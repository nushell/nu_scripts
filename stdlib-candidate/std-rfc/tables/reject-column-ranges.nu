use ./col-indices.nu *

# Reject a range of columns by their indices
#
# Example:
#
# ls | reject column-ranges 0 4 5 | first 3
export def "reject column-ranges" [
    ...ranges
] {
    let column_selector = ($in | col-indices ...$ranges)
    $in | reject ...$column_selector
}
