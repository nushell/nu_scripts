# A ls command that approximates the ls -sh command in bash
def ls-wide [
    --path(-p):string # The path you want to list
    --columns(-c):int # The number of columns in your output
    ] {
    let is_columns_empty = ($columns | empty?)
    let is_path_empty = ($path | empty?)
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

    ls $path | each -n { |file|
        let the_file = ($file.item.name | into string | fill --alignment r -c ' ' --width $max_fname_size)
        let the_size = ($file.item.size | into string | fill --alignment l -c ' ' --width $max_fsize_size)
        $"($the_file) ($the_size) " | autoview

        if $is_columns_empty {
            if ($file.index + 1) mod 3 == 0 {
                echo (char newline) | autoview
            } else {}
        } else {
            if ($file.index + 1) mod $columns == 0 {
                echo (char newline) | autoview
            } else {}
        }
    } | str join
}

# This is a first attempt and some type of logging
def log [message:any] {
    let now = (date now | date format '%Y%m%d_%H%M%S.%f')
    let mess = $"($now)|DBG|($message)(char nl)"
    echo $mess | autoview
}