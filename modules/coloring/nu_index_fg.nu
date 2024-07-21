# this script uses foreground ansi index colors to print
# a table of 16 rows by 16 colums where each item is a
# different color
def show_index_colors [] {
    let prefix = "38;5;"
    echo 1..256 | each { |idx|
        let cr = (($idx) mod 16)
        let color = ($"(ansi -e $prefix)($idx)m")
        let padded_number = ($"($idx)" | fill -a l -w 3 -c '0')

        if $cr == 0 {
            $"($color)($padded_number) (char newline)"
        } else {
            $"($color)($padded_number) "
        }
    } | str join
}

# one-liner version that just prints
# it all on one line which wraps in
# your terminal
def one_liner [] {
    0..255 | each {|fg| [(ansi -e '38;5;') ($fg | into string) 'm' ($fg | into string) ' ']} | flatten | str join
}


show_index_colors
