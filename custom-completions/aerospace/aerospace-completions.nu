
def "nu-complete aerospace" [] {
    ^aerospace --help 
    | lines 
    | filter { str starts-with "  " } 
    | parse "  {value} {description}" 
    | str trim
}

export extern "aerospace" [
    command?: string@"nu-complete aerospace"
    --help(-h)      # Show help for command
    --version(-v)   # Print the current version
]


export extern "aerospace balance-sizes" [
    --help(-h)      # Show help for command
    # TODO: make a nu-complete to fill out this with current workspaces using aerospace list-windows
    --workspace:int     # Select specific workspace
]

export extern "aerospace close" [
    --help(-h)              # Show help for command
    --quit-if-last-window   # Quits aerospace when closing the final active window
    # TODO: make a nu-complete to fill out this with current windows using aerospace list-windows
    --window-id:int         # Select a specific window to close
]

export extern "aerospace close-all-windows-but-current" [
    --help(-h)              # Show help for command
    --quit-if-last-window   # Quits aerospace when closing the final active window
]

export extern "aerospace config" [
    --help(-h)              # Show help for command
    # TODO: figure out how to do the nested layers here where you need --json or --keys for this
    --get:string            # Show value of the specified key
    --major-keys            # Print all major keys
    --all-keys              # Print all keys
    --config-path:string    # Specify config file to display
]

# TODO: finish below
export extern "aerospace debug-windows" [
    --help(-h)      # Show help for command
]

export extern "aerospace enable" [
    --help(-h)      # Show help for command
]

export extern "aerospace flatten-workspace-tree" [
    --help(-h)      # Show help for command
]

export extern "aerospace focus" [
    --help(-h)      # Show help for command
]

export extern "aerospace focus-back-and-forth" [
    --help(-h)      # Show help for command
]

export extern "aerospace focus-monitor" [
    --help(-h)      # Show help for command
]

export extern "aerospace fullscreen" [
    --help(-h)      # Show help for command
]

export extern "aerospace join-with" [
    --help(-h)      # Show help for command
]

export extern "aerospace layout" [
    --help(-h)      # Show help for command
]

export extern "aerospace list-apps" [
    --help(-h)      # Show help for command
]

export extern "aerospace list-exec-env-vars" [
    --help(-h)      # Show help for command
]

export extern "aerospace list-modes" [
    --help(-h)      # Show help for command
]

export extern "aerospace list-monitors" [
    --help(-h)      # Show help for command
]

export extern "aerospace list-windows" [
    --help(-h)      # Show help for command
]

export extern "aerospace list-workspaces" [
    --help(-h)      # Show help for command
]

export extern "aerospace macos-native-fullscreen" [
    --help(-h)      # Show help for command
]

export extern "aerospace macos-native-minimize" [
    --help(-h)      # Show help for command
]

export extern "aerospace mode" [
    --help(-h)      # Show help for command
]

export extern "aerospace move" [
    --help(-h)      # Show help for command
]

export extern "aerospace move-mouse" [
    --help(-h)      # Show help for command
]

export extern "aerospace move-node-to-monitor" [
    --help(-h)      # Show help for command
]

export extern "aerospace move-node-to-workspace" [
    --help(-h)      # Show help for command
]

export extern "aerospace move-workspace-to-monitor" [
    --help(-h)      # Show help for command
]

export extern "aerospace reload-config" [
    --help(-h)      # Show help for command
]

export extern "aerospace resize" [
    --help(-h)      # Show help for command
]

export extern "aerospace split" [
    --help(-h)      # Show help for command
]

export extern "aerospace summon-workspace" [
    --help(-h)      # Show help for command
]

export extern "aerospace trigger-binding" [
    --help(-h)      # Show help for command
]

export extern "aerospace volume" [
    --help(-h)      # Show help for command
]

export extern "aerospace workspace" [
    --help(-h)      # Show help for command
]

export extern "aerospace workspace-back-and-forth" [
    --help(-h)      # Show help for command
]

