# this module regroups a bunch of development tools to make the development
# process easier for anyone.
#
# the main purpose of `toolkit` is to offer an easy to use interface for the
# developer during a PR cycle.

# Check that all the tests pass.
#
# Input:
#   Optional file paths to check or infer them from Git
export def test [
    --full # Check all files instead of input
    --and-exit # Exit with error count
]: [list<path> -> int, nothing -> int] {
    with files --full=$full --and-exit=$and_exit { |files|
        print "test: not implemented!"
        [0] # success code
    }
}

# Run all the necessary checks and tests to submit a perfect PR.
#
# Input:
#   Optional file paths to check or infer them from Git
export def "check pr" [
    --full # Check all files instead of input
    --and-exit # Exit with error count
]: [list<path> -> int, nothing -> int] {
    with files --full=$full --and-exit=$and_exit { |files|
         [
            { lint }
            { test }
         ] | par-each { |task| $files | do $task } # TODO: buffer output
    }
}

# View subcommands.
export def main []: nothing -> string {
    help toolkit
}

# Wrap file lookup and exit codes.
def "with files" [
    task: closure
    --full
    --and-exit
]: [list<path> -> int, nothing -> int] {
    let files = match [$in, $full] {
        [_ true] => (glob **/*.nu --exclude [before_v0.60/**])
        [null _] => (git diff --name-only origin/main | lines)
        [$files _] => $files
    } | where $it ends-with .nu and ($it | path exists)
    let error_count = if ($files | length) == 0 {
        print 'warning: no .nu files found!'
        0
    } else {
        $files
            | each { path expand }
            | do $task $files # run the closure with both input and param
            | math sum # it MUST return a non-empty list of ints
    }
    if $and_exit {
        exit $error_count
    } else {
        $error_count
    }
}

export def "lint check" []: path -> int {
    let file = $in
    let test_methodology = $env.TEST_METHOD? | default "import-or-source"
    const current_path = (path self)

    let diagnostics = match $test_methodology {
        ide-check => {
            nu --ide-check 10 $file
            | $"[($in)]"
            | from nuon
            | where type == diagnostic
            | select severity message
        }

        import-or-source => {
            # If any line in the file starts with `export`, then
            # we assume it is a module. Otherwise, treat it as source
            let has_exports = (open $file | $in like '(?m)^export\s')
            if $has_exports {
                # treat as module
                if not (nu-check --as-module $file) {
                    do { nu --no-config-file --commands $"use '($file)'" }
                    | complete
                    | [[severity message]; [$in.exit_code $in.stderr]]
                    | where severity != 0
                }
            } else {
                if not (nu-check $file) {
                    do { nu --no-config-file --commands $"source '($file)'" }
                    | complete
                    | [[severity message]; [$in.exit_code $in.stderr]]
                    | where severity != 0
                }
            }
        }

        _ => { error make { msg: "Invalid TEST_METHOD"}}
    }
    let error_count = $diagnostics | length
    if $error_count == 0 {
        print $"lint: ✔ ($file) is ok"
    } else {
        print $"lint: ❌ ($file) has errors:\n($diagnostics | table)"
    }
    $error_count
}

# Check that all the files parse.
#
# Input:
#   Optional file paths to check or infer them from Git
export def lint [
    --full # Check all files instead of input
    --and-exit # Exit with error count
]: [list<path> -> int, nothing -> int] {
    with files --full=$full --and-exit=$and_exit {
        par-each { lint check }
    }
}
