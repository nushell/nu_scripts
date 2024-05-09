def "nu-complete ps" [] {
    ps -l | each {|x| { value: $"($x.pid)", description: $x.command } }
}

export def wait-pid [pid: string@"nu-complete ps"] {
    do -i { tail --pid $pid -f /dev/null }
}

export def wait-cmd [action -i: duration = 1sec  -t: string='waiting'] {
    mut time = 0
    loop {
        print -e $"(ansi light_gray)($t) (ansi light_gray_italic)($i * $time)(ansi reset)"
        let c = do --ignore-errors $action | complete | get exit_code
        if ($c == 0) { break }
        sleep $i
        $time = $time + 1
    }
}

export def 'process ancestor' [pid: int@"nu-complete ps"] {
    let px = ps
    let cur = $px | where pid == $pid | get 0
    mut s = [$cur]
    loop {
        let ppid = $s | last | get ppid
        let p = $px | where pid == $ppid
        if ($p | is-empty) { break }
        $s ++= $p
    }
    $s
}

export def 'process descendant' [pid: int@"nu-complete ps"] {
    descendant (ps) $pid
}

def 'descendant' [ps pid] {
    let p = $ps | where ppid == $pid
    if ($p | is-empty) {
        return []
    } else {
        let pd = $p | each {|x| descendant $ps $x.pid } | flatten
        return [...$p ...$pd]
    }
}
