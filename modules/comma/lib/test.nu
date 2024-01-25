def 'run exp' [expect result o] {
    let r = do $expect $result $o.args? $o.scope?
    if ($r | describe -d).type == 'bool' { $r } else {
        error make -u {msg: $"(view source $o.expect) must be bool" }
    }
}

export def diffo [x] {
    let tbl = $x
    | transpose k v
    | if ($in | length) != 2 {
        error make -u { msg: "must be two fields" }
    } else {
        $in
    }
    | each {|i|
        let n = mktemp -t
        echo ($i.v? | default '' | into string) out> $n
        $i | insert n $n
    }
    let a = $tbl.0
    let b = $tbl.1
    let d = ^diff -u --color $a.n $b.n
    | lines
    | each {|x|
        if ($x | str starts-with $"--- ($a.n)") {
            $"--- ($a.k)"
        } else if ($x | str starts-with $"+++ ($b.n)") {
            $"+++ ($b.k)"
        } else {
            $x
        }
    }
    rm -f $a.n
    rm -f $b.n
    $d
}

export def main [fmt, indent, dsc, o] {
    let result = do $o.spec? $o.args? $o.scope? | default false
    let exp_type = ($o.expect? | describe -d).type
    mut stat_list = []
    let status = if $exp_type == 'nothing' {
        true == $result
    } else if $exp_type == 'closure' {
        run exp $o.expect $result $o
    } else if $exp_type == 'list' {
        $stat_list = ($o.expect | each {|r| run exp $r $result $o })
        $stat_list | all {|x| $x == true }
    } else if $exp_type == 'record' {
    } else {
        $o.expect? == $result
    }
    let report = if $status { null } else {
        let e = if $exp_type == 'closure' {
            $"<(view source $o.expect)>"
        } else if $exp_type == 'list' {
            $o.expect | zip $stat_list
            | reduce -f [] {|i,a| $a | append (if $i.1 {'SUCC'} else {$"<(view source $i.0)>"}) }
        } else {
            $o.expect?
        }
        let r = {
            args: $o.args?
            result: $result
            expect: $e
        }
        if ($o.report? | is-empty) {
            $r | to yaml | lines
        } else {
            do $o.report $r
        }
    }
    do $fmt {
        indent: $indent
        status: $status
        message: $dsc
        args: $o.args?
        report: $report
    }
}

def suit [] {
    let specs = $in
    use resolve.nu
    mut lv = []
    for i in $specs {
        let l = $lv | length
        let t = $i.path | range ..-2
        for j in ($t | enumerate) {
            let desc = $i.g | get $j.index
            let g = $env.comma_index.settings.test_group
            if $j.index < $l {
                let a = $lv | get $j.index
                if $j.item == $a {
                } else {
                    do $g { indent: $j.index title: $j.item desc: $desc}
                }
            } else {
                do $g { indent: $j.index title: $j.item desc: $desc}
            }
        }
        main $i.fmt ($i.indent - 1) $i.desc {
            expect: $i.expect
            spec: $i.spec
            args: $i.mock
            report: $i.report
            scope: (resolve scope null (resolve comma 'comma_scope') [])
        }
        $lv = $t
    }
}


export def run [tbl --opt: record] {
    let argv = $in
    let _ = $env.comma_index
    use tree.nu
    let bc = {|node, _|
        if $_.dsc in $node {
            $node | get $_.dsc
        } else {
            ''
        }
    }
    let cb = {|pth, g, node, _|
        let indent = ($pth | length)
        if $_.exp in $node {
            let exp = $node | get $_.exp
            let spec = $node | get $_.act
            let mock = if $_.mock in $node { $node | get $_.mock }
            let report = if $_.rpt in $node { $node | get $_.rpt }
            let desc = $pth | last
            {
                path: $pth
                g: $g
                fmt: $env.comma_index.settings.test_message
                indent: $indent
                desc: $desc
                expect: $exp
                spec: $spec
                mock: $mock
                report: $report
            }
        }
    }
    let specs = $argv
    | flatten
    | tree select --strict $tbl
    | do {
        let i = $in
        if $_.sub in $i.node {
            $i.node | get $_.sub
        } else {
            let n = $argv | last
            {$n: ($i.node | reject 'end') }
        }
    }
    | tree map $cb $bc
    if ($opt.watch? | default false) {
        use run.nu watches
        watches {
            $specs | suit
        } [] {} { clear: true }
    } else {
        $specs | suit
    }
}
