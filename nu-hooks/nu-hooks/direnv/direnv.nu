def direnv [] {
    [
        {
            condition: {|before, after| ($before != $after) and ($after | path join .env.yaml | path exists) }
            code: "
                open .env.yaml | load-env
            "
        }
        {
            condition: {|before, after| ($before != $after) and ($after | path join '.env' | path exists) }
            code: "
                open .env
                | lines
                | parse -r '(?P<k>.+?)=(?P<v>.+)'
                | reduce -f {} {|x, acc| $acc | upsert $x.k $x.v}
                | load-env
            "
        }
    ]
}

export-env {
    $env.config = ( $env.config | upsert hooks.env_change.PWD { |config|
        let o = ($config | get -o hooks.env_change.PWD)
        let val = (direnv)
        if $o == null {
            $val
        } else {
            $o | append $val
        }
    })
}
