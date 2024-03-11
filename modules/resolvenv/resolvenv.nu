export def record_match [pat obj] {
    $pat
    | transpose k v
    | reduce -f true {|i,a|
        match ($i.v | describe -d).type {
            string => {
                $obj | get $i.k | find -ir $i.v | is-not-empty
            }
            int => {
                $i.v == ($obj | get $i.k)
            }
            record => {
                record_match $i.v ($obj | get $i.k)
            }
            list => {
                $obj | get $i.k
                | zip $i.v
                | reduce -f true {|i1, a1|
                    let tk = random chars -l 6
                    $a1 and (record_match {$tk: $i1.1} {$tk: $i1.0} )
                }
            }
        }
        | do { $a and $in}
    }
}

# [pattern object action] : list<table<any, any, any>>
export def rx_match [obj tbl] {
    mut default = null
    mut action = null
    for i in $tbl {
        if ($i.0 | describe -d).type == 'string' {
            $default = $i.1
        } else {
            if (record_match $i.0 $obj) {
                $action = $i.1
                break
            }
        }
    }
    if ($action | is-empty) {
        $action = $default
    }
    let t = ($action | describe -d).type
    if ($env.DEBUG? | default false) { print -e $t }
    match $t {
        closure => { $obj | do $action $obj }
        _ => { $action }
    }
    | default {}
}


export def 'wifi ssid' [dev=wlan0] {
    if (which iw | is-empty) {
        print -e 'please install iw'
    } else {
        let r = iw dev $dev link
        | lines
        | parse -r '\s*SSID: (?<ssid>[\w\-]+)'
        if ($r | is-not-empty) { $r | get 0.ssid }
    }
}

export def screens [] {
    # TODO: optimize
    mut monitor = []
    for i in (xrandr | lines) {
        let x = $i | parse -r '(?<port>[\w\-]+)\s+connected\s+(?<x>\d+)x(?<y>\d+)\+(?<_x>\d+)\+(?<_y>\d+).*'
        if ($x | is-not-empty) {
            let r = $x | get 0
            | transpose k v
            | reduce -f {} {|i,a|
                let v = if $i.k == 'port' { $i.v } else { $i.v | into int }
                $a | insert $i.k $v
            }
            $monitor ++= $r
        }
    }
    $monitor
}

export def 'current screen' [] {
    let c = xdotool getmouselocation
    | split row ' '
    | each { $in | split row ':'}
    | reduce -f {} {|i,a| $a | insert $i.0 ($i.1 | into int)}
    for i in (screens) {
        let x = $c.x >= $i._x and $c.x < ($i.x + $i._x)
        let y = $c.y >= $i._y and $c.y < ($i.y + $i._y)
        if $x and $y {
            return $i
        }
    }
}

# [pattern action]
export def --env select [wifi tbl] {
    let obj = {
        wifi: (wifi ssid $wifi)
        screen: (current screen)
    }
    rx_match $obj $tbl | load-env
}
