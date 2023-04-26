def "nu-complete ps" [] {
    ps -l | each {|x| { value: $"($x.pid)", description: $x.command } }
}

# after { do something ... } <pid>
export def main [action, pid: string@"nu-complete ps"] {
    do -i { tail --pid $pid -f /dev/null }
    do $action
}
