use ./row-indices.nu *

# Selects one or more rows while keeping the original indices.
#
# Example - Selects the first, fifth, and sixth rows from the table:
#
# ls / | select ranges 0 4..5
#
# Example - Select the 5th row:
#
# ls / | select 5
#
# Example - Select the 4th row.
#
# Note that the difference between this and `select 3` is that the index (#) column shows the *original* (pre-select) position in the table.
#
# ls | select ranges 3
export def "select ranges" [ ...ranges ] {
  enumerate
  | flatten
  | select ...(row-indices ...$ranges)
}
