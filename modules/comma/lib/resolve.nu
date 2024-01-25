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
