export def logtime [msg act] {
    let start = date now
    let result = do $act
    # HACK: serialization
    let period = (date now) - $start | format duration ns | str replace ' ' ''

    echo $'($start | format date '%Y-%m-%d_%H:%M:%S%z')(char tab)($period)(char tab)($msg)(char newline)'
    | save -a ~/.cache/nushell/power_time.log

    $result
}

export def timelog [] {
    open ~/.cache/nushell/power_time.log
    | from tsv -n
    | rename start duration message
    | each {|x|
        $x
        | update start ($x.start | into datetime -f '%Y-%m-%d_%H:%M:%S%z')
        | update duration ($x.duration | into duration)
    }
}

export def analyze [] {
    timelog
    | group-by message
    | transpose component metrics
    | each {|x| $x | upsert metrics ($x.metrics | get duration | math avg)}
}

