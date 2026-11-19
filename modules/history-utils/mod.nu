def quote [...t] {
    $"'($t | str join '')'"
}

def flatten_fields [args] {
    let f = $in | default [] | where {|x| $x | is-not-empty }
    let prefix = $args.0
    let inner = $args.1
    let outer = $args.2
    if ($f | is-not-empty) {
        $f
        | each {|x|
            if ($x | describe -d).type == list {
                $x | str join $inner
            } else {
                $x
            }
        }
        | str join $outer
        | do { (if ($prefix | is-empty) {[$in]} else {[$prefix $in]})}
    } else { [] }
}

def sql [q] {
    [
        [$q.select   ['select',   ' as ', ', ']]
        [[$q.from]   ['from',     ' as ', ' join ']]
        [$q.where?   ['where',    ' ',    ' and ']]
        [$q.whereOr? ['or',       ' ',    ' or ']]
        [$q.groupBy? ['group by', null,   ', ']]
        [$q.orderBy? ['order by', ' ',    ', ']]
        [[$q.limit?] ['limit',    null,   ' offset ']]
    ]
    | each {|x| $x.0 | flatten_fields $x.1 }
    | flatten
    | str join ' '
}

# Displays the recent command history
export def 'history timing' [
    pattern?: string # Show commands matching the pattern
    --exclude(-x): string # Exclude commands mathing the pattern
    --num(-n)=10  # Maximum number or results
    --all(-a)  # Show commands for all directories (default: cwd)
] {
    open $nu.history-path | query db (sql {
        from: history
        select: [
            [duration_ms duration]
            [command_line cmd]
            [start_timestamp start]
            (if $all {[$"replace\(cwd, '($env.HOME)', '~')" cwd]})
            [exit_status exit]
        ]
        where: [
            "cmd not like 'history timing%'"
            (if ($pattern | is-not-empty) {[cmd like (quote '%' $pattern '%')]})
            (if ($exclude | is-not-empty) {[cmd not like (quote '%' $exclude '%')]})
            (if not $all {[cwd = (quote $env.PWD)]})
        ]
        orderBy: [[start desc]]
        limit: $num
    })
    | update duration {|x| $x.duration | default 0 | do { $in * 1_000_000 } | into duration }
    | update start {|x| $x.start | into int | do { $in * 1_000_000 } | into datetime }
}

def "nu-complete history dir" [] {
    open $nu.history-path | query db (sql {
        from: history
        select: [cwd ['count(1)' count]]
        groupBy: [cwd]
        orderBy: ['count desc']
        limit: 20
    })
    | rename value description
    | update value {|x| $x.value | str replace $env.HOME '~' }
}

export def 'history top' [
    num=10
    --before (-b): duration
    --dir (-d)
    --path(-p): list<directory>
] {
    open $nu.history-path | query db (sql {
        from: history
        select: [
            (if $dir {[$"replace\(cwd, '($env.HOME)', '~')" cwd]} else {[command_line cmd]})
            ['count(1)' count]
        ]
        where: [
            (if ($before | is-not-empty) {
                let ts = (date now) - $before | into int | do { $in / 1_000_000 }
                [start_timestamp > $ts]
            })
            (if ($path | is-not-empty) {
                let ps = $path | path expand | each { quote $in } | str join ', '
                [cwd in '(' $ps  ')']
            })
        ]
        groupBy: [(if $dir {'cwd'} else {'cmd'})]
        orderBy: [[count desc]]
        limit: $num
    })
}
