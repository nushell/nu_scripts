use ./col-indices.nu *

# Select a range of columns by their indices
#
# Example:
# 
# ls -l | select column-ranges 0 10..12 | first 3
# # => ╭───┬────────────────────┬──────────────┬─────────────┬──────────────╮
# # => │ # │        name        │   created    │  accessed   │   modified   │
# # => ├───┼────────────────────┼──────────────┼─────────────┼──────────────┤
# # => │ 0 │ CITATION.cff       │ 3 months ago │ 4 hours ago │ 3 months ago │
# # => │ 1 │ CODE_OF_CONDUCT.md │ 7 months ago │ 4 hours ago │ 7 months ago │
# # => │ 2 │ CONTRIBUTING.md    │ 3 months ago │ 4 hours ago │ 3 months ago │
# # => ╰───┴────────────────────┴──────────────┴─────────────┴──────────────╯
export def "select column-ranges" [
    ...ranges
] {
    let column_selector = ($in | col-indices ...$ranges)
    $in | select ...$column_selector
}