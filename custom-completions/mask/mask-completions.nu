def "nu-complete mask recipes" [] {
    ^mask --introspect
        | from json
        | get commands
        | each {|x|
            {
                value: $x.name,
                description: (
                    $x.description
                )
            }
        }
}

def "nu-complete mask args" [context: string, offset: int] {
    let r = ($context | split row ' ')
    let c = ^mask --introspect
        | from json
        | get commands
        | where name == $r.1
        | get 0
    mut rt = []
    if not ($c | get required_args | is-empty) {
        $rt ++= ($c | get required_args | each {|x|
            {value: null, description: $"($x.name) \(positional)"}
        })
    }
    if not ($c | get subcommands | is-empty) {
        $rt ++= ($c | get subcommands | each {|x|
            {value: $x.name, description: $"($x.description) \(subcommand)"}
        })
    }
    if not ($c | get named_flags | is-empty) {
        $rt ++= ($c | get named_flags | each {|x|
            let v = if not ($x.long | is-empty) { $"`--($x.long)`" } else if not ($x.short | is-empty) { $"`-($x.short)`" } else { $"---($x.name)" }
            let a = ["required", "multiple", "takes_value", "validate_as_number"]
                | filter {|y| ($x | get $y) == true }
                | str join ','
            let d = if ($a | is-empty) { $x.description } else { $"($x.description) \(($a))" }
            {value: $v , description: $d }
        })
    }

    $rt
}

export extern "mask" [
    recipes?: string@"nu-complete mask recipes"
    ...args: any@"nu-complete mask args"
]
