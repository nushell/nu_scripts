use std assert
use ../std-rfc bench

export def "test bench-units" [] {
    let $test = bench {sleep 0.001sec; 1 + 2} --units ns --rounds 2 | get mean
    assert str contains $test " ns"
}

export def "test bench-timings" [] {
    let $test = bench {1 + 2} --rounds 3 --list-timings | get times | length
    assert equal $test 3
}

export def "test bench-pretty" [] {
    let $test = (bench {1 + 2} --rounds 3 --pretty) =~ '\d.* \+/- \d'
    assert equal $test true
}

export def "test bench-sign-digits" [] {
    let $test = bench {sleep 1ms} --sign-digits 1 --rounds 5 | get min
    assert equal $test 1ms
}
