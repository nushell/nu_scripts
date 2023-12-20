def unindent [] {
    let txt = $in | lines | range 1..
    let indent = $txt.0 | parse --regex '^(?P<indent>\s*)' | get indent.0 | str length
    $txt
    | each {|s| $s | str substring $indent.. }
    | str join (char newline)
}

def 'path parents' [] {
    $in
    | path expand
    | path split
    | reduce -f [ '' ] {|x, acc| [( $acc.0 | path join $x ), ...$acc] }
    | range ..-2
}

def find [] {
    $in
    | path parents
    | filter {|x| $x | path join ',.nu' | path exists }
    | get 0?
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
          print $'(ansi yellow_italic)activating(ansi reset) (ansi default_underline)(ansi default_bold),(ansi reset) module with `(ansi default_dimmed)(ansi default_italic)source ,.nu(ansi reset)`'
          source ,.nu
          "
        }
    ]
}

export-env {
    $env.config = ( $env.config | upsert hooks.env_change.PWD { |config|
        let o = ($config | get -i hooks.env_change.PWD)
        let val = (comma_file)
        if $o == null {
            $val
        } else {
            $o | append $val
        }
    })
    $env.comm = ([sub dsc act cmp] | gendict 5)
}

def gendict [size: int = 5] {
    let keys = $in
    mut k = []
    let n = $keys | length
    let rk = random chars -l ($n * $size)
    for i in 1..$n {
        let b = ($i - 1) * $size
        let e = $i * $size
        $k ++= [($rk | str substring $b..$e)]
    }
    $keys
    | zip $k
    | reduce -f {} {|x, acc|
        $acc | upsert $x.0 (if true { $x.1 } else { $x.0 })
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

def 'as act' [] {
    let o = $in
    let ix = $env.comm
    let t = ($o | describe -d).type
    if $t == 'closure' {
        { $ix.act: $o }
    } else if ($ix.sub in $o) {
        null
    } else if ($ix.act in $o) {
        $o
    } else {
        null
    }
}

def computed-env [args, vars] {
    mut vs = {}
    mut cls = []
    for i in ($vars | transpose k v) {
        if ($i.v | describe -d).type == 'closure' {
            $cls ++= [$i]
        } else {
            $vs = ($vs | upsert $i.k $i.v)
        }
    }
    for i in $cls {
        $vs = ($vs | upsert $i.k (do $i.v $args $vs))
    }
    $vs
}

def run [tbl] {
    let loc = $in
    let ix = $env.comm
    mut act = $tbl
    mut argv = []
    for i in $loc {
        let a = $act | as act
        if ($a | is-empty) {
            if ($ix.sub in $act) and ($i in ($act | get $ix.sub)) {
                let n = $act | get $ix.sub | get $i
                $act = $n
            } else if $i in $act {
                let n = $act | get $i
                $act = $n
            } else {
                $act = {|| print $"not found `($i)`"}
                break
            }
        } else {
            $argv ++= [$i]
        }
    }
    let a = $act | as act
    if ($a | is-empty) {
        let c = if $ix.sub in $act { $act | get $ix.sub | columns } else { $act | columns }
        print $'require argument: ($c)'
    } else {
        do ($a | get $ix.act) $argv (computed-env $argv $env.comma_vars)
    }
}

def complete [tbl] {
    let argv = $in
    let ix = $env.comm
    mut tbl = $env.comma
    for i in $argv {
        let c = if ($i | is-empty) {
            $tbl
        } else {
            let tp =  ($tbl | describe -d).type
            if ($tp == 'record') and ($i in $tbl) {
                let j = $tbl | get $i
                if $ix.sub in $j {
                    $j | get $ix.sub
                } else {
                    $j
                }
            } else {
                $tbl
            }
        }
        let a = $c | as act
        if not ($a | is-empty) {
            let r = do ($a | get $ix.cmp) $argv (computed-env null $env.comma_vars)
            $tbl = $r
        } else {
            $tbl = $c
        }
    }
    match ($tbl | describe -d).type {
        record => {
            $tbl
            | transpose k v
            | each {|x|
                if ($x.v | describe -d).type == 'closure' {
                    $x.k
                } else if $ix.dsc in $x.v {
                    { value: $x.k, description: ($x.v | get $ix.dsc) }
                } else {
                    $x.k
                }
            }
        }
        list => { $tbl }
        _ => { $tbl }
    }
}

def summary [] {
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
    | complete $env.comma
}

export def , [
    --summary
    --completion
    ...args:string@compos
] {
    if $summary {
        let r = $env.comma | summary | to json
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
                $env.comma_vars = {
                    created: '(date now | format date '%Y-%m-%d{%w}%H:%M:%S')'
                    computed: {|a, e| $'\($e.created\)\($a\)' }
                }

                $env.comma = {
                    created: {|a, e| $e.computed }
                    hello: {
                        $env.comm.act: {|args, vars| print $'hello \($args\)' }
                        $env.comm.dsc: 'hello \(x\)'
                        $env.comm.cmp: {|args, vars| $args}
                    }
                    open: {
                        $env.comm.sub: {
                            any: {
                                $env.comm.act: {|a, e| open $a.0}
                                $env.comm.cmp: {ls | get name}
                                $env.comm.dsc: 'open a file'
                            }
                            json: {
                                $env.comm.act: {|a, e| open $a.0}
                                $env.comm.cmp: {ls *.json | get name}
                                $env.comm.dsc: 'open a json file'
                            }
                        }
                        $env.comm.dsc: 'open a file'
                    }
                }
                "
                | unindent
                | save $",.nu"
                #source ',.nu'
            }
        }
    } else {
        $args | run $env.comma
    }
}
