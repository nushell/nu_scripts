def safe_get [path obj] {
    mut r = $obj
    mut ps = $path
    loop {
        if ($ps | length) < 1 { break }
        if $r == null { break }
        let p = $ps | first

        if ($p | describe -d).type == closure {
            $r = ($r | do $p $r)
            $ps = ($ps | range 1..)
            continue
        }

        match ($r | describe -d).type {
            record => {
                if $p in $r {
                    $r = ($r | get $p)
                } else {
                    $r = null
                }
            }
            list => {
                let ps = $ps
                return ($r | each {|x| safe_get $ps $x })
            }
            _ => {
                $r = null
            }
        }
        $ps = ($ps | range 1..)
    }
    $r
}

def extract [tg obj] {
    $tg
    | transpose k v
    | reduce -f {} {|i,a|
        match ($i.v | describe -d).type {
            list => {
                let c = safe_get $i.v $obj
                $a | upsert $i.k $c
            }
            record => {
                let o = safe_get $i.v._ $obj
                let t = $i.v | reject _
                $a | upsert $i.k (main $t $o)
            }
        }
    }
}

export def main [tg obj] {
    if ($obj | describe -d).type == list {
        $obj | each {|x| extract $tg $x }
    } else {
        extract $tg $obj
    }
}

