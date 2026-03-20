# Ghostty terminal emulator completions for Nushell
# https://ghostty.org — Version 1.3.x
# Ghostty uses +action syntax for subcommands and --key=value for config options

# --- Completion helpers ---

def "nu-complete ghostty actions" [] {
    [
        { value: "+list-fonts", description: "List available fonts" }
        { value: "+list-themes", description: "List available themes" }
        { value: "+list-keybinds", description: "List configured keybindings" }
        { value: "+list-colors", description: "List named RGB colors" }
        { value: "+list-actions", description: "List all bindable actions" }
        { value: "+show-config", description: "Show current configuration" }
        { value: "+validate-config", description: "Validate config file" }
        { value: "+edit-config", description: "Open config in $EDITOR" }
        { value: "+show-face", description: "Show font face for a codepoint" }
        { value: "+crash-report", description: "Inspect crash reports" }
        { value: "+ssh-cache", description: "Manage SSH terminfo cache" }
        { value: "+version", description: "Show version information" }
        { value: "+boo", description: "Display the Ghostty animation" }
    ]
}

def "nu-complete ghostty font-style" [] {
    [regular bold italic bold_italic]
}

def "nu-complete ghostty presentation" [] {
    [text emoji]
}

# --- Main command ---

# Ghostty terminal emulator
export extern ghostty [
    -e: string                              # Run a command instead of the shell
    --help                                  # Show help
    --version                               # Show version
    ...args: string                         # Action (+action) or config (--key=value)
]

# --- Actions ---

# List available fonts
export extern "ghostty +list-fonts" [
    --family: string                        # Filter by font family name
    --style: string@"nu-complete ghostty font-style"  # Filter by style
    --bold                                  # Show bold variants
    --italic                                # Show italic variants
    --help                                  # Show help
]

# List available color themes
export extern "ghostty +list-themes" [
    --plain                                 # Disable formatting for Unix tooling
    --help                                  # Show help
]

# List configured keybindings
export extern "ghostty +list-keybinds" [
    --default                               # Show default keybindings
    --docs                                  # Print documentation for each keybind
    --help                                  # Show help
]

# List named RGB colors
export extern "ghostty +list-colors" [
    --plain                                 # Disable formatting for Unix tooling
    --help                                  # Show help
]

# List all bindable actions
export extern "ghostty +list-actions" [
    --docs                                  # Print documentation for each action
    --help                                  # Show help
]

# Show current configuration
export extern "ghostty +show-config" [
    --default                               # Show default config instead of user config
    --changes-only                          # Only show options changed from default
    --docs                                  # Print documentation above each option
    --help                                  # Show help
]

# Validate Ghostty configuration file
export extern "ghostty +validate-config" [
    --config-file: path                     # Path to config file to validate
    --help                                  # Show help
]

# Open Ghostty config in $VISUAL or $EDITOR
export extern "ghostty +edit-config" [
    --help                                  # Show help
]

# Show font face used for a specific codepoint
export extern "ghostty +show-face" [
    --cp: string                            # Codepoint (decimal, hex 0x, octal 0o, binary 0b)
    --string: string                        # Find face for all codepoints in a string
    --style: string@"nu-complete ghostty font-style"  # Search for a specific style
    --presentation: string@"nu-complete ghostty presentation"  # Force text or emoji presentation
    --help                                  # Show help
]

# Manage SSH terminfo cache
export extern "ghostty +ssh-cache" [
    --clear                                 # Clear the entire cache
    --add                                   # Add an entry to the cache
    --remove                                # Remove an entry from the cache
    --host: string                          # Hostname for add/remove
    --ttl: string                           # Time-to-live for cache entry
    --help                                  # Show help
]

# Inspect and send crash reports
export extern "ghostty +crash-report" [
    --help                                  # Show help
]

# Show Ghostty version information
export extern "ghostty +version" [
    --help                                  # Show help
]

# Display the Ghostty animation from the website
export extern "ghostty +boo" [
    --help                                  # Show help
]
