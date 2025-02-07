# Assign keynames to a list of values, effectively converting the list to a record.
#
# Example:
#
# [ 1 2 3 ] | name-values a b c
# => ╭───┬───╮
# => │ a │ 1 │
# => │ b │ 2 │
# => │ c │ 3 │
# => ╰───┴───╯
export def main [...names: string]: [list -> record] {
    let IN = $in
    0.. | zip $IN | into record | rename ...$names
}
