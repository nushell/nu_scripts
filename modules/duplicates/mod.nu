# duplicates returns the rows that correspond to duplicates of the given column.
export def duplicates  [
    column: string # Column to look duplicates at
    --count(-c) # set it to display the number of times the value is repeated.
] {
    group-by {get $column | into string} |
    transpose |
    insert count { $in.column1 | flatten | length } |
    where count > 1 |
    reject column0 |
    if  ($count | is-empty) { reject count } else { each { $in } }  |
    flatten |
    flatten
}

# duplicates files recursively finds duplicate files in the current working folder.
# It uses a heuristic based on duplicate files having the same size.
export def "duplicates files" [] {
    do -i {ls **/*} | duplicates size
}


