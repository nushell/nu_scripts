# Convert a record, where each value is a list, into a list of columns.
# { a: [ 1 2 3 ], b: [ 4 5 6 ] } | record-into-columns
# => ╭───┬───────────╮
# => │ 0 │ ╭───┬───╮ │
# => │   │ │ # │ a │ │
# => │   │ ├───┼───┤ │
# => │   │ │ 0 │ 1 │ │
# => │   │ │ 1 │ 2 │ │
# => │   │ │ 2 │ 3 │ │
# => │   │ ╰───┴───╯ │
# => │ 1 │ ╭───┬───╮ │
# => │   │ │ # │ b │ │
# => │   │ ├───┼───┤ │
# => │   │ │ 0 │ 4 │ │
# => │   │ │ 1 │ 5 │ │
# => │   │ │ 2 │ 6 │ │
# => │   │ ╰───┴───╯ │
# => ╰───┴───────────╯
# =>
# This can be especially useful when combined with `columns-into-table`, as in:
#
# { a: [ 1 2 3 ], b: [ 4 5 6 ] } | record-into-columns
# | columns-into-table
# => ╭───┬───┬───╮
# => │ # │ a │ b │
# => ├───┼───┼───┤
# => │ 0 │ 1 │ 4 │
# => │ 1 │ 2 │ 5 │
# => │ 2 │ 3 │ 6 │
# => ╰───┴───┴───╯
# =>
export def main []: [record -> list] {
    items {|key, val| $val | wrap $key}
}
