# zmx - session persistence for terminal processes
# https://github.com/neurosnap/zmx

def "nu-complete zmx sessions" [] {
    zmx list --short | lines
}

def "nu-complete zmx shells" [] {
    ["bash", "zsh", "fish", "nu"]
}

# Attach to session, creating if needed
export extern "zmx attach" [
    name: string@"nu-complete zmx sessions"  # Session name
    ...command: string                       # Command to run instead of a login shell
]

# Attach to session, creating if needed
export extern "zmx a" [
    name: string@"nu-complete zmx sessions"  # Session name
    ...command: string                       # Command to run instead of a login shell
]

# Send command without attaching
export extern "zmx run" [
    name: string@"nu-complete zmx sessions"  # Session name
    -d                                       # Detach from the calling terminal; use `wait` to track its status
    --fish                                   # Required when the session runs fish shell
    ...command: string                       # Command to run
]

# Send command without attaching
export extern "zmx r" [
    name: string@"nu-complete zmx sessions"  # Session name
    -d                                       # Detach from the calling terminal; use `wait` to track its status
    --fish                                   # Required when the session runs fish shell
    ...command: string                       # Command to run
]

# Send raw input to session PTY
export extern "zmx send" [
    name: string@"nu-complete zmx sessions"  # Session name
    ...text: string                          # Raw text to send (no automatic carriage return)
]

# Send raw input to session PTY
export extern "zmx s" [
    name: string@"nu-complete zmx sessions"  # Session name
    ...text: string                          # Raw text to send (no automatic carriage return)
]

# Inject text into session display
export extern "zmx print" [
    name: string@"nu-complete zmx sessions"  # Session name
    ...text: string                          # Text to inject into the display and scrollback
]

# Inject text into session display
export extern "zmx p" [
    name: string@"nu-complete zmx sessions"  # Session name
    ...text: string                          # Text to inject into the display and scrollback
]

# Write stdin to file_path through the session
export extern "zmx write" [
    name: string@"nu-complete zmx sessions"  # Session name
    file_path: path                          # Destination path (absolute or relative to the session cwd)
]

# Write stdin to file_path through the session
export extern "zmx wr" [
    name: string@"nu-complete zmx sessions"  # Session name
    file_path: path                          # Destination path (absolute or relative to the session cwd)
]

# Detach all clients (ctrl+\ for current client)
export extern "zmx detach" []

# Detach all clients (ctrl+\ for current client)
export extern "zmx d" []

# List active sessions
export extern "zmx list" [
    --short                                  # Print only session names, one per line
]

# List active sessions
export extern "zmx l" [
    --short                                  # Print only session names, one per line
]

# List active sessions
export extern "zmx ls" [
    --short                                  # Print only session names, one per line
]

# Kill session and all attached clients
export extern "zmx kill" [
    ...name: string@"nu-complete zmx sessions"  # Session name(s) to kill
    --force                                     # Force kill
]

# Kill session and all attached clients
export extern "zmx k" [
    ...name: string@"nu-complete zmx sessions"  # Session name(s) to kill
    --force                                     # Force kill
]

# Output session scrollback
export extern "zmx history" [
    name: string@"nu-complete zmx sessions"  # Session name
    --vt                                     # Output history with escape sequences (terminal format)
    --html                                   # Output history as HTML
]

# Output session scrollback
export extern "zmx hi" [
    name: string@"nu-complete zmx sessions"  # Session name
    --vt                                     # Output history with escape sequences (terminal format)
    --html                                   # Output history as HTML
]

# Wait for session tasks to complete
export extern "zmx wait" [
    ...sessions: string@"nu-complete zmx sessions"  # Session name(s) to wait on
]

# Wait for session tasks to complete
export extern "zmx w" [
    ...sessions: string@"nu-complete zmx sessions"  # Session name(s) to wait on
]

# Follow session output
export extern "zmx tail" [
    ...sessions: string@"nu-complete zmx sessions"  # Session name(s) to follow
]

# Follow session output
export extern "zmx t" [
    ...sessions: string@"nu-complete zmx sessions"  # Session name(s) to follow
]

# Shell completions (bash, zsh, fish, nu)
export extern "zmx completions" [
    shell: string@"nu-complete zmx shells"  # Shell to generate completions for
]

# Shell completions (bash, zsh, fish, nu)
export extern "zmx c" [
    shell: string@"nu-complete zmx shells"  # Shell to generate completions for
]

# Show version
export extern "zmx version" []

# Show version
export extern "zmx v" []

# Show help message
export extern "zmx help" []

# Show help message
export extern "zmx h" []

def "nu-complete zmx commands" [] {
    [
        [value description];
        [attach "Attach to session, creating if needed"]
        [run "Send command without attaching"]
        [send "Send raw input to session PTY"]
        [print "Inject text into session display"]
        [write "Write stdin to file_path through the session"]
        [detach "Detach all clients (ctrl+\\ for current client)"]
        [list "List active sessions"]
        [kill "Kill session and all attached clients"]
        [history "Output session scrollback"]
        [wait "Wait for session tasks to complete"]
        [tail "Follow session output"]
        [completions "Shell completions (bash, zsh, fish, nu)"]
        [version "Show version"]
        [help "Show help message"]
    ]
}

# session persistence for terminal processes
export extern "zmx" [
    command?: string@"nu-complete zmx commands"  # The zmx subcommand to run
    --version(-v)                                # Show version
    --help(-h)                                   # Show help message
]
