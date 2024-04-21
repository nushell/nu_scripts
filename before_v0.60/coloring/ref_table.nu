# This script will print a table 8 rows by 36 columns
# of background colors using ansi index coloring

# This prints the column headers
let nl = (char newline)
let plus = $"($nl)   + "
let cols = (seq 0 35 | each { |col| $"($col)" | fill -c ' ' --width 3 } | str join)
$"($plus)($cols)"

let ansi_bg = (ansi -e '48;5;')
let ansi_reset = (ansi reset)
$"($nl)($nl)"

# This prints the row headers
let row_header = '   0  '
let row_data = (seq 0 15 | each { |row|
    $"($ansi_bg)($row)m   ($ansi_reset)"
} | str join)
$"($row_header)($row_data)($nl)($nl)"

# This is the meat of the script that prints the little squares of color
seq 0 6 | each { |row_idx|
    let r = ($"($row_idx) * 36 + 16" | math eval)
    let row_header = (echo $r | into string -d 0 | fill -c ' ' --width 4)
    let row_data = (seq 0 35 | each { |row|
        let val = ($"($r + $row)" | math eval | into string -d 0)
        $"($ansi_bg)($val)m  (ansi -e 'm') "
    } | str join)
    $"($row_header)  ($row_data)($nl)($nl)"
} | str join
