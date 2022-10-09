# authour: DWTW

def commandsGlow [] {
  [ "config", "help", "stash" ]
}

# Render markdown on the CLI, with pizzazz!
export extern "glow" [
  string?
  --all(-a)                 # Show system files and directories (TUI)
  --config: string          # Specify config file
  --help(-h)                # Help for glow
  --local(-l)               # Show local files only
  --pager(-p)               # Display with pager
  --style(-s): string       # Style name or JSON path
  --width(-w): int          # Word-wrap width
]

# Create a config file
export extern "glow config" [
  --help(-h)                # Help for config
  --config: string          # Specify config file
]

# Provides help for any command
export extern "glow help" [
  string?: string@commandsGlow
  --help(-h)                # Help for config
  --config: string          # Specify config file
]

# Do stash stuff
export extern "glow stash" [
  string?
  --memo: string            # Memo or note for stashing
  --help(-h)                # Help for config
  --config: string          # Specify config file
]
