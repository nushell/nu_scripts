# AeroSpace

AeroSpace is an i3-like tiling window manager for macOS


## Current status

All basic commands are expressed with descriptions, as are most flags.
Most command arguments have completions, but are not fully documented.

Completions that have yet to be added but are written are embedded in the code block below:

```nu
# TODO: figure out how to get subcommands and flags to show up in a way that feels normal with base extern
# currently, they show up in the completion list and clog up the results


export extern "aerospace config --major-keys" [
    --help(-h)              # Print help
]

export extern "aerospace config --all-keys" [
    --help(-h)              # Print help
]

export extern "aerospace config --config-path" [
    --help(-h)              # Print help
]

export extern "aerospace config --get" [
    command:string@"nu-complete aerospace-config-list-all-keys"
    --json # Print result in JSON format
    --keys # Print keys of the complicated object (map or array)
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


export extern "aerospace macos-native-fullscreen on" [
    --help(-h)      # Print help
    --window-id:int@"nu-complete aerospace-list-all-windows"         # Act on the specified window instead of the focused window
    --fail-if-noop  # Exit with non-zero exit code if already fullscreen
]

export extern "aerospace macos-native-fullscreen off" [
    --help(-h)      # Print help
    --window-id:int@"nu-complete aerospace-list-all-windows"         # Act on the specified window instead of the focused window
    --fail-if-noop  # Exit with non-zero exit code if already not fullscreen
]


export extern "aerospace move-mouse window-lazy-center" [
    --help(-h)      # Print help
    --fail-if-noop  # Exit with non-zero exit code if mouse is already at the requested position.
]

export extern "aerospace move-mouse monitor-lazy-center" [
    --help(-h)      # Print help
    --fail-if-noop  # Exit with non-zero exit code if mouse is already at the requested position.
]

def "nu-complete aerospace-move-node-to-monitor" [] {
    [
        "left,
        "down"
        "up",
        "right",
        "next",
        "prev",
    ]
}

export extern "aerospace volume set" [
    --help(-h)      # Print help
    command:int@"nu-complete aerospace-volume-set"
]

```
