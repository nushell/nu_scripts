use std assert
use ../std-rfc/math

#[test]
export def "test round-significant-digits" [] {
    assert equal (0.0000012346789 | math round-significant-digits 2) 0.0000012
    assert not equal (0.0000012346789 | math round-significant-digits 2) 0.00000123
}
