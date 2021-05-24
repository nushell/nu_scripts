# A Script to try and create the table for the readme.md file
# | Category         | File                                                      | Nu Version | Description |
# | ---------------- | --------------------------------------------------------- | ---------- | ----------- |
# | coloring         | [color_table.nu](./coloring/color_table.nu)               | 0.32      | desc        |
# | coloring         | [color_tables.nu](./coloring/color_tables.nu)             | 0.32       | desc        |

# Right now there is still manual manipulation in order to update the README.md
# Hopefully, in the future someone will contribute a script to make this automatic.

let nu_files = (ls **/*.nu)
let nu_table = ($nu_files | 
    get name |
    wrap File | 
    insert 'Nu Version' 0.32 | 
    insert Description desc | 
    insert Category { |it| 
        let cat = ($it.File | path dirname)
        if $cat == "" {
            "not assigned yet"
        } {
            $cat
        }
    } | select Category File 'Nu Version' Description)
# Let's fix the file now
let nu_table = ($nu_table | update File { |it|
    let file_path = $it.File
    let file_name = ($file_path | path basename)
    $"[($file_name)](char lparen)./($file_path)(char rparen)"
})
$nu_table | to md --pretty
