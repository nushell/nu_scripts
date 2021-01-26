# This script will print a table 8 rows by 36 columns
# of background colors using ansi index coloring

# This prints the column headers
let nl = $(char newline)
let plus = $(echo [$nl '   + '] | str collect)
let cols = $(seq 0 35 | each { echo $(build-string $it) | str lpad -c ' ' -l 3 } | str collect)
echo [$plus $cols] | str collect

let ansi_bg = $(ansi -e '48;5;')
let ansi_reset = $(ansi reset)
echo $nl $nl | str collect

# This prints the row headers
let row_header = '   0  '
let row_data = $(seq 0 15 | each {
    echo [$ansi_bg $it 'm' '  ' $ansi_reset ' ']
} | str collect)
echo [$row_header $row_data $nl $nl] | str collect

# This is the meat of the script that prints the little squares of color
seq 0 6 | each {
    let math_str = $(build-string $it ' * 36 + 16')
    let i = $(echo $math_str | math eval)
    let row_header = $(echo $i | str from -d 0 | str lpad -c ' ' -l 4)
    let row_data = $(seq 0 35 | each {
        let math_str2 = $(build-string $i + $it)
        let val = $(echo $math_str2 | math eval | str from -d 0)
        echo [$ansi_bg $val 'm' '  ' $(ansi -e 'm') ' ']
    } | str collect)
    echo [$row_header '  ' $row_data $nl $nl] | str collect
} | str collect

