# spawn task to run in the background
#
# please note that a fresh nushell is spawned to execute the given command
# So it doesn't inherit current scope's variables, custom commands, alias definition, except env variables which value can convert to string.
#
# e.g:
# spawn { echo 3 }
export def spawn [
    command: block   # the command to spawn
] {
    let config_path = $nu.config-path
    let env_path = $nu.env-path
    let source_code = (view source $command | str trim -l -c '{' | str trim -r -c '}')
    let job_id = (pueue add -p $"nu --config \"($config_path)\" --env-config \"($env_path)\" -c '($source_code)'")
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

# get job running status
export def status () {
    pueue status --json
    | from json
    | get tasks
    | transpose -i status
    | flatten
    | flatten status
}

# kill specific job
export def kill (id: int) {
    pueue kill $id
}

# clean job log
export def clean () {
    pueue clean
}
