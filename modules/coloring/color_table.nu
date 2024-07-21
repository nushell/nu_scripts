def make_header [hi] {
    if $hi == true {
        let ansi100m = ('100m' | fill -a l -w 11 -c ' ')
        let ansi101m = ('101m' | fill -a l -w 9 -c ' ')
        let ansi102m = ('102m' | fill -a l -w 9 -c ' ')
        let ansi103m = ('103m' | fill -a l -w 9 -c ' ')
        let ansi104m = ('104m' | fill -a l -w 9 -c ' ')
        let ansi105m = ('105m' | fill -a l -w 9 -c ' ')
        let ansi106m = ('106m' | fill -a l -w 9 -c ' ')
        let ansi107m = ('107m' | fill -a l -w 9 -c ' ')
        $"(char newline)($ansi100m)($ansi101m)($ansi102m)($ansi103m)($ansi104m)($ansi105m)($ansi106m)($ansi107m)(char newline)"
    
    } else {
        let ansi40m = ('40m' | fill -a l -w 10 -c ' ')
        let ansi41m = ('41m' | fill -a l -w 8 -c ' ')
        let ansi42m = ('42m' | fill -a l -w 8 -c ' ')
        let ansi43m = ('43m' | fill -a l -w 8 -c ' ')
        let ansi44m = ('44m' | fill -a l -w 8 -c ' ')
        let ansi45m = ('45m' | fill -a l -w 8 -c ' ')
        let ansi46m = ('46m' | fill -a l -w 8 -c ' ')
        let ansi47m = ('47m' | fill -a l -w 8 -c ' ')
        $"(char newline)($ansi40m)($ansi41m)($ansi42m)($ansi43m)($ansi44m)($ansi45m)($ansi46m)($ansi47m)(char newline)"
    }
}

# mk_header and make_header do the same thing in different ways
# make_header is far easier to read and understand
# mk_header is more convoluted but less repetitive

def mk_header [color_range:range] {
    let min_rng = (echo $color_range | math min)
    let hi_start_pad = 11
    let hi_regular_pad = 9
    let lo_start_pad = 10
    let lo_regular_pad = 8
    echo $color_range | each { |color|
        let ansi_color = $"($color)m"
        if $color == $min_rng {
            if $min_rng == 100 {
                ($ansi_color | fill -a l -w $hi_start_pad -c ' ')

            } else {
                ($ansi_color | fill -a l -w $lo_start_pad -c ' ')

            }

        } else {
            if $min_rng >= 100 {
                ($ansi_color | fill -a l -w $hi_regular_pad -c ' ')

            } else {
                ($ansi_color | fill -a l -w $lo_regular_pad -c ' ')

            }

        }
            } | str join
    echo (char newline)
}

def color_row_range [num:int bg_rg:range] {
    let reset = (ansi reset)
    let row_header = $"($num)m ($reset)"
    let row_data = (echo $bg_rg | each { |back|
        let row_name = $"($num);($back)m"
        let ansi_color = (ansi -e $row_name)
        $"($ansi_color) ($row_name) ($reset)"
    } | append (char newline) | str join)
    $"($row_header)($row_data)"
}

def create_color_tables [fg_range:range bg_range:range] {
    echo $fg_range | each { |fg|
        color_row_range $fg $bg_range
    } | str join
}

def color_table [] {
    [
        # make_header $false
        (mk_header 40..47)
        (create_color_tables 30..37 40..47)

        # put a line between tables
        (char newline)

        #make_header $true
        (mk_header 100..107)
        (create_color_tables 90..97 100..107)
    ] | str join
}

color_table

