# this script uses foreground ansi index colors to print
# a table of 16 rows by 16 colums where each item is a
# different color
def show_index_colors [] {
    let prefix = "38;5;"
    echo 1..256 | each { |idx|
        let cr = ($"($idx) % 16" | math eval)
        let color = ($"(ansi -e $prefix)($idx)m")
        let padded_number = ($"($idx)" | str lpad -l 3 -c '0')

        if $cr == 0 {
            $"($color)($padded_number) (char newline)"
        } {
            $"($color)($padded_number) "
        }
    } | str collect
}

show_index_colors

# one-liner version that just prints
# it all on one line which wraps in
# your terminal

#echo 1..256 | each { |idx| echo [(ansi -e '38;5;') (build-string $idx) 'm' (build-string $idx) ' ']} | str collect