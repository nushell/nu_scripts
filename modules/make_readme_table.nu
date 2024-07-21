# A Script to try and create the table for the readme.md file
# | Category         | File                                                                          |
# | ---------------- | ----------------------------------------------------------------------------- |
# | coloring         | [24bit-1.nu](./coloring\24bit-1.nu)                                           |
# | coloring         | [color_table.nu](./coloring\color_table.nu)                                   |
# | coloring         | [color_tables.nu](./coloring\color_tables.nu)                                 |
# | coloring         | [gradient.nu](./coloring\gradient.nu)                                         |

# Right now there is still manual manipulation in order to update the README.md
# Hopefully, in the future someone will contribute a script to make this automatic.

let nu_files = (ls **/*.nu)
let nu_table = ($nu_files |
    get name |
    wrap File |
    insert Category { |it|
        let cat = ($it.File | path dirname)
        if $cat == "" {
            "not assigned yet"
        } else {
            $cat
        }
    } | where Category !~ ".git" | select Category File | sort-by Category)

# Let's fix the file now
let nu_table = ($nu_table | update File { |it|
    let file_path = ($it.File  | into string | str replace '\' '/' --all)
    let file_name = ($file_path | path basename)
    $"[($file_name)](char lparen)./($file_path)(char rparen)"
})

echo $nu_table | to md --pretty
