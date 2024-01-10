export def lg [tag?] {
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

module utils {
    export def gendict [size extend] {
        let keys = $in
        mut k = []
        let n = $keys | length
        let rk = random chars -l ($n * $size)
        for i in 1..$n {
            let b = ($i - 1) * $size
            let e = $i * $size
            $k ++= ($rk | str substring $b..$e)
        }
        let ids = $keys
        | zip $k
        | reduce -f {} {|x, acc|
            let id = if ($x.0 | describe -d).type == 'list' { $x.0 } else { [$x.0] }
            $id | reduce -f $acc {|i,a| $a | insert $i $"($id.0)_($x.1)" }
        }
        $extend
        | transpose k v
        | reduce -f $ids {|x, acc|
            $acc | insert $x.k { $x.v }
        }
    }


    export def 'str repeat' [n] {
        let o = $in
        if $n < 1 { return '' }
        mut r = ''
        for i in 0..($n - 1) {
            $r += $o
        }
        $r
    }

    export def 'os type' [] {
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

    export def outdent [] {
        let txt = $in | lines | range 1..
        let indent = $txt.0 | parse --regex '^(?P<indent>\s*)' | get indent.0 | str length
        $txt
        | each {|s| $s | str substring $indent.. }
        | str join (char newline)
    }
}

module tree {
    export def node [] {
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

    def gather [cur _] {
        mut data = $in
        mut wth = ($data.watch? | default [])
        mut flt = ($data.filter? | default [])
        if $_.flt in $cur { $flt ++= ($cur | get $_.flt) }
        if $_.wth in $cur { $wth ++= ($cur | get $_.wth) }
        {
            filter: $flt
            watch: $wth
        }
    }

    export def select [data --strict] {
        let ph = $in
        let _ = $env.comma_index
        mut cur = $data | node
        mut ops = {} | gather $cur $_
        mut rest = []
        for i in $ph {
            if $cur.end {
                $rest ++= $i
            } else {
                $ops = ($ops | gather $cur $_)
                let sub = $cur | get $_.sub
                if $i in $sub {
                    $cur = ($sub | get $i | node)
                } else {
                    if $strict {
                        $cur = ({ do $_.tips "not found" $i } | node)
                    } else {
                        $cur
                    }
                    break
                }
            }
        }
        {
            node: $cur
            rest: $rest
            ...$ops
        }
    }

    export def map [cb bc?] {
        let t = $in | node
        let _ = $env.comma_index
        travel [] [] $t $cb $bc $_
    }

    def travel [path g data cb bc _] {
        if $data.end {
            do $cb $path $g $data $_
        } else {
            $data | get $_.sub
            | transpose k v
            | reduce -f [] {|x, a|
                let v = $x.v | node
                let g = if ($bc | describe -d).type == 'closure' {
                    $g | append (do $bc $v $_)
                } else { $g }
                let r = travel ($path | append $x.k) $g $v $cb $bc $_
                if ($r | is-empty) {
                    $a
                } else {
                    $a | append $r
                }
            }
        }
    }


    export def spread [list lv=0] {
        $list
        | each {|x|
            if ($x | describe -d).type == 'list' {
                spread $x ($lv + 1)
            } else {
                $x
            }
        } | flatten
    }

}

module resolve {
    export def scope [args, vars, flts] {
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
                let fr = do ($flt | get $i) $args $vs
                let fr = if ($fr | describe -d).type == 'record' { $fr } else { {} }
                $vs = ($vs | merge $fr)
            } else {
                error make -u {msg: $"filter `($i)` not found" }
            }
        }
        $vs
    }


    export def comma [key = 'comma'] {
        let _ = $env.comma_index
        if ($env | get $key | describe -d).type == 'closure' {
            do ($env | get $key) $_
        } else {
            $env | get $key
        }
    }
}

module run {
    export def watches [act argv scope w] {
        if $w == null { return }
        let _ = $env.comma_index
        let cl = $w.clear? | default false
        if 'interval' in $w {
            loop {
                if $cl {
                    clear
                }
                do $act $argv $scope
                sleep $w.interval
                print -e $env.comma_index.settings.theme.watch_separator
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
                        print -e $env.comma_index.settings.theme.watch_separator
                    }
                }
            }
        }
    }

    export def main [tbl --opt: record] {
        let n = $in
        use tree
        use resolve
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
        use tree
        use resolve
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
        use utils 'str repeat'
        let w = term size | get columns
        mut lines = []
        for a in (unnest (if $strip { $x.0 } else { $x })) {
            mut nl = ($prefix | str repeat $a.lv)
            for t in $a.it {
                let line = if ($nl | str replace -a ' ' '' | is-empty) { $"($nl)($t)" } else { $"($nl) ($t)" }
                if ($line | str length) > $w {
                    $lines ++= $nl
                    $nl = $"($prefix | str repeat $a.lv)($t)"
                } else {
                    $nl = $line
                }
            }
            $lines ++= $nl
        }
        $lines | str join $" \\(char newline)"
    }

}

module test {
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
        use resolve
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
        use tree
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
            use run watches
            watches {
                $specs | suit
            } [] {} { clear: true }
        } else {
            $specs | suit
        }
    }
}

module vscode-tasks {
    export def merge [args tbl --opt: record] {
            let c = $args | gen $tbl
            if $opt.json {
                $c | to json
            } else {
                $c
            }
    }

    export def gen [tbl] {
        let argv = $in
        let _ = $env.comma_index
        use tree
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
                []
            } else {
                let label = $g
                    | filter {|x| not ($x | is-empty) }
                    | str join ' | '
                let command = $pth
                    | str join ' '
                let args = view source ($node | get $_.act)
                    | str replace -ar $'[ \n]' ''
                    | parse --regex '\{\|(.+?)\|.+\}'
                let args = if ($args| is-empty) { '' } else { $args.0.capture0 }
                let argid = if ($args | is-empty) { '' } else {
                    $"_($args | str replace -ar $'[ ,\n]' '_')"
                }
                let cmp = if $_.cmp in $node { random chars -l 8 }
                {
                    label: $label
                    command: $command
                    cmp: $cmp
                    args: $args
                    argid: $argid
                }
            }
        }
        let vs = $argv
        | flatten
        | tree select --strict $tbl
        | $in.node
        | reject 'end'
        | tree map $cb $bc
        let nuc = "nu -c 'use comma.nu *; source ,.nu;"
        let tasks = $vs
        | each {|x|
            let input = if ($x.cmp | is-empty) { '' } else { $" ${input:($x.cmp)}"}
            let input = if ($x.args | is-empty) { $input } else {
                $"($input) ${input:($x.argid)}"
            }
            let label = if ($x.label | is-empty) { '' } else { $" [($x.label)]" }
            {
                type: 'shell'
                label: $"($x.command)"
                command: $"($nuc) , ($x.command)($input)'"
                problemMatcher: []
            }
        }
        let inputs = $vs
        | filter {|x| not ($x.cmp | is-empty) }
        | each {|x| {
            id: $x.cmp
            type: 'command'
            command: 'shellCommand.execute'
            args: { command: $"($nuc) , -c --vscode ($x.command)'" }
        } }
        let args = $vs
        | reduce -f {} {|x,a|
            if ($x.args | is-empty) { $a } else {
                if $x.argid in $a { $a } else {
                    $a | insert $x.argid {
                        "type": "promptString",
                        "id": $x.argid,
                        "description": $x.args
                    }
                }
            }
        }
        | transpose k v
        | get v

        {
            version: "2.0.0"
            tasks: $tasks
            inputs: [...$inputs ...$args]
        }
    }
}

def 'find parent' [] {
    let o = $in
    let depth = ($env.PWD | path expand | path split | length) - 1
    mut cur = [',.nu']
    mut e = ''
    for i in 0..$depth {
        $e = ($cur | path join)
        if ($e | path exists) { break }
        $cur = ['..', ...$cur]
        $e = ''
    }
    $e
}



def 'comma file' [] {
    [
        {
          condition: {|_, after| $after | path join ',.nu' | path exists}
          code: "
          print -e $'(ansi default_underline)(ansi default_bold),(ansi reset).nu (ansi green_italic)detected(ansi reset)...'
          print -e $'(ansi $env.comma_index.settings.theme.info)activating(ansi reset) (ansi default_underline)(ansi default_bold),(ansi reset) module with `(ansi default_dimmed)(ansi default_italic)source ,.nu(ansi reset)`'

          # TODO: allow parent dir
          $env.comma_index.wd = $after
          $env.comma_index.session_id = (random chars)

          source ,.nu
          "
        }
    ]
}

export-env {
    use utils *
    # batch mode
    if not ($env.config? | is-empty) {
        $env.config = ( $env.config | upsert hooks.env_change.PWD { |config|
            let o = ($config | get -i hooks.env_change.PWD)
            let val = (comma file)
            if $o == null {
                $val
            } else {
                $o | append $val
            }
        })
    }
    $env.comma_index = (
        [
            [children sub s]
            [description desc dsc d]
            [action act a]
            [completion cmp c]
            [filter flt f]
            [computed cpu u]
            [watch wth w]
            tag
            # test
            [expect exp e x]
            [mock test_args m]
            [report rpt r]
            # internal
            dry_run
        ]
        | gendict 5 {
            settings: {
                test_group: {|x|
                    let indent = '  ' | str repeat $x.indent
                    let s = $"(ansi bg_dark_gray)GROUP(ansi reset)"
                    let t = $"(ansi yellow_bold)($x.title)(ansi reset)"
                    let d = $"(ansi light_gray)($x.desc)(ansi reset)"
                    print $"($indent)($s) ($t) ($d)"
                }
                test_message: {|x|
                    let indent = '  ' | str repeat $x.indent
                    let status = if $x.status {
                        $"(ansi bg_green)SUCC(ansi reset)"
                    } else {
                        $"(ansi bg_red)FAIL(ansi reset)"
                    }
                    print $"($indent)($status) (ansi yellow_bold)($x.message) (ansi light_gray)($x.args)(ansi reset)"
                    if not ($x.report | is-empty) {
                        let report = if $indent == 0 {
                            $x.report
                        } else {
                            $x.report | each {|i| $"($indent)($i)"}
                        }
                        | str join (char newline)
                        print $"(ansi light_gray)($report)(ansi reset)"
                    }
                }
                theme: {
                    info: 'yellow_italic'
                    batch_hint: 'dark_gray'
                    watch_separator: $"(ansi dark_gray)------------------------------(ansi reset)"
                }
            }
            os: (os type)
            arch: (uname -m)
            lg: {$in | lg}
            batch: {|mod|
                let o = $in
                    | lines
                    | split row ';'
                    | flatten
                let cmd = ['use comma.nu *' $'source ($mod)' ...$o ]
                    | str join (char newline)
                print -e $"(ansi $env.comma_index.settings.theme.batch_hint)($cmd)(ansi reset)"
                nu -c $cmd
            }
            test: {|dsc, spec|
                use test
                let fmt = $env.comma_index.settings.test_message
                test $fmt 0 $dsc $spec
            }
            tips: {|...m|
                if ($m | length) > 2 {
                    print -e $"(ansi light_gray_italic)Accepts no more than (ansi yellow_bold)2(ansi reset)(ansi light_gray_italic) parameters(ansi reset)"
                } else {
                    print -e $"(ansi light_gray_italic)($m.0)(ansi reset) (ansi yellow_bold)($m.1?)(ansi reset)"
                }
            }
            T: {|f| {|r,a,s| do $f $r $a $s; true } }
            F: {|f| {|r,a,s| do $f $r $a $s; false } }
            I: {|x| $x }
            diff: {|x|
                use test
                test diffo {expect: $x.expect, result: $x.result}
            }
            outdent: { $in | outdent }
            config: {|cb|
                # FIXME: no affected $env
                $env.comma_index.settings = (do $cb $env.comma_index.settings)
            }
        }
    )
}


def summary [$tbl] {
    let argv = $in
    use tree
    $argv
    | flatten
    | tree select --strict $tbl
    | $in.node
    | get $env.comma_index.sub
    | tree map { |pth, g, node| {
        path: $pth
        node: $node
    } }
}

def 'parse argv' [] {
    let context = $in
    $context.0
    | str substring 0..$context.1
    | split row ';'
    | last
    | str trim -l
    | split row -r '\s+'
    | range 1..
    | where not ($it | str starts-with '-')
}

def expose [t, a, tbl] {
    match $t {
        test => {
            use test
            $a | test run $tbl
        }
        summary => {
            $a | summary $tbl
        }
        vscode => {
            use vscode-tasks
            $a | vscode-tasks gen $tbl
        }
        dry => {
            use run
            run dry $a
        }
        _ => {
            let _ = $env.comma_index
            do $_.tips "expose has different arguments" [
                test
                summary
                vscode
            ]
        }
    }
}

# perform or print
export def --wrapped pp [...x --print --as-str] {
    if $print or (do -i { $env.comma_index | get $env.comma_index.dry_run } | default false) {
        use run
        let r = run dry $x --strip
        if $as_str {
            $r
        } else {
            print -e $"(ansi light_gray)($r)(ansi reset)(char newline)"
        }
    } else {
        use tree spread
        ^$x.0 ...(spread ($x | range 1..))
    }
}

def completion [...context] {
    use resolve
    use run
    $context
    | parse argv
    | run complete (resolve comma)
}

export def --wrapped , [
    # flag with parameters is not supported
    --json (-j)
    --completion (-c)
    --vscode
    --test (-t)
    --tag (-g)
    --watch (-w)
    --print (-p)
    --expose (-e) # for test
    ...args:string@'completion'
] {
    use resolve
    if ($args | is-empty) {
        if $vscode {
            use vscode-tasks
            vscode-tasks merge $args (resolve comma) --opt {json: $json}
        } else if ([$env.PWD, ',.nu'] | path join | path exists) {
            ^$env.EDITOR ,.nu
        } else {
            let a = [yes no] | input list 'create ,.nu ?'
            let time = date now | format date '%Y-%m-%d{%w}%H:%M:%S'
            let txt = [($nu.config-path | path dirname) scripts comma_tmpl.nu]
                | path join
                | open $in
                | str replace '{{time}}' $time
            if $a == 'yes' {
                $txt | save $",.nu"
                #source ',.nu'
            } else {
                $txt
            }
        }
    } else {
        let tbl = resolve comma
        if $completion {
            use run
            let c = $args | flatten | run complete $tbl
            if $vscode {
                $c
                | each {|x|
                    if ($x | describe -d).type == 'string' { $x } else {
                        $"($x.value)||($x.description)|"
                    }
                }
                | str join (char newline)
            } else if $json {
                $c | to json
            } else {
                $c
            }
        } else if $test {
            use test
            $args | flatten | test run $tbl --opt {watch: $watch}
        } else if $expose {
            expose $args.0 ($args | range 1..) $tbl
        } else {
            if $print {
                $env.comma_index = ($env.comma_index | upsert $env.comma_index.dry_run true)
            }
            use run
            $args | flatten | run $tbl --opt {watch: $watch}
        }
    }
}
