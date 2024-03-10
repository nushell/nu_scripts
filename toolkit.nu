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

export def generate-file-list [] {
    let start = "let files = ["
    let files  = glob **/*.nu --exclude [before_v0.60/**]

    let new_list = $files | str join ",\n" | append "]"

    let final = "

    mut exit_code = 0
    for file in $files {
        let diagnostics_table = nu --ide-check 10 $file | to text  | ['[', $in, ']'] | str join | from json
        let result = $diagnostics_table | where type == \"diagnostic\" | is-empty
        if $result {
            # print $\"✔ ($file) is ok\"
        } else {
            print $\"❌ ($file) has errors:\"
            print ($diagnostics_table | where type == \"diagnostic\")
            $exit_code = 1
        }
    }

exit $exit_code
"

    $start 
    | append $new_list
    | append $final 
    | save "check-files.nu" --force
}
