# internal function that holds the host data. We could store it in a yaml file as well but that would require nushell to read it from disk every single time
def hosts [] {
  [
    # Put your config here
  ]
}

def "nu-complete wol" [] {
  hosts|where mac != ''|get name
}

def "nu-complete nu" [] {
  hosts|where nu|get name
}

def "nu-complete hosts" [] {
  hosts|get name
}

def "nu-complete scripts" [] {
  $nu.scope.commands|where is_custom|get command
}
# Returns ssh connection as url to be consumed by original ssh command
def get-url [
    host: record
] {
  if $host.ip == '' {
    echo $"ssh://($host.username)@($host.name).($host.domain):($host.port)"  
  } else {
    echo $"ssh://($host.username)@($host.ip):($host.port)"
  }
}
# Returns all mandatory function arguments, used for input validation in ssh script
def get-required-args [
  command: record                  # command for which arguments should be returned
] {
  $command.signature
  |where not is_optional
  |get parameter_name
}
# Connect over ssh to one of predefined hosts, execute nushell commands and parse them on the host
export def ssh [
    hostname: string@"nu-complete hosts"                 # name of the host you want to connect to
  ...args                                                # commands you wish to run on the hosts
] {
    let host = (hosts|where name == $hostname|get -i 0)
    if not ($host.nu) {
        ^ssh (get_url $host) $args
    } else {
        if ($args|length) == 0 {
            ^ssh (get_url $host)
        } else {
            ^ssh (get_url $host) ($args|str collect ' ')|from json
        }

    }
}

# Connect over ssh to one of predefined hosts, execute nushell script with arguments passed from the host
export def "ssh script" [
    hostname: string@"nu-complete nu"                           # name of the host you want to connect to
    script: string@"nu-complete scripts"                        # name of the script 
  ...args                                                       # arguments you wish to pass to the script in key=value format
] {
    let host = (hosts|where name == $hostname|get 0)
    let command = ($nu.scope.commands|where command == $script|get 0)
    let args = ($args|split column '=' key value)
    
    if ((get-required-args $command)|all? ($it in ($args|get key))) {
      let full_command = (build-string ($args|format "let {key} = '{value}'"|str collect '; ') '; do ' (view-source $command.command) '|to json -r')
      ^ssh (get-url $host) $full_command|from json
    } else {
      error make {
        msg: $"($command.command) requires following arguments: (get-required-args $command) you provided: ($args|get -i key)"
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
