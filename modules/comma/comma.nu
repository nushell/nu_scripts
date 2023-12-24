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
        let id = if ($x.0 | describe -d).type == 'list' { $x.0 } else { [$x.0] }
        let id = $id | reduce -f {} {|i,a| $a | upsert $i $"($id.0)_($x.1)" }
        $acc | merge $id
    }
}

def lg [tag?] {
    let o = $in
    print $'---($tag)---($o | describe)(char newline)($o | to yaml)'
    $o
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
        [
            [children sub]
            [description desc dsc]
            [action act]
            [completion cmp]
            [filter flt]
            [computed cpu]
            [watch wth]
            [expect exp]
        ]
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

def resolve-node [] { # [endpoint, node]
    let o = $in
    let _ = $env.comma_index
    let t = ($o | describe -d).type
    if $t == 'closure' {
        { end: true,  $_.act: $o }
    } else if ($_.act in $o) {
        { end: true,  ...$o }
    } else if ($_.sub in $o) {
        { end: false, ...$o }
    } else {
        { end: false, $_.sub: $o}
    }
}

def 'tree select' [tree --strict] {
    let ph = $in
    let _ = $env.comma_index
    mut cur = $tree | resolve-node
    mut rest = []
    mut flt = []
    mut wth = []
    for i in $ph {
        if $cur.end {
            $rest ++= $i
        } else {
            let sub = $cur | get $_.sub
            if $i in $sub {
                if $_.flt in $cur { $flt ++= ($cur | get $_.flt) }
                if $_.wth in $cur { $wth ++= ($cur | get $_.wth) }
                $cur = ($sub | get $i | resolve-node)
            } else {
                if $strict {
                    $cur = ({ print $"not found `($i)`"} | resolve-node)
                } else {
                    $cur
                }
                break
            }
        }
    }
    {
        node: $cur
        filter: $flt
        watch: $wth
        rest: $rest
    }
}

def 'tree map' [tree] {

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

def run-watch [act rest scope w] {
    let _ = $env.comma_index
    let cl = $w.clear? | default false
    if 'interval' in $w {
        loop {
            if $cl {
                clear
            }
            do $act $rest $scope
            sleep $w.interval
            print $env.comma_index.settings.theme.watch_separator
        }
    } else {
        if $cl {
            clear
        }
        if not ($w.postpone? | default false) {
            do $act $rest ($scope | upsert $_.wth { op: null path: null new_path: null })
        }
        let ops = if ($w.op? | is-empty) {['Write']} else { $w.op }
        watch . --glob=($w.glob? | default '*') {|op, path, new_path|
            if $cl {
                clear
            }
            if $op in $ops {
                do $act $rest ($scope | upsert $_.wth {
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
}

def run [tbl] {
    let n = $in | tree select --strict $tbl
    let _ = $env.comma_index
    if not $n.node.end {
        print $"require argument: ($n.node | get $_.sub | columns)"
        return
    }
    let flt = if $_.flt in $n.node { [...$n.filter ...($n.node | get $_.flt)] } else { $n.filter }
    let wth = if $_.wth in $n.node { $n.node | get $_.wth } else { null }
    let act = $n.node | get $_.act
    let scope = resolve-scope $n.rest (get-comma 'comma_scope') $flt

    if ($wth | is-empty) {
        do $act $n.rest $scope
    } else {
        run-watch $act $n.rest $scope $wth
    }
}

def cmpl [tbl] {
    let n = $in | tree select $tbl
    let _ = $env.comma_index
    let flt = if $_.flt in $n.node { [...$n.filter ...($n.node | get $_.flt)] } else { $n.filter }
    let wth = if $_.wth in $n.node { $n.node | get $_.wth } else { null }
    if $n.node.end {
        let cmp = $n.node | get $_.cmp
        let scope = resolve-scope null (get-comma 'comma_scope') $flt
        do $cmp $n.rest $scope
    } else {
        $n.node | get $_.sub | transpose k v | each {|x| $x | update v ($x.v | resolve-node) | enrich desc $flt }
    }
}

def 'enrich desc' [flt] {
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
    | cmpl (get-comma)
}

export def --wrapped , [
    --vscode
    --completion (-c)
    ...args:string@compos
] {
    if $vscode {
        let r = get-comma | gen-vscode | to json
        return $r
    }
    if $completion {
        let r = $args | cmpl (get-comma)
        return ($r | to json)
    }
    if not ($args | is-empty) {
        $args | run (get-comma)
    } else {
        if ([$env.PWD, ',.nu'] | path join | path exists) {
            ^$env.EDITOR ,.nu
        } else {
            let a = [yes no] | input list 'create ,.nu?'
            if $a == 'yes' {
                let time = date now | format date '%Y-%m-%d{%w}%H:%M:%S'
                let file = [($nu.config-path | path dirname) scripts comma_tmpl.nu] | path join
                open $file
                | str replace '{{time}}' $time
                | save $",.nu"
                #source ',.nu'
            }
        }
    }
}
