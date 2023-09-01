# construct bars based of a given percentage from a given width (5 is default)
# > bar 0.2
# █
# > bar 0.71
# ███▌
def 'bar' [
    percentage: float
    --background (-b): string = 'default'
    --foreground (-f): string = 'default'
    --progress (-p) # output the result using 'print -n'
    --width (-w): int = 5
] {
    let blocks = [null "▏" "▎" "▍" "▌" "▋" "▊" "▉" "█"]
    let $whole_part = (($blocks | last) * ($percentage * $width // 1))
    let $fraction = (
        $blocks
        | get (
            ($percentage * $width) mod 1
            | $in * ($blocks | length | $in - 1)
            | math round
        )
    )

    let result = (
        $"($whole_part)($fraction)"
        | fill -c $' ' -w $width
        | if ($foreground == 'default') and ($background == 'default') {} else {
            $"(ansi -e {fg: ($foreground), bg: ($background)})($in)(ansi reset)"
        }
    )

    if $progress {
        print -n $"($result)\r"
    } else {
        $result
    }
}

use std assert equal

#[test]
def bar_tests [] {
    equal "█▌   " (bar 0.3)
    equal "███       " (bar 0.3 --width 10)
    equal "▊" (bar 0.71 --width 1)
    equal "███████▏  " (bar 0.71 --width 10)
}