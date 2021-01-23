def make_header [hi] {
    if $hi == $true {
        let ansi100m = $(echo '100m' | str lpad -l 11 -c ' ')
        let ansi101m = $(echo '101m' | str lpad -l 9 -c ' ')
        let ansi102m = $(echo '102m' | str lpad -l 9 -c ' ')
        let ansi103m = $(echo '103m' | str lpad -l 9 -c ' ')
        let ansi104m = $(echo '104m' | str lpad -l 9 -c ' ')
        let ansi105m = $(echo '105m' | str lpad -l 9 -c ' ')
        let ansi106m = $(echo '106m' | str lpad -l 9 -c ' ')
        let ansi107m = $(echo '107m' | str lpad -l 9 -c ' ')
        echo [$(char newline) $ansi100m $ansi101m $ansi102m $ansi103m $ansi104m $ansi105m $ansi106m $ansi107m $(char newline)] | str collect
    } {
        let ansi40m = $(echo '40m' | str lpad -l 10 -c ' ')
        let ansi41m = $(echo '41m' | str lpad -l 8 -c ' ')
        let ansi42m = $(echo '42m' | str lpad -l 8 -c ' ')
        let ansi43m = $(echo '43m' | str lpad -l 8 -c ' ')
        let ansi44m = $(echo '44m' | str lpad -l 8 -c ' ')
        let ansi45m = $(echo '45m' | str lpad -l 8 -c ' ')
        let ansi46m = $(echo '46m' | str lpad -l 8 -c ' ')
        let ansi47m = $(echo '47m' | str lpad -l 8 -c ' ')
        echo [$(char newline) $ansi40m $ansi41m $ansi42m $ansi43m $ansi44m $ansi45m $ansi46m $ansi47m $(char newline)] | str collect
    }
}

# mk_header and make_header do the same thing in different ways
# make_header is far easier to read and understand
# mk_header is more convoluted but less repetitive

def mk_header [color_range:range] {
    let min_rng = $(echo $color_range | math min)
    let hi_start_pad = 11
    let hi_regular_pad = 9
    let lo_start_pad = 10
    let lo_regular_pad = 8
    echo $color_range | each {
        let ansi_color = $(echo [$(build-string $it 'm')])
        if $it == $min_rng {
            if $min_rng == 100 {
                let header = $(echo $ansi_color | str lpad -l $hi_start_pad -c ' ')
                echo $header
            } {
                let header = $(echo $ansi_color | str lpad -l $lo_start_pad -c ' ')
                echo $header
            }
        } {
            if $min_rng >= 100 {
                let header = $(echo $ansi_color | str lpad -l $hi_regular_pad -c ' ')
                echo $header
            } {
                let header = $(echo $ansi_color | str lpad -l $lo_regular_pad -c ' ')
                echo $header
            }
        }
    } | str collect
    echo $(char newline)
}

def color_row_range [num:int bg_rg:range] {
    let reset = $(ansi reset)
    let row_header = $(build-string $num "m " $(ansi reset))
    let row_data = $(echo $bg_rg | each {
        let row_name = $(echo [$(build-string $num ';' $it) "m"] | str collect)
        let ansi_color = $(ansi -e $row_name)
        echo [$ansi_color ' ' $row_name ' ' $reset] | str collect
    } | append $(char newline) | str collect)
    echo [$row_header $row_data] | str collect
}

def create_color_tables [fg_range:range bg_range:range] {
    echo $fg_range | each {
        color_row_range $it $bg_range
    } | str collect
}

def color_table [] {
    #make_header $false
    mk_header 40..47
    create_color_tables 30..37 40..47

    # put a line between tables
    echo $(char newline)

    #make_header $true
    mk_header 100..107
    create_color_tables 90..97 100..107
}

color_table