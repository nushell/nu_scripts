# this script uses foreground ansi index colors to print
# a table of 16 rows by 16 colums where each item is a
# different color
def show_index_colors [] {
    let prefix = "38;5;"
    echo 1..256 | each {
        let cr = $(echo $(build-string $it % 16) | math eval)
        let color = $(echo [$(ansi -e $prefix) $(build-string $it) 'm'] | str collect)
        let padded_number = $(echo $(build-string $it | str lpad -l 3 -c '0'))
        if $cr == 0 {
            echo [$color $padded_number ' ' $(char newline)]
        } {
            echo [$color $padded_number ' ']
        }
    } | str collect
}

show_index_colors

# one-liner version that just prints
# it all on one line which wraps in
# your terminal

#echo 1..256 | each {echo [$(ansi -e '38;5;') $(build-string $it) 'm' $(build-string $it) ' ']} | str collect