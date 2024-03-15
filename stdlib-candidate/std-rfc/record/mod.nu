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

#[test]
def test_record_list_merge [] {
    use std assert
    assert equal ([{a:1} {b:2} {c:3} {d:4}] | list merge) {a:1 b:2 c:3 d:4}
}
#[test]
def test_record_filtername_predicate [] {
    use std assert
    assert equal ({aa:1 ab:2 ba:3 bb:4 ca:5 cb:6} | filter-name predicate {$in | str contains a}) {aa:1 ab:2 ba:3 ca:5}
}
#[test]
def test_record_filtername_text [] {
    use std assert
    assert equal ({aa:1 ab:2 ba:3 bb:4 ca:5 cb:6} | filter-name text a) {aa:1 ab:2 ba:3 ca:5}
    assert equal ({aa:1 ab:2 ba:3 bb:4 ca:5 cb:6} | filter-name text -r ^a) {aa:1 ab:2}
    assert equal ({aa:1 ab:2 ba:3 bb:4 ca:5 cb:6} | filter-name text -r ^A) {}
}
#[test]
def test_record_filtervalue_predicate [] {
    use std assert
    assert equal ({aa:1 ab:2 ba:3 bb:4 ca:5 cb:6} | filter-value predicate { $in mod 2 == 0 }) {ab:2 bb:4 cb:6}
}