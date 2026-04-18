# authour: DWTW

def commands [] {
  tldr --list | lines
}

def platformOverride [] {
  [linux macos sunos windows android freebsd netbsd openbsd common]
}

def whenColor [] {
  [always auto never]
}

# Collaborative cheatsheets for console commands
export extern "tldr" [
  cmd?: string@commands
  --list(-l)                                # Lists all commands in the cache
  --edit-page                               # Edit custom page with `EDITOR`
  --edit-patch                              # Edit custom patch with `EDITOR`
  --render(-f): string                      # Render a specific markdown file
  --platform(-p): string@platformOverride   # Override the operating system, can be specified multiple times in order of preference
  --language(-L): string                    # Override the language
  --update(-u)                              # Update the local cache
  --no-auto-update                          # If auto update is configured, disable it for this run
  --clear-cache(-c)                         # Clear the local cache
  --config-path: path                       # Override config file location
  --pager                                   # Use a pager to page output
  --raw(-r)                                 # Display the raw markdown instead of rendering it
  --quiet(-q)                               # Suppress informational message
  --show-paths                              # Show file and directory paths using tealdeer
  --seed-config                             # Create a basic config
  --color: string@whenColor                 # Controls whether to use color
  --version(-v)                             # Print the version
  --help                                    # Print the help information
]
