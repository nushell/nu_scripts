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

0..8 | each {|x|
    let row = (30..39 | each {|i|
        let row = (40..49 | each {|a|
          if ($a != 48) {
            if ($i != 38) {
            let color = $"($x);($i);($a)"
            $"(ansi -e $color)m\\e[($color)(ansi -e '0;37;40')m "
          }}
        } | str join)
        $"($row)(char newline)"
    } | str join)
    $"($row)(char newline)"
} | str join

