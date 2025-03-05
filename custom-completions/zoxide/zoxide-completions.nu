def "nu-complete zoxide import" [] {
  ["autojump", "z"]
}

def "nu-complete zoxide shells" [] {
  ["bash", "elvish", "fish", "nushell", "posix", "powershell", "xonsh", "zsh"]
}

def "nu-complete zoxide hooks" [] {
  ["none", "prompt", "pwd"]
}

# Add a new directory or increment its rank
export extern "zoxide add" [
  ...paths: path
]

# Edit the database
export extern "zoxide edit" [ ]

# Import entries from another application
export extern "zoxide import" [
  --from: string@"nu-complete zoxide import"  # Application to import from
  --merge                                     # Merge into existing database
]

# Generate shell configuration
export extern "zoxide init" [
  shell: string@"nu-complete zoxide shells"
  --no-cmd                                    # Prevents zoxide from defining the `z` and `zi` commands
  --cmd: string                               # Changes the prefix of the `z` and `zi` commands [default: z]
  --hook: string@"nu-complete zoxide hooks"   # Changes how often zoxide increments a directory's score [default: pwd]
]

# Search for a directory in the database
export extern "zoxide query" [
  ...keywords: string
  --all(-a)             # Show unavailable directories
  --interactive(-i)     # Use interactive selection
  --list(-l)            # List all matching directories
  --score(-s)           # Print score with results
  --exclude: path       # Exclude the current directory
]

# Remove a directory from the database
export extern "zoxide remove" [
  ...paths: path
]

export extern zoxide [
  --help(-h)            # Print help
  --version(-V)         # Print version
]
