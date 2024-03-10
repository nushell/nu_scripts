def logtime [msg act] {
    let start = (date now)
    let result = (do $act)
    let period = ((date now) - $start
        | into duration --unit ns
        | into string
        | str replace ' ' '')

    echo $'($start | format date '%Y-%m-%d_%H:%M:%S%z')(char tab)($period)(char tab)($msg)(char newline)'
    | save -a ~/.cache/nushell/time.log

    return $result
}

export def timelog [] {
    open ~/.cache/nushell/time.log
    | from tsv -n
    | rename start duration message
    | each {|x|
        $x
        | update start ($x.start | into datetime -f '%Y-%m-%d_%H:%M:%S%z')
        | update duration ($x.duration | into duration)
    }
}
