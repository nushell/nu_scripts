
use std iter scan

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
# > 0.0000012346789 | reset-insignificant-digits 2
# 0.0000012
#
# > 1.2346789 | reset-insignificant-digits 3
# 1.23
#
# > 123456789.89 | reset-insignificant-digits 5 --floor
# 123450000
#
# > 1sec / 3 | math reset-insignificant-digits
# 333ms
export def 'reset-insignificant-digits' [
    n: int = 3 # a number of significant digits
    --floor # use `math floor` for rounding
]: [int -> int, float -> float, duration -> duration] {
    let $input = $in
    let $num = $input | into string | split chars

    let $rounded_str = $num
        | scan --noinit 0 {|ind i|
            if $i =~ '\d' {
                if $ind == 0 and $i == '0' {
                    $ind
                } else { $ind + 1 }
            } else {$ind}
        }
        | wrap digit_ind
        | merge ($num | wrap d)
        | each {|i| if $i.d =~ '\d' and $i.digit_ind > $n {'0'} else {$i.d}}
        | str join

    match ($input | describe) {
        'duration' => {$rounded_str | into duration}
        'int' => {$rounded_str | into int}
        'float' => {$rounded_str | into float}
    }
}
