# A ls command that approximates the ls -sh command in bash
export def ls-wide [
    --path(-p):string # The path you want to list
    --columns(-c):int # The number of columns in your output
    ] {
    let is_columns_empty = ($columns | is-empty)
    let is_path_empty = ($path | is-empty)
    let columns_default = 3

    if $is_path_empty {
        if $is_columns_empty {
            run_ls "." $columns_default
        } else {
            run_ls "." $columns
        }
    } else {
        if $is_columns_empty {
            run_ls $path $columns_default
        } else {
            run_ls $path $columns
        }
    }
}

def run_ls [
    path:string
    columns:int
    ] {
    let max_fname_size = (ls $path | get name | into string | str length | math max)
    let max_fsize_size = (ls $path | get size | into string | str length | math max)
    let is_columns_empty = ($columns | is-empty)

    ls $path | enumerate | each { |file|
        let the_file = ($file.item.name | into string | fill -a l -c ' ' -w $max_fname_size)
        let the_size = ($file.item.size | into string | fill -a r -c ' ' -w $max_fsize_size)
        let new_line = (if $is_columns_empty {
            if ($file.index + 1) mod 3 == 0 {
                char newline
            }
        } else {
            if ($file.index + 1) mod $columns == 0 {
                char newline
            }
        })
        $"($the_file) ($the_size) ($new_line)"
    } | str join
}
