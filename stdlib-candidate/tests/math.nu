use std assert
use ../std-rfc/math

#[test]
export def "test reset-insignificant-digits-decimals" [] {
    assert equal (0.0000012346789 | math reset-insignificant-digits 2) 0.0000012
    assert equal (11 / 3 | math reset-insignificant-digits 6) 3.66666
    assert not equal (0.0000012346789 | math reset-insignificant-digits 2) 0.00000123
    assert equal (1.999999 | math reset-insignificant-digits 1) 1.0
}

#[test]
export def "test reset-insignificant-digits-duration" [] {
    assert equal (2min / 7 | math reset-insignificant-digits 3) 17100000000ns
    assert equal (1sec | math reset-insignificant-digits 3) 1000000000ns
}

#[test]
export def "test reset-insignificant-digits-ints" [] {
    assert equal (123456 | math reset-insignificant-digits 2) 120000
}
