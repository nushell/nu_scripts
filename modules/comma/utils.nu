export def spy [tag?] {
    let o = $in
    let t = [
        $'(ansi xterm_grey)--------(ansi xterm_olive)($tag)(ansi xterm_grey)--------'
        $'(ansi xterm_grey39)($o | describe)'
        $'(ansi xterm_grey66)($o | to yaml)'
        (ansi reset)
    ]
    print -e ($t | str join (char newline))
    $o
}

export def --wrapped ll [...args] {
    let c = ['navy' 'teal' 'xpurplea' 'xgreen' 'olive' 'maroon']
    let t = date now | format date '%Y-%m-%dT%H:%M:%S'
    let n = $args | length
    let lv = if $n == 1 { 0 } else { $args.0 }
    let s = match $n {
        1 => ($args | range 0..)
        _ => ($args | range 1..)
    }
    let s = $s
    | reduce -f {tag: {}, msg:[]} {|x, acc|
        if ($x | describe -d).type == 'record' {
            $acc | update tag ($acc.tag | merge $x)
        } else {
            $acc | update msg ($acc.msg | append $x)
        }
    }
    let gray = (ansi light_gray)
    let dark = (ansi grey39)
    let g = $s.tag
    | transpose k v
    | each {|y| $"($dark)($y.k):($gray)($y.v)"}
    | str join ' '
    | do { if ($in | is-empty) {''} else {$"($in)($dark)|"} }
    let r = [
        $"(ansi ($c | get $lv))($t)($dark)|($g)"
        $"($gray)($s.msg | str join ' ')(ansi reset)"
    ]
    | where { not ($in | is-empty) }
    | str join ' '
    print -e $r
}

export alias l0 = ll 0
export alias l1 = ll 1
export alias l2 = ll 2
export alias l3 = ll 3
export alias l4 = ll 4
export alias l5 = ll 5

def "nu-complete ps" [] {
    ps -l | each {|x| { value: $"($x.pid)", description: $x.command } }
}

export def wait-pid [pid: string@"nu-complete ps"] {
    do -i { tail --pid $pid -f /dev/null }
}

export def wait-cmd [action -i: duration = 1sec  -t: string] {
    mut time = 0
    loop {
        l0 { time: $time } $t
        let c = do --ignore-errors $action | complete | get exit_code
        if ($c == 0) { break }
        sleep $i
        $time = $time + 1
    }
}

# perform or print
export def --wrapped pp [
    ...x
    --print(-p)
    --as-str
] {
    if $print or (do -i { $env.comma_index | get $env.comma_index.dry_run } | default false) {
        use lib/run.nu
        let r = run dry $x --strip
        if $as_str {
            $r
        } else {
            print -e $"(ansi light_gray)($r)(ansi reset)(char newline)"
        }
    } else {
        use lib/tree.nu spread
        ^$x.0 ...(spread ($x | range 1..))
    }
}

export def outdent [] {
    let txt = $in | lines | range 1..
    let indent = $txt.0 | parse --regex '^(?P<indent>\s*)' | get indent.0 | str length
    $txt
    | each {|s| $s | str substring $indent.. }
    | str join (char newline)
}
