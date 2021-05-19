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
        } {
            run_ls "." $columns
        }
    } {
        if $is_columns_empty {
            run_ls $path $columns_default
        } {
            run_ls $path $columns
        }
    }
}

def run_ls [
    path:string
    columns:int
    ] {
    let max_fname_size = (ls $path | get name | str from | str length | math max)
    let max_fsize_size = (ls $path | get size | str from | str length | math max)

    ls $path | each -n {
        build-string (echo $it.item.name | str rpad -c ' ' -l $max_fname_size) ' ' (echo (build-string $it.item.size) | str lpad -c ' ' -l $max_fsize_size) ' '
        if $is_columns_empty {
            if ($it.index + 1) mod 3 == 0 {
                echo (char newline) | autoview
            } {}
        } {
            if ($it.index + 1) mod $columns == 0 {
                echo (char newline) | autoview
            } {}
        }
    } | str collect
}

# This is a first attempt and some type of logging
def log [
    message:any # Some log message
    ] {
    let now = (date now | date format '%Y%m%d_%H%M%S.%f')
    let mess = (build-string $now '|DBG|' $message (char newline))
    echo $mess | autoview
}

