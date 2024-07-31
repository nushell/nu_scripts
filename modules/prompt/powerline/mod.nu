### pwd
use lib/pwd.nu *

### proxy
export def proxy_stat [] {
    {|bg|
        let theme = $env.NU_POWER_THEME.proxy
        if ($env.https_proxy? | is-not-empty) or ($env.http_proxy? | is-not-empty) {
            [$bg '']
        } else {
            [$bg null]
        }
    }
}

### host
def host_abbr [] {
    {|bg|
        let theme = $env.NU_POWER_THEME.host
        let n = (sys host).hostname
        let ucl = if (is-admin) {
                $theme.is_admin
            } else {
                $theme.default
            }
        [$bg $"($ucl)($n)"]
    }
}

### time
def time_segment [] {
    {|bg|
        let config = $env.NU_POWER_CONFIG.time
        let theme = $env.NU_POWER_THEME.time
        let format = match $config.style {
            "compact" => { $'($theme.fst)%y%m%d($theme.snd)%w($theme.fst)%H%M%S' }
            "rainbow" => {
                let fmt = [w y m d H M S]
                let color = ['1;93m' '1;35m' '1;34m' '1;36m' '1;32m' '1;33m' '1;91m']
                $fmt
                | enumerate
                | each { |x| $"(ansi -e ($color | get $x.index))%($x.item)" }
                | str join
            }
            _  => { $'($theme.fst)%y-%m-%d[%w]%H:%M:%S' }
        }
        [$bg $"(date now | format date $format)"]
    }
}

export use lib/profile.nu *

export def wraptime [message action] {
    if $env.NU_POWER_BENCHMARK? == true {
        {|| logtime $message $action }
    } else {
        $action
    }
}

def get_component [schema] {
    let component = $env.NU_PROMPT_COMPONENTS | get $schema.source
    if $env.NU_POWER_BENCHMARK? == true {
        {|bg| logtime $'component ($schema.source)' {|| do $component $bg } }
    } else {
        $component
    }
}

### prompt
def decorator [ ] {
    match $env.NU_POWER_DECORATOR {
        'plain' => {
            {|s, direction?: string, color?: string = 'light_yellow', next_color?: string|
                match $direction {
                    '|>'|'>' => {
                        let r = $'(ansi light_yellow)|'
                        $"($s)($r)"
                    }
                    '>>'|'<<' => {
                        $s
                    }
                    '<' => {
                        let l = $'(ansi light_yellow)|'
                        $"($l)($s)"
                    }
                }
            }
        }
        'power' => {
            {|s, direction?: string, color?: string = 'light_yellow', next_color?: string|
                match $direction {
                    '|>' => {
                        let l = (ansi -e {bg: $color})
                        let r = $'(ansi -e {fg: $color, bg: $next_color})(char nf_left_segment)'
                        $'($l)($s)($r)'
                    }
                    '>' => {
                        let r = $'(ansi -e {fg: $color, bg: $next_color})(char nf_left_segment)'
                        $'($s)($r)'
                    }
                    '>>' => {
                        let r = $'(ansi reset)(ansi -e {fg: $color})(char nf_left_segment)'
                        $'($s)($r)'
                    }
                    '<'|'<<' => {
                        let l = $'(ansi -e {fg: $color})(char nf_right_segment)(ansi -e {bg: $color})'
                        $'($l)($s)'
                    }
                }
            }
        }
    }
}

def left_prompt [segment] {
    let decorator = decorator
    let segment = $segment
        | each {|x|
            [$x.color (get_component $x)]
        }
    {||
        let segment = $segment
            | reduce -f [] {|x, acc|
                let y = do $x.1 $x.0
                if $y.1 == null {
                    $acc
                } else {
                    $acc | append [$y]
                }
            }
        let stop = ($segment | length) - 1
        let cs = $segment | each {|x| $x.0 } | append $segment.0.0 | range 1..
        $segment
        | zip $cs
        | enumerate
        | each {|x|
            if $x.index == $stop {
                do $decorator $x.item.0.1 '>>' $x.item.0.0 $x.item.1
            } else if $x.index == 0 {
                do $decorator $x.item.0.1 '|>' $x.item.0.0 $x.item.1
            } else {
                do $decorator $x.item.0.1 '>' $x.item.0.0 $x.item.1
            }
        }
        | str join
    }
}

def right_prompt [segment] {
    let decorator = decorator
    let segment = $segment
        | each {|x|
            [$x.color (get_component $x)]
        }
    {||
        $segment
        | reduce -f [] {|x,acc|
            let y = do $x.1 $x.0
            if $y.1 == null {
                $acc
            } else {
                $acc | append [$y]
            }
        }
        | enumerate
        | each {|x|
            if $x.index == 0 {
                do $decorator $x.item.1 '<<' $x.item.0
            } else {
                do $decorator $x.item.1 '<' $x.item.0
            }
        }
        | str join
    }
}

def up_prompt [segment] {
    let thunk = $segment
        | each {|y| $y | each {|x| get_component $x } }
    { ||
        let ss = $thunk
            | each {|y|
                $y
                | reduce -f [] {|x, acc|
                    let y = (do $x null)
                    if $y.1 == null {
                        $acc
                    } else {
                        $acc | append $y.1
                    }
                }
                | str join $'(ansi light_yellow)|'
            }
        # TODO: length of unicode char is 3
        let fl = (term size).columns - ($ss | str join ''| ansi strip | str length) | math abs
        $ss | str join $"(ansi xterm_grey)('' | fill -c '-' -w $fl)(ansi reset)"
    }
}

export def default_env [name value] {
    if $name in $env {
        $env | get $name
    } else {
        $value
    }
}

export def --env init [] {
    match $env.NU_POWER_FRAME {
        'default' => {
            $env.PROMPT_COMMAND = (wraptime
                'left'
                (left_prompt $env.NU_POWER_SCHEMA.0)
            )
            $env.PROMPT_COMMAND_RIGHT = (wraptime
                'right'
                (right_prompt $env.NU_POWER_SCHEMA.1)
            )
        }
        'fill' => {
            $env.PROMPT_COMMAND = (up_prompt $env.NU_POWER_SCHEMA)
        }
    }

    $env.PROMPT_INDICATOR = {||
        match $env.NU_POWER_DECORATOR {
            'plain' => { "> " }
            _ => { " " }
        }
    }
    $env.PROMPT_INDICATOR_VI_INSERT = {|| ": " }
    $env.PROMPT_INDICATOR_VI_NORMAL = {|| "> " }
    $env.PROMPT_MULTILINE_INDICATOR = {||
        match $env.NU_POWER_DECORATOR {
            'plain' => { "::: " }
            _ => { $"(char haze) " }
        }
    }

    $env.config = ( $env.config | update menus ($env.config.menus
        | each {|x|
            if ($x.marker in $env.NU_POWER_MENU_MARKER) {
                let c = ($env.NU_POWER_MENU_MARKER | get $x.marker)
                $x | upsert marker $'(ansi -e {fg: $c})(char nf_left_segment_thin) '
            } else {
                $x
            }
        }
        ))

    hook
}

export def --env set [name setup] {
    $env.NU_POWER_THEME = (if ($setup.theme? | is-empty) {
            $env.NU_POWER_THEME
        } else {
            let n = $setup.theme
            | transpose k v
            | reduce -f {} {|it, acc|
                $acc | insert $it.k (ansi -e {fg: $it.v})
            }
            let o = if $name in $env.NU_POWER_THEME {
                $env.NU_POWER_THEME | get $name
            } else {
                {}
            }
            $env.NU_POWER_THEME
            | upsert $name ($o | merge $n)
        })

    $env.NU_POWER_CONFIG = (if ($setup.config? | is-empty) {
            $env.NU_POWER_CONFIG
        } else {
            let n = $setup.config
            | transpose k v
            | reduce -f {} {|it, acc|
                $acc | insert $it.k $it.v
            }
            let o = if $name in $env.NU_POWER_CONFIG {
                $env.NU_POWER_CONFIG | get $name
            } else {
                {}
            }
            $env.NU_POWER_CONFIG
            | upsert $name ($o | merge $n)
        })
}

export def --env register [name source setup] {
    set $name $setup

    $env.NU_PROMPT_COMPONENTS = (
        $env.NU_PROMPT_COMPONENTS | upsert $name {|| $source }
    )
}

export def --env inject [pos idx define setup?] {
    let prev = $env.NU_POWER_SCHEMA | get $pos
    let next = if $idx == 0 {
        $prev | prepend $define
    } else {
        [
            ($prev | range 0..($idx - 1))
            $define
            ($prev | range $idx..)
        ] | flatten
    }

    $env.NU_POWER_SCHEMA = (
        $env.NU_POWER_SCHEMA
        | update $pos $next
    )

    let kind = $define.source

    if ($setup.theme? | is-not-empty) {
        let prev_theme = $env.NU_POWER_THEME | get $kind
        let prev_cols = $prev_theme | columns
        let next_theme = $setup.theme | transpose k v
        for n in $next_theme {
            if $n.k in $prev_cols {
                $env.NU_POWER_THEME = (
                    $env.NU_POWER_THEME | update $kind {|conf|
                      $conf | get $kind | update $n.k (ansi -e {fg: $n.v})
                    }
                )
            }
        }
    }

    if ($setup.config? | is-not-empty) {
        let prev_cols = $env.NU_POWER_CONFIG | get $kind | columns
        for n in ($setup.config | transpose k v) {
            if $n.k in $prev_cols {
                $env.NU_POWER_CONFIG = (
                    $env.NU_POWER_CONFIG | update $kind {|conf|
                      $conf | get $kind | update $n.k $n.v
                    }
                )
            }
        }
    }
}

export def --env eject [] {
    "power eject not implement"
}

export def --env hook [] {
    $env.config = ( $env.config | upsert hooks.env_change { |config|
        let init = [{|before, after| if ($before | is-not-empty) { init } }]
        $config.hooks.env_change
        | upsert NU_POWER_SCHEMA $init
        | upsert NU_POWER_FRAME $init
        | upsert NU_POWER_DECORATOR $init
        | upsert NU_POWER_MENU_MARKER $init
        | upsert NU_POWER_BENCHMARK [{ |before, after|
            if ($before | is-not-empty) {
                init
                rm -f ~/.cache/nushell/power_time.log
            }
        }]

        # NU_POWER_THEME
    })
}

export-env {
    $env.NU_POWER_BENCHMARK = false

    $env.NU_POWER_SCHEMA = (default_env
        NU_POWER_SCHEMA
        [
            [
                {source: pwd,   color: '#353230'}
            ]
            [
                {source: proxy, color: 'dark_gray'}
                {source: host,  color: '#504945'}
                {source: time,  color: '#353230'}
            ]
        ]
    )

    $env.NU_POWER_FRAME = (default_env
        NU_POWER_FRAME
        'default' # default | fill
    )

    $env.NU_POWER_DECORATOR = (default_env
        NU_POWER_DECORATOR
        'power' # power | plain
    )

    $env.NU_POWER_MENU_MARKER = (default_env
        NU_POWER_MENU_MARKER
        {
            "| " : 'green'
            ": " : 'yellow'
            "# " : 'blue'
            "? " : 'red'
        }
    )

    $env.NU_POWER_THEME = (default_env
        NU_POWER_THEME
        {
            pwd: {
                default: (ansi xterm_green)
                out_home: (ansi xterm_gold3b)
                vcs: (ansi xterm_teal)
            }
            proxy: {
                on: (ansi yellow)
            }
            host: {
                is_admin: (ansi yellow)
                default: (ansi blue)
            }
            time: {
                fst: (ansi xterm_tan)
                snd: (ansi xterm_aqua)
            }
        }
    )

    $env.NU_POWER_CONFIG = (default_env
        NU_POWER_CONFIG
        {
            time: {
                style: null
            }
        }
    )

    $env.NU_PROMPT_COMPONENTS = {
        pwd: (pwd_abbr)
        proxy: (proxy_stat)
        host: (host_abbr)
        time: (time_segment)
    }
}

