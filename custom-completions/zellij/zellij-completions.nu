def "nu-complete subcommands" [] {
  ^zellij --help | split column "SUBCOMMANDS:" | get column2.0 | str trim | lines | str trim | parse -r '(?P<command>^[
a-z-]+)' | get command
}

def "nu-complete zellij" [] {
  [
    { value: "action", description: "Send actions to a specific session [aliases: ac]" },
    { value: "attach", description: "Attach to a session [aliases: a]" },
    { value: "convert-config", description: "" },
    { value: "convert-layout", description: "" },
    { value: "convert-theme", description: "" },
    { value: "edit", description: "Edit file with default $EDITOR / $VISUAL [aliases: e]" },
    { value: "help", description: "Print this message or the help of the given subcommand(s)" },
    { value: "kill-all-sessions", description: "Kill all sessions [aliases: ka]" },
    { value: "kill-session", description: "Kill the specific session [aliases: k]" },
    { value: "list-sessions", description: "List active sessions [aliases: ls]" },
    { value: "options", description: "Change behaviour of zellij" },
    { value: "run", description: "Run a command in a new pane [aliases: r]" },
    { value: "setup", description: "Setup zellij and check its configuration" },
  
    # Aliases
    { value: "ac", description: "Alias for `action`" },
    { value: "a", description: "Alias for `attach`" },
    { value: "e", description: "Alias for `edit`" },
    { value: "ka", description: "Alias for `kill-all-sessions`" },
    { value: "k", description: "Alias for `kill-session`" },
    { value: "ls", description: "Alias for `list-sessions`" },
    { value: "r", description: "Alias for `run`" },
  ]
}

def "nu-complete zellij action" [] {
  [
    { value: "close-pane", description: "Close the focused pane" },
    { value: "close-tab", description: "Close the current tab" },
    { value: "dump-screen", description: "Dump the focused pane to a file" },
    { value: "edit", description: "Open the specified file in a new zellij pane with your default EDITOR" },
    { value: "edit-scrollback", description: "Open the pane scrollback in your default editor" },
    { value: "focus-next-pane", description: "Change focus to the next pane" },
    { value: "focus-previous-pane", description: "Change focus to the precvious pane" },
    { value: "go-to-next-tab", description: "Go to the next tab" },
    { value: "go-to-previous-tab", description: "Go to the previous tab" },
    { value: "go-to-tab", description: "Go to tab with index [index]" },
    { value: "half-page-scroll-down", description: "Scroll down half page in focus pane" },
    { value: "half-page-scroll-up", description: "Scroll up half page in focus pane" },
    { value: "help", description: "Print this message or the help of the given subcommand(s)" },
    { value: "move-focus", description: "Move the focused pane in the specified direction. [right|left|up|down]" },
    { value: "move-focus-or-tab", description: "Move focus to the pane or tab (if on screen edge) in the specified direction. [right|left|up|down]" },
    { value: "move-pane", description: "Change the location of the focused pane in the specified direction. [right|left|up|down]" },
    { value: "new-pane", description: "Open a new pane in the specified direction. [right|down] If no direction specified, will try to use the biggest available space" },
    { value: "new-tab", description: "Create a new tab, optionally with a specified tab layout and name" },
    { value: "page-scroll-down", description: "Scroll down one page in focus pane" },
    { value: "page-scroll-up", description: "Scroll up one page in focus pane" },
    { value: "rename-pane", description: "Renames the focused pane" },
    { value: "rename-tab", description: "Renames the focused tab" },
    { value: "resize", description: "Resize the focused pane in the specified direction. [right|left|up|down|+|-]" },
    { value: "scroll-down", description: "Scroll down to the bottom in focus pane" },
    { value: "scroll-up", description: "Scroll up in the focused pane" },
    { value: "switch-mode", description: "Switch input mode of all connected clients [locked|pane|tab|resize|move|search|session]" },
    { value: "toggle-active-sync-tab", description: "Toggle between sending text commands to all panes on the current tab and normal mode" },
    { value: "toggle-floating-panes", description: "Toggle visibility of all floating panes in the current tab, open one if none exist" },
    { value: "toggle-fullscreen", description: "Toggle between fullscreen focus pane and normal layout" },
    { value: "toggle-pane-embed-or-floating", description: "Embed focused pane if floating or float focused pane if embedded" },
    { value: "toggle-pane-frames", description: "Toggle frames around panes in the UI" },
    { value: "undo-rename-pane", description: "Remove a previously set pane name" },
    { value: "undo-rename-tab", description: "Remove a previously set tab name" },
    { value: "write", description: "Write bytes to the terminal" },
    { value: "write-chars", description: "Write characters to the terminal" },
  ]
}

def "nu-complete zellij attach" [] {
  [
    { value: "help", description: "Print this message or the help of a given subcommand(s)" },
    { value: "options", description: "Change the behaviour of zellij" },
  ]
}

def "nu-complete sessions" [] {
  ^zellij ls -n | lines | parse "{value} {description}"
}

# Turned off since it messes with sub-commands
#export extern "zellij" [
#  command?: string@"nu-complete zellij"
#  --config(-c)          # <CONFIG> Change where zellij looks for the configuration file [env: ZELLIJ_CONFIG_FILE=]
#  --config-dir          # <CONFIG_DIR> Change where zellij looks for the configuration directory [env: ZELLIJ_CONFIG_DIR=]
#  --debug(-d)           # Specify emitting additional debug information
#  --data-dir            # <DATA_DIR> Change where zellij looks for plugins
#  --help(-h)            # Print help message
#  --layout(-l)          # <LAYOUT> Name of a predefined layout inside the layout directory or the path to a layout file
#  --max-panes           # <MAX_PANES> Maximum panes on screen, caution: opening more panes will close old ones
#  --sessions(-s)        # <SESSION> Specify name of a new session
#  --version(-v)         # Print version information
#]

# Send actions to a specific session
export extern "zellij action" [
  command: string@"nu-complete zellij action"
  --help(-h) # Print help information
]

# Renames the focused tab
export extern "zellij action rename-tab" [
  name: string # Name for the tab
]

# Attach to a session
export extern "zellij attach" [
  session_name: string@"nu-complete sessions" # Name of the session to attach to
  command?: string@"nu-complete zellij attach"
  --create(-c) # Create a session if one does not exist
  --help(-h)   # Print help information
  --index      # <INDEX> Number of the session index in the active sessions ordered by creation date
]

# <OLD_CONFIG_FILE>
export extern "zellij convert-config" [
  file: path
  --help(-h) # Print help information
]

# <OLD_LAYOUT_FILE>
export extern "zellij convert-layout" [
  file: path
  --help(-h) # Print help information
]

# <OLD_THEME_FILE>
export extern "zellij convert-theme" [
  file: path
  --help(-h) # Print help information
]

def "nu-complete directions" [] {
  [ "right" "left" "down" "up" ]
}

# Edit file with default $EDITOR / $VISUAL
export extern "zellij edit" [
  file: path
  --cwd: path                                      # <CWD> Change the working directory of the editor
  --direction(-d): string@"nu-complete directions" # <DIRECTION> Direction to open the new pane in
  --floating(-f)                                   # Open the new pane in floating mode
  --help(-h)                                       # Print help information
  --line-number(-l): number                        # <LINE_NUMBER> Open the file in the specified line number
]

# Print this message or the help of the given subcommand(s)
export extern "zellij help" [
  command?: string@"nu-complete subcommands"
]

# Kill all sessions
export extern "zellij kill-all-sessions" [
  --help(-h) # Print help information
  --yes(-y)  # Automatic yes to prompts
]

# Kill the specific session
export extern "zellij kill-session" [
  session_name: string@"nu-complete sessions" # <TARGET_SESSION> Name of target session
  --help(-h) # Print help information         # Print help information
]

# List active sessions
export extern "zellij list-sessions" [
  --help(-h) # Print help information
]

def "nu-complete string bools" [] {
  [ "'true'" "'false'" ]
}

def "nu-complete option copy-clipboard" [] {
  [ "system", "primary" ]
}

def "nu-complete option on-force-close" [] {
  [ "quit" "detach" ]
}

# Change the behaviour of zellij
export extern "zellij options" [
  --attach-to-session: string@"nu-complete string bools" # Whether to attach to a session specified in "session-name" if it exists [possible values: true, false]
  --copy-clipboard: string@"nu-complete option copy-clipboard" # OSC52 destination clipboard [possible values: system, primary]
  --copy-command: string # <COPY_COMMAND> Switch to using a user supplied command for clipboard instead of OSC52
  --copy-on-select: string@"nu-complete string bools" # Automatically copy when selecting text (tru or false) [possible values: true, false]
  --default-layout # <DEFAULT_LAYOUT> Set the default layout
  --default-mode # <DEFAULT_MODE> Set the default mode
  --default-shell # <DEFAULT_SHELL> Set the default shell
  --disable-mouse-mode # Disable handling of mouse events
  --help(-h) # Print help information
  --layout-dir: path # <LAYOUT_DIR> Set the layout_dir, defaults to subdirectory of config dir
  --mirror-session: string@"nu-complete string bools" # Mirror session when multiple users are connected (true or false) [possible values: true, false]
  --mouse-mode: string@"nu-complete string bools" # <MOUSE_MODE> Set the handling of mouse events (true or false) Can be temporarily bypassed by the [SHIFT] key [possible values: true, false]
  --on-force-close: string@"nu-complete option on-force-close" # <ON_FORCE_CLOSE> Set behaviour on force close (quit or detach)
  --pane-frames: string@"nu-complete string bools" # <PANE_FRAMES> Set display of pane frames (true or false) [possible values: true, false]
  --scroll-buffer-size: any # <SCROLL_BUFFER_SIZE>
  --scrollback-editor: path # <SCROLLBACK_EDITOR> Explicit full path to open the scrollback editor (default is $EDITOR or $VISUAL)
  --session-name: string # <SESSION_NAME> The name of the session to create when starting Zellij
  --simplified-ui: string@"nu-complete string bools" # <SIMPLIFIED_UI> Allow plugins to use a more simplified layout that is compatible with more fonts (true or false) [possible values: true, false]
  --theme: string # <THEME> Set the default theme
  --theme-dir: path # <THEME_DIR> Set the theme_dir, defaults to subdirectory of config dir
]

# Run a command in a new pane
export extern "zellij run" [
  command: string # Command to run
  --close-on-exit(-c) # Close the pane immediately when its command exits
  --cwd: path # <CWD> Change the working directory of th new pane
  --direction(-d): string@"nu-complete directions" # <DIRECTION> Direction to open new pane in
  --floating(-f) # Open the new pane in floating mode
  --help(-h) # Print help information
  --name(-n): string # <NAME> Name of the new pane
  --start-suspended(-s) # Start the command suspended, only running after you first presses ENTER
]

export extern "zellij setup" [
  --check # Checks the configuration of zellij and displays currently used directories
  --clean # Disables loading of configuration file at default location, loads the defaults that zellij ships with
  --dump-config # Dump the default configuration file to stdout
  --dump-layout: string # <DUMP_LAYOUT> Dump the specified layout file to stdout
  --generate-auto-start: string # Generates auto-start for the specified shell
  --generate-completion: string # Generates completion for the specified shell
  --help(-h) # Print help information
]

