# authour: DWTW

def colorScheme [] {
  [ "default", "default-light", "gruvbox", "gruvbox-light", "nord", "nord-light" ]
}

def widgetType [] {
  [ "cpu", "mem", "net", "proc", "temp", "disk", "bat" ]
}

# Yet another cross-platform graphical process/system monitor.
export extern "btm" [
  --autohide-time                           # Hide time-scale in graphs automatically
  --basic(-b)                               # Use a more basic look
  --battery                                 # Show battery widget
  --case_sensitive(-S)                      # Enables case sensitivity
  --celsius(-c)                             # Sets temp type to celsius
  --color: string@colorScheme               # Use a pre-defined colorscheme
  --config(-C): string                      # Sets the location of the config file
  --current_usage(-u)                        # Set CPU% to current system CPU%
  --default_time_value(-t): int             # Time value for graphs
  --default_widget_count: int               # Sets nth selected widget type to use default widget 
  --default_widget_type: string@widgetType  # Set default select widget
  --disable_advanced_kill                   # Hide advanced options
  --disable_click                           # Disables mouse
  --dot_marker(-m)                          # Uses dot marker for graphs
  --fahrenheit(-f)                          # Sets temp type to fahrenheit
  --group(-g)                               # Groups processes
  --help(-h)                                # Prints help information
  --hide_avg_cpu(-a)                        # Hide average CPU usage
  --hide_table_gap                          # Hides spacing between table headers and entries
  --hide_time                               # Completely hides the time scale 
  --kelvin(-k)                              # Sets temp type to kelvin
  --left-legend(-l)                         # Puts the CPU chart to left 
  --men_as_value                            # Default sort by memory usage
  --network_use_binary_prefix               # Network widget with binary prefixes
  --network_use_bytes                       # Network widget as bytes 
  --network_use_logs                        # Network eidget with logs 
  --process_command                         # Show processes as commands
  --rate(-r): int                           # Sets refresh
  --regex(-R)                               # Enable regex by default 
  --show_table_scroll_position              # Show scroll position 
  --time-delta(-d): int                     # Amount changed when zooming in/out
  --tree(-T)                                # Show processes as tree
  --version(-V)                             # Prints version information 
  --whole-word(-w)                          # Search results match entries query
]
