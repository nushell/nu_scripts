export def get-sign [cmd] {
    let x = (scope commands | where name == $cmd).signatures?.0?.any?
    mut s = []
    mut n = {}
    mut p = []
    mut pr = []
    mut r = []
    for it in $x {
        if $it.parameter_type == 'switch' {
            if ($it.short_flag | is-not-empty) {
                $s ++= $it.short_flag
            }
            if ($it.parameter_name | is-not-empty) {
                $s ++= $it.parameter_name
            }
        } else if $it.parameter_type == 'named' {
            if ($it.parameter_name | is-empty) {
                $n = ($n | upsert $it.short_flag $it.short_flag)
            } else if ($it.short_flag | is-empty) {
                $n = ($n | upsert $it.parameter_name $it.parameter_name)
            } else {
                $n = ($n | upsert $it.short_flag $it.parameter_name)
            }
        } else if $it.parameter_type == 'positional' {
            if $it.is_optional == false {
                $p ++= $it.parameter_name
            } else {
                $pr ++= $it.parameter_name
            }
        } else if $it.parameter_type == 'rest' {
            $r ++= $it.parameter_name
        }
    }
    { switch: $s, name: $n, positional: ($p ++ $pr), rest: $r }
}

# "test -h [123 (3213 3)] 123 `a sdf` --cd --ef sadf -g" | token
export def token [] {
    let s = ($in | split row '' | range 1..-2)
    let s = if ($s | last) == ' ' { $s } else { $s | append ' ' }
    mut par = []
    mut res = []
    mut cur = ''
    mut esc = false
    for c in $s {
        if $c == '\' {
            $esc = true
        } else {
            if $esc {
                $cur ++= $c
                $esc = false
            } else {
                if $c == ' ' and ($par | length) == 0 {
                    $res ++= [$cur]
                    $cur = ''
                } else {
                    if $c in ['{' '[' '('] {
                        $par ++= $c
                    }
                    if $c in ['}' ']' ')'] {
                        $par = ($par | range ..-2)
                    }
                    if $c in ['"' "'" '`'] {
                        if ($par | length) > 0 and ($par | last) == $c {
                            $par = ($par | range ..-2)
                        } else {
                            $par ++= $c
                        }
                    }
                    $cur ++= $c
                }

            }
        }
    }
    return $res
}

export def parse [] {
    let token = ($in | token)
    let sign = (get-sign $token.0)
    mut sw = ''
    mut pos = []
    mut opt = {}
    for c in $token {
        if ($sw | is-empty) {
            if ($c | str starts-with '-') {
                let c = if ($c | str substring 1..2) != '-' {
                    let k = ($c | str substring 1..)
                    if $k in $sign.name {
                        $'($sign.name | get $k)'
                    } else {
                        $k
                    }
                } else {
                    $c | str substring 2..
                }
                if $c in $sign.switch {
                    $opt = ($opt | upsert $c true)
                } else {
                    $sw = $c
                }
            } else {
                $pos ++= [$c]
            }
        } else {
            $opt = ($opt | upsert $sw $c)
            $sw = ''
        }
    }
    $opt._args = $pos
    let p = $pos | range 1..($sign.positional | length)
    let rest = $pos | range (($sign.positional | length) + 1)..-1
    $opt._pos = ( $p | enumerate
        | reduce -f {} {|it, acc|
            $acc | upsert ($sign.positional | get $it.index) $it.item
        } )
    if ($sign.rest | length) > 0 {
        $opt._pos = ($opt._pos | upsert $sign.rest.0 $rest)
    }
    $opt
}

# def test [a b x? ...y --cd(-c) --ef(-e):string -g -h:int --ij --lm:bool] {}
# (scope commands | where name == test).signatures?.0?.any?
# get-sign test | to yaml
# "test -h 111 123 'asdf' --cd --ef sadf -g -h 222" | cmd parse | to yaml
