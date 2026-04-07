def "nu-complete tv channels" [] {
  ^tv list-channels
  | lines
}

export extern "tv" [
  channel: string@"nu-complete tv channels"
]

# Lists the available channels
export extern "tv list-channels" []
# Initializes shell completion ("tv init zsh")
export extern "tv init" []
# Generates standard shell tab-completion scripts for tv's various subcommands
export extern "tv completions" []
# Downloads the latest collection of channel prototypes from github and saves them to the local configuration directory
export extern "tv update-channels" []
# Print this message or the help of the given subcommand(s)
export extern "tv help" []
