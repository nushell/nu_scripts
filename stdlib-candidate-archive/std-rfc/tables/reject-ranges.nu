use ./row-indices.nu *

# Rejects one or more rows while keeping the original indices.
#
# Example - Rejects the first, fifth, and sixth rows from the table:
#
# ls / | reject ranges 0 4..5
export def "reject ranges" [ ...ranges ] {
  enumerate
  | flatten
  | collect
  | reject ...(row-indices ...$ranges)
}
