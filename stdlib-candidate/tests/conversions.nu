use std assert
use ../std-rfc/conversions *

export def "test range-into-list" [] {
  assert equal (
    1..10 | into list
  ) (
    [ 1 2 3 4 5 6 7 8 9 10 ]
  )
}

export def "test string-into-list" [] {
  assert equal (
    "foo" | into list
  ) (
    [ foo ]
  )
}

export def "test range-stride-into-list" [] {
  assert equal (
    0..2..10 | into list
  ) (
    [ 0 2 4 6 8 10 ]
  )
}

export def "test null-into-list" [] {
  assert equal (
    null | into list | get 0 | describe
  ) (
    "nothing"
  )
}

export def "test list-into-list" [] {
  assert equal (
    [ foo bar baz ] | into list
  ) (
    [ foo bar baz ]
  )

}
