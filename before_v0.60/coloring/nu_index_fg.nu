def show_index_colors [] {
    let prefix = "38;5;"
    echo 1..256 | each { |fg|
        let cr = ($"($fg) % 16" | math eval)
        if $cr  == 0 {
            $"(ansi -e $prefix)($fg)m($fg | into string | str lpad -l 3 -c '0') (char newline)"
        } {
            $"(ansi -e $prefix)($fg)m($fg | into string | str lpad -l 3 -c '0') "
        }
    } | str collect
}

show_index_colors

#one-liner
#echo 0..255 | each { |fg| echo [(ansi -e '38;5;') ($fg | into string) 'm' ($fg | into string) ' ']} | str collect