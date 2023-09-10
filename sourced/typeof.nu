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

#[test]
def simple_type [] {
    use std assert

    assert equal ("foo" | typeof) "string"
    assert equal (123 | typeof) "int"
    assert equal (true | typeof) "bool"
}

#[test]
def list_type [] {
    use std assert

    assert equal ([1 2 3] | typeof) {type: "list", items: "int"}
    assert equal (["foo" "bar" "baz"] | typeof) {type: "list", items: "string"}
    assert equal (["foo" 2 true] | typeof) {type: "list", items: "any"}
}

#[test]
def table_type [] {
    use std assert
    assert equal (ls | typeof) {
        type: "table",
        columns: {
            name: "string",
            type: "string",
            size: "filesize",
            modified: "date",
        }
    }
}


#[test]
def record_type [] {
    use std assert
    assert equal ($nu | typeof) {
        type: "record",
        fields: {
            default-config-dir: "string",
            config-path: "string",
            env-path: "string",
            history-path: "string",
            loginshell-path: "string",
            plugin-path: "string",
            home-path: "string",
            temp-path: "string",
            pid: "int",
            os-info: {
                type: "record",
                fields: {
                    name: "string",
                    arch: "string",
                    family: "string",
                    kernel_version: "string",
                }
            },
            startup-time: "duration",
            is-interactive: "bool",
            is-login: "bool",
            current-exe: "string",
        }
    }
}
