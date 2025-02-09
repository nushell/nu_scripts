# Convert/split a table into a list of columns
#
# Examples:
# ls | table-into-columns 
# => Returns a list of 4 tables, one for each of the `ls` columns
#
# Can be roundtripped with `columns-into-table`
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
export def main []: [table -> list<table>] {
    let IN = $in
    $IN | columns | each {|col| $IN | select $col}
}
