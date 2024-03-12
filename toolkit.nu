# this module regroups a bunch of development tools to make the development
# process easier for anyone.
#
# the main purpose of `toolkit` is to offer an easy to use interface for the
# developer during a PR cycle.


# check that all the tests pass
export def test [
] {
    print "toolkit test: not implemented!"
}

# run all the necessary checks and tests to submit a perfect PR
export def "check pr" [
] {
    generate-file-list
    test
}

export def main [] { help toolkit }

export def generate-file-list [ --full ] {
    let start = "let files = ["

    mut files = [""]

    if $full {
        # all the *.nu files in the repo
        # exept for `before_v0.60`
        # do nothing.. as $files has already all files
        print "checking all files..."
        mut $files = glob **/*.nu --exclude [before_v0.60/**]
    } else {
        $files = (git diff --name-only origin/main | lines | each { path expand })
    }


    let new_list = $files | str join ",\n" | append "]"

    let final = "

    mut exit_code = 0
    for file in $files {
        let diagnostics_table = nu --ide-check 10 $file | to text  | ['[', $in, ']'] | str join | from json
        let result = $diagnostics_table | where type == \"diagnostic\" | is-empty
        if $result {
            print $\"✔ ($file) is ok\"
        } else {
            print $\"❌ ($file) has errors:\"
            print ($diagnostics_table | where type == \"diagnostic\")
            $exit_code = 1
        }
    }
    print $\"💚 All files checked!\"

    git branch -r

exit $exit_code
"

    $start 
    | append $new_list
    | append $final 
    | save "check-files.nu" --force
}
