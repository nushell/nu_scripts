use std assert
use ../std-rfc/math

#[test]
export def "test significant-digits-decimals" [] {
    assert equal (0.0000012346789 | math significant-digits 2) 0.0000012
    assert equal (11 / 3 | math significant-digits 6) 3.66666
    assert not equal (0.0000012346789 | math significant-digits 2) 0.00000123
    assert equal (1.999999 | math significant-digits 1) 1.0
}

#[test]
export def "test significant-digits-duration" [] {
    assert equal (2min / 7 | math significant-digits 3) 17100000000ns
    assert equal (1sec | math significant-digits 3) 1000000000ns
}

#[test]
export def "test significant-digits-ints" [] {
    assert equal (123456 | math significant-digits 2) 120000
}

export def "test significant-digits-0" [] {
    assert equal (0 | math significant-digits 2) 0
}

export def "test significant-digits-negative" [] {
    assert equal (-1.23456789 | math significant-digits 5) (-1.2346)
}
