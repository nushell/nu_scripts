# Starship prompt completions for Nushell
# https://starship.rs — The cross-shell prompt for astronauts

# --- Completion helpers ---

def "nu-complete starship shells" [] {
    [bash elvish fish nushell powershell zsh]
}

def "nu-complete starship presets" [] {
    [
        bracketed-segments
        catppuccin-powerline
        gruvbox-rainbow
        jetpack
        nerd-font-symbols
        no-empty-icons
        no-nerd-font
        no-runtime-versions
        pastel-powerline
        plain-text-symbols
        pure-preset
        tokyo-night
    ]
}

# --- Main command ---

# The cross-shell prompt for astronauts
export extern starship [
    --help(-h)                              # Print help
    --version(-V)                           # Print version
]

# --- Subcommands ---

# Create a pre-populated GitHub issue with information about your configuration
export extern "starship bug-report" [
    --help(-h)                              # Print help
]

# Generate starship shell completions for your shell to stdout
export extern "starship completions" [
    shell: string@"nu-complete starship shells"  # Shell to generate completions for
    --help(-h)                              # Print help
]

# Edit the starship configuration
export extern "starship config" [
    name?: string                           # Configuration key to edit
    value?: string                          # Value to place into that key
    --help(-h)                              # Print help
]

# Explains the currently showing modules
export extern "starship explain" [
    --status(-s): int                       # Status code of the previously run command
    --pipestatus: string                    # Pipe status codes
    --terminal-width(-w): int              # Width of the current terminal
    --path(-p): path                        # Path that the prompt should render for
    --logical-path(-P): string             # Logical path for the prompt
    --cmd-duration(-d): int                # Execution duration of the last command (ms)
    --keymap(-k): string                   # Keymap of fish/zsh/cmd
    --jobs(-j): int                        # Number of currently running jobs
    --shlvl: int                            # Current value of SHLVL
    --help(-h)                              # Print help
]

# Prints the shell function used to execute starship
export extern "starship init" [
    shell: string@"nu-complete starship shells"  # Shell to initialize
    --print-full-init                       # Print full init script
    --help(-h)                              # Print help
]

# Prints a specific prompt module
export extern "starship module" [
    name?: string                           # Name of the module to print
    --list(-l)                              # List all supported modules
    --status(-s): int                       # Status code of the previously run command
    --pipestatus: string                    # Pipe status codes
    --terminal-width(-w): int              # Width of the current terminal
    --path(-p): path                        # Path that the prompt should render for
    --logical-path(-P): string             # Logical path for the prompt
    --cmd-duration(-d): int                # Execution duration of the last command (ms)
    --keymap(-k): string                   # Keymap of fish/zsh/cmd
    --jobs(-j): int                        # Number of currently running jobs
    --shlvl: int                            # Current value of SHLVL
    --help(-h)                              # Print help
]

# Prints a preset config
export extern "starship preset" [
    name?: string@"nu-complete starship presets"  # Preset name
    --output(-o): path                     # Output the preset to a file
    --list(-l)                              # List all preset names
    --help(-h)                              # Print help
]

# Prints the computed starship configuration
export extern "starship print-config" [
    --default(-d)                           # Print the default instead of computed config
    --help(-h)                              # Print help
    ...name: string                         # Configuration keys to print
]

# Prints the full starship prompt
export extern "starship prompt" [
    --right                                 # Print the right prompt
    --profile: string                       # Print prompt with specified profile name
    --continuation                          # Print the continuation prompt
    --status(-s): int                       # Status code of the previously run command
    --pipestatus: string                    # Pipe status codes
    --terminal-width(-w): int              # Width of the current terminal
    --path(-p): path                        # Path that the prompt should render for
    --logical-path(-P): string             # Logical path for the prompt
    --cmd-duration(-d): int                # Execution duration of the last command (ms)
    --keymap(-k): string                   # Keymap of fish/zsh/cmd
    --jobs(-j): int                        # Number of currently running jobs
    --shlvl: int                            # Current value of SHLVL
    --help(-h)                              # Print help
]

# Generate random session key
export extern "starship session" [
    --help(-h)                              # Print help
]

# Prints timings of all active modules
export extern "starship timings" [
    --status(-s): int                       # Status code of the previously run command
    --pipestatus: string                    # Pipe status codes
    --terminal-width(-w): int              # Width of the current terminal
    --path(-p): path                        # Path that the prompt should render for
    --logical-path(-P): string             # Logical path for the prompt
    --cmd-duration(-d): int                # Execution duration of the last command (ms)
    --keymap(-k): string                   # Keymap of fish/zsh/cmd
    --jobs(-j): int                        # Number of currently running jobs
    --shlvl: int                            # Current value of SHLVL
    --help(-h)                              # Print help
]

# Toggle a given starship module
export extern "starship toggle" [
    name: string                            # Name of the module to toggle
    value?: string                          # Key of the config to toggle
    --help(-h)                              # Print help
]
