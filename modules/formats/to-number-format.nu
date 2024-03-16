export def number-format [
    num                             # Number to format
    --thousands_delim (-t) = ' '    # Thousands delimiter: number-format 1000 -t ': 1'000
    --whole_part_length (-w) = 0    # Length of padding whole-part digits: number-format 123 -w 6:    123
    --decimal_digits (-d) = 0       # Number of digits after decimal delimiter: number-format 1000.1234 -d 2: 1000.12
    --denom (-D) = ""               # Denom `--denom "Wt": number-format 1000 --denom 'Wt': 1000Wt
] {

    let parts = (
        $num
        | into string
        | split row "."
    )

    let whole_part = (
        $parts.0
        | split chars
        | reverse
        | reduce -f [] {
            |it, acc| if ((($it.index + 1) mod 3) == 0) {
                $acc.item
                | append $it.item
                | append $thousands_delim
            } else {
                $acc.item
                | append $it.item
            }
        }
        | reverse
    )

    let whole_part2 = (
        if ($whole_part | first) == $thousands_delim {
            ($whole_part | skip 1)
        } else {
            $whole_part
        }
        | str join ''
    )

    let whole_part3 = (
        if $whole_part_length == 0 {
            $whole_part2
        } else {
            $whole_part2
            | fill -w $whole_part_length -c ' ' -a r
        }
    )

    let dec_part = (
        if ($parts | length) == 1 {
            "0"
        } else {
            $parts.1
        }
    )

    let dec_part2 = (
        if $decimal_digits == 0 {
            ""
        } else {
            $".($dec_part)" | fill -w ($decimal_digits + 1) -c '0' -a l
        }
    )

    let out = $"(ansi green)($whole_part3)($dec_part2)(ansi reset)(ansi green_bold)($denom)(ansi reset)"
    $out
}