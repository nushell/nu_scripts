# spawn task to run in the background
#
# please note that a fresh nushell is spawned to execute the given command
# So it doesn't inherit current scope's variables, custom commands, alias definition, except env variables which value can convert to string.
#
# Note that the closure to spawn can't take arguments.  And it only supports something like this: { echo 3 }, it have no parameter list.
#
# e.g:
# spawn { echo 3 }
export def spawn [
    command: closure   # the command to spawn
    --label(-l): string    # the label of comand
    --group(-g): string    # the group name to spawn
] {
    let config_path = $nu.config-path
    let env_path = $nu.env-path
    let source_code = (view source $command | str trim -l -c '{' | str trim -r -c '}')
    mut args = [
        $"nu --config \"($config_path)\" --env-config \"($env_path)\" -c '($source_code)'",
    ]
    if $label != null {
        $args = ($args | prepend ["--label", $label])
    }
    if $group != null {
        $args = ($args | prepend ["--group", $group])
    }
    let job_id = (pueue add -p $args)

    {"job_id": $job_id}
}

export def log [
    id: int   # id to fetch log
] {
    pueue log $id -f --json
    | from json
    | transpose -i info
    | flatten --all
    | flatten --all
    | flatten status
}

# get job's stdout.
export def output [
    id: int   # id to fetch job's stdout
] {
    log $id | get output.0
}

# get job running status
export def status [
    --detailed(-d)   # need to get detailed stauts?
] {
    let output = (
        pueue status --json
        | from json
        | get tasks
        | transpose -i status
        | flatten
        | flatten status
    )

    if not $detailed {
        $output | select id label group Done? status? start? end?
    } else {
        $output
    }
}

# kill specific job
export def kill (id: int) {
    pueue kill $id
}

# clean job log
export def clean () {
    pueue clean
}
