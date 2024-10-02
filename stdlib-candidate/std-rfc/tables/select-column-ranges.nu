use ./col-indices.nu *

# Select a range of columns by their indices
#
# Example:
# 
# ls | select column-ranges 0 4 5 | first 3
# # => ╭───┬────────────────────╮
# # => │ # │        name        │
# # => ├───┼────────────────────┤
# # => │ 0 │ CITATION.cff       │
# # => │ 1 │ CODE_OF_CONDUCT.md │
# # => │ 2 │ CONTRIBUTING.md    │
# # => ╰───┴────────────────────╯
export def "select column-ranges" [
    ...ranges
] {
    let column_selector = ($in | col-indices ...$ranges)
    $in | select ...$column_selector
}