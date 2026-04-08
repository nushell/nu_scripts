# authour: DWTW

def platformOverride [] {
  [ "linux", "macos", "windows", "sunos", "osx", "android" ]
}

def whenColor [] {
  [ "always", "auto", "never" ]
}

# Collaborative cheatsheets for console commands
export extern "tldr" [
  string?
  --list(-l)                                # Lists all commands in the cache
  --render(-f): string                      # Render a specific markdown file
  --platform(-f): string@platformOverride   # Override the operating system
  --language(-L): string                    # Override the language
  --update(-u)                              # Update the local cache
  --no-auto-update                          # If auto update is configured. disable it for this run
  --clear-cache(-c)                         # Clear the local cache
  --pager                                   # Use a pager to page output
  --raw(-r)                                 # Display the raw markdown instead of rendering it
  --quiet(-q)                               # Suppress informational message
  --show-paths                              # Show file and directory paths using tealdeer
  --seed-config                             # Create a basic config
  --color: string@whenColor                 # Controls whether to use color
  --version(-v)                             # Print the version
  --help                                    # Print the help information
]
