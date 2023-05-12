# construct bars based of a given percentage from a given width (5 is default)
# > bar 0.2
# █
# > bar 0.71 --width 10
# ███████
def 'bar' [
    percentage: float
    --background (-b): string = 'default'
    --foreground (-f): string = 'default'
    --progress (-p) # output the result using 'print -n' with '\r' at the end
    --width (-w): int = 5
] {
    let blocks = [null "▏" "▎" "▍" "▌" "▋" "▊" "▉" "█"]
    let $whole_part = (($blocks | last) * ($percentage * $width // 1))
    let $fraction = (
        $blocks 
        | get (
            ($percentage * $width) mod 1 
            | $in * ($blocks | length) 
            | math floor
        )
    )

    let $result = (
        $"($whole_part)($fraction)" 
        | fill -c $' ' -w $width 
        | $"(ansi -e {fg: ($foreground), bg: ($background)})($in)(ansi reset)"
    )

    if $progress {
        print -n $"($result)\r"
    } else {
        $result
    }
}

def assert_eq [num: int, expected: string, input_1: float, input_2?] {
    let actual = (
        if ($input_2 == null) {bar $input_1} else {
            bar $input_1 --width $input_2
        }
    )
    let span = (metadata $expected).span;
    if $actual != $expected {
      error make {
        msg: "Actual != Expected",
        label: {
            text: $"expected ($expected) but got ($actual)", start: $span.start, end: $span.end
        }
      }
    } else {
        print $"Test ($num) (ansi green)passed(ansi reset) ✓"
    }
}

def bar_tests [] {
    assert_eq 1 "[49;39m▏    [0m" 0.03
    assert_eq 2 "[49;39m▎         [0m" 0.03 10
    assert_eq 3 "[49;39m▊[0m" 0.71 1
    assert_eq 4 "[49;39m███████   [0m" 0.71 10
}
