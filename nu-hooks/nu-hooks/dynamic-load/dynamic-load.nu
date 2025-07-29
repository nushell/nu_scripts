def dynamic_load [] {
    [
        {
            condition: {|before, after| (not ('.nu' in (overlay list))) and ('~/.nu' | path exists) }
            code: "overlay use ~/.nu as .nu"
        }
    ]
}

export-env {
    $env.config = ( $env.config | upsert hooks.env_change.PWD { |config|
        let o = ($config | get -o hooks.env_change.PWD)
        let val = (dynamic_load)
        if $o == null {
            $val
        } else {
            $o | append $val
        }
    })
}


# const path = "~/.nu"
# const if ($path| path expand | path exists) {
#   source $path
# }
