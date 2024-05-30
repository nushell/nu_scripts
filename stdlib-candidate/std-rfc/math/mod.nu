# replace all insignificant digits with 0
#
# | Significant Digits | Maximum Relative Error |
# |--------------------|------------------------|
# | 1                  | 50%                    |
# | 2                  | 5%                     |
# | 3                  | 0.5%                   |
# | 4                  | 0.05%                  |
# | 5                  | 0.005%                 |
# | 6                  | 0.0005%                |
#
# > 0.0000012346789 | round-significant-digits 2
# 0.0000012
#
# > 1.2346789 | round-significant-digits 3
# 1.23
#
# > 123456789.89 | round-significant-digits 5 --floor
# 123450000
#
# > 1sec / 3 | math round-significant-digits
# 333ms
export def 'round-significant-digits' [
    n: int = 3 # a number of significant digits
    --floor # use `math floor` for rounding
]: [int -> float, float -> float, duration -> duration] {
    let $input = $in
    let $type = $input | describe

    let $num = match $type {
        'int' => {$input | into float}
        'duration' => {$input | into int | into float}
        _ => {$input}
    }

    let first_digit_pos = 1 + ($num | math abs | math log 10 | math floor)
    let scaling_factor = 10.0 ** ($n - $first_digit_pos)

    $num * $scaling_factor
    | if $floor {math floor} else {math round}
    | $in / $scaling_factor
    | if $type == 'duration' {
        $'($in)ns' | into duration
    } else {}
}
