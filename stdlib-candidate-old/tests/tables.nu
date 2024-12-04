use std assert
use ../std-rfc/tables *

const test_table = [
  [ col-a     col-b     col-c     col-d     col-e     col-f ];
  [  'a0'      'b0'      'c0'      'd0'      'e0'      'f0' ]
  [  'a1'      'b1'      'c1'      'd1'      'e1'      'f1' ]
  [  'a2'      'b2'      'c2'      'd2'      'e2'      'f2' ]
  [  'a3'      'b3'      'c3'      'd3'      'e3'      'f3' ]
  [  'a4'      'b4'      'c4'      'd4'      'e4'      'f4' ]
  [  'a5'      'b5'      'c5'      'd5'      'e5'      'f5' ]
  [  'a6'      'b6'      'c6'      'd6'      'e6'      'f6' ]
  [  'a7'      'b7'      'c7'      'd7'      'e7'      'f7' ]
  [  'a8'      'b8'      'c8'      'd8'      'e8'      'f8' ]
  [  'a9'      'b9'      'c9'      'd9'      'e9'      'f9' ]
]

const enumerated_table = [
  [ index      col-a     col-b     col-c     col-d     col-e     col-f ];
  [   0         'a0'      'b0'      'c0'      'd0'      'e0'      'f0' ]
  [   1         'a1'      'b1'      'c1'      'd1'      'e1'      'f1' ]
  [   2         'a2'      'b2'      'c2'      'd2'      'e2'      'f2' ]
  [   3         'a3'      'b3'      'c3'      'd3'      'e3'      'f3' ]
  [   4         'a4'      'b4'      'c4'      'd4'      'e4'      'f4' ]
  [   5         'a5'      'b5'      'c5'      'd5'      'e5'      'f5' ]
  [   6         'a6'      'b6'      'c6'      'd6'      'e6'      'f6' ]
  [   7         'a7'      'b7'      'c7'      'd7'      'e7'      'f7' ]
  [   8         'a8'      'b8'      'c8'      'd8'      'e8'      'f8' ]
  [   9         'a9'      'b9'      'c9'      'd9'      'e9'      'f9' ]
]

export def "test row-indices-range" [] {
  assert equal (
    row-indices 0..3 10..11
  ) (
    [ 0 1 2 3 10 11 ]
  )
}

export def "test row-indices-index" [] {
  assert equal (
    row-indices 4
  ) (
    [ 4 ]
  )
}

export def "test row-indices-complex" [] {
  assert equal (
    row-indices 0..2..6 3 7
  ) (
    [ 0 2 4 6 3 7 ]
  )
}

export def "test col-index-ints" [] {
  assert equal (
    # Third and Fifth Columns
    $test_table | col-indices 2 4
  ) (
    [ 'col-c', 'col-e' ]
  )
}

export def "test col-index-complex" [] {
  assert equal (
    # Every other column, plus the second
    $test_table | col-indices 0..2..10 1
  ) (
    [ 'col-a', 'col-b', 'col-c', 'col-e' ]
  )
}

export def "test select-range single-int" [] {
  assert equal (
    $test_table | select ranges 1
  ) (
    $enumerated_table | select 1
  )
}

export def "test select-range single-range" [] {
  assert equal (
    $test_table | select ranges 2..4
  ) (
    $enumerated_table | select 2 3 4 
  )
}

export def "test select-range complex" [] {
  assert equal (
    # First and every following third-row + second row
    $test_table | select ranges 1 0..3..100
  ) (
    $enumerated_table | select 0 1 3 6 9
  )
}

export def "test select-range out-of-bounds" [] {
  assert equal (
    $test_table | select ranges 100
  ) (
    []
  )
}

export def "test reject-range single-index" [] {
  assert equal (
    $test_table | reject ranges 4
  ) (
    $enumerated_table | reject 4
  )
}

export def "test reject-range ranges" [] {
  assert equal (
    # Reject rows 0-3 and 5-9, leaving only 4
    $test_table | reject ranges 0..3 5..9
  ) (
    $enumerated_table | select 4
  )
}

export def "test reject-range out-of-bounds" [] {
  assert error {
    $test_table | reject ranges 1000
  }
}

export def "test select-col index" [] {
  assert equal (
    $test_table | select column-ranges 2
  ) (
    $test_table | select col-c
  )
}

export def "test select-col indices" [] {
  assert equal (
    $test_table | select column-ranges 2 4
  ) (
    $test_table | select col-c col-e
  )
}

export def "test select-col ranges-and-index" [] {
  assert equal (
    $test_table | select column-ranges 0..2..5 1
  ) (
    $test_table | select col-a col-c col-e col-b
  )
}

export def "test reject-col ranges-and-index" [] {
  assert equal (
    $test_table | reject column-ranges 0..2..5 1
  ) (
    $enumerated_table | select col-d col-f
  )
}

export def "test reject-col out-of-bounds" [] {
  assert equal (
    $test_table | reject column-ranges 1_000
  ) (
    $test_table
  )
}
