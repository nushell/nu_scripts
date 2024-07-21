# This script will print a table 8 rows by 36 columns
# of background colors using ansi index coloring

# #!/bin/bash
# echo -en "\n   +  "
# for i in {0..35}; do
# printf "%2b " $i
# done
# printf "\n\n %3b  " 0
# for i in {0..15}; do
#     echo -en "\033[48;5;${i}m  \033[m "
# done
# #for i in 16 52 88 124 160 196 232; do
# for i in {0..6}; do
#     let "i = i*36 +16"
#     printf "\n\n %3b  " $i
#     for j in {0..35}; do
#         let "val = i+j"
#         echo -en "\033[48;5;${val}m  \033[m "
#     done
# done
# echo -e "\n"


# This prints the column headers
let nl = (char newline)
let plus = $"($nl)   + "
let cols = (seq 0 35 | each { |col| $"($col)" | fill -a l -c ' ' -w 3 } | str join)
print $"($plus)($cols)"

let ansi_bg = (ansi -e '48;5;')
let ansi_reset = (ansi reset)
print $"($nl)($nl)"

# This prints the row headers
let row_header = '   0  '
let row_data = (seq 0 15 | each { |row|
    $"($ansi_bg)($row)m   ($ansi_reset)"
} | str join)
print $"($row_header)($row_data)($nl)($nl)"

# This is the meat of the script that prints the little squares of color
seq 0 6 | each { |row_idx|
    let r = ($row_idx * 36 + 16)
    let row_header = (echo $r | into string -d 0 | fill -a l -c ' ' -w 4)
    let row_data = (seq 0 35 | each { |row|
        let val = (($r + $row) | into string -d 0)
        $"($ansi_bg)($val)m  (ansi -e 'm') "
    } | str join)
    $"($row_header)  ($row_data)($nl)($nl)"
} | str join
