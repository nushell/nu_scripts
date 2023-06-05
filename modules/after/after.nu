def "nu-complete ps" [] {
    ps -l | each {|x| { value: $"($x.pid)", description: $x.command } }
}

# after <pid> {|| do something ... }
export def main [
    pid: string@"nu-complete ps"
    action
] {
    do -i { tail --pid $pid -f /dev/null }
    do $action
}

# before {|| do something ... } <pid>
export def before [
    action
    pid: string@"nu-complete ps"
] {
    do -i { tail --pid $pid -f /dev/null }
    do $action
}
