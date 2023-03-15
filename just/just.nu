export def run [...x: any] {
    let script = $"($env.PWD)/.nu"
    nu $script ...$x
}

export def "nu-complete just recipes" [] {
    ^just --unstable --unsorted --dump --dump-format json
        | from json
        | get recipes
        | transpose k v
        | each {|x|
            {
                value: $x.k,
                description: ( $x.v.parameters
                             | each {|y| $y.name}
                             | str join ' '
                             )
            }
        }
}

export def "nu-complete just args" [context: string, offset: int] {
    let r = ($context | split row ' ')
    ^just --unstable -u --dump --dump-format json
        | from json
        | get recipes
        | get ($r.1)
        | get body
        | each {|x| {description: ($x | get 0) }}
        | prepend ''

}

export extern "main" [
    recipes?: string@"nu-complete just recipes"
    ...args: any@"nu-complete just args"
]
