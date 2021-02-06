# A ls command that approximates the ls -sh command in bash
def ls-wide [
    --columns(-c):int # The number of columns in your output
    ] {
    let is_empty = $(= $columns | empty?)
    let max_fname_size = $(ls | get name | str from | str length | math max)
    let max_fsize_size = $(ls | get size | str from | str length | math max)

    ls | each -n {
        build-string $(echo $it.item.name | str rpad -c ' ' -l $max_fname_size) ' ' $(echo $(build-string $it.item.size) | str lpad -c ' ' -l $max_fsize_size) ' '
        if $is_empty {
            if $it.index mod 3 == 0 && $it.index != 0 {
                echo $(char newline) | autoview
            } {}

            } {
            if $it.index mod $columns == 0 && $it.index != 0 {
                echo $(char newline) | autoview
            } {}
        }
    } | str collect
}
