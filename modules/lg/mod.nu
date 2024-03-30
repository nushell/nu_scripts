def get_settings [] {
    {
        level: ($env.lg_level? | default 2)
        file: ($env.lg_file?)
    }
}

export-env {
    $env.lg_prefix = ['TRC' 'DBG' 'INF' 'WRN' 'ERR' 'CRT']
    $env.lg_prefix_index = {
        trc: 0
        dbg: 1
        inf: 2  msg: 2
        wrn: 3
        err: 4
        crt: 5
    }
    $env.lg_theme = {
        console: {
            level : (['navy' 'teal' 'xgreen' 'xpurplea' 'olive' 'maroon'] | each { ansi $in })
            delimiter: $'(ansi grey39)│'
            fg: (ansi light_gray)
            bg: (ansi grey39)
            terminal: (ansi reset)
        }
        file: {
            level : ['' '' '' '' '' '']
            delimiter: '│'
            fg: ''
            bg: ''
            terminal: (char newline)
        }

    }
}

def parse_msg [args] {
    let time = date now | format date '%FT%T.%3f'
    let s = $args
        | reduce -f {tag: {}, txt:[]} {|x, acc|
            if ($x | describe -d).type == 'record' {
                $acc | update tag ($acc.tag | merge $x)
            } else {
                $acc | update txt ($acc.txt | append $x)
            }
        }
    {time: $time, txt: $s.txt, tag: $s.tag }
}

export def --wrapped level [
    level
    ...args
    --multiline(-m)
    --label: string
    --setting: any
] {
    let setting = if ($setting | is-empty) { get_settings } else { $setting }
    let theme = if ($setting.file? | is-empty) { 'console' } else { 'file' }
    let theme = $env.lg_theme | get $theme
    let output = if ($setting.file? | is-empty) {{ print -e $in }} else {{ $in | save -af $setting.file }}
    let msg = parse_msg $args

    let time = $"($theme.level | get $level)($msg.time)"
    let label = if ($label | is-empty) { '' } else { $"($theme.fg)($label)" }
    let txt = $msg.txt | str join ' '
    let txt = if ($txt | is-empty) { '' } else { $"($theme.fg)($txt)" }
    let tag = $msg.tag | transpose k v
    let r = if $multiline {
        let body = $tag
        | each {|y| $"    ($theme.bg)($y.k) = ($theme.fg)($y.v | to json -r)"}
        | str join (char newline)
        let head = [$time $label $txt]
        | filter {|x| $x | is-not-empty }
        | str join $theme.delimiter
        [$head $body] | str join (char newline)
    } else {
        let tag = $tag
        | each {|y| $"($theme.bg)($y.k)=($theme.fg)($y.v)"}
        | str join ' '
        [$time $label $tag $txt]
        | filter {|x| $x | is-not-empty }
        | str join $theme.delimiter
    }
    $r + $theme.terminal | do $output
}

def 'nu-complete log-prefix' [] {
    $env.lg_prefix_index | columns
}

export def --wrapped main [
    level: string@'nu-complete log-prefix'
    --multiline(-m)
    ...args
] {
    let setting = get_settings
    let lv = $env.lg_prefix_index | get $level
    if $lv < $setting.level {
        return
    }
    let label = $env.lg_prefix | get $lv
    if $multiline {
        level $lv ...$args --label $label --setting $setting --multiline
    } else {
        level $lv ...$args --label $label --setting $setting
    }
}
