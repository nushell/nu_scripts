
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
# > 0.0000012346789 | significant-digits 2
# 0.0000012
#
# > 1.2346789 | significant-digits 3
# 1.23
#
# > 1sec / 3 | math significant-digits
# 333ms
export def 'significant-digits' [
    significant_digits: int = 4 # a number of first non-zero digits to keep
]: [int -> int, float -> float, duration -> duration] {
    let $input = $in
    let $chars = $input | into string | split chars

    let $rounded_str = $chars
        | scan --noinit 0 {|ind i|
            if $i =~ '\d' {
                if $ind == 0 and $i == '0' {
                    $ind
                } else { $ind + 1 }
            } else {$ind}
        }
        | zip $chars
        | each {|i| if $i.1 =~ '\d' and $i.0 > $significant_digits {'0'} else {$i.1}}
        | str join

    match ($input | describe) {
        'duration' => {$rounded_str | into duration}
        'int' => {$rounded_str | into int}
        'float' => {$rounded_str | into float}
    }
}
