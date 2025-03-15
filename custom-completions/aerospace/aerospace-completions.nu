
def "nu-complete aerospace" [] {
    ^aerospace --help 
    | lines 
    | filter { str starts-with "  " } 
    | parse "  {value} {description}" 
    | str trim
}

export extern "aerospace" [
    command?: string@"nu-complete aerospace"
    --help(-h)              # Print help
    --version(-v)           # Print the current version
]

def "nu-complete aerospace-list-all-workspaces" [] {
    ^aerospace list-workspaces --all
    | lines
}

export extern "aerospace balance-sizes" [
    --help(-h)              # Print help
    --workspace:int@"nu-complete aerospace-list-all-workspaces"        # Act on the specified workspace instead of the focused workspace
]

def "nu-complete aerospace-list-all-windows" [] {
    aerospace list-windows --all
    | lines
    | split column "|" -n 3
    | rename window-id application title
    | str trim
}

export extern "aerospace close" [
    --help(-h)              # Print help
    --quit-if-last-window   # Quit the app instead of closing if it's the last window of the app
    --window-id:int@"nu-complete aerospace-list-all-windows"         # Act on the specified window instead of the focused window
]

export extern "aerospace close-all-windows-but-current" [
    --help(-h)              # Print help
    --quit-if-last-window   # Quit the apps instead of closing them if it's their last window
]

export extern "aerospace config" [
    --help(-h)              # Print help
    --get:string            # Get the value for a given key. You can inspect available keys with --major-keys or --all-keys
    --major-keys            # Print major keys
    --all-keys              # Print all available keys recursively
    --config-path           # Print absolute path to the loaded config
]

export extern "aerospace config --major-keys" [
    --help(-h)              # Print help
]

export extern "aerospace config --all-keys" [
    --help(-h)              # Print help
]

export extern "aerospace config --config-path" [
    --help(-h)              # Print help
]

def "nu-complete aerospace-config-list-all-keys" [] {
    aerospace config --all-keys
    | lines
}

export extern "aerospace config --get" [
    command:string@"nu-complete aerospace-config-list-all-keys"
    --json # Print result in JSON format
    --keys # Print keys of the complicated object (map or array)
]

export extern "aerospace debug-windows" [
    --help(-h)              # Print help
    --window-id:int@"nu-complete aerospace-list-all-windows"         # Print debug information of the specified window right away. Usage of this flag disables interactive mode
]

def "nu-complete aerospace-enable" [] {
    ['toggle', 'on', 'off']
}

export extern "aerospace enable" [
    --help(-h)              # Print help
    command:string@"nu-complete aerospace-enable"
]

export extern "aerospace enable toggle" [
    --help(-h)              # Print help
]

export extern "aerospace enable on" [
    --help(-h)              # Print help
    --fail-if-noop          # Exit with non-zero exit code if already in the requested mode
]

export extern "aerospace enable off" [
    --help(-h)              # Print help
    --fail-if-noop          # Exit with non-zero exit code if already in the requested mode
]

export extern "aerospace flatten-workspace-tree" [
    --help(-h)      # Print help
    --workspace:int@"nu-complete aerospace-list-all-workspaces"        # Act on the specified workspace instead of the focused workspace
]
def "nu-complete aerospace-focus" [] {
    ['left','down','up','right']
}

export extern "aerospace focus" [
    --help(-h)      # Print help
    command?:string@"nu-complete aerospace-focus"
    --window-id:int@"nu-complete aerospace-list-all-windows"
    --dfs-index:int@"nu-complete aersoace-list-dfs-indices"
]

def "nu-complete aerospace-focus-boundaries" [] {
    ['workspace', 'all-monitors-outer-frame']
}

def "nu-complete aerosapce-focus-boundaries-action" [] {
    ['stop', 'wrap-around-the-workspace', 'wrap-around-all-monitors']
}

export extern "aerospace focus left" [
    --help(-h)      # Print help
    --ignore-floating #ignore floating windows
    --boundaries:string@"nu-complete aerospace-focus-boundaries" # Defines focus boundaries
    --boundaries-action:string@"nu-complete aerospace-focus-boundaries-action" # Defines the behavior when requested to cross the <boundary>.
]

export extern "aerospace focus down" [
    --help(-h)      # Print help
    --ignore-floating #ignore floating windows
    --boundaries:string@"nu-complete aerospace-focus-boundaries" # Defines focus boundaries
    --boundaries-action:string@"nu-complete aerospace-focus-boundaries-action" # Defines the behavior when requested to cross the <boundary>.
]

export extern "aerospace focus up" [
    --help(-h)      # Print help
    --ignore-floating #ignore floating windows
    --boundaries:string@"nu-complete aerospace-focus-boundaries" # Defines focus boundaries
    --boundaries-action:string@"nu-complete aerospace-focus-boundaries-action" # Defines the behavior when requested to cross the <boundary>.
]

export extern "aerospace focus right" [
    --help(-h)      # Print help
    --ignore-floating #ignore floating windows
    --boundaries:string@"nu-complete aerospace-focus-boundaries" # Defines focus boundaries
    --boundaries-action:string@"nu-complete aerospace-focus-boundaries-action" # Defines the behavior when requested to cross the <boundary>.
]

export extern "aerospace focus-back-and-forth" [
    --help(-h)      # Print help
]

def "nu-complete aerospace-focus-monitor" [] {
    # TODO: figure out how to do <monitor pattern> parsing
    ['left','down','up','right','next','prev']
}

export extern "aerospace focus-monitor" [
    --help(-h)      # Print help
    command:string@"nu-complete aerospace-focus-monitor"
]

export extern "aerospace focus-monitor left" [
    --help(-h)      # Print help
    --wrap-around # Make it possible to wrap around focus
]

export extern "aerospace focus-monitor down" [
    --help(-h)      # Print help
    --wrap-around # Make it possible to wrap around focus
]

export extern "aerospace focus-monitor up" [
    --help(-h)      # Print help
    --wrap-around # Make it possible to wrap around focus
]

export extern "aerospace focus-monitor right" [
    --help(-h)      # Print help
    --wrap-around # Make it possible to wrap around focus
]

export extern "aerospace focus-monitor next" [
    --help(-h)      # Print help
    --wrap-around # Make it possible to wrap around focus
]

export extern "aerospace focus-monitor prev" [
    --help(-h)      # Print help
    --wrap-around # Make it possible to wrap around focus
]

export extern "aerospace fullscreen" [
    --help(-h)      # Print help
]

export extern "aerospace fullscreen" [
    --help(-h)      # Print help
]

export extern "aerospace join-with" [
    --help(-h)      # Print help
]

export extern "aerospace layout" [
    --help(-h)      # Print help
]

export extern "aerospace list-apps" [
    --help(-h)      # Print help
]

export extern "aerospace list-exec-env-vars" [
    --help(-h)      # Print help
]

export extern "aerospace list-modes" [
    --help(-h)      # Print help
]

export extern "aerospace list-monitors" [
    --help(-h)      # Print help
]

export extern "aerospace list-windows" [
    --help(-h)      # Print help
]

export extern "aerospace list-workspaces" [
    --help(-h)      # Print help
]

export extern "aerospace macos-native-fullscreen" [
    --help(-h)      # Print help
]

export extern "aerospace macos-native-minimize" [
    --help(-h)      # Print help
]

export extern "aerospace mode" [
    --help(-h)      # Print help
]

export extern "aerospace move" [
    --help(-h)      # Print help
]

export extern "aerospace move-mouse" [
    --help(-h)      # Print help
]

export extern "aerospace move-node-to-monitor" [
    --help(-h)      # Print help
]

export extern "aerospace move-node-to-workspace" [
    --help(-h)      # Print help
]

export extern "aerospace move-workspace-to-monitor" [
    --help(-h)      # Print help
]

export extern "aerospace reload-config" [
    --help(-h)      # Print help
]

export extern "aerospace resize" [
    --help(-h)      # Print help
]

export extern "aerospace split" [
    --help(-h)      # Print help
]

export extern "aerospace summon-workspace" [
    --help(-h)      # Print help
]

export extern "aerospace trigger-binding" [
    --help(-h)      # Print help
]

export extern "aerospace volume" [
    --help(-h)      # Print help
]

export extern "aerospace workspace" [
    --help(-h)      # Print help
]

export extern "aerospace workspace-back-and-forth" [
    --help(-h)      # Print help
]

