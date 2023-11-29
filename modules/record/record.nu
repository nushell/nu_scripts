# Merge a list of records
export def "list merge" [] {
    let list = $in
    mut result = {}
    for $obj in $list {
        $result = ($result | merge $obj)
    }
    $result
}

export module filter-name {
    # Filter fields name by predicate
    export def predicate [
        pred: closure  # Predicate closure that checks fields name
    ] {
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
    export def text [
        filter: string  # Text to match with
        --regex(-r)     # Match by regex
    ] {
        let obj = $in
        $obj | predicate { not ($in | (if $regex {find -r $filter} else {find $filter})  | is-empty) }
    }
}

# Filter fields value by predicate
export def "filter-value predicate" [
    pred: closure # Predicate closure that checks fields value
] {
    let $obj_input = $in
    $obj_input 
        | columns 
        | where {|col| $obj_input | get $col | do $pred }
        | each {|input| 
            { $input: ($obj_input | get $input) } 
        }
        | list merge
}