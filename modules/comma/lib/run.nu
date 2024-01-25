export def watches [act argv scope w] {
    if $w == null { return }
    let _ = $env.comma_index
    let cl = $w.clear? | default false
    if 'interval' in $w {
        loop {
            if $cl {
                clear
            }
            do $act $argv $scope | do { print -e $in }
            if not $cl {
                do $env.comma_index.settings.theme.watch_separator
            }
            sleep $w.interval
        }
    } else {
        if $cl {
            clear
        }
        if not ($w.postpone? | default false) {
            do $act $argv ($scope | upsert $_.wth { op: null path: null new_path: null })
        }
        let ops = if ($w.op? | is-empty) {['Write']} else { $w.op }
        watch . --glob=($w.glob? | default '*') {|op, path, new_path|
            if $cl {
                clear
            }
            if $op in $ops {
                do $act $argv ($scope | upsert $_.wth {
                    op: $op
                    path: $path
                    new_path: $path
                })
                if not $cl {
                    do $env.comma_index.settings.theme.watch_separator
                }
            }
        }
    }
}

export def main [tbl --opt: record] {
    let n = $in
    use tree.nu
    use resolve.nu
    let n = $n | tree select --strict $tbl
    let _ = $env.comma_index
    if not $n.node.end {
        do $_.tips "require argument" ($n.node | get $_.sub | columns)
        return
    }
    let flt = if $_.flt in $n.node { [...$n.filter ...($n.node | get $_.flt)] } else { $n.filter }
    let wth = if $opt.watch {
        if $_.wth in $n.node {
            [...$n.watch ($n.node | get $_.watch)]
        } else {
            $n.watch
        }
        | reduce -f {} {|i,a| $a | merge $i}
    } else {
        null
    }
    let act = $n.node | get $_.act
    let scope = resolve scope $n.rest (resolve comma 'comma_scope') $flt

    if ($wth | is-empty) {
        do $act $n.rest $scope
    } else {
        watches $act $n.rest $scope $wth
    }
}

export def complete [tbl] {
    let n = $in
    let n = if ($n | last) == '' { $n | range ..-2 } else { $n }
    use tree.nu
    use resolve.nu
    let n = $n | tree select $tbl
    let _ = $env.comma_index
    let flt = if $_.flt in $n.node { [...$n.filter ...($n.node | get $_.flt)] } else { $n.filter }
    let wth = if $_.wth in $n.node { $n.node | get $_.wth } else { null }
    if $n.node.end {
        let cmp = $n.node | get $_.cmp
        let scope = resolve scope null (resolve comma 'comma_scope') $flt
        do $cmp $n.rest $scope
    } else {
        $n.node | get $_.sub | transpose k v | each {|x| $x | update v ($x.v | tree node) | enrich desc $flt }
    }
}

def 'enrich desc' [flt] {
    let o = $in
    let _ = $env.comma_index
    let flt = if $_.flt in $o.v {
        [...$flt, ...($o.v | get $_.flt)]
    } else {
        $flt
    }
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
        if ($dsc | is-empty) and ($suf | is-empty) {
            $o.k
        } else {
            { value: $o.k, description: $"($suf)($dsc)"}
        }
    } else {
        # TODO: ?
        { value: $o.k, description: $"__($suf)" }
    }
}

def unnest [list lv=0] {
    mut cur = []
    mut rt = []
    for i in $list {
        if ($i | describe -d).type == 'list' {
            $rt = [...$rt, {it: $cur, lv: $lv}, ...(unnest $i ($lv + 1))]
            $cur = []
        } else {
            $cur = [...$cur, $i]
        }
    }
    if not ($cur | is-empty) {
        $rt = [...$rt, {it: $cur, lv: $lv}]
    }
    return $rt
}

export def --wrapped dry [...x --prefix='    ' --strip] {
    let w = term size | get columns
    mut lines = []
    for a in (unnest (if $strip { $x.0 } else { $x })) {
        mut nl = ('' | fill -c $prefix -w $a.lv)
        for t in $a.it {
            let line = if ($nl | str replace -a ' ' '' | is-empty) { $"($nl)($t)" } else { $"($nl) ($t)" }
            if ($line | str length) > $w {
                $lines ++= $nl
                $nl = $"('' | fill -c $prefix -w $a.lv)($t)"
            } else {
                $nl = $line
            }
        }
        $lines ++= $nl
    }
    $lines | str join $" \\(char newline)"
}

