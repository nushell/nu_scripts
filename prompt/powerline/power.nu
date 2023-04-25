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

        let theme = $env.NU_POWER_THEME.pwd
        let style = if $to_home.related == '>' {
            $theme.out_home
        } else {
            $theme.default
        }
        $"($style)($dir_comp | str join (char separator))"
    }
}

### proxy
export def proxy_stat [] {
    {||
        let theme = $env.NU_POWER_THEME.proxy
        if not (($env.https_proxy? | is-empty) and ($env.http_proxy? | is-empty)) {
            $theme.on
        } else {
            $nothing
        }
    }
}

### host
def host_abbr [] {
    {||
        let theme = $env.NU_POWER_THEME.host
        let n = (hostname | str trim)
        let ucl = if (is-admin) {
                $theme.is_admin
            } else {
                $theme.default
            }
        $"($ucl)($n)"
    }
}

### time
def time_segment [] {
    {||
        let theme = $env.NU_POWER_THEME.time
        $"($theme.now)(date now | date format '%y-%m-%d/%H:%M:%S')"
    }
}

### prompt
def decorator [
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

def squash [thunk] {
    mut r = ""
    for t in $thunk {
        let v = (do $t.0)
        if ($v != $nothing) {
            $r += (do $t.1 $v)
        }
    }
    $r
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
                [$x.item.0.1 (decorator '>>' $x.item.0.0 $x.item.1)]
            } else {
                [$x.item.0.1 (decorator '>' $x.item.0.0 $x.item.1)]
            }
        })
    {|| squash $thunk }
}

def right_prompt [segment] {
    let thunk = ( $segment
        | each {|x| [$x.color ($env.NU_PROMPT_COMPONENTS | get $x.source)]}
        | enumerate
        | each {|x|
            if $x.index == 0 {
                [$x.item.1 (decorator '<<' $x.item.0)]
            } else {
                [$x.item.1 (decorator '<' $x.item.0)]
            }
        })
    {|| squash $thunk }
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
                | filter {|x| $x != $nothing }
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
            _ => { " " }
        }
    }
    let-env PROMPT_INDICATOR_VI_INSERT = {|| ": " }
    let-env PROMPT_INDICATOR_VI_NORMAL = {|| "> " }
    let-env PROMPT_MULTILINE_INDICATOR = {||
        match $env.NU_POWER_DECORATOR {
            'plain' => { "::: " }
            _ => { $"(char haze) " }
        }
    }

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

export def-env register [name source theme] {
    let-env NU_PROMPT_COMPONENTS = (
        $env.NU_PROMPT_COMPONENTS | upsert $name {|| $source }
    )
    let-env NU_POWER_THEME = (
        $env.NU_POWER_THEME | upsert $name $theme
    )
}

export def-env inject [pos idx define theme?] {
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

    if not ($theme | is-empty) {
        let kind = $define.source
        let prev_theme = ($env.NU_POWER_THEME | get $kind)
        let prev_cols = ($prev_theme | columns)
        let next_theme = ($theme | transpose k v)
        for n in $next_theme {
            if $n.k in $prev_cols {
                let-env NU_POWER_THEME = (
                    $env.NU_POWER_THEME | update $kind {|conf|
                      $conf | get $kind | update $n.k $n.v
                    }
                )
            }
        }
    }
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

    let-env NU_POWER_MENU_MARKER = (default_env
        NU_POWER_MENU_MARKER
        {
            "| " : 'green'
            ": " : 'yellow'
            "# " : 'blue'
            "? " : 'red'
        }
    )

    let-env NU_POWER_THEME = (default_env
        NU_POWER_THEME
        {
            pwd: {
                default: (ansi light_green_bold)
                out_home: (ansi xterm_gold3b)
            }
            proxy: {
                on: (ansi yellow)
            }
            host: {
                is_admin: (ansi yellow)
                default: (ansi blue)
            }
            time: {
                now: (ansi xterm_tan)
            }
        }
    )

    let-env NU_PROMPT_COMPONENTS = {
        pwd: (pwd_abbr)
        proxy: (proxy_stat)
        host: (host_abbr)
        time: (time_segment)
    }
}

