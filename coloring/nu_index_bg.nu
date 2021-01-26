def show_index_colors [] {
    let prefix = "48;5;"
    let relet_color = "0m"
    echo 1..256 | each {
        let cr = $(echo $(build-string $it % 16) | math eval)
        let color = $(echo [$(ansi -e $prefix) $(build-string $it) 'm'] | str collect)
        let padded_number = $(echo $(build-string $it | str lpad -l 3 -c '0'))
        if $cr == 0 {
            echo [$color $padded_number ' ' $(ansi -e $relet_color) $(char newline)]
        } {
            echo [$color $padded_number ' ' $(ansi -e $relet_color)]
        }
    } | str collect
}

show_index_colors

#one-liner
#echo 0..255 | each {echo [$(ansi -e '38;5;') $(build-string $it) 'm' $(build-string $it) ' ']} | str collect