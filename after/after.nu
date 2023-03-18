def "nu-complete ps" [] {
    ps | each {|x| { value: $x.pid, description: $x.name } }
}

# after <pid> { do something ... }
export def after [pid: string@"nu-complete ps" action ] {
    do -i { tail --pid $pid -f /dev/null }
    do $action
}
