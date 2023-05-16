def "nu-complete just recipes" [] {
    ^just --unstable --unsorted --dump --dump-format json
        | from json
        | get recipes
        | transpose k v
        | each {|x|
            {
                value: $x.k,
                description: (
                    $x.v.parameters
                    | each {|y|
                        if ($y.default|is-empty) {
                            $y.name
                        } else {
                            $'($y.name)="($y.default)"'
                        }
                    }
                    | str join ' '
                )
            }
        }
}

def "nu-complete just args" [context: string, offset: int] {
    let r = ($context | split row ' ')
    ^just --unstable -u --dump --dump-format json
        | from json
        | get recipes
        | get ($r.2)
        | get body
        | each {|x| {description: ($x | get 0) }}
        | prepend ''
}

def prefix [prefix] {
    $in
    | each {|x| $x | update value $'($prefix) ($x.value)' }
    | append { value: '' }
}

def "nu-complete npm scripts" [] {
    open package.json | get scripts | transpose k v | each {|x| {value: $x.k} }
}

def "nu-complete all recipes" [context: string, offset: int] {
    let justs = (nu-complete just recipes | prefix 'just')
    let npms = if ([$env.PWD, package.json] | path join | path exists ) {
        nu-complete npm scripts | prefix 'npm run'
    } else { [] }
    [$justs $npms] | flatten
}

def "nu-complete all args" [context: string, offset: int] {
    let justs = (nu-complete just args $context $offset)
    [$justs] | flatten
}

export def j [
    recipes?: string@"nu-complete all recipes"
    ...args: any@"nu-complete all args"
] {
    if ($recipes | is-empty) {
        ^just
    } else {
        let init = ($recipes | split row ' ')
        ^($init | first) ($init | range 1..) $args
    }
}
