def show_index_colors [] {
    let prefix = "48;5;"
    echo 1..256 | each { |idx|
        let cr = ($"($idx) % 16" | math eval)
        let color = $"(ansi -e $prefix)($idx)m"
        let padded_number = ($"($idx)" | str lpad -l 3 -c '0')
        if $cr == 0 {
            $"($color)($padded_number) (ansi -e 0m)(char newline)"
        } {
            $"($color)($padded_number) (ansi -e 0m)"
        }
    } | str collect
}

show_index_colors
