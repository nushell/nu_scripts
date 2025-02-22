def 'nu-complete komorebic commands' [] {
  [
    {
      value: quickstart
      description: 'Gather example configurations for a new-user quickstart'
    }
    {
      value: start
      description: 'Start komorebi.exe as a background process'
    }
    {
      value: stop
      description: 'Stop the komorebi.exe process and restore all hidden windows'
    }
    {
      value: check
      description: 'Check komorebi configuration and related files for common errors'
    }
    {
      value: configuration
      description: 'Show the path to komorebi.json'
    }
    {
      value: bar-configuration
      description: 'Show the path to komorebi.bar.json'
    }
    {
      value: whkdrc
      description: 'Show the path to whkdrc'
    }
    {
      value: state
      description: 'Show a JSON representation of the current window manager state'
    }
    {
      value: global-state
      description: 'Show a JSON representation of the current global state'
    }
    {
      value: gui
      description: 'Launch the komorebi-gui debugging tool'
    }
    {
      value: visible-windows
      description: 'Show a JSON representation of visible windows'
    }
    {
      value: monitor-information
      description: 'Show information about connected monitors'
    }
    {
      value: query
      description: 'Query the current window manager state'
    }
    {
      value: subscribe-socket
      description: 'Subscribe to komorebi events using a Unix Domain Socket'
    }
    {
      value: unsubscribe-socket
      description: 'Unsubscribe from komorebi events'
    }
    {
      value: subscribe-pipe
      description: 'Subscribe to komorebi events using a Named Pipe'
    }
    {
      value: unsubscribe-pipe
      description: 'Unsubscribe from komorebi events'
    }
    {
      value: log
      description: "Tail komorebi.exe's process logs (cancel with Ctrl-C)"
    }
    {
      value: quick-save-resize
      description: 'Quicksave the current resize layout dimensions'
    }
    {
      value: quick-load-resize
      description: 'Load the last quicksaved resize layout dimensions'
    }
    {
      value: save-resize
      description: 'Save the current resize layout dimensions to a file'
    }
    {
      value: load-resize
      description: 'Load the resize layout dimensions from a file'
    }
    {
      value: focus
      description: 'Change focus to the window in the specified direction'
    }
    {
      value: move
      description: 'Move the focused window in the specified direction'
    }
    {
      value: minimize
      description: 'Minimize the focused window'
    }
    {
      value: close
      description: 'Close the focused window'
    }
    {
      value: force-focus
      description: 'Forcibly focus the window at the cursor with a left mouse click'
    }
    {
      value: cycle-focus
      description: 'Change focus to the window in the specified cycle direction'
    }
    {
      value: cycle-move
      description: 'Move the focused window in the specified cycle direction'
    }
    {
      value: stack
      description: 'Stack the focused window in the specified direction'
    }
    {
      value: unstack
      description: 'Unstack the focused window'
    }
    {
      value: cycle-stack
      description: 'Cycle the focused stack in the specified cycle direction'
    }
    {
      value: focus-stack-window
      description: 'Focus the specified window index in the focused stack'
    }
    {
      value: stack-all
      description: 'Stack all windows on the focused workspace'
    }
    {
      value: unstack-all
      description: 'Unstack all windows in the focused container'
    }
    {
      value: resize-edge
      description: 'Resize the focused window in the specified direction'
    }
    {
      value: resize-axis
      description: 'Resize the focused window or primary column along the specified axis'
    }
    {
      value: move-to-monitor
      description: 'Move the focused window to the specified monitor'
    }
    {
      value: cycle-move-to-monitor
      description: 'Move the focused window to the monitor in the given cycle direction'
    }
    {
      value: move-to-workspace
      description: 'Move the focused window to the specified workspace'
    }
    {
      value: move-to-named-workspace
      description: 'Move the focused window to the specified workspace'
    }
    {
      value: cycle-move-to-workspace
      description: 'Move the focused window to the workspace in the given cycle direction'
    }
    {
      value: send-to-monitor
      description: 'Send the focused window to the specified monitor'
    }
    {
      value: cycle-send-to-monitor
      description: 'Send the focused window to the monitor in the given cycle direction'
    }
    {
      value: send-to-workspace
      description: 'Send the focused window to the specified workspace'
    }
    {
      value: send-to-named-workspace
      description: 'Send the focused window to the specified workspace'
    }
    {
      value: cycle-send-to-workspace
      description: 'Send the focused window to the workspace in the given cycle direction'
    }
    {
      value: send-to-monitor-workspace
      description: 'Send the focused window to the specified monitor workspace'
    }
    {
      value: move-to-monitor-workspace
      description: 'Move the focused window to the specified monitor workspace'
    }
    {
      value: focus-monitor
      description: 'Focus the specified monitor'
    }
    {
      value: focus-last-workspace
      description: 'Focus the last focused workspace on the focused monitor'
    }
    {
      value: focus-workspace
      description: 'Focus the specified workspace on the focused monitor'
    }
    {
      value: focus-workspaces
      description: 'Focus the specified workspace on all monitors'
    }
    {
      value: focus-monitor-workspace
      description: 'Focus the specified workspace on the target monitor'
    }
    {
      value: focus-named-workspace
      description: 'Focus the specified workspace'
    }
    {
      value: cycle-monitor
      description: 'Focus the monitor in the given cycle direction'
    }
    {
      value: cycle-workspace
      description: 'Focus the workspace in the given cycle direction'
    }
    {
      value: move-workspace-to-monitor
      description: 'Move the focused workspace to the specified monitor'
    }
    {
      value: cycle-move-workspace-to-monitor
      description: 'Move the focused workspace monitor in the given cycle direction'
    }
    {
      value: swap-workspaces-with-monitor
      description: 'Swap focused monitor workspaces with specified monitor'
    }
    {
      value: new-workspace
      description: 'Create and append a new workspace on the focused monitor'
    }
    {
      value: resize-delta
      description: 'Set the resize delta (used by resize-edge and resize-axis)'
    }
    {
      value: invisible-borders
      description: 'Set the invisible border dimensions around each window'
    }
    {
      value: global-work-area-offset
      description: 'Set offsets to exclude parts of the work area from tiling'
    }
    {
      value: monitor-work-area-offset
      description: 'Set offsets for a monitor to exclude parts of the work area from tiling'
    }
    {
      value: focused-workspace-container-padding
      description: 'Set container padding on the focused workspace'
    }
    {
      value: focused-workspace-padding
      description: 'Set workspace padding on the focused workspace'
    }
    {
      value: adjust-container-padding
      description: 'Adjust container padding on the focused workspace'
    }
    {
      value: adjust-workspace-padding
      description: 'Adjust workspace padding on the focused workspace'
    }
    {
      value: change-layout
      description: 'Set the layout on the focused workspace'
    }
    {
      value: cycle-layout
      description: 'Cycle between available layouts'
    }
    {
      value: flip-layout
      description: 'Flip the layout on the focused workspace (BSP only)'
    }
    {
      value: promote
      description: 'Promote the focused window to the top of the tree'
    }
    {
      value: promote-focus
      description: 'Promote the user focus to the top of the tree'
    }
    {
      value: promote-window
      description: 'Promote the window in the specified direction'
    }
    {
      value: retile
      description: 'Force the retiling of all managed windows'
    }
    {
      value: monitor-index-preference
      description: 'Set the monitor index preference for a monitor identified using its size'
    }
    {
      value: display-index-preference
      description: 'Set the display index preference for a monitor identified using its display name'
    }
    {
      value: ensure-workspaces
      description: 'Create at least this many workspaces for the specified monitor'
    }
    {
      value: ensure-named-workspaces
      description: 'Create these many named workspaces for the specified monitor'
    }
    {
      value: container-padding
      description: 'Set the container padding for the specified workspace'
    }
    {
      value: named-workspace-container-padding
      description: 'Set the container padding for the specified workspace'
    }
    {
      value: workspace-padding
      description: 'Set the workspace padding for the specified workspace'
    }
    {
      value: named-workspace-padding
      description: 'Set the workspace padding for the specified workspace'
    }
    {
      value: workspace-layout
      description: 'Set the layout for the specified workspace'
    }
    {
      value: named-workspace-layout
      description: 'Set the layout for the specified workspace'
    }
    {
      value: workspace-layout-rule
      description: 'Add a dynamic layout rule for the specified workspace'
    }
    {
      value: named-workspace-layout-rule
      description: 'Add a dynamic layout rule for the specified workspace'
    }
    {
      value: clear-workspace-layout-rules
      description: 'Clear all dynamic layout rules for the specified workspace'
    }
    {
      value: clear-named-workspace-layout-rules
      description: 'Clear all dynamic layout rules for the specified workspace'
    }
    {
      value: workspace-tiling
      description: 'Enable or disable window tiling for the specified workspace'
    }
    {
      value: named-workspace-tiling
      description: 'Enable or disable window tiling for the specified workspace'
    }
    {
      value: workspace-name
      description: 'Set the workspace name for the specified workspace'
    }
    {
      value: toggle-window-container-behaviour
      description: 'Toggle the behaviour for new windows (stacking or dynamic tiling)'
    }
    {
      value: toggle-float-override
      description: 'Enable or disable float override, which makes it so every new window opens in floating mode'
    }
    {value: toggle-workspace-window-container-behavior description: 'Toggle the behaviour for new windows (stacking or dynamic tiling) for currently focused workspace. If there was no behaviour set for the workspace previously it takes the opposite of the global value'}
    {
      value: toggle-workspace-float-override
      description: 'Enable or disable float override, which makes it so every new window opens in floating mode, for the currently focused workspace. If there was no override value set for the workspace previously it takes the opposite of the global value'
    }
    {
      value: toggle-pause
      description: 'Toggle window tiling on the focused workspace'
    }
    {
      value: toggle-tiling
      description: 'Toggle window tiling on the focused workspace'
    }
    {
      value: toggle-float
      description: 'Toggle floating mode for the focused window'
    }
    {
      value: toggle-monocle
      description: 'Toggle monocle mode for the focused container'
    }
    {
      value: toggle-maximize
      description: 'Toggle native maximization for the focused window'
    }
    {
      value: restore-windows
      description: 'Restore all hidden windows (debugging command)'
    }
    {
      value: manage
      description: 'Force komorebi to manage the focused window'
    }
    {
      value: unmanage
      description: 'Unmanage a window that was forcibly managed'
    }
    {
      value: replace-configuration
      description: 'Replace the configuration of a running instance of komorebi from a static configuration file'
    }
    {
      value: reload-configuration
      description: 'Reload legacy komorebi.ahk or komorebi.ps1 configurations (if they exist)'
    }
    {
      value: watch-configuration
      description: 'Enable or disable watching of legacy komorebi.ahk or komorebi.ps1 configurations (if they exist)'
    }
    {
      value: complete-configuration
      description: 'For legacy komorebi.ahk or komorebi.ps1 configurations, signal that the final configuration option has been sent'
    }
    {
      value: window-hiding-behaviour
      description: 'Set the window behaviour when switching workspaces / cycling stacks'
    }
    {
      value: cross-monitor-move-behaviour
      description: 'Set the behaviour when moving windows across monitor boundaries'
    }
    {
      value: toggle-cross-monitor-move-behaviour
      description: 'Toggle the behaviour when moving windows across monitor boundaries'
    }
    {
      value: unmanaged-window-operation-behaviour
      description: 'Set the operation behaviour when the focused window is not managed'
    }
    {
      value: ignore-rule
      description: 'Add a rule to ignore the specified application'
    }
    {
      value: manage-rule
      description: 'Add a rule to always manage the specified application'
    }
    {
      value: initial-workspace-rule
      description: 'Add a rule to associate an application with a workspace on first show'
    }
    {
      value: initial-named-workspace-rule
      description: 'Add a rule to associate an application with a named workspace on first show'
    }
    {
      value: workspace-rule
      description: 'Add a rule to associate an application with a workspace'
    }
    {
      value: named-workspace-rule
      description: 'Add a rule to associate an application with a named workspace'
    }
    {
      value: clear-workspace-rules
      description: 'Remove all application association rules for a workspace by monitor and workspace index'
    }
    {
      value: clear-named-workspace-rules
      description: 'Remove all application association rules for a named workspace'
    }
    {
      value: clear-all-workspace-rules
      description: 'Remove all application association rules for all workspaces'
    }
    {
      value: identify-object-name-change-application
      description: 'Identify an application that sends EVENT_OBJECT_NAMECHANGE on launch'
    }
    {
      value: identify-tray-application
      description: 'Identify an application that closes to the system tray'
    }
    {
      value: identify-layered-application
      description: 'Identify an application that has WS_EX_LAYERED, but should still be managed'
    }
    {
      value: remove-title-bar
      description: 'Whitelist an application for title bar removal'
    }
    {
      value: toggle-title-bars
      description: 'Toggle title bars for whitelisted applications'
    }
    {
      value: border
      description: 'Enable or disable borders'
    }
    {
      value: border-colour
      description: 'Set the colour for a window border kind'
    }
    {
      value: border-width
      description: 'Set the border width'
    }
    {
      value: border-offset
      description: 'Set the border offset'
    }
    {
      value: border-style
      description: 'Set the border style'
    }
    {
      value: border-implementation
      description: 'Set the border implementation'
    }
    {
      value: transparency
      description: 'Enable or disable transparency for unfocused windows'
    }
    {
      value: transparency-alpha
      description: 'Set the alpha value for unfocused window transparency'
    }
    {
      value: toggle-transparency
      description: 'Toggle transparency for unfocused windows'
    }
    {
      value: animation
      description: 'Enable or disable movement animations'
    }
    {
      value: animation-duration
      description: 'Set the duration for movement animations in ms'
    }
    {
      value: animation-fps
      description: 'Set the frames per second for movement animations'
    }
    {
      value: animation-style
      description: 'Set the ease function for movement animations'
    }
    {
      value: mouse-follows-focus
      description: 'Enable or disable mouse follows focus on all workspaces'
    }
    {
      value: toggle-mouse-follows-focus
      description: 'Toggle mouse follows focus on all workspaces'
    }
    {
      value: ahk-app-specific-configuration
      description: 'Generate common app-specific configurations and fixes to use in komorebi.ahk'
    }
    {
      value: pwsh-app-specific-configuration
      description: 'Generate common app-specific configurations and fixes in a PowerShell script'
    }
    {
      value: convert-app-specific-configuration
      description: 'Convert a v1 ASC YAML file to a v2 ASC JSON file'
    }
    {
      value: fetch-app-specific-configuration
      description: 'Fetch the latest version of applications.json from komorebi-application-specific-configuration'
    }
    {
      value: application-specific-configuration-schema
      description: 'Generate a JSON Schema for applications.json'
    }
    {
      value: notification-schema
      description: 'Generate a JSON Schema of subscription notifications'
    }
    {
      value: socket-schema
      description: 'Generate a JSON Schema of socket messages'
    }
    {
      value: static-config-schema
      description: 'Generate a JSON Schema of the static configuration file'
    }
    {
      value: generate-static-config
      description: 'Generates a static configuration JSON file based on the current window manager state'
    }
    {
      value: enable-autostart
      description: 'Generates the komorebi.lnk shortcut in shell:startup to autostart komorebi'
    }
    {
      value: disable-autostart
      description: 'Deletes the komorebi.lnk shortcut in shell:startup to disable autostart'
    }
    {
      value: help
      description: 'Print this message or the help of the given subcommand(s)'
    }
  ]
}

export extern komorebi [
# A tiling window manager for Windows
  --ffm                 (-f) # Allow the use of komorebi's custom focus-follows-mouse implementation
  --await-configuration (-a) # Wait for 'komorebic complete-configuration' to be sent before processing events
  --tcp-port: int       (-t) # Start a TCP server on the given port to allow the direct sending of SocketMessages
  --config: string      (-c) # Path to a static configuration JSON file
  --help                (-h) # Print help
  --version             (-V) # Print version
]

export extern komorebic [
# The command-line interface for Komorebi, a tiling window manager for Windows
  string?: string@'nu-complete komorebic commands'
  --bar  # Start komorebi with bar
  --whkd # Start komorebic with whkd
]
