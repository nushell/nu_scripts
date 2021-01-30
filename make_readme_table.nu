# A Script to try and create the table for the readme.md file
# | Category         | File                                                      | Nu Version | Description |
# | ---------------- | --------------------------------------------------------- | ---------- | ----------- |
# | coloring         | [color_table.nu](./coloring/color_table.nu)               | 0.26       | desc        |
# | coloring         | [color_tables.nu](./coloring/color_tables.nu)             | 0.26       | desc        |

# Right now there is still manual manipulation in order to update the README.md
# Hopefully, in the future someone will contribute a script to make this automatic.

let nu_files = $(ls **/*.nu)
let nu_table = $(echo $nu_files | 
    get name |
    wrap File | 
    insert 'Nu Version' 0.26 | 
    insert Description desc | 
    insert Category { 
        let cat = $(get File | path dirname)
        if $cat == "" {
            echo "not assigned yet"
        } {
            echo $cat
        }
    } | select Category File 'Nu Version' Description)

# Let's fix the file now
let nu_table = $(echo $nu_table | update File {
    let file_path = $(get File)
    let file_name = $(echo $file_path | path basename)
    let file_link = $(build-string "[" $file_name "]" "(./" $file_path ")")
    echo $file_link
})

echo $nu_table | to md --pretty