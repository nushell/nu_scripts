# Convert a list of columns into a table
#
# Examples:
#
# [
#  ([ 1 2 3 ] | wrap a)
#  ([ 4 5 6 ] | wrap b)
#  ([ 7 8 9 ] | wrap c)
# ] | columns-into-table 
# => ╭───┬───┬───┬───╮
# => │ # │ a │ b │ c │
# => ├───┼───┼───┼───┤
# => │ 0 │ 1 │ 4 │ 7 │
# => │ 1 │ 2 │ 5 │ 8 │
# => │ 2 │ 3 │ 6 │ 9 │
# => ╰───┴───┴───┴───╯
#
# Can roundtrip with `table-into-columns`
# 
# ls | table-into-columns | columns-into-table
# => ╭───┬────────────────────────┬──────┬────────┬────────────────╮
# => │ # │          name          │ type │  size  │    modified    │
# => ├───┼────────────────────────┼──────┼────────┼────────────────┤
# => │ 0 │ into-list.nu           │ file │  378 B │ 40 minutes ago │
# => │ 1 │ mod.nu                 │ file │   28 B │ 41 minutes ago │
# => │ 2 │ name-values.nu         │ file │  394 B │ 34 minutes ago │
# => │ 3 │ record-into-columns.nu │ file │ 1.3 kB │ 27 minutes ago │
# => ╰───┴────────────────────────┴──────┴────────┴────────────────╯
export def main []: [list<table> -> table] {
    reduce {|it| merge $it}
}
