# Start one or more units
extern "systemctl start" [
	--type(-t)					# List of unit types
	--state					# List of unit states
	--all(-a)					# Show all units or properties
	--recursive(-r)					# Show also units of local containers
	--reverse					# Show reverse dependencies between units
	--after					# Show units ordered before specified unit
	--before					# Show units ordered after specified unit
	--full(-l)					# Do not ellipsize anything
	--show-types					# Show the type of the socket
	--job-mode					# How to deal with queued jobs
	--ignore-inhibitors(-i)					# Ignore inhibitor locks on shutdown or sleep
	--quiet(-q)					# Suppress output to STDOUT
	--no-block					# Do not wait for the requested operation to finish
	--no-legend					# Do not print header and footer
	--user					# Talk to the service manager of the calling user
	--system					# Talk to the service manager of the system.
	--failed					# List units in failed state
	--global					# Enable or disable for all users
	--no-wall					# Do not send wall message before halt
	--no-reload					# Do not reload daemon configuration
	--no-ask-password					# Disable asking for password
	--kill-who					# Send signal to which process
	--signal(-s)					# Which signal to send
	--force(-f)					# Overwrite conflicting existing symlinks
	--runtime					# Make changes only temporarily
	--output(-o)					# Control journal formatting
	--plain					# list-dependencies flat, not as tree
	--help(-h)					# Print a short help and exit
	--version					# Print a short version and exit
	--no-pager					# Do not pipe output into a pager
	...args
]

# Stop one or more units
extern "systemctl stop" [
	--type(-t)					# List of unit types
	--state					# List of unit states
	--all(-a)					# Show all units or properties
	--recursive(-r)					# Show also units of local containers
	--reverse					# Show reverse dependencies between units
	--after					# Show units ordered before specified unit
	--before					# Show units ordered after specified unit
	--full(-l)					# Do not ellipsize anything
	--show-types					# Show the type of the socket
	--job-mode					# How to deal with queued jobs
	--ignore-inhibitors(-i)					# Ignore inhibitor locks on shutdown or sleep
	--quiet(-q)					# Suppress output to STDOUT
	--no-block					# Do not wait for the requested operation to finish
	--no-legend					# Do not print header and footer
	--user					# Talk to the service manager of the calling user
	--system					# Talk to the service manager of the system.
	--failed					# List units in failed state
	--global					# Enable or disable for all users
	--no-wall					# Do not send wall message before halt
	--no-reload					# Do not reload daemon configuration
	--no-ask-password					# Disable asking for password
	--kill-who					# Send signal to which process
	--signal(-s)					# Which signal to send
	--force(-f)					# Overwrite conflicting existing symlinks
	--runtime					# Make changes only temporarily
	--output(-o)					# Control journal formatting
	--plain					# list-dependencies flat, not as tree
	--help(-h)					# Print a short help and exit
	--version					# Print a short version and exit
	--no-pager					# Do not pipe output into a pager
	...args
]

# Restart one or more units
extern "systemctl restart" [
	--type(-t)					# List of unit types
	--state					# List of unit states
	--all(-a)					# Show all units or properties
	--recursive(-r)					# Show also units of local containers
	--reverse					# Show reverse dependencies between units
	--after					# Show units ordered before specified unit
	--before					# Show units ordered after specified unit
	--full(-l)					# Do not ellipsize anything
	--show-types					# Show the type of the socket
	--job-mode					# How to deal with queued jobs
	--ignore-inhibitors(-i)					# Ignore inhibitor locks on shutdown or sleep
	--quiet(-q)					# Suppress output to STDOUT
	--no-block					# Do not wait for the requested operation to finish
	--no-legend					# Do not print header and footer
	--user					# Talk to the service manager of the calling user
	--system					# Talk to the service manager of the system.
	--failed					# List units in failed state
	--global					# Enable or disable for all users
	--no-wall					# Do not send wall message before halt
	--no-reload					# Do not reload daemon configuration
	--no-ask-password					# Disable asking for password
	--kill-who					# Send signal to which process
	--signal(-s)					# Which signal to send
	--force(-f)					# Overwrite conflicting existing symlinks
	--runtime					# Make changes only temporarily
	--output(-o)					# Control journal formatting
	--plain					# list-dependencies flat, not as tree
	--help(-h)					# Print a short help and exit
	--version					# Print a short version and exit
	--no-pager					# Do not pipe output into a pager
	...args
]

# Reload units if supported or restart them
extern "systemctl reload-or-restart" [
	--type(-t)					# List of unit types
	--state					# List of unit states
	--all(-a)					# Show all units or properties
	--recursive(-r)					# Show also units of local containers
	--reverse					# Show reverse dependencies between units
	--after					# Show units ordered before specified unit
	--before					# Show units ordered after specified unit
	--full(-l)					# Do not ellipsize anything
	--show-types					# Show the type of the socket
	--job-mode					# How to deal with queued jobs
	--ignore-inhibitors(-i)					# Ignore inhibitor locks on shutdown or sleep
	--quiet(-q)					# Suppress output to STDOUT
	--no-block					# Do not wait for the requested operation to finish
	--no-legend					# Do not print header and footer
	--user					# Talk to the service manager of the calling user
	--system					# Talk to the service manager of the system.
	--failed					# List units in failed state
	--global					# Enable or disable for all users
	--no-wall					# Do not send wall message before halt
	--no-reload					# Do not reload daemon configuration
	--no-ask-password					# Disable asking for password
	--kill-who					# Send signal to which process
	--signal(-s)					# Which signal to send
	--force(-f)					# Overwrite conflicting existing symlinks
	--runtime					# Make changes only temporarily
	--output(-o)					# Control journal formatting
	--plain					# list-dependencies flat, not as tree
	--help(-h)					# Print a short help and exit
	--version					# Print a short version and exit
	--no-pager					# Do not pipe output into a pager
	...args
]

# Reload units if supported or restart them, if running
extern "systemctl try-reload-or-restart" [
	--type(-t)					# List of unit types
	--state					# List of unit states
	--all(-a)					# Show all units or properties
	--recursive(-r)					# Show also units of local containers
	--reverse					# Show reverse dependencies between units
	--after					# Show units ordered before specified unit
	--before					# Show units ordered after specified unit
	--full(-l)					# Do not ellipsize anything
	--show-types					# Show the type of the socket
	--job-mode					# How to deal with queued jobs
	--ignore-inhibitors(-i)					# Ignore inhibitor locks on shutdown or sleep
	--quiet(-q)					# Suppress output to STDOUT
	--no-block					# Do not wait for the requested operation to finish
	--no-legend					# Do not print header and footer
	--user					# Talk to the service manager of the calling user
	--system					# Talk to the service manager of the system.
	--failed					# List units in failed state
	--global					# Enable or disable for all users
	--no-wall					# Do not send wall message before halt
	--no-reload					# Do not reload daemon configuration
	--no-ask-password					# Disable asking for password
	--kill-who					# Send signal to which process
	--signal(-s)					# Which signal to send
	--force(-f)					# Overwrite conflicting existing symlinks
	--runtime					# Make changes only temporarily
	--output(-o)					# Control journal formatting
	--plain					# list-dependencies flat, not as tree
	--help(-h)					# Print a short help and exit
	--version					# Print a short version and exit
	--no-pager					# Do not pipe output into a pager
	...args
]

# Runtime status about one or more units
extern "systemctl status" [
	--type(-t)					# List of unit types
	--state					# List of unit states
	--all(-a)					# Show all units or properties
	--recursive(-r)					# Show also units of local containers
	--reverse					# Show reverse dependencies between units
	--after					# Show units ordered before specified unit
	--before					# Show units ordered after specified unit
	--full(-l)					# Do not ellipsize anything
	--show-types					# Show the type of the socket
	--job-mode					# How to deal with queued jobs
	--ignore-inhibitors(-i)					# Ignore inhibitor locks on shutdown or sleep
	--quiet(-q)					# Suppress output to STDOUT
	--no-block					# Do not wait for the requested operation to finish
	--no-legend					# Do not print header and footer
	--user					# Talk to the service manager of the calling user
	--system					# Talk to the service manager of the system.
	--failed					# List units in failed state
	--global					# Enable or disable for all users
	--no-wall					# Do not send wall message before halt
	--no-reload					# Do not reload daemon configuration
	--no-ask-password					# Disable asking for password
	--kill-who					# Send signal to which process
	--signal(-s)					# Which signal to send
	--force(-f)					# Overwrite conflicting existing symlinks
	--runtime					# Make changes only temporarily
	--output(-o)					# Control journal formatting
	--plain					# list-dependencies flat, not as tree
	--help(-h)					# Print a short help and exit
	--version					# Print a short version and exit
	--no-pager					# Do not pipe output into a pager
	...args
]

# Enable one or more units
extern "systemctl enable" [
	--type(-t)					# List of unit types
	--state					# List of unit states
	--all(-a)					# Show all units or properties
	--recursive(-r)					# Show also units of local containers
	--reverse					# Show reverse dependencies between units
	--after					# Show units ordered before specified unit
	--before					# Show units ordered after specified unit
	--full(-l)					# Do not ellipsize anything
	--show-types					# Show the type of the socket
	--job-mode					# How to deal with queued jobs
	--ignore-inhibitors(-i)					# Ignore inhibitor locks on shutdown or sleep
	--quiet(-q)					# Suppress output to STDOUT
	--no-block					# Do not wait for the requested operation to finish
	--no-legend					# Do not print header and footer
	--user					# Talk to the service manager of the calling user
	--system					# Talk to the service manager of the system.
	--failed					# List units in failed state
	--global					# Enable or disable for all users
	--no-wall					# Do not send wall message before halt
	--no-reload					# Do not reload daemon configuration
	--no-ask-password					# Disable asking for password
	--kill-who					# Send signal to which process
	--signal(-s)					# Which signal to send
	--force(-f)					# Overwrite conflicting existing symlinks
	--runtime					# Make changes only temporarily
	--output(-o)					# Control journal formatting
	--plain					# list-dependencies flat, not as tree
	--help(-h)					# Print a short help and exit
	--version					# Print a short version and exit
	--no-pager					# Do not pipe output into a pager
	...args
]

# Disable one or more units
extern "systemctl disable" [
	--type(-t)					# List of unit types
	--state					# List of unit states
	--all(-a)					# Show all units or properties
	--recursive(-r)					# Show also units of local containers
	--reverse					# Show reverse dependencies between units
	--after					# Show units ordered before specified unit
	--before					# Show units ordered after specified unit
	--full(-l)					# Do not ellipsize anything
	--show-types					# Show the type of the socket
	--job-mode					# How to deal with queued jobs
	--ignore-inhibitors(-i)					# Ignore inhibitor locks on shutdown or sleep
	--quiet(-q)					# Suppress output to STDOUT
	--no-block					# Do not wait for the requested operation to finish
	--no-legend					# Do not print header and footer
	--user					# Talk to the service manager of the calling user
	--system					# Talk to the service manager of the system.
	--failed					# List units in failed state
	--global					# Enable or disable for all users
	--no-wall					# Do not send wall message before halt
	--no-reload					# Do not reload daemon configuration
	--no-ask-password					# Disable asking for password
	--kill-who					# Send signal to which process
	--signal(-s)					# Which signal to send
	--force(-f)					# Overwrite conflicting existing symlinks
	--runtime					# Make changes only temporarily
	--output(-o)					# Control journal formatting
	--plain					# list-dependencies flat, not as tree
	--help(-h)					# Print a short help and exit
	--version					# Print a short version and exit
	--no-pager					# Do not pipe output into a pager
	...args
]

# Start a unit and dependencies and disable all others
extern "systemctl isolate" [
	--type(-t)					# List of unit types
	--state					# List of unit states
	--all(-a)					# Show all units or properties
	--recursive(-r)					# Show also units of local containers
	--reverse					# Show reverse dependencies between units
	--after					# Show units ordered before specified unit
	--before					# Show units ordered after specified unit
	--full(-l)					# Do not ellipsize anything
	--show-types					# Show the type of the socket
	--job-mode					# How to deal with queued jobs
	--ignore-inhibitors(-i)					# Ignore inhibitor locks on shutdown or sleep
	--quiet(-q)					# Suppress output to STDOUT
	--no-block					# Do not wait for the requested operation to finish
	--no-legend					# Do not print header and footer
	--user					# Talk to the service manager of the calling user
	--system					# Talk to the service manager of the system.
	--failed					# List units in failed state
	--global					# Enable or disable for all users
	--no-wall					# Do not send wall message before halt
	--no-reload					# Do not reload daemon configuration
	--no-ask-password					# Disable asking for password
	--kill-who					# Send signal to which process
	--signal(-s)					# Which signal to send
	--force(-f)					# Overwrite conflicting existing symlinks
	--runtime					# Make changes only temporarily
	--output(-o)					# Control journal formatting
	--plain					# list-dependencies flat, not as tree
	--help(-h)					# Print a short help and exit
	--version					# Print a short version and exit
	--no-pager					# Do not pipe output into a pager
	...args
]

# Set the default target to boot into
extern "systemctl set-default" [
	--type(-t)					# List of unit types
	--state					# List of unit states
	--all(-a)					# Show all units or properties
	--recursive(-r)					# Show also units of local containers
	--reverse					# Show reverse dependencies between units
	--after					# Show units ordered before specified unit
	--before					# Show units ordered after specified unit
	--full(-l)					# Do not ellipsize anything
	--show-types					# Show the type of the socket
	--job-mode					# How to deal with queued jobs
	--ignore-inhibitors(-i)					# Ignore inhibitor locks on shutdown or sleep
	--quiet(-q)					# Suppress output to STDOUT
	--no-block					# Do not wait for the requested operation to finish
	--no-legend					# Do not print header and footer
	--user					# Talk to the service manager of the calling user
	--system					# Talk to the service manager of the system.
	--failed					# List units in failed state
	--global					# Enable or disable for all users
	--no-wall					# Do not send wall message before halt
	--no-reload					# Do not reload daemon configuration
	--no-ask-password					# Disable asking for password
	--kill-who					# Send signal to which process
	--signal(-s)					# Which signal to send
	--force(-f)					# Overwrite conflicting existing symlinks
	--runtime					# Make changes only temporarily
	--output(-o)					# Control journal formatting
	--plain					# list-dependencies flat, not as tree
	--help(-h)					# Print a short help and exit
	--version					# Print a short version and exit
	--no-pager					# Do not pipe output into a pager
	...args
]

# Show the default target to boot into
extern "systemctl get-default" [
	--type(-t)					# List of unit types
	--state					# List of unit states
	--all(-a)					# Show all units or properties
	--recursive(-r)					# Show also units of local containers
	--reverse					# Show reverse dependencies between units
	--after					# Show units ordered before specified unit
	--before					# Show units ordered after specified unit
	--full(-l)					# Do not ellipsize anything
	--show-types					# Show the type of the socket
	--job-mode					# How to deal with queued jobs
	--ignore-inhibitors(-i)					# Ignore inhibitor locks on shutdown or sleep
	--quiet(-q)					# Suppress output to STDOUT
	--no-block					# Do not wait for the requested operation to finish
	--no-legend					# Do not print header and footer
	--user					# Talk to the service manager of the calling user
	--system					# Talk to the service manager of the system.
	--failed					# List units in failed state
	--global					# Enable or disable for all users
	--no-wall					# Do not send wall message before halt
	--no-reload					# Do not reload daemon configuration
	--no-ask-password					# Disable asking for password
	--kill-who					# Send signal to which process
	--signal(-s)					# Which signal to send
	--force(-f)					# Overwrite conflicting existing symlinks
	--runtime					# Make changes only temporarily
	--output(-o)					# Control journal formatting
	--plain					# list-dependencies flat, not as tree
	--help(-h)					# Print a short help and exit
	--version					# Print a short version and exit
	--no-pager					# Do not pipe output into a pager
	...args
]

# Sets one or more properties of a unit
extern "systemctl set-property" [
	--type(-t)					# List of unit types
	--state					# List of unit states
	--all(-a)					# Show all units or properties
	--recursive(-r)					# Show also units of local containers
	--reverse					# Show reverse dependencies between units
	--after					# Show units ordered before specified unit
	--before					# Show units ordered after specified unit
	--full(-l)					# Do not ellipsize anything
	--show-types					# Show the type of the socket
	--job-mode					# How to deal with queued jobs
	--ignore-inhibitors(-i)					# Ignore inhibitor locks on shutdown or sleep
	--quiet(-q)					# Suppress output to STDOUT
	--no-block					# Do not wait for the requested operation to finish
	--no-legend					# Do not print header and footer
	--user					# Talk to the service manager of the calling user
	--system					# Talk to the service manager of the system.
	--failed					# List units in failed state
	--global					# Enable or disable for all users
	--no-wall					# Do not send wall message before halt
	--no-reload					# Do not reload daemon configuration
	--no-ask-password					# Disable asking for password
	--kill-who					# Send signal to which process
	--signal(-s)					# Which signal to send
	--force(-f)					# Overwrite conflicting existing symlinks
	--runtime					# Make changes only temporarily
	--output(-o)					# Control journal formatting
	--plain					# list-dependencies flat, not as tree
	--help(-h)					# Print a short help and exit
	--version					# Print a short version and exit
	--no-pager					# Do not pipe output into a pager
	...args
]

# List automount units
extern "systemctl list-automounts" [
	--type(-t)					# List of unit types
	--state					# List of unit states
	--all(-a)					# Show all units or properties
	--recursive(-r)					# Show also units of local containers
	--reverse					# Show reverse dependencies between units
	--after					# Show units ordered before specified unit
	--before					# Show units ordered after specified unit
	--full(-l)					# Do not ellipsize anything
	--show-types					# Show the type of the socket
	--job-mode					# How to deal with queued jobs
	--ignore-inhibitors(-i)					# Ignore inhibitor locks on shutdown or sleep
	--quiet(-q)					# Suppress output to STDOUT
	--no-block					# Do not wait for the requested operation to finish
	--no-legend					# Do not print header and footer
	--user					# Talk to the service manager of the calling user
	--system					# Talk to the service manager of the system.
	--failed					# List units in failed state
	--global					# Enable or disable for all users
	--no-wall					# Do not send wall message before halt
	--no-reload					# Do not reload daemon configuration
	--no-ask-password					# Disable asking for password
	--kill-who					# Send signal to which process
	--signal(-s)					# Which signal to send
	--force(-f)					# Overwrite conflicting existing symlinks
	--runtime					# Make changes only temporarily
	--output(-o)					# Control journal formatting
	--plain					# list-dependencies flat, not as tree
	--help(-h)					# Print a short help and exit
	--version					# Print a short version and exit
	--no-pager					# Do not pipe output into a pager
	...args
]

# Return if system is running/starting/degraded
extern "systemctl is-system-running" [
	--type(-t)					# List of unit types
	--state					# List of unit states
	--all(-a)					# Show all units or properties
	--recursive(-r)					# Show also units of local containers
	--reverse					# Show reverse dependencies between units
	--after					# Show units ordered before specified unit
	--before					# Show units ordered after specified unit
	--full(-l)					# Do not ellipsize anything
	--show-types					# Show the type of the socket
	--job-mode					# How to deal with queued jobs
	--ignore-inhibitors(-i)					# Ignore inhibitor locks on shutdown or sleep
	--quiet(-q)					# Suppress output to STDOUT
	--no-block					# Do not wait for the requested operation to finish
	--no-legend					# Do not print header and footer
	--user					# Talk to the service manager of the calling user
	--system					# Talk to the service manager of the system.
	--failed					# List units in failed state
	--global					# Enable or disable for all users
	--no-wall					# Do not send wall message before halt
	--no-reload					# Do not reload daemon configuration
	--no-ask-password					# Disable asking for password
	--kill-who					# Send signal to which process
	--signal(-s)					# Which signal to send
	--force(-f)					# Overwrite conflicting existing symlinks
	--runtime					# Make changes only temporarily
	--output(-o)					# Control journal formatting
	--plain					# list-dependencies flat, not as tree
	--help(-h)					# Print a short help and exit
	--version					# Print a short version and exit
	--no-pager					# Do not pipe output into a pager
	...args
]

# Freeze units with the cgroup freezer
extern "systemctl freeze" [
	--type(-t)					# List of unit types
	--state					# List of unit states
	--all(-a)					# Show all units or properties
	--recursive(-r)					# Show also units of local containers
	--reverse					# Show reverse dependencies between units
	--after					# Show units ordered before specified unit
	--before					# Show units ordered after specified unit
	--full(-l)					# Do not ellipsize anything
	--show-types					# Show the type of the socket
	--job-mode					# How to deal with queued jobs
	--ignore-inhibitors(-i)					# Ignore inhibitor locks on shutdown or sleep
	--quiet(-q)					# Suppress output to STDOUT
	--no-block					# Do not wait for the requested operation to finish
	--no-legend					# Do not print header and footer
	--user					# Talk to the service manager of the calling user
	--system					# Talk to the service manager of the system.
	--failed					# List units in failed state
	--global					# Enable or disable for all users
	--no-wall					# Do not send wall message before halt
	--no-reload					# Do not reload daemon configuration
	--no-ask-password					# Disable asking for password
	--kill-who					# Send signal to which process
	--signal(-s)					# Which signal to send
	--force(-f)					# Overwrite conflicting existing symlinks
	--runtime					# Make changes only temporarily
	--output(-o)					# Control journal formatting
	--plain					# list-dependencies flat, not as tree
	--help(-h)					# Print a short help and exit
	--version					# Print a short version and exit
	--no-pager					# Do not pipe output into a pager
	...args
]

# Unfreeze frozen units
extern "systemctl thaw" [
	--type(-t)					# List of unit types
	--state					# List of unit states
	--all(-a)					# Show all units or properties
	--recursive(-r)					# Show also units of local containers
	--reverse					# Show reverse dependencies between units
	--after					# Show units ordered before specified unit
	--before					# Show units ordered after specified unit
	--full(-l)					# Do not ellipsize anything
	--show-types					# Show the type of the socket
	--job-mode					# How to deal with queued jobs
	--ignore-inhibitors(-i)					# Ignore inhibitor locks on shutdown or sleep
	--quiet(-q)					# Suppress output to STDOUT
	--no-block					# Do not wait for the requested operation to finish
	--no-legend					# Do not print header and footer
	--user					# Talk to the service manager of the calling user
	--system					# Talk to the service manager of the system.
	--failed					# List units in failed state
	--global					# Enable or disable for all users
	--no-wall					# Do not send wall message before halt
	--no-reload					# Do not reload daemon configuration
	--no-ask-password					# Disable asking for password
	--kill-who					# Send signal to which process
	--signal(-s)					# Which signal to send
	--force(-f)					# Overwrite conflicting existing symlinks
	--runtime					# Make changes only temporarily
	--output(-o)					# Control journal formatting
	--plain					# list-dependencies flat, not as tree
	--help(-h)					# Print a short help and exit
	--version					# Print a short version and exit
	--no-pager					# Do not pipe output into a pager
	...args
]

# Remove config/state/logs for the given units
extern "systemctl clean" [
	--type(-t)					# List of unit types
	--state					# List of unit states
	--all(-a)					# Show all units or properties
	--recursive(-r)					# Show also units of local containers
	--reverse					# Show reverse dependencies between units
	--after					# Show units ordered before specified unit
	--before					# Show units ordered after specified unit
	--full(-l)					# Do not ellipsize anything
	--show-types					# Show the type of the socket
	--job-mode					# How to deal with queued jobs
	--ignore-inhibitors(-i)					# Ignore inhibitor locks on shutdown or sleep
	--quiet(-q)					# Suppress output to STDOUT
	--no-block					# Do not wait for the requested operation to finish
	--no-legend					# Do not print header and footer
	--user					# Talk to the service manager of the calling user
	--system					# Talk to the service manager of the system.
	--failed					# List units in failed state
	--global					# Enable or disable for all users
	--no-wall					# Do not send wall message before halt
	--no-reload					# Do not reload daemon configuration
	--no-ask-password					# Disable asking for password
	--kill-who					# Send signal to which process
	--signal(-s)					# Which signal to send
	--force(-f)					# Overwrite conflicting existing symlinks
	--runtime					# Make changes only temporarily
	--output(-o)					# Control journal formatting
	--plain					# list-dependencies flat, not as tree
	--help(-h)					# Print a short help and exit
	--version					# Print a short version and exit
	--no-pager					# Do not pipe output into a pager
	...args
]

# List of unit types
extern "systemctl" [
	--type(-t)					# List of unit types
	--state					# List of unit states
	--all(-a)					# Show all units or properties
	--recursive(-r)					# Show also units of local containers
	--reverse					# Show reverse dependencies between units
	--after					# Show units ordered before specified unit
	--before					# Show units ordered after specified unit
	--full(-l)					# Do not ellipsize anything
	--show-types					# Show the type of the socket
	--job-mode					# How to deal with queued jobs
	--ignore-inhibitors(-i)					# Ignore inhibitor locks on shutdown or sleep
	--quiet(-q)					# Suppress output to STDOUT
	--no-block					# Do not wait for the requested operation to finish
	--no-legend					# Do not print header and footer
	--user					# Talk to the service manager of the calling user
	--system					# Talk to the service manager of the system.
	--failed					# List units in failed state
	--global					# Enable or disable for all users
	--no-wall					# Do not send wall message before halt
	--no-reload					# Do not reload daemon configuration
	--no-ask-password					# Disable asking for password
	--kill-who					# Send signal to which process
	--signal(-s)					# Which signal to send
	--force(-f)					# Overwrite conflicting existing symlinks
	--runtime					# Make changes only temporarily
	--output(-o)					# Control journal formatting
	--plain					# list-dependencies flat, not as tree
	--help(-h)					# Print a short help and exit
	--version					# Print a short version and exit
	--no-pager					# Do not pipe output into a pager
	...args
]