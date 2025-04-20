# 
extern "machinectl" [
	--help(-h)					# Print a short help and exit
	--version					# Print a short version and exit
	--no-pager					# Do not pipe output into a pager
	--no-legend					# Do not print header and footer
	--all(-a)					# Also show machines starting with a '.'
	--full(-l)					# Do not ellipsize process tree entries
	--all(-a)					# Show all properties, even if not set
	--mkdir					# Create destination directory
	--read-only					# Apply read-only mount
	--format					# Specify compression format
	--force					# Overwrite existing machine image
	...args
]

# List running machines
extern "machinectl list" [
	--help(-h)					# Print a short help and exit
	--version					# Print a short version and exit
	--no-pager					# Do not pipe output into a pager
	--no-legend					# Do not print header and footer
	--all(-a)					# Also show machines starting with a '.'
	--full(-l)					# Do not ellipsize process tree entries
	--all(-a)					# Show all properties, even if not set
	--mkdir					# Create destination directory
	--read-only					# Apply read-only mount
	--format					# Specify compression format
	--force					# Overwrite existing machine image
	...args
]

# List startable machine images
extern "machinectl list-images" [
	--help(-h)					# Print a short help and exit
	--version					# Print a short version and exit
	--no-pager					# Do not pipe output into a pager
	--no-legend					# Do not print header and footer
	--all(-a)					# Also show machines starting with a '.'
	--full(-l)					# Do not ellipsize process tree entries
	--all(-a)					# Show all properties, even if not set
	--mkdir					# Create destination directory
	--read-only					# Apply read-only mount
	--format					# Specify compression format
	--force					# Overwrite existing machine image
	...args
]

# Show information about machine
extern "machinectl status" [
	--help(-h)					# Print a short help and exit
	--version					# Print a short version and exit
	--no-pager					# Do not pipe output into a pager
	--no-legend					# Do not print header and footer
	--all(-a)					# Also show machines starting with a '.'
	--full(-l)					# Do not ellipsize process tree entries
	--all(-a)					# Show all properties, even if not set
	--mkdir					# Create destination directory
	--read-only					# Apply read-only mount
	--format					# Specify compression format
	--force					# Overwrite existing machine image
	...args
]

# Show properties of machines
extern "machinectl show" [
	--help(-h)					# Print a short help and exit
	--version					# Print a short version and exit
	--no-pager					# Do not pipe output into a pager
	--no-legend					# Do not print header and footer
	--all(-a)					# Also show machines starting with a '.'
	--full(-l)					# Do not ellipsize process tree entries
	--all(-a)					# Show all properties, even if not set
	--mkdir					# Create destination directory
	--read-only					# Apply read-only mount
	--format					# Specify compression format
	--force					# Overwrite existing machine image
	...args
]

# Start machine
extern "machinectl start" [
	--help(-h)					# Print a short help and exit
	--version					# Print a short version and exit
	--no-pager					# Do not pipe output into a pager
	--no-legend					# Do not print header and footer
	--all(-a)					# Also show machines starting with a '.'
	--full(-l)					# Do not ellipsize process tree entries
	--all(-a)					# Show all properties, even if not set
	--mkdir					# Create destination directory
	--read-only					# Apply read-only mount
	--format					# Specify compression format
	--force					# Overwrite existing machine image
	...args
]

# Login to a machine
extern "machinectl login" [
	--help(-h)					# Print a short help and exit
	--version					# Print a short version and exit
	--no-pager					# Do not pipe output into a pager
	--no-legend					# Do not print header and footer
	--all(-a)					# Also show machines starting with a '.'
	--full(-l)					# Do not ellipsize process tree entries
	--all(-a)					# Show all properties, even if not set
	--mkdir					# Create destination directory
	--read-only					# Apply read-only mount
	--format					# Specify compression format
	--force					# Overwrite existing machine image
	...args
]

# Enable machine to start at boot
extern "machinectl enable" [
	--help(-h)					# Print a short help and exit
	--version					# Print a short version and exit
	--no-pager					# Do not pipe output into a pager
	--no-legend					# Do not print header and footer
	--all(-a)					# Also show machines starting with a '.'
	--full(-l)					# Do not ellipsize process tree entries
	--all(-a)					# Show all properties, even if not set
	--mkdir					# Create destination directory
	--read-only					# Apply read-only mount
	--format					# Specify compression format
	--force					# Overwrite existing machine image
	...args
]

# Disable machine from starting at boot
extern "machinectl disable" [
	--help(-h)					# Print a short help and exit
	--version					# Print a short version and exit
	--no-pager					# Do not pipe output into a pager
	--no-legend					# Do not print header and footer
	--all(-a)					# Also show machines starting with a '.'
	--full(-l)					# Do not ellipsize process tree entries
	--all(-a)					# Show all properties, even if not set
	--mkdir					# Create destination directory
	--read-only					# Apply read-only mount
	--format					# Specify compression format
	--force					# Overwrite existing machine image
	...args
]

# Poweroff machine
extern "machinectl poweroff" [
	--help(-h)					# Print a short help and exit
	--version					# Print a short version and exit
	--no-pager					# Do not pipe output into a pager
	--no-legend					# Do not print header and footer
	--all(-a)					# Also show machines starting with a '.'
	--full(-l)					# Do not ellipsize process tree entries
	--all(-a)					# Show all properties, even if not set
	--mkdir					# Create destination directory
	--read-only					# Apply read-only mount
	--format					# Specify compression format
	--force					# Overwrite existing machine image
	...args
]

# Reboot machine
extern "machinectl reboot" [
	--help(-h)					# Print a short help and exit
	--version					# Print a short version and exit
	--no-pager					# Do not pipe output into a pager
	--no-legend					# Do not print header and footer
	--all(-a)					# Also show machines starting with a '.'
	--full(-l)					# Do not ellipsize process tree entries
	--all(-a)					# Show all properties, even if not set
	--mkdir					# Create destination directory
	--read-only					# Apply read-only mount
	--format					# Specify compression format
	--force					# Overwrite existing machine image
	...args
]

# Terminate machine (without shutting down)
extern "machinectl terminate" [
	--help(-h)					# Print a short help and exit
	--version					# Print a short version and exit
	--no-pager					# Do not pipe output into a pager
	--no-legend					# Do not print header and footer
	--all(-a)					# Also show machines starting with a '.'
	--full(-l)					# Do not ellipsize process tree entries
	--all(-a)					# Show all properties, even if not set
	--mkdir					# Create destination directory
	--read-only					# Apply read-only mount
	--format					# Specify compression format
	--force					# Overwrite existing machine image
	...args
]

# Send signal to process in a machine
extern "machinectl kill" [
	--help(-h)					# Print a short help and exit
	--version					# Print a short version and exit
	--no-pager					# Do not pipe output into a pager
	--no-legend					# Do not print header and footer
	--all(-a)					# Also show machines starting with a '.'
	--full(-l)					# Do not ellipsize process tree entries
	--all(-a)					# Show all properties, even if not set
	--mkdir					# Create destination directory
	--read-only					# Apply read-only mount
	--format					# Specify compression format
	--force					# Overwrite existing machine image
	...args
]

# Bind-mount a directory to a machine
extern "machinectl bind" [
	--help(-h)					# Print a short help and exit
	--version					# Print a short version and exit
	--no-pager					# Do not pipe output into a pager
	--no-legend					# Do not print header and footer
	--all(-a)					# Also show machines starting with a '.'
	--full(-l)					# Do not ellipsize process tree entries
	--all(-a)					# Show all properties, even if not set
	--mkdir					# Create destination directory
	--read-only					# Apply read-only mount
	--format					# Specify compression format
	--force					# Overwrite existing machine image
	...args
]

# Copy file or directory to a machine
extern "machinectl copy-to" [
	--help(-h)					# Print a short help and exit
	--version					# Print a short version and exit
	--no-pager					# Do not pipe output into a pager
	--no-legend					# Do not print header and footer
	--all(-a)					# Also show machines starting with a '.'
	--full(-l)					# Do not ellipsize process tree entries
	--all(-a)					# Show all properties, even if not set
	--mkdir					# Create destination directory
	--read-only					# Apply read-only mount
	--format					# Specify compression format
	--force					# Overwrite existing machine image
	...args
]

# Copy file or directory from a machine
extern "machinectl copy-from" [
	--help(-h)					# Print a short help and exit
	--version					# Print a short version and exit
	--no-pager					# Do not pipe output into a pager
	--no-legend					# Do not print header and footer
	--all(-a)					# Also show machines starting with a '.'
	--full(-l)					# Do not ellipsize process tree entries
	--all(-a)					# Show all properties, even if not set
	--mkdir					# Create destination directory
	--read-only					# Apply read-only mount
	--format					# Specify compression format
	--force					# Overwrite existing machine image
	...args
]

# Open a shell on a machine
extern "machinectl shell" [
	--help(-h)					# Print a short help and exit
	--version					# Print a short version and exit
	--no-pager					# Do not pipe output into a pager
	--no-legend					# Do not print header and footer
	--all(-a)					# Also show machines starting with a '.'
	--full(-l)					# Do not ellipsize process tree entries
	--all(-a)					# Show all properties, even if not set
	--mkdir					# Create destination directory
	--read-only					# Apply read-only mount
	--format					# Specify compression format
	--force					# Overwrite existing machine image
	...args
]

# Show information about machine images (human-readable)
extern "machinectl image-status" [
	--help(-h)					# Print a short help and exit
	--version					# Print a short version and exit
	--no-pager					# Do not pipe output into a pager
	--no-legend					# Do not print header and footer
	--all(-a)					# Also show machines starting with a '.'
	--full(-l)					# Do not ellipsize process tree entries
	--all(-a)					# Show all properties, even if not set
	--mkdir					# Create destination directory
	--read-only					# Apply read-only mount
	--format					# Specify compression format
	--force					# Overwrite existing machine image
	...args
]

# Show properties of machine images (machine-readable)
extern "machinectl show-image" [
	--help(-h)					# Print a short help and exit
	--version					# Print a short version and exit
	--no-pager					# Do not pipe output into a pager
	--no-legend					# Do not print header and footer
	--all(-a)					# Also show machines starting with a '.'
	--full(-l)					# Do not ellipsize process tree entries
	--all(-a)					# Show all properties, even if not set
	--mkdir					# Create destination directory
	--read-only					# Apply read-only mount
	--format					# Specify compression format
	--force					# Overwrite existing machine image
	...args
]

# Clone a machine image
extern "machinectl clone" [
	--help(-h)					# Print a short help and exit
	--version					# Print a short version and exit
	--no-pager					# Do not pipe output into a pager
	--no-legend					# Do not print header and footer
	--all(-a)					# Also show machines starting with a '.'
	--full(-l)					# Do not ellipsize process tree entries
	--all(-a)					# Show all properties, even if not set
	--mkdir					# Create destination directory
	--read-only					# Apply read-only mount
	--format					# Specify compression format
	--force					# Overwrite existing machine image
	...args
]

# Rename a machine image
extern "machinectl rename" [
	--help(-h)					# Print a short help and exit
	--version					# Print a short version and exit
	--no-pager					# Do not pipe output into a pager
	--no-legend					# Do not print header and footer
	--all(-a)					# Also show machines starting with a '.'
	--full(-l)					# Do not ellipsize process tree entries
	--all(-a)					# Show all properties, even if not set
	--mkdir					# Create destination directory
	--read-only					# Apply read-only mount
	--format					# Specify compression format
	--force					# Overwrite existing machine image
	...args
]

# Mark or unmark machine image as read-only
extern "machinectl read-only" [
	--help(-h)					# Print a short help and exit
	--version					# Print a short version and exit
	--no-pager					# Do not pipe output into a pager
	--no-legend					# Do not print header and footer
	--all(-a)					# Also show machines starting with a '.'
	--full(-l)					# Do not ellipsize process tree entries
	--all(-a)					# Show all properties, even if not set
	--mkdir					# Create destination directory
	--read-only					# Apply read-only mount
	--format					# Specify compression format
	--force					# Overwrite existing machine image
	...args
]

# Remove machine images
extern "machinectl remove" [
	--help(-h)					# Print a short help and exit
	--version					# Print a short version and exit
	--no-pager					# Do not pipe output into a pager
	--no-legend					# Do not print header and footer
	--all(-a)					# Also show machines starting with a '.'
	--full(-l)					# Do not ellipsize process tree entries
	--all(-a)					# Show all properties, even if not set
	--mkdir					# Create destination directory
	--read-only					# Apply read-only mount
	--format					# Specify compression format
	--force					# Overwrite existing machine image
	...args
]

# Set size limit for machine image
extern "machinectl set-limit" [
	--help(-h)					# Print a short help and exit
	--version					# Print a short version and exit
	--no-pager					# Do not pipe output into a pager
	--no-legend					# Do not print header and footer
	--all(-a)					# Also show machines starting with a '.'
	--full(-l)					# Do not ellipsize process tree entries
	--all(-a)					# Show all properties, even if not set
	--mkdir					# Create destination directory
	--read-only					# Apply read-only mount
	--format					# Specify compression format
	--force					# Overwrite existing machine image
	...args
]

# Download a .tar container image
extern "machinectl pull-tar" [
	--help(-h)					# Print a short help and exit
	--version					# Print a short version and exit
	--no-pager					# Do not pipe output into a pager
	--no-legend					# Do not print header and footer
	--all(-a)					# Also show machines starting with a '.'
	--full(-l)					# Do not ellipsize process tree entries
	--all(-a)					# Show all properties, even if not set
	--mkdir					# Create destination directory
	--read-only					# Apply read-only mount
	--format					# Specify compression format
	--force					# Overwrite existing machine image
	...args
]

# Download a .raw container image
extern "machinectl pull-raw" [
	--help(-h)					# Print a short help and exit
	--version					# Print a short version and exit
	--no-pager					# Do not pipe output into a pager
	--no-legend					# Do not print header and footer
	--all(-a)					# Also show machines starting with a '.'
	--full(-l)					# Do not ellipsize process tree entries
	--all(-a)					# Show all properties, even if not set
	--mkdir					# Create destination directory
	--read-only					# Apply read-only mount
	--format					# Specify compression format
	--force					# Overwrite existing machine image
	...args
]

# Download a .dkr container image
extern "machinectl pull-dkr" [
	--help(-h)					# Print a short help and exit
	--version					# Print a short version and exit
	--no-pager					# Do not pipe output into a pager
	--no-legend					# Do not print header and footer
	--all(-a)					# Also show machines starting with a '.'
	--full(-l)					# Do not ellipsize process tree entries
	--all(-a)					# Show all properties, even if not set
	--mkdir					# Create destination directory
	--read-only					# Apply read-only mount
	--format					# Specify compression format
	--force					# Overwrite existing machine image
	...args
]

# Import a .tar container image
extern "machinectl import-tar" [
	--help(-h)					# Print a short help and exit
	--version					# Print a short version and exit
	--no-pager					# Do not pipe output into a pager
	--no-legend					# Do not print header and footer
	--all(-a)					# Also show machines starting with a '.'
	--full(-l)					# Do not ellipsize process tree entries
	--all(-a)					# Show all properties, even if not set
	--mkdir					# Create destination directory
	--read-only					# Apply read-only mount
	--format					# Specify compression format
	--force					# Overwrite existing machine image
	...args
]

# Import a .raw container image
extern "machinectl import-raw" [
	--help(-h)					# Print a short help and exit
	--version					# Print a short version and exit
	--no-pager					# Do not pipe output into a pager
	--no-legend					# Do not print header and footer
	--all(-a)					# Also show machines starting with a '.'
	--full(-l)					# Do not ellipsize process tree entries
	--all(-a)					# Show all properties, even if not set
	--mkdir					# Create destination directory
	--read-only					# Apply read-only mount
	--format					# Specify compression format
	--force					# Overwrite existing machine image
	...args
]

# Export a .tar container image
extern "machinectl export-tar" [
	--help(-h)					# Print a short help and exit
	--version					# Print a short version and exit
	--no-pager					# Do not pipe output into a pager
	--no-legend					# Do not print header and footer
	--all(-a)					# Also show machines starting with a '.'
	--full(-l)					# Do not ellipsize process tree entries
	--all(-a)					# Show all properties, even if not set
	--mkdir					# Create destination directory
	--read-only					# Apply read-only mount
	--format					# Specify compression format
	--force					# Overwrite existing machine image
	...args
]

# Export a .raw container image
extern "machinectl export-raw" [
	--help(-h)					# Print a short help and exit
	--version					# Print a short version and exit
	--no-pager					# Do not pipe output into a pager
	--no-legend					# Do not print header and footer
	--all(-a)					# Also show machines starting with a '.'
	--full(-l)					# Do not ellipsize process tree entries
	--all(-a)					# Show all properties, even if not set
	--mkdir					# Create destination directory
	--read-only					# Apply read-only mount
	--format					# Specify compression format
	--force					# Overwrite existing machine image
	...args
]

# Specify compression format
extern "machinectl uncompressed xz gzip bzip2" [
	--help(-h)					# Print a short help and exit
	--version					# Print a short version and exit
	--no-pager					# Do not pipe output into a pager
	--no-legend					# Do not print header and footer
	--all(-a)					# Also show machines starting with a '.'
	--full(-l)					# Do not ellipsize process tree entries
	--all(-a)					# Show all properties, even if not set
	--mkdir					# Create destination directory
	--read-only					# Apply read-only mount
	--format					# Specify compression format
	--force					# Overwrite existing machine image
	...args
]

# Show running downloads, imports and exports
extern "machinectl list-transfers" [
	--help(-h)					# Print a short help and exit
	--version					# Print a short version and exit
	--no-pager					# Do not pipe output into a pager
	--no-legend					# Do not print header and footer
	--all(-a)					# Also show machines starting with a '.'
	--full(-l)					# Do not ellipsize process tree entries
	--all(-a)					# Show all properties, even if not set
	--mkdir					# Create destination directory
	--read-only					# Apply read-only mount
	--format					# Specify compression format
	--force					# Overwrite existing machine image
	...args
]

# Abort running downloads, imports or exports
extern "machinectl cancel-transfers" [
	--help(-h)					# Print a short help and exit
	--version					# Print a short version and exit
	--no-pager					# Do not pipe output into a pager
	--no-legend					# Do not print header and footer
	--all(-a)					# Also show machines starting with a '.'
	--full(-l)					# Do not ellipsize process tree entries
	--all(-a)					# Show all properties, even if not set
	--mkdir					# Create destination directory
	--read-only					# Apply read-only mount
	--format					# Specify compression format
	--force					# Overwrite existing machine image
	...args
]

# 
extern "machinectl yes no" [
	--help(-h)					# Print a short help and exit
	--version					# Print a short version and exit
	--no-pager					# Do not pipe output into a pager
	--no-legend					# Do not print header and footer
	--all(-a)					# Also show machines starting with a '.'
	--full(-l)					# Do not ellipsize process tree entries
	--all(-a)					# Show all properties, even if not set
	--mkdir					# Create destination directory
	--read-only					# Apply read-only mount
	--format					# Specify compression format
	--force					# Overwrite existing machine image
	...args
]