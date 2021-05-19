# duplicates returns the rows that correspond to duplicates of the given column.
def duplicates [
    column: string # Column to look duplicates at
    --count(-c) # set it to display the number of times the value is repeated.
] {
    group-by $column |
    pivot |
    insert count { $it.Column1 | flatten | length } |
    where count > 1 |
    reject Column0 |
    if  ($count | empty?) { reject count } { each { $it } }  |
    flatten |
    flatten
}

# duplicates files recursively finds duplicate files in the current working folder.
# It uses a heuristic based on duplicate files having the same size.
def "duplicates files" [] {
    do -i {ls **/*} | duplicates size
}


