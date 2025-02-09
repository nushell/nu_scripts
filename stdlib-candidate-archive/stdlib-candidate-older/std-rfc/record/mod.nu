# Merge a list of records
export def "list merge" []: list<record> -> record {
    let list = $in
    mut result = {}
    for $obj in $list {
        $result = ($result | merge $obj)
    }
    $result
}

# Filter fields name by predicate
export def "filter-name predicate" [
    pred: closure  # Predicate closure that checks fields name
]: record -> record {
    let $obj_input = $in
    $obj_input
        | columns
        | where { $in | do $pred }
        | each {|input|
            { $input: ($obj_input | get $input) }
        }
        | list merge
}

# Filter fields name by text checking
export def "filter-name text" [
    filter: string  # Text to match with
    --regex(-r)     # Match by regex
]: record -> record {
    let obj = $in
    $obj | filter-name predicate { not ($in | (if $regex {find -r $filter} else {find $filter})  | is-empty) }
}

# Filter fields value by predicate
export def "filter-value predicate" [
    pred: closure # Predicate closure that checks fields value
]: record -> record {
    let $obj_input = $in
    $obj_input
        | columns
        | where {|col| $obj_input | get $col | do $pred }
        | each {|input|
            { $input: ($obj_input | get $input) }
        }
        | list merge
}
