def show_index_colors [] {
    let prefix = "48;5;"
    1..256 | each { |idx|
        let color = $"(ansi -e $prefix)($idx)m"
        let padded_number = ($"($idx)" | fill -a l -w 3 -c '0')
        let cr = ($idx mod 16)
        if $cr == 0 {
            $"($color)($padded_number) (ansi -e 0m)(char newline)"
        } else {
            $"($color)($padded_number) (ansi -e 0m)"
        }
    } | str join
}

show_index_colors
