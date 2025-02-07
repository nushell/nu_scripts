use ../conversions/into-list.nu *

# Return a list of indices for the provided ranges or indices. Primarily used as a helper for "select ranges" et. al.
#
# Example:
#
# row-indices 0 2..5 7..8
# # => ╭───┬───╮
# # => │ 0 │ 0 │
# # => │ 1 │ 2 │
# # => │ 2 │ 3 │
# # => │ 3 │ 4 │
# # => │ 4 │ 5 │
# # => │ 5 │ 7 │
# # => │ 6 │ 8 │
# # => ╰───┴───╯
export def main [ ...ranges ] {
  $ranges
  | reduce -f [] {|range,indices|
    $indices ++ ($range | into list)
  }
}
