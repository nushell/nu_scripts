
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

def "nu-complete aerospace-focus-monitor-numbers" [] {
    ^aerospace list-monitors -count
    | 1..$in
    | to str
}

def "nu-complete aerospace-focus-monitor-regex" [] {
    ^aerospace list-monitors
    | parse "{number} | {name}" 
    | str trim
    | get name
}

def "nu-complete aerospace-focus-monitor" [] {
    [
        'left',
        'down',
        'up',
        'right',
        'next',
        'prev',
        'main',
        'secondary',
        ...(nu-complete aerospace-focus-monitor-numbers),
        ...(nu-complete aerospace-focus-monitor-regex)
    ]
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

def "nu-complete aerospace fullscreen" [] {
    [
        "on",
        "off"
    ]
}

export extern "aerospace fullscreen" [
    --help(-h)      # Print help
    --no-outer-gaps # Remove the outer gaps when in fullscreen mode
    --window-id:int@"nu-complete aerospace-list-all-windows"      # Act on the specified window instead of the focues window
    command?:string@"nu-complete aerospace-fullscreen"
]

export extern "aerospace fullscreen on" [
    --help(-h)      # Print help
    --no-outer-gaps # Remove the outer gaps when in fullscreen mode
    --window-id:int@"nu-complete aerospace-list-all-windows"     # Act on the specified window instead of the focues window
    --fail-if-noop  # Exit with non-zero exit code if already fullscreen
]

export extern "aerospace fullscreen off" [
    --help(-h)      # Print help
    --no-outer-gaps # Remove the outer gaps when in fullscreen mode
    --window-id:int@"nu-complete aerospace-list-all-windows"      # Act on the specified window instead of the focues window
    --fail-if-noop  # Exit with non-zero exit code if already not fullscreen
]

def "nu-complete aerospace-join-with" [] {
    [
        "left",
        "down",
        "up",
        "right"
    ]
}

export extern "aerospace join-with" [
    --help(-h)      # Print help
    --window-id:int@"nu-complete aerospace-list-all-windows"      # Act on the specified window instead of the focues window
    command:string@"nu-complete aerospace-join-with"
]

def "nu-complete aerospace-join-with" [] {
    [
        "h_tiles",
        "v_tiles",
        "h_accordion",
        "v_accordion",
        "tiles",
        "accordion",
        "horizontal",
        "vertical",
        "tiling",
        "floating"
    ]
}

export extern "aerospace layout" [
    --help(-h)      # Print help
    --window-id:int@"nu-complete aerospace-list-all-windows"      # Act on the specified window instead of the focues window
    # TODO: find a way to support multiple options
    command:string@"nu-complete aerospace-layout"
]

def "nu-complete aerospace-output-format-apps" [] {
    # TODO: actually implement.
}

export extern "aerospace list-apps" [
    --help(-h)      # Print help
    --macos-native-hidden # Filter results to on ly print hidden applications. [no] inverts the condition
    --format:string # Specify output format. See "Output Format" section for more details. Incompatible with --count
    # --format:string@"nu-complete aerospace-output-format-apps" # Specify output format. See "Output Format" section for more details. Incompatible with --count
    --count         # Output only the number of apps. Incompatible with --format, --json
    --json          # Output in JSON format. Can be used in combination with --format to specify which data to include into the json. Incompatible with --count
]

export extern "aerospace list-exec-env-vars" [
    --help(-h)      # Print help
]

export extern "aerospace list-modes" [
    --help(-h)      # Print help
    --current       # only print the currently active mode
]

def "nu-complete aerospace-output-format-monitors" [] {
    # TODO: actually implement.
}

export extern "aerospace list-monitors" [
    --help(-h)      # Print help
    --focused       # Filter results to only print the focused monitor. [no] inverts the condition
    --mouse         # Filter results to only print the monitor with the mouse. [no] inverts the condition
    --format:string # Specify output format. See "Output Format" section for more details. Incompatible with --count
    # --format:string@"nu-complete aerospace-output-format-monitors" # Specify output format. See "Output Format" section for more details. Incompatible with --count
    --count         # Output only the number of workspaces. Incompatible with --format, --json
    --json          # Output in JSON format. Can be used in combination with --format to specify which data to include into the json. Incompatible with --count
]

def "nu-complete aerospace-output-format-windows" [] {
    # TODO: actually implement.
}

export extern "aerospace list-windows" [
    --help(-h)      # Print help
    --all           # Alias for --monitor all. Use with caution. Check `man aerospace-list-windows` for more details.
    --focused       # Print the focused window. Please note that it is possible for no window to be in focus. In that case, an error is reported.
    # TODO: create completions for these two
    --workspace     #Filter results to print windows that belong to either of specified workspaces.
    --monitor     #Filter results to print windows that belong to either of specified monitors.
    --pid           #Filter results to only print windows that belong to the Application with specified <pid>
    --app-bundle-id           #Filter results to only print windows that belong to the Application with specified Bundle ID
    --format:string # Specify output format. See "Output Format" section for more details. Incompatible with --count
    # --format:string@"nu-complete aerospace-output-format-windows" # Specify output format. See "Output Format" section for more details. Incompatible with --count
    --count         # Output only the number of workspaces. Incompatible with --format, --json
    --json          # Output in JSON format. Can be used in combination with --format to specify which data to include into the json. Incompatible with --count
]

export extern "aerospace list-workspaces" [
    --help(-h)      # Print help
    --all           # Alias for --monitor all. Use with caution. Check `man aerospace-list-windows` for more details.
    --focused       # Alias for --monitor focused --visible. Always prints a single workspace
    # TODO: create completion for --monitor
    --monitor       # Filter results to print windows that belong to either of specified monitors.
    --visible       # Filter results to only print currently visible workspaces. [no] inverts the condition. Several workspaces can be visible in multi-monitor setup
    --empty         # Filter results to only print empty workspaces. [no] inverts the condition.
    --format:string # Specify output format. See "Output Format" section for more details. Incompatible with --count
    # --format:string@"nu-complete aerospace-output-format-windows" # Specify output format. See "Output Format" section for more details. Incompatible with --count
    --count         # Output only the number of workspaces. Incompatible with --format, --json
    --json          # Output in JSON format. Can be used in combination with --format to specify which data to include into the json. Incompatible with --count
]

# TODO: resume here
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

