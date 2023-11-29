def direnv [] {
    [
        {
            condition: {|before, after| ($before != $after) and ($after | path join .env.yaml | path exists) }
            code: "
                $env.ENV_PWD = $env.PWD
                open .env.yaml | load-env
            "
        }
        {
            condition: {|before, after| ($before != $after) and ($after | path join '.env' | path exists) }
            code: "
                $env.envpath = ($after)
                echo $'🖊️ Loading variable from .env: ($env.envpath)/.env'
                open .env
                | lines
                | parse -r '(?P<k>.+?)=(?P<v>.+)'
                | reduce -f {} {|x, acc| $acc | upsert $x.k $x.v}
                | load-env
            "
        }
        {
            condition: {|before, after| ($before != $after) and (($env|get -i envpath) != null) and ($env.envpath != $after) }
            code: "
                try {
                    (($after) | path relative-to ($env.envpath))
                } catch {
                    echo $'󰩺  Remone variable from .env: ($env.envpath)/.env'
                    $env.envpath = $'($env.envpath)/.env'
                    open $env.envpath
                    | lines
                    | parse -r '(?P<k>.+?)=(?P<v>.+)'
                    | reduce -f {} {|x, acc| $acc | upsert $x.k null}
                    | load-env
                    $env.envpath = null
                }

            "
        }
    ]
}

export-env {
    $env.config = ( $env.config | upsert hooks.env_change.PWD { |config|
        let o = ($config | get -i hooks.env_change.PWD)
        let val = (direnv)
        if $o == null {
            $val
        } else {
            $o | append $val
        }
    })
}
