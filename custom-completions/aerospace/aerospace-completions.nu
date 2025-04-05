# AeroSpace is an i3-like tiling window manager for macOS
export extern "aerospace" [
    command?:string
    --help(-h)              # Print help
    --version(-v)           # Print the current version
]

def "nu-complete aerospace-list-all-workspaces" [] {
    ^aerospace list-workspaces --all
    | lines
}

# Balance sizes of all windows in the current workspace
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

# Close the focused window.
export extern "aerospace close" [
    --help(-h)              # Print help
    --quit-if-last-window   # Quit the app instead of closing if it's the last window of the app
    --window-id:int@"nu-complete aerospace-list-all-windows"         # Act on the specified window instead of the focused window
]

# On the focused workspace, close all windows but current
export extern "aerospace close-all-windows-but-current" [
    --help(-h)              # Print help
    --quit-if-last-window   # Quit the apps instead of closing them if it's their last window
]

# Query AeroSpace config options
export extern "aerospace config" [
    --help(-h)              # Print help
    --get:string            # Get the value for a given key. You can inspect available keys with --major-keys or --all-keys
    --major-keys            # Print major keys
    --all-keys              # Print all available keys recursively
    --config-path           # Print absolute path to the loaded config
]

def "nu-complete aerospace-config-list-all-keys" [] {
    aerospace config --all-keys
    | lines
}


# Interactive command to record Accessibility API debug information to create bug reports
export extern "aerospace debug-windows" [
    --help(-h)              # Print help
    --window-id:int@"nu-complete aerospace-list-all-windows"         # Print debug information of the specified window right away. Usage of this flag disables interactive mode
]

def "nu-complete aerospace-enable" [] {
    ['toggle', 'on', 'off']
}

# Temporarily disable window management
export extern "aerospace enable" [
    --help(-h)              # Print help
    command:string@"nu-complete aerospace-enable"
]

# Run /bin/bash -c '<bash-script>', and don’t wait for the command termination. Stdout, stderr and exit code are ignored.
export extern "aerospace exec-and-forget" [
    command:string
]

# Flatten the tree of the focused workspace
export extern "aerospace flatten-workspace-tree" [
    --help(-h)      # Print help
    --workspace:int@"nu-complete aerospace-list-all-workspaces"        # Act on the specified workspace instead of the focused workspace
]

def "nu-complete aerospace-focus" [] {
    ['left','down','up','right']
}

# Set focus to the nearest window in the given direction
export extern "aerospace focus" [
    --help(-h)      # Print help
    command?:string@"nu-complete aerospace-focus"
    --window-id:int@"nu-complete aerospace-list-all-windows"
    --dfs-index:int
    # --dfs-index:int@"nu-complete aerospace-list-dfs-indices"
]

def "nu-complete aerospace-focus-boundaries" [] {
    ['workspace', 'all-monitors-outer-frame']
}

def "nu-complete aerospace-focus-boundaries-action" [] {
    ['stop', 'wrap-around-the-workspace', 'wrap-around-all-monitors']
}

# Switch between the current and previously foxused elements back and forth. The element is either a window or an empty workspace
export extern "aerospace focus-back-and-forth" [
    --help(-h)      # Print help
]

def "nu-complete aerospace-focus-monitor-numbers" [] {
    ^aerospace list-monitors -count
    | 1..$in
    | into string
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

# Focus monitor by relative direction, by order, or by pattern
export extern "aerospace focus-monitor" [
    --help(-h)      # Print help
    command:string@"nu-complete aerospace-focus-monitor"
]


def "nu-complete aerospace-fullscreen" [] {
    [
        "on",
        "off"
    ]
}

# Toggle the fullscreen mode for the focused window
export extern "aerospace fullscreen" [
    --help(-h)      # Print help
    --no-outer-gaps # Remove the outer gaps when in fullscreen mode
    --window-id:int@"nu-complete aerospace-list-all-windows"      # Act on the specified window instead of the focues window
    command?:string@"nu-complete aerospace-fullscreen"
]


def "nu-complete aerospace-join-with" [] {
    [
        "left",
        "down",
        "up",
        "right"
    ]
}

# Put the focused window and the nearest node in the specified direction under a common parent container
export extern "aerospace join-with" [
    --help(-h)      # Print help
    --window-id:int@"nu-complete aerospace-list-all-windows"      # Act on the specified window instead of the focues window
    command:string@"nu-complete aerospace-join-with"
]

def "nu-complete aerospace-layout" [] {
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

# Change layout of the focused window to the given layout
export extern "aerospace layout" [
    --help(-h)      # Print help
    --window-id:int@"nu-complete aerospace-list-all-windows"      # Act on the specified window instead of the focues window
    # TODO: find a way to support multiple options
    command:string@"nu-complete aerospace-layout"
]

def "nu-complete aerospace-output-format-apps" [] {
    # TODO: actually implement.
}

# Print the list of running applications that appears in the Dock and may have a user interface
export extern "aerospace list-apps" [
    --help(-h)      # Print help
    --macos-native-hidden # Filter results to on ly print hidden applications. [no] inverts the condition
    --format:string # Specify output format. See "Output Format" section for more details. Incompatible with --count
    # --format:string@"nu-complete aerospace-output-format-apps" # Specify output format. See "Output Format" section for more details. Incompatible with --count
    --count         # Output only the number of apps. Incompatible with --format, --json
    --json          # Output in JSON format. Can be used in combination with --format to specify which data to include into the json. Incompatible with --count
]

# List environment variables that exec-* commands and callbacks are run with
export extern "aerospace list-exec-env-vars" [
    --help(-h)      # Print help
]

# Print a list of modes currently specified in the configuration
export extern "aerospace list-modes" [
    --help(-h)      # Print help
    --current       # only print the currently active mode
]

def "nu-complete aerospace-output-format-monitors" [] {
    # TODO: actually implement.
}

# Print monitors that satisfy conditions
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

# Print windows that satisfy conditions
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

# Print workspaces that satisfy conditions
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

def "nu-complete aerospace-macos-native-fullscreen" [] {
    [
        "on",
        "off"
    ]
}

# Toggle macOS fullscreen for the focused window
export extern "aerospace macos-native-fullscreen" [
    --help(-h)      # Print help
    --window-id:int@"nu-complete aerospace-list-all-windows"         # Act on the specified window instead of the focused window
    command?:string@"nu-complete aerospace-macos-native-fullscreen"
]

# Minimize focused window
export extern "aerospace macos-native-minimize" [
    --help(-h)      # Print help
    --window-id:int@"nu-complete aerospace-list-all-windows"         # Act on the specified window instead of the focused window
]

def "nu-complete aerospace-binding-mode" [] {
    ^aerospace list-modes 
    | lines
}

# Activate the specified binding mode
export extern "aerospace mode" [
    --help(-h)      # Print help
    command:string@"nu-complete aerospace-binding-mode"
]

def "nu-complete aerospace-move" [] {
    [
        "left",
        "down",
        "up",
        "right"
    ]
}

# Move the focused window in the given direction
export extern "aerospace move" [
    --help(-h)      # Print help
    command:string@"nu-complete aerospace-move"
    --window-id:int@"nu-complete aerospace-list-all-windows"         # Act on the specified window instead of the focused window
]

def "nu-complete aerospace-move-mouse" [] {
    [
        "monitor-lazy-center",
        "monitor-force-center",
        "window-lazy-center",
        "window-force-center"
    ]
}

# Move mouse to the requested position
export extern "aerospace move-mouse" [
    --help(-h)      # Print help
    command:string@"nu-complete aerospace-move-mouse"
]

# Move window to monitor targeted by relative direction, by order, or by pattern
export extern "aerospace move-node-to-monitor" [
    --help(-h)      # Print help
    --wrap-around   # Make it possible to jump between first and last workspaces using (next|prev)
    --fail-if-noop  # Exit with non-zero code if moving a window to a workspace it already belongs to
    --focus-follows-window  #Make sure that the window in question receives focus after moving.
    --window-id:int@"nu-complete aerospace-list-all-windows"         # Act on the specified window instead of the focused window
    command:string
]

# Move the focused window to the specified workspace
export extern "aerospace move-node-to-workspace" [
    --help(-h)      # Print help
    --wrap-around   # Make it possible to jump between first and last workspaces using (next|prev)
    --fail-if-noop  # Exit with non-zero code if moving a window to a workspace it already belongs to
    --focus-follows-window  #Make sure that the window in question receives focus after moving.
    --window-id:int@"nu-complete aerospace-list-all-windows"         # Act on the specified window instead of the focused window
    command:string
]

# Move workspace to monitor targeted by relative direction, by order, or by pattern. Focus follows the focused workspace, so the workspace stays focused.
export extern "aerospace move-workspace-to-monitor" [
    --help(-h)      # Print help
    --wrap-around   # Make it possible to jump between first and last monitors
    --workspace     # Act on the specified workspace instead of the focused workspace
]

# Reload currently active config
export extern "aerospace reload-config" [
    --help(-h)      # Print help
    --no-gui        # Don't open GUI to show error. Only use stdout to report errors
    --dry-run       # Validate the config and show errors (if any) but don't reload the config
]

def "nu-complete aerospace-resize" [] {
    [
        "smart",
        "smart-opposite",
        "width",
        "height",
    ]
}

# Resize the focused window
export extern "aerospace-resize" [
    --help(-h)      # Print help
    --window-id:int@"nu-complete aerospace-list-all-windows"         # Act on the specified window instead of the focused window
    command:string@"nu-complete aerospace-resize"
]

def "nu-complete aerospace-split" [] {
    [
        "horizontal",
        "vertical",
        "opposite"
    ]
}

# split command exist solely for compatibility with i3. Unless you’re hardcore i3 user who knows what they are doing, it’s recommended to use join-with
export extern "aerospace split" [
    --help(-h)      # Print help
    --window-id:int@"nu-complete aerospace-list-all-windows"         # Act on the specified window instead of the focused window
    command:string@"nu-complete aerospace-split"
]

# Move the requested workspace to the focused monitor. The moved workspace becomes focused. The behavior is identical to Xmonad.
export extern "aerospace summon-workspace" [
    --help(-h)      # Print help
    --fail-if-noop  # Exit with non-zero code if moving a window to a workspace it already belongs to
    command:string
]

# Trigger AeroSpace binding as if it was pressed by user
export extern "aerospace trigger-binding" [
    --help(-h)      # Print help
    command:string
    --mode:string   # Moe to search <binding> in
]

def "nu-complete aerospace-volume" [] {
    [
        "up",
        "down",
        "mute-toggle",
        "mute-off",
        "mute-on",
        "set"
        ]
}

# Manipulate volume
export extern "aerospace volume" [
    --help(-h)      # Print help
    command:string@"nu-complete aerospace-volume"
]

def "nu-complete aerospace-volume-set" [] {
    0..100
}

# Focus the specified workspace OR focuses next or previous workspace in the list
export extern "aerospace workspace" [
    --help(-h)      # Print help
    --wrap-around   # Make it possible to jump between first and last workspaces using (next|prev)
    --auto-back-and-forth   # Autmatic back-and-forth when switching to already focused workspace. Incompatible with --fail-if-noop
    --fail-if-noop  # Exit with non-zero exit code if switching to the already focused workspace. Incompatible with --auto-back-and-forth
    command:string
]

# Switch between the focused workspace and previously focused workspace back and forth
export extern "aerospace workspace-back-and-forth" [
    --help(-h)      # Print help
]

