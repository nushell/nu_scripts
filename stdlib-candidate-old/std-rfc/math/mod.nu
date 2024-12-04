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
# > 123456789.89 | significant-digits 5
# 123450000
#
# > 1sec / 3 | math significant-digits
# 333ms
export def 'significant-digits' [
    n: int = 3 # a number of significant digits
]: [int -> int, float -> float, duration -> duration] {
    let $input = $in
    let $type = $input | describe

    let $num = match $type {
        'duration' => {$input | into int}
        _ => {$input}
    }

    let insignif_position = $num
        | if $in == 0 {
            0 # it's impoosbile to calculate `math log` from 0, thus 0 errors here
        } else {
            math abs
            | math log 10
            | math floor
            | $n - 1 - $in
        }


    # See the note below the code for an explanation of the construct used.
    let scaling_factor = 10 ** ($insignif_position | math abs)

    let res = $num
        | if $insignif_position > 0 {
            $in * $scaling_factor
        } else {
            $in / $scaling_factor
        }
        | math floor
        | if $insignif_position <= 0 {
            $in * $scaling_factor
        } else {
            $in / $scaling_factor
        }

    match $type {
        'duration' => {$res | into duration}
        'int' => {$res | into int}
        _ => {$res}
    }
}

# I started with `10.0 ** $insignif_position`, but it was sometimes producing
# not rounded digits in `$num / $scaling_factor` if `$insignif_position` was negative
# like with
# > 3456789 | math round --precision -5
# 3499999.9999999995
# so I use what I have now.
