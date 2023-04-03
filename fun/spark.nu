let TICKS = [(char -u "2581")
              (char -u "2582")
              (char -u "2583")
              (char -u "2584")
              (char -u "2585")
              (char -u "2586")
              (char -u "2587")
              (char -u "2588")]

# send an array into spark and get a sparkline out
# let v = [2, 250, 670, 890, 2, 430, 11, 908, 123, 57]
# > spark $v
# ▁▂▆▇▁▄▁█▁▁

# create a small sparkline graph
def spark [v: list] {
    let min = ($v | math min)
    let max = ($v | math max)
    let ratio = (if $max == $min { 1.0 } else { 7.0 / ($max - $min)})
    $v | each { |e|
        let i = ((($e - $min) * $ratio) | math round)
        $"($TICKS | get $i)"
    } | str join
}

def assert_eq [num: int, expected: string, input: list] {
    let actual = (spark2 $input)
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

def spark2_tests [] {
    assert_eq 1 "▁" [1.0]
    assert_eq 2 "▁▁" [1.0, 1.0]
    assert_eq 3 "▁▁▁▁" [1.0, 1.0, 1.0, 1.0]
    assert_eq 4 "▁▅▄▇▄█" [1.0, 1.3, 1.2, 1.4, 1.2, 1.5]
    assert_eq 5 "▁█▅" [-1.0, 1.0, 0.0]
    assert_eq 6 "▁▂█▅▂" [1.0, 5.0, 22.0, 13.0, 5.0]
    assert_eq 7 "▁▂▄▅▃█" [0.0, 30.0, 55.0, 80.0, 33.0, 150.0]
    assert_eq 8 "▁▁▁▁▃▁▁▁▂█" [1.0, 2.0, 3.0, 4.0, 100.0, 5.0, 10.0, 20.0, 50.0, 300.0]
    assert_eq 9 "▁▄█" [1.0, 50.0, 100.0]
    assert_eq 10 "▁▄█" [0.1, 5.0, 10.0]
    assert_eq 11 "▁▃█" [2.0, 4.0, 8.0]
    # assert_eq 12 "▁█" [2.0, 4.0, 8.0]
}