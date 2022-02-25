# Bash script
# for x in {0..8}; do
#     for i in {30..37}; do
#         for a in {40..47}; do
#             echo -ne "\e[$x;$i;$a""m\\\e[$x;$i;$a""m\e[0;37;40m "
#         done
#         echo
#     done
#     echo
# done
# echo ""

# Nushell 0.32.0
for x in 0..8 {
    let row = (for i in 30..37 {
        let row = (for a in 40..47 {
            let color = $"($x);($i);($a)"
            $"(ansi -e $color)m\e[($color)(ansi -e '0;37;40')m "
        } | str collect)
        $"($row)(char newline)"
    } | str collect)
    $"($row)(char newline)"
} | str collect

# Nushell 0.31.0
# echo 0..8 | each { |style|
#     let row = (echo 30..37 | each { |fg|
#         let row = (echo 40..47 | each { |bg|
#             let color = $"($style);($fg);($bg)m"
#             $"(ansi -e $color)($color)(ansi reset)  "
#         } | str collect)
#         $"($row)(char newline)"
#     } | str collect)
#     $"($row)(char newline)"
# } | str collect