export-env {
    $env.history_backup_dir = $'($env.HOME)/.cache/nu-history-backup'
}

# backup history
export def 'history backup' [tag?] {
    if (which sqlite3 | is-empty) {
        print -e $'(ansi light_gray)please install sqlite3(ansi reset)'
        return
    }
    mkdir $env.history_backup_dir
    let tag = if ($tag | is-empty) { '' } else { $"($tag)::" }
    [
        $".output ($env.history_backup_dir)/($tag)(date now | format date "%y_%m_%d_%H_%M_%S").sql"
        $"update history set cwd = replace\(cwd, '($env.HOME)', '~');"
        '.dump'
        $"update history set cwd = replace\(cwd, '~', '($env.HOME)');"
        '.quit'
    ]
    | str join (char newline)
    | sqlite3 $nu.history-path
}

def "nu-complete history_backup_file" [] {
    ls $env.history_backup_dir | each {|x| $x.name | path parse } | get stem | reverse
}
# restore history
export def 'history restore' [name: string@"nu-complete history_backup_file"] {
    if (which sqlite3 | is-empty) {
        print -e $'(ansi light_gray)please install sqlite3(ansi reset)'
        return
    }
    rm -f $nu.history-path
    open ([$env.history_backup_dir, $"($name).sql"] | path join)
    | sqlite3 $nu.history-path
    [
        $"update history set cwd = replace\(cwd, '~', '($env.HOME)');"
        '.quit'
    ]
    | str join (char newline)
    | sqlite3 $nu.history-path
}

def quote [...t] {
    $"'($t | str join '')'"
}

export def 'history timing' [
    pattern?
    --num(-n)=10
    --all(-a)
] {
    mut cond = ["cmd not like 'history timing%'"]
    if ($pattern | is-not-empty) {
        $cond ++= (['cmd' 'like' (quote '%' $pattern '%')] | str join ' ')
    }
    if not $all {
        $cond ++= (['cwd' '=' (quote $env.PWD)] | str join ' ')
    }
    let cond = if ($cond | is-empty) {[]} else {['where' ($cond | str join ' and ')]}

    let q = [
        "select"
        ([
            'duration_ms as duration'
            'command_line as cmd'
            'start_timestamp as start'
            ...(if $all {[$"replace\(cwd, '($env.HOME)', '~') as cwd"]} else {[]})
            'exit_status as exit'
        ] | str join ', ')
        'from history'
        ...$cond
        'order by' 'start' 'desc'
        'limit' $num
    ]
    | str join ' '

    open $nu.history-path
    | query db $q
    | update duration {|x| $x.duration | default 0 | do { $in * 1_000_000 } | into duration }
    | update start {|x|
        $x.start | into int | do { $in * 1_000_000 } | into datetime
    }
}

export def 'history top' [
    num=10
    --before (-b): duration
    --dir (-d)
    --path(-p): list<string>
] {
    mut cond = []
    if ($before | is-not-empty) {
        let ts = (date now) - $before | into int | do { $in / 1_000_000 }
        $cond ++= (['start_timestamp' '>' $ts] | str join ' ')
    }
    if ($path | is-not-empty) {
        let ps = $path | each { quote $in } | str join ', '
        $cond ++= (['cwd' 'in' '(' $ps  ')'] | str join ' ')
    }
    let cond = if ($cond | is-empty) {[]} else {['where' ($cond | str join ' and ')]}

    let tk = if $dir {
        [
            $"replace\(cwd, '($env.HOME)', '~') as cwd"
            'cwd'
        ]
    } else {
        [
            'command_line as cmd'
            'cmd'
        ]
    }
    let q = [
        'select'
        ([
            $tk.0
            'count(1) as count'
        ] | str join ', ')
        'from history'
        ...$cond
        'group by' $tk.1
        'order by' 'count' 'desc'
        'limit' $num
    ]
    | str join ' '

    open $nu.history-path | query db $q
}
