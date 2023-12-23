def gendict [size: int = 5] {
    let keys = $in
    mut k = []
    let n = $keys | length
    let rk = random chars -l ($n * $size)
    for i in 1..$n {
        let b = ($i - 1) * $size
        let e = $i * $size
        $k ++= ($rk | str substring $b..$e)
    }
    $keys
    | zip $k
    | reduce -f {} {|x, acc|
        $acc | upsert $x.0 $"($x.0)_($x.1)"
    }
}

def log [tag? -c] {
    let o = $in
    if ($c) {
        echo $'---(char newline)' | save -f ~/.cache/comma.log
    } else {
        echo $'---($tag)---($o | describe)(char newline)($o | to yaml)' | save -a ~/.cache/comma.log
    }
    $o
}

def 'str repeat' [n] {
    let o = $in
    if $n < 1 { return '' }
    mut r = ''
    for i in 0..($n - 1) {
        $r += $o
    }
    $r
}

def unindent [] {
    let txt = $in | lines | range 1..
    let indent = $txt.0 | parse --regex '^(?P<indent>\s*)' | get indent.0 | str length
    $txt
    | each {|s| $s | str substring $indent.. }
    | str join (char newline)
}

def find-parent [] {
    let o = $in
    let depth = ($env.PWD | path expand | path split | length) - 1
    mut cur = [',.nu']
    mut e = ''
    for i in 0..$depth {
        $e = ($cur | path join)
        #print ($e | path expand)
        if ($e | path exists) { break }
        $cur = ['..', ...$cur]
        $e = ''
    }
    $e
}

def test [fmt, indent, dsc, spec] {
    let id = {|x| $x}
    match ($spec | length) {
        1 => {
            let rst = (do $spec.0)
            let r = (not ($rst | is-empty)) and ($rst == true)
            let ctx = if $r { null } else { $rst }
            do $fmt $indent $r $dsc $ctx
        }
        2|3 => {
            let rst = do $spec.1
            let pred = if ($spec.0 | describe -d).type == 'closure' {
                do $spec.0 $rst
            } else {
                $spec.0 == $rst
            }
            let pred = (not ($pred | is-empty)) and ($pred == true)
            let ctx = if ($spec.2? | is-empty) {
                if $pred { null } else { $id }
            } else { $spec.2 }
            let ctx = if ($ctx | describe -d).type == 'closure' {
                do $ctx $rst
            } else {
                $ctx
            }
            do $fmt $indent $pred $dsc $ctx
        }
        _ => {
            error make {msg: 'too many args', }
        }
    }
}

def comma_file [] {
    [
        {
          condition: {|_, after| not ($after | path join ',.nu' | path exists)}
          code: "$env.comma = null"
        }
        {
          condition: {|_, after| $after | path join ',.nu' | path exists}
          code: "
          print $'(ansi default_underline)(ansi default_bold),(ansi reset).nu (ansi green_italic)detected(ansi reset)...'
          print $'(ansi $env.comma_index.settings.theme.info)activating(ansi reset) (ansi default_underline)(ansi default_bold),(ansi reset) module with `(ansi default_dimmed)(ansi default_italic)source ,.nu(ansi reset)`'

          # TODO: allow parent dir
          $env.comma_index.wd = $after
          $env.comma_index.session_id = (random chars)

          # echo '' | save -f ~/.cache/comma.log
          source ,.nu
          "
        }
    ]
}

export-env {
    # batch mode
    if not ($env.config? | is-empty) {
        $env.config = ( $env.config | upsert hooks.env_change.PWD { |config|
            let o = ($config | get -i hooks.env_change.PWD)
            let val = (comma_file)
            if $o == null {
                $val
            } else {
                $o | append $val
            }
        })
    }
    $env.comma_index = (
        [sub dsc act cmp flt cpu wth]
        | gendict 5
        | merge {
            settings: {
                test_message: {|indent, status, message, context|
                    let indent = '    ' | str repeat $indent
                    let status = if $status {
                        $"(ansi bg_green)SUCC(ansi reset)"
                    } else {
                        $"(ansi bg_red)FAIL(ansi reset)"
                    }
                    print $"($indent)($status) (ansi yellow_bold)($message)(ansi reset)"
                    if not ($context | is-empty) {
                        let ctx = if $indent == 0 {
                            $context | to yaml
                        } else {
                            $context | to yaml | lines
                            | each {|x| $"($indent)($x)"}
                            | str join (char newline)
                        }
                        print $"(ansi light_gray)($ctx)(ansi reset)"
                    }
                }
                theme: {
                    info: 'yellow_italic'
                    batch_hint: 'dark_gray'
                    watch_separator: $"(ansi dark_gray)------------------------------(ansi reset)"
                }
            }
            os: (os-type)
            arch: (uname -m)
            log: {$in | log}
            batch: {
                let o = $in
                    | lines
                    | split row ';'
                    | flatten
                    | each {|x| $", ($x | str trim)" }
                let cmd = ['use comma.nu *' 'source ,.nu' ...$o ]
                    | str join (char newline)
                print $"(ansi $env.comma_index.settings.theme.batch_hint)($cmd)(ansi reset)"
                nu -c $cmd
            }
            test: {|dsc, ...spec|
                test $env.comma_index.settings.test_message 0 $dsc $spec
            }
            config: {|cb|
                # FIXME: no affected $env
                $env.comma_index.settings = (do $cb $env.comma_index.settings)
            }
        }
    )
}

def resolve-node [] { # [is-act, node]
    let o = $in
    let _ = $env.comma_index
    let t = ($o | describe -d).type
    if $t == 'closure' {
        [ true  { $_.act: $o } ]
    } else if ($_.sub in $o) {
        [ false $o ]
    } else if ($_.act in $o) {
        [ true  $o ]
    } else {
        [ false {$_.sub: $o} ]
    }
}

def 'as act' [] {
    let o = $in
    let _ = $env.comma_index
    let t = ($o | describe -d).type
    if $t == 'closure' {
        { $_.act: $o }
    } else if ($_.sub in $o) {
        null
    } else if ($_.act in $o) {
        $o
    } else {
        null
    }
}

def resolve-scope [args, vars, flts] {
    mut vs = {}
    mut cpu = []
    mut flt = {}
    let _ = $env.comma_index
    for i in ($vars | transpose k v) {
        if ($i.v | describe -d).type == 'record' {
            if $_.cpu in $i.v {
                $cpu ++= {k: $i.k, v: ($i.v | get $_.cpu)}
            } else if $_.flt in $i.v {
                $flt = ($flt | merge {$i.k: ($i.v | get $_.flt)} )
            } else {
                $vs = ($vs | merge {$i.k: $i.v})
            }
        } else {
            $vs = ($vs | merge {$i.k: $i.v})
        }
    }
    for i in $cpu {
        $vs = ($vs | merge {$i.k: (do $i.v $args $vs)} )
    }
    for i in ($flts | default []) {
        if $i in $flt {
            $vs = ($vs | merge {$i: (do ($flt | get $i) $args $vs)} )
        } else {
            error make {msg: $"filter `($i)` not found" }
        }
    }
    $vs
}

def os-type [] {
    let info = cat /etc/os-release
    | lines
    | reduce -f {} {|x, acc|
        let a = $x | split row '='
        $acc | upsert $a.0 ($a.1| str replace -a '"' '')
    }
    if 'ID_LIKE' in $info {
        if not ($info.ID_LIKE | parse -r '(rhel|fedora|redhat)' | is-empty) {
            'redhat'
        } else {
            $info.ID_LIKE
        }
    } else {
        $info.ID
    }
}


def get-comma [key = 'comma'] {
    let _ = $env.comma_index
    if ($env | get $key | describe -d).type == 'closure' {
        do ($env | get $key) $_
    } else {
        $env | get $key
    }
}

def run [tbl] {
    let loc = $in
    let _ = $env.comma_index
    mut act = $tbl
    mut argv = []
    mut flt = []
    for i in $loc {
        let n = $act | resolve-node
        if $n.0 {
            $argv ++= $i
        } else {
            if ($_.sub in $act) and ($i in ($act | get $_.sub)) {
                if $_.flt in $act {
                    $flt ++= ($act | get $_.flt)
                }
                let n = $act | get $_.sub | get $i
                $act = $n
            } else if $i in $act {
                let n = $act | get $i
                $act = $n
            } else {
                $act = {|| print $"not found `($i)`"}
                break
            }
        }
    }
    let n = $act | as act
    if ($n | is-empty) {
        let c = if $_.sub in $act { $act | get $_.sub | columns } else { $act | columns }
        print $'require argument: ($c)'
    } else {
        if $_.flt in $n {
            $flt ++= ($n | get $_.flt)
        }
        let scope = (resolve-scope $argv (get-comma 'comma_scope') $flt)
        let cls = $n | get $_.act
        let argv = $argv
        if $_.wth in $n {
            let w = $n | get $_.wth
            let cl = $w.clear? | default false
            if 'interval' in $w {
                loop {
                    if $cl {
                        clear
                    }
                    do $cls $argv $scope
                    sleep $w.interval
                    print $env.comma_index.settings.theme.watch_separator
                }
            } else {
                if $cl {
                    clear
                }
                if not ($w.postpone? | default false) {
                    do $cls $argv ($scope | upsert $_.wth { op: null path: null new_path: null })
                }
                let ops = if ($w.op? | is-empty) {['Write']} else { $w.op }
                watch . --glob=($w.glob? | default '*') {|op, path, new_path|
                    if $cl {
                        clear
                    }
                    if $op in $ops {
                        do $cls $argv ($scope | upsert $_.wth {
                            op: $op
                            path: $path
                            new_path: $path
                        })
                        if not $cl {
                            print $env.comma_index.settings.theme.watch_separator
                        }
                    }
                }
            }
        } else {
            do $cls $argv $scope
        }
    }
}

def enrich-desc [flt] {
    let o = $in
    let _ = $env.comma_index
    let flt = if $_.flt in $o.v { [...$flt, ...($o.v | get $_.flt)] } else { $flt }
    let f = if ($flt | is-empty) { '' } else { $"($flt | str join '|')|" }
    let w = if $_.wth in $o.v {
        let w = $o.v | get $_.wth
        if 'interval' in $w {
            $"[poll:($w.interval)]"
        } else {
            let ops = if ($w.op? | is-empty) {['Write']} else {$w.op}
            | str join ','
            $"[($ops)|($w.glob? | default '*')]"
        }
    } else { '' }

    let suf = $"($w)($f)"
    let suf = if ($suf | is-empty) { $suf } else { $"($suf) " }
    if ($o.v | describe -d).type == 'record' {
        let dsc = if $_.dsc in $o.v { $o.v | get $_.dsc } else { '' }
        if ($dsc | is-empty) {
            $o.k
        } else {
            { value: $o.k, description: $"($suf)($dsc)"}
        }
    } else {
        # TODO: ?
        { value: $o.k, description: $"__($suf)" }
    }
}

def complete [tbl] {
    let argv = $in
    let _ = $env.comma_index
    mut tbl = (get-comma)
    mut flt = []
    for i in $argv {
        let c = if ($i | is-empty) {
            $tbl
        } else {
            let tp =  ($tbl | describe -d).type
            if ($tp == 'record') and ($i in $tbl) {
                let j = $tbl | get $i
                if $_.sub in $j {
                    if $_.flt in $j {
                        $flt ++= ($j | get $_.flt)
                    }
                    $j | get $_.sub
                } else {
                    $j
                }
            } else {
                $tbl
            }
        }
        let a = $c | as act
        if not ($a | is-empty) {
            let flt = if $_.flt in $a { $flt | append ($a | get $_.flt) } else { $flt }
            let r = do ($a | get $_.cmp) $argv (resolve-scope null (get-comma 'comma_scope') $flt)
            $tbl = $r
        } else {
            $tbl = $c
        }
    }
    let flt = $flt
    match ($tbl | describe -d).type {
        record => {
            $tbl
            | transpose k v
            | each {|x|
                if ($x.v | describe -d).type == 'closure' {
                    $x.k
                } else {
                    $x | enrich-desc $flt
                }
            }
        }
        list => { $tbl }
        _ => { $tbl }
    }
}

def gen-vscode [] {
    let o = $in
    $o
}

def 'parse argv' [] {
    let context = $in
    $context.0
    | str substring 0..$context.1
    | split row -r '\s+'
    | range 1..
    | where not ($it | str starts-with '-')
}

def compos [...context] {
    $context
    | parse argv
    | complete (get-comma)
}

export def --wrapped , [
    --vscode
    --completion
    ...args:string@compos
] {
    if $vscode {
        let r = get-comma | gen-vscode | to json
        return $r
    }
    if $completion {
        return
    }
    if ($args | is-empty) {
        if ([$env.PWD, ',.nu'] | path join | path exists) {
            ^$env.EDITOR ,.nu
        } else {
            let a = [yes no] | input list 'create ,.nu?'
            if $a == 'yes' {
                $"
                $env.comma_scope = {|_|{
                    created: '(date now | format date '%Y-%m-%d{%w}%H:%M:%S')'
                    computed: {$_.cpu:{|a, s| $'\($s.created\)\($a\)' }}
                    say: {|s| print $'\(ansi $_.settings.theme.info\)\($s\)\(ansi reset\)' }
                    quick: {$_.flt:{|a, s| do $s.say 'run a `quick` filter' }}
                    slow: {$_.flt:{|a, s|
                        do $s.say 'run a `slow` filter'
                        sleep 1sec
                        do $s.say 'filter need to be declared'
                        sleep 1sec
                        $'\($s.computed\)<\($a\)>'
                    }}
                }}

                $env.comma = {|_|{
                    created: {|a, s| $s.computed }
                    inspect: {|a, s| {index: $_, scope: $s, args: $a} | table -e }
                    test: {
                        $_.sub: {
                            batch: { 'created; inspect' | do $_.batch }
                            watch: {
                                $_.act: {|a, s| $s | get $_.wth }
                                $_.cmp: {ls *.json | get name}
                                $_.dsc: 'inspect watch context'
                                $_.wth: {
                                    glob: '*'
                                    op: ['Write', 'Create']
                                    postpone: true
                                }
                            }
                            open_file: {
                                $_.act: {|a, s| open $a.0 }
                                $_.cmp: {ls | get name}
                                $_.dsc: 'open a file'
                                $_.flt: ['slow']
                            }
                            ping: {
                                $_.act: {|a, s| ping -c 2 localhost }
                                $_.wth: {
                                    interval: 2sec
                                    clear: true
                                }
                            }
                        }
                        $_.dsc: 'run test'
                        $_.flt: ['quick']
                    }
                }}
                "
                | unindent
                | save $",.nu"
                #source ',.nu'
            }
        }
    } else {
        $args | run (get-comma)
    }
}
