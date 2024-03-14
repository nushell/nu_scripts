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
export def main []: nothing -> nothing {
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

# Check the input file with nu --ide-check.
export def "lint ide-check" []: path -> int {
    let file = $in
    let stub = $env.STUB_IDE_CHECK? | default false | into bool
    let diagnostics = if $stub {
        do { nu --no-config-file --commands $"use '($file)'" }
            | complete
            | [[severity message]; [$in.exit_code $in.stderr]]
            | where severity != 0
    } else {
        nu --ide-check 10 $file
            | $"[($in)]"
            | from nuon
            | where type == diagnostic
            | select severity message
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
        par-each { lint ide-check }
    }
}
