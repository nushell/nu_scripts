# internal function that holds the host data. We could store it in a yaml file as well but that would require nushell to read it from disk every single time
def hosts [] {
  [
    # Put your config here
  ]
}
def "nu-complete wol" [] {
  hosts
  |where mac != ''
  |get name
}

def "nu-complete nu" [] {
  hosts
  |where nu
  |get name
}

def "nu-complete hosts" [] {
  hosts
  |get name
}

def "nu-complete scripts" [] {
  scope commands
  |where is_custom
  |get -i command
}

# Returns ssh connection as url to be consumed by original ssh command
def get-url [
    host: record
] {
    if 'ip' in ($host|columns) {
        echo $"ssh://($host.username)@($host.ip):($host.port)"
    } else {
        echo $"ssh://($host.username)@($host.name).($host.domain):($host.port)"
    }
}

# Connect over ssh to one of predefined hosts, execute nushell commands and parse them on the host
export def ssh [
    hostname: string@"nu-complete hosts"                 # name of the host you want to connect to
    ...args                                                 # commands you wish to run on the host
] {
    let host = (hosts|where name == $hostname|get -i 0)
    if ($host.nu) {
        if ($args|length) > 0 {
            ^ssh (get-url $host) (build-string ($args|str join ' ') '|to json -r')|from json
        } else {
            ^ssh (get-url $host)
        }
    } else {
        ^ssh (get-url $host) $args
    }
}

# Connect over ssh to one of predefined hosts, execute nushell script with arguments passed from the host
export def "ssh script" [
    hostname: string@"nu-complete nu"                           # name of the host you want to connect to
    script: string@"nu-complete scripts"                        # name of the script
  ...args                                                       # arguments you wish to pass to the script in key=value format
] {
    let span = (metadata $script).span
    if $script in (scope commands|where is_custom|get command) {

        let host = (hosts|where name == $hostname|get 0)
        let full_command = (build-string (view-source $script) '; ' $script ' ' ($args|str join ' ') '|to json -r')
        ^ssh (get-url $host) ($full_command)|from json

    } else {
        error make {
            msg: $"($script) is not a custom command, use regular ssh command instead"
            label: {
                text: "Not a custom command",
                start: $span.start,
                end: $span.end
            }
        }
    }
}
# Turns on specified hosts using Wake on Lan
export def wake [
    ...names: string@"nu-complete wol" # list of host names to wake
] {
    hosts
    |where name in $names
    |each {|host|
        if $host.mac != '' {
        echo $"Waking ($host.name)"
        wakeonlan $host.mac|ignore
        } else {
            error make {
                msg: $"($host.name) does not support Wake on Lan"
            }
        }
    }
}
