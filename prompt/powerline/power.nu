### pwd
def related [sub dir] {
    if $sub == $dir {
        return { related: '=', path: '' }
    }
    let suffix = (do --ignore-errors { $sub | path relative-to $dir })
    if ($suffix | is-empty) {
        return { related: '>', path: '' }
    } else {
        return { related: '<', path: $suffix}
    }
}

export def "pwd_abbr" [] {
    {||
        let pwd = ($env.PWD)

        let to_home = (related $pwd $nu.home-path)

        let cwd = if $to_home.related == '=' {
            "~"
        } else if $to_home.related == '>' {
            $pwd
        } else {
            $'~(char separator)($to_home.path)'
        }

        mut dir_comp = ($cwd | split row (char separator))

        if ($dir_comp | length) > 5 {
            let first = ($dir_comp | first)
            let last = ($dir_comp | last)
            let body = (
                $dir_comp
                |range 1..-2
                |each {|x| $x | str substring ..2 }
                )
            $dir_comp = ([$first $body $last] | flatten)
        }

        let style = if $to_home.related == '>' {
            $'(ansi xterm_gold3b)'
        } else {
            $'(ansi light_green_bold)'
        }
        $"($style)($dir_comp | str join (char separator))"
    }
}

### proxy
export def proxy_stat [] {
    {||
        if not (($env.https_proxy? | is-empty) and ($env.http_proxy? | is-empty)) {
            $'(ansi yellow)'
        } else {
            ''
        }
    }
}

### host
def host_abbr [] {
    {||
        let n = (hostname | str trim)
        let ucl = if (is-admin) {
                (ansi yellow)
            } else {
                (ansi blue)
            }
        $"($ucl)($n)"
    }
}

### time
def time_segment [] {
    {||
        $"(ansi xterm_tan)(date now | date format '%y-%m-%d/%H:%M:%S')"
    }
}

### prompt
def _sep [
    direction?: string
    color?: string = 'light_yellow'
    fg?: string
] {
    match $env.NU_POWER_DECORATOR {
        'plain' => {
            let r = match $direction {
                '>' => {
                    let r = $'(ansi light_yellow)|'
                    {|s| $"($s)($r)" }
                }
                '<' => {
                    let l = $'(ansi light_yellow)|'
                    {|s| $"($l)($s)" }
                }
                '<<'|'>>' => {{|s| $s }}
            }
            return $r
        }
        'power' => {
            let fg = if ($fg | is-empty) { $color } else { $fg }
            match $direction {
                '>' => {
                    let l = (ansi -e {bg: $fg})
                    let r = $'(ansi -e {fg: $fg, bg: $color})(char nf_left_segment)'
                    {|s| $'($l)($s)($r)' }
                }
                '>>' => {
                    let l = (ansi -e {bg: $fg})
                    let r = $'(ansi reset)(ansi -e {fg: $fg})(char nf_left_segment)'
                    {|s| $'($l)($s)($r)' }
                }
                '<'|'<<' => {
                    let l = $'(ansi -e {fg: $color})(char nf_right_segment)(ansi -e {bg: $color})'
                    {|s| $'($l)($s)' }
                }
            }
        }
    }
}

def left_prompt [segment] {
    let stop = ($segment | length) - 1
    let vs = ($segment | each {|x| [$x.color ($env.NU_PROMPT_COMPONENTS | get $x.source)]})
    let cs = ($vs | each {|x| $x.0})
    let cs = ($cs | prepend $cs.1?)
    let thunk = ($vs
        | zip $cs
        | enumerate
        | each {|x|
            if $x.index == $stop {
                [$x.item.0.1 (_sep '>>' $x.item.0.0 $x.item.1)]
            } else {
                [$x.item.0.1 (_sep '>' $x.item.0.0 $x.item.1)]
            }
        })
    {||
        $thunk
        | each {|x| do $x.1 (do $x.0) }
        | str join
    }
}

def right_prompt [segment] {
    let thunk = ( $segment
        | each {|x| [$x.color ($env.NU_PROMPT_COMPONENTS | get $x.source)]}
        | enumerate
        | each {|x|
            if $x.index == 0 {
                [$x.item.1 (_sep '<<' $x.item.0)]
            } else {
                [$x.item.1 (_sep '<' $x.item.0)]
            }
        })
    {||
        $thunk
        | reduce -f [] {|x, a|
            let v = (do $x.0)
            if ($v | is-empty) {
                $a
            } else {
                $a | append (do $x.1 $v)
            }
        }
        | str join
    }
}

def up_prompt [segment] {
    let thunk = ($segment
        | each {|y| $y | each {|x| $env.NU_PROMPT_COMPONENTS | get $x.source}
        })
    { ||
        let ss = ($thunk
            | each {|y|
                $y
                | each {|x| do $x }
                | filter {|x| not ($x | is-empty)}
                | str join $'(ansi light_yellow)|'
            })
        # TODO: length of unicode char is 3
        let fl = (((term size).columns - ($ss | str join ''| ansi strip | str length)) | math abs)
        $ss | str join $"(ansi xterm_grey)('' | fill -c '-' -w $fl)(ansi reset)"
    }
}

export def default_env [name value] {
    if ($name in ($env | columns)) {
        $env | get $name
    } else {
        $value
    }
}

export def-env init [] {
    match $env.NU_POWER_FRAME {
        'default' => {
            let-env PROMPT_COMMAND = (left_prompt $env.NU_POWER_SCHEMA.0)
            let-env PROMPT_COMMAND_RIGHT = (right_prompt $env.NU_POWER_SCHEMA.1)
        }
        'fill' => {
            let-env PROMPT_COMMAND = (up_prompt $env.NU_POWER_SCHEMA)
        }
    }

    let-env PROMPT_INDICATOR = {||
        match $env.NU_POWER_DECORATOR {
            'plain' => { "> " }
            'power' => { " " }
        }
    }
    let-env PROMPT_INDICATOR_VI_INSERT = {|| ": " }
    let-env PROMPT_INDICATOR_VI_NORMAL = {|| "> " }
    let-env PROMPT_MULTILINE_INDICATOR = {|| "::: " }

    let-env config = ( $env.config | update menus ($env.config.menus
        | each {|x|
            if ($x.marker in ($env.NU_POWER_MENU_MARKER | columns)) {
                let c = ($env.NU_POWER_MENU_MARKER | get $x.marker)
                $x | upsert marker $'(ansi -e {fg: $c})(char nf_left_segment_thin) '
            } else {
                $x
            }
        }
        ))

    hook
}

export def-env register [name source] {
    let-env NU_PROMPT_COMPONENTS = (
        $env.NU_PROMPT_COMPONENTS | upsert $name {|| $source }
    )
}

export def-env inject [pos idx define] {
    let prev = ($env.NU_POWER_SCHEMA | get $pos)
    let next = if $idx == 0 {
        $prev | prepend $define
    } else {
        [
            ($prev | range 0..($idx - 1))
            $define
            ($prev | range $idx..)
        ] | flatten
    }

    let-env NU_POWER_SCHEMA = (
        $env.NU_POWER_SCHEMA
        | update $pos $next
    )
}

export def-env eject [] {
    "power eject not implement"
}

export def-env hook [] {
    let-env config = ( $env.config | upsert hooks.env_change { |config|
        let init = [{|before, after| if not ($before | is-empty) { init } }]
        $config.hooks.env_change
        | upsert NU_POWER_SCHEMA $init
        | upsert NU_POWER_FRAME $init
        | upsert NU_POWER_DECORATOR $init
        | upsert NU_POWER_MENU_MARKER $init
        # NU_POWER_THEME
    })
}

export-env {
    let-env NU_POWER_SCHEMA = (default_env
        NU_POWER_SCHEMA
        [
            [
                {source: pwd,   color: '#353230'}
            ]
            [
                {source: proxy, color: 'dark_gray'}
                {source: host,  color: '#353230'}
                {source: time,  color: '#666560'}
            ]
        ]
    )

    let-env NU_POWER_FRAME = (default_env
        NU_POWER_FRAME
        'default' # default | fill
    )

    let-env NU_POWER_DECORATOR = (default_env
        NU_POWER_DECORATOR
        'power' # power | plain
    )

    let-env NU_POWER_THEME = (default_env
        NU_POWER_THEME
        {
            red: (ansi red)
        }
    )

    let-env NU_POWER_MENU_MARKER = (default_env
        NU_POWER_MENU_MARKER
        {
            "| " : 'green'
            ": " : 'yellow'
            "# " : 'blue'
            "? " : 'red'
        }
    )

    let-env NU_PROMPT_COMPONENTS = {
        pwd: (pwd_abbr)
        proxy: (proxy_stat)
        host: (host_abbr)
        time: (time_segment)
    }
}

