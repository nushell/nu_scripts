### pwd
def related [sub dir] {
    if $sub == $dir {
        return { related: '=', path: '' }
    }
    let suffix = (do --ignore-errors { $sub | path relative-to $dir })
    if ($suffix | is-empty) {
        { related: '>', path: '' }
    } else {
        { related: '<', path: $suffix}
    }
}

export def "pwd_abbr" [] {
    {|bg|
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
                |slice 1..-2
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
        [$bg $"($style)($dir_comp | str join (char separator))"]
    }
}

### proxy
export def proxy_stat [] {
    {|bg|
        let theme = $env.NU_POWER_THEME.proxy
        if not (($env.https_proxy? | is-empty) and ($env.http_proxy? | is-empty)) {
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
        let n = (hostname | str trim)
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

### utils
def logtime [msg act] {
    let start = (date now)
    let result = (do $act)
    # HACK: serialization
    let period = ((date now) - $start | format duration ns | str replace ' ' '')

    echo $'($start | format date '%Y-%m-%d_%H:%M:%S%z')(char tab)($period)(char tab)($msg)(char newline)'
    | save -a ~/.cache/nushell/power_time.log

    $result
}

export def wraptime [message action] {
    if $env.NU_POWER_BENCHMARK? == true {
        {|| logtime $message $action }
    } else {
        $action
    }
}

def get_component [schema] {
    let component = ($env.NU_PROMPT_COMPONENTS | get $schema.source)
    if $env.NU_POWER_BENCHMARK? == true {
        {|bg| logtime $'component ($schema.source)' {|| do $component $bg } }
    } else {
        $component
    }
}

export def timelog [] {
    open ~/.cache/nushell/power_time.log
    | from tsv -n
    | rename start duration message
    | each {|x|
        $x
        | update start ($x.start | into datetime -f '%Y-%m-%d_%H:%M:%S%z')
        | update duration ($x.duration | into duration)
    }
}

export def analyze [] {
    timelog
    | group-by message
    | transpose component metrics
    | each {|x| $x | upsert metrics ($x.metrics | get duration | math avg)}
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
    let decorator = (decorator)
    let segment = ($segment
        | each {|x|
            [$x.color (get_component $x)]
        })
    {||
        let segment = ($segment
            | reduce -f [] {|x, acc|
                let y = (do $x.1 $x.0)
                if $y.1 == null {
                    $acc
                } else {
                    $acc | append [$y]
                }
            })
        let stop = ($segment | length) - 1
        let cs = ($segment | each {|x| $x.0 } | append $segment.0.0 | slice 1..)
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
    let decorator = (decorator)
    let segment = ($segment
        | each {|x|
            [$x.color (get_component $x)]
        })
    {||
        $segment
        | reduce -f [] {|x,acc|
            let y = (do $x.1 $x.0)
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

def decorator_gen [
    direction?: string
    color?: string = 'light_yellow'
    next_color?: string
] {
    match $env.NU_POWER_DECORATOR {
        'plain' => {
            match $direction {
                '|>'|'>' => {
                    let r = $'(ansi light_yellow)|'
                    {|s| $"($s)($r)" }
                }
                '>>' => {
                    {|s| $s }
                }
                '<'|'<<' => {
                    let l = $'(ansi light_yellow)|'
                    {|s| $"($l)($s)" }
                }
            }
        }
        'power' => {
            match $direction {
                '|>' => {
                    let l = $'(ansi -e {bg: $color})'
                    let r = $'(ansi -e {fg: $color, bg: $next_color})(char nf_left_segment)'
                    {|s| $'($l)($s)($r)' }
                }
                '>' => {
                    let r = $'(ansi -e {fg: $color, bg: $next_color})(char nf_left_segment)'
                    {|s| $'($s)($r)' }
                }
                '>>' => {
                    let r = $'(ansi reset)(ansi -e {fg: $color})(char nf_left_segment)'
                    {|s| $'($s)($r)' }
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
        let v = (do $t.0 null)
        if ($v.1 != null) {
            $r += (do $t.1 $v.1)
        }
    }
    $r
}

def left_prompt_gen [segment] {
    let stop = ($segment | length) - 1
    let vs = ($segment | each {|x| [$x.color (get_component $x)]})
    let cs = ($segment | each {|x| $x.color } | append $segment.0.color | slice 1..)
    let thunk = ($vs
        | zip $cs
        | enumerate
        | each {|x|
            if $x.index == $stop {
                [$x.item.0.1 (decorator_gen '>>' $x.item.0.0 $x.item.1)]
            } else if $x.index == 0 {
                [$x.item.0.1 (decorator_gen '|>' $x.item.0.0 $x.item.1)]
            } else {
                [$x.item.0.1 (decorator_gen '>' $x.item.0.0 $x.item.1)]
            }
        })
    {|| squash $thunk }
}

def right_prompt_gen [segment] {
    let thunk = ( $segment
        | each {|x| [$x.color (get_component $x)]}
        | enumerate
        | each {|x|
            if $x.index == 0 {
                [$x.item.1 (decorator_gen '<<' $x.item.0)]
            } else {
                [$x.item.1 (decorator_gen '<' $x.item.0)]
            }
        })
    {|| squash $thunk }
}

def up_prompt [segment] {
    let thunk = ($segment
        | each {|y| $y | each {|x| get_component $x }
        })
    { ||
        let ss = ($thunk
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
            })
        # TODO: length of unicode char is 3
        let fl = (((term size).columns - ($ss | str join ''| ansi strip | str length)) | math abs)
        $ss | str join $"(ansi xterm_grey)('' | fill -c '-' -w $fl)(ansi reset)"
    }
}

export def default_env [name value] {
    if ($name in $env) {
        $env | get $name
    } else {
        $value
    }
}

export def --env init [] {
    match $env.NU_POWER_FRAME {
        'default' => {
            match $env.NU_POWER_MODE {
                'power' => {
                    $env.PROMPT_COMMAND = (wraptime
                        'dynamic left'
                        (left_prompt $env.NU_POWER_SCHEMA.0)
                    )
                    $env.PROMPT_COMMAND_RIGHT = (wraptime
                        'dynamic right'
                        (right_prompt $env.NU_POWER_SCHEMA.1)
                    )
                }
                'fast' => {
                    $env.PROMPT_COMMAND = (wraptime
                        'static left'
                        (left_prompt_gen $env.NU_POWER_SCHEMA.0)
                    )
                    $env.PROMPT_COMMAND_RIGHT = (wraptime
                        'static right'
                        (right_prompt_gen $env.NU_POWER_SCHEMA.1)
                    )
                }
            }
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

export def --env set [name theme config?] {
    $env.NU_POWER_THEME = (if ($theme | is-empty) {
            $env.NU_POWER_THEME
        } else {
            $env.NU_POWER_THEME
            | upsert $name ($theme
                | transpose k v
                | reduce -f {} {|it, acc|
                    $acc | insert $it.k (ansi -e {fg: $it.v})
                })
        })

    $env.NU_POWER_CONFIG = (if ($config | is-empty) {
            $env.NU_POWER_CONFIG
        } else {
            $env.NU_POWER_CONFIG
            | upsert $name ($config
                | transpose k v
                | reduce -f {} {|it, acc|
                    $acc | insert $it.k $it.v
                })
        })
}

export def --env register [name source theme config?] {
    set $name $theme $config

    $env.NU_PROMPT_COMPONENTS = (
        $env.NU_PROMPT_COMPONENTS | upsert $name {|| $source }
    )
}

export def --env inject [pos idx define theme? config?] {
    let prev = ($env.NU_POWER_SCHEMA | get $pos)
    let next = if $idx == 0 {
        $prev | prepend $define
    } else {
        [
            ($prev | slice 0..($idx - 1))
            $define
            ($prev | slice $idx..)
        ] | flatten
    }

    $env.NU_POWER_SCHEMA = (
        $env.NU_POWER_SCHEMA
        | update $pos $next
    )

    let kind = $define.source

    if not ($theme | is-empty) {
        let prev_theme = ($env.NU_POWER_THEME | get $kind)
        let prev_cols = ($prev_theme | columns)
        let next_theme = ($theme | transpose k v)
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

    if not ($config | is-empty) {
        let prev_cols = ($env.NU_POWER_CONFIG | get $kind | columns)
        for n in ($config | transpose k v) {
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
        let init = [{|before, after| if not ($before | is-empty) { init } }]
        $config.hooks.env_change
        | upsert NU_POWER_MODE $init
        | upsert NU_POWER_SCHEMA $init
        | upsert NU_POWER_FRAME $init
        | upsert NU_POWER_DECORATOR $init
        | upsert NU_POWER_MENU_MARKER $init
        | upsert NU_POWER_BENCHMARK [{ |before, after|
            if not ($before | is-empty) {
                init
                rm -f ~/.cache/nushell/power_time.log
            }
        }]

        # NU_POWER_THEME
    })
}

export-env {
    $env.NU_POWER_BENCHMARK = false

    $env.NU_POWER_MODE = (default_env
        NU_POWER_MODE
        'power' # power | fast
    )

    $env.NU_POWER_SCHEMA = (default_env
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

