# give the type of the input data in a structured form
def typeof [] {
    let data = $in
    let raw_type = $data | describe

    match ($raw_type | str replace --regex "<.*" "") {
        "list" => { {
            type: "list"
            items: ($raw_type | parse "list<{type}>" | get type.0)
        } },
        "record" => {
            type: "record"
            fields: ($data | columns | each {|field| {
                name: $field,
                type: ($data | get $field | typeof)
            } } | transpose -rid)
        },
        "table" => {
            type: "table"
            columns: ($data | columns | each {|col| {
                name: $col,
                type: ($data | get $col | describe | parse "list<{type}>" | get type.0)
            } } | transpose -rid)
        },
        _ => $raw_type
    }
}
