use std assert
use ../std-rfc bench

export def "test bench-timings" [] {
    let $test = bench {1 + 2} --rounds 3 --list-timings | get times | length
    assert equal $test 3
}

export def "test bench-pretty" [] {
    let $test = (bench {1 + 2} --rounds 3 --pretty) =~ '\d.* \+/- \d'
    assert equal $test true
}
