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

echo 0..8 | each {
    let x = $it
    let row = $(echo 30..37 | each {
        let i = $it
        let row = $(echo 40..47 | each {
            let a = $it
            let color = $(build-string $x ';' $i ';' $a 'm')
            echo [$(ansi -e $color) $color $(ansi reset) '  ']
        } | str collect)
        echo [$row $(char newline)] | str collect
    } | str collect)
    echo [$row $(char newline)] | str collect
} | str collect