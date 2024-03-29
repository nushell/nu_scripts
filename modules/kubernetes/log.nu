def get_settings [] {
    {
        level: ($env.nlog_level? | default 2)
        file: ($env.nlog_file?)
    }
}

export-env {
    $env.nlog_prefix = ['TRC' 'DBG' 'INF' 'WRN' 'ERR' 'CRT']
    $env.nlog_prefix_index = {
        trc: 0
        dbg: 1
        inf: 2  msg: 2
        wrn: 3
        err: 4
        crt: 5
    }
}

def parse_msg [args] {
    let time = date now | format date '%Y-%m-%dT%H:%M:%S'
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
    lv
    ...args
    --label: string
    --setting: any
] {
    let setting = if ($setting | is-empty) { get_settings } else { $setting }
    let msg = parse_msg $args
    if ($setting.file? | is-empty) {
        let c = ['navy' 'teal' 'xgreen' 'xpurplea' 'olive' 'maroon']
        let gray = ansi light_gray
        let dark = ansi grey39
        let time = $"(ansi ($c | get $lv))($msg.time)"
        let tag = $msg.tag
        | transpose k v
        | each {|y| $"($dark)($y.k)=($gray)($y.v)"}
        | str join ' '
        let msg = $msg.txt | str join ' '
        let msg = if ($msg | is-empty) { '' } else { $"($gray)($msg)" }
        let label = if ($label | is-empty) { '' } else { $"(ansi dark_gray)($label)" }
        let r = [$time $label $tag $msg]
        | filter {|x| $x | is-not-empty }
        | str join $'($dark)│'
        print -e ($r + (ansi reset))
    } else {
        [
            ''
            $'#($env.nlog_prefix | get $lv)# ($msg.txt | str join " ")'
            ...($msg.tag | transpose k v | each {|y| $"($y.k)=($y.v | to json)"})
            ''
        ]
        | str join (char newline)
        | save -af $setting.file
    }
}

def 'nu-complete log-prefix' [] {
    $env.nlog_prefix_index | columns
}

export def --wrapped main [
    lv:string@'nu-complete log-prefix'
    ...args
] {
    let setting = get_settings
    let lv = $env.nlog_prefix_index | get $lv
    if $lv < $setting.level {
        return
    }
    let label = $env.nlog_prefix | get $lv
    level $lv ...$args --label $label --setting $setting
}
