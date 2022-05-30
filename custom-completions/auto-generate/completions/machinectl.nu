# 
extern "machinectl" [

	...args
]

# List running machines
extern "machinectl list" [
	--all(-a)					# Also show machines starting with a '.'
	...args
]

# List startable machine images
extern "machinectl list-images" [
	--all(-a)					# Also show machines starting with a '.'
	...args
]

# Show information about machine
extern "machinectl status" [
	--full(-l)					# Do not ellipsize process tree entries
	...args
]

# Show properties of machines
extern "machinectl show" [
	--all(-a)					# Show all properties, even if not set
	...args
]

# Start machine
extern "machinectl start" [

	...args
]

# Login to a machine
extern "machinectl login" [

	...args
]

# Enable machine to start at boot
extern "machinectl enable" [

	...args
]

# Disable machine from starting at boot
extern "machinectl disable" [

	...args
]

# Poweroff machine
extern "machinectl poweroff" [

	...args
]

# Reboot machine
extern "machinectl reboot" [

	...args
]

# Terminate machine (without shutting down)
extern "machinectl terminate" [

	...args
]

# Send signal to process in a machine
extern "machinectl kill" [

	...args
]

# Bind-mount a directory to a machine
extern "machinectl bind" [
	--mkdir					# Create destination directory
	--read-only					# Apply read-only mount
	...args
]

# Copy file or directory to a machine
extern "machinectl copy-to" [

	...args
]

# Copy file or directory from a machine
extern "machinectl copy-from" [

	...args
]

# Open a shell on a machine
extern "machinectl shell" [

	...args
]

# Show information about machine images (human-readable)
extern "machinectl image-status" [

	...args
]

# Show properties of machine images (machine-readable)
extern "machinectl show-image" [

	...args
]

# Clone a machine image
extern "machinectl clone" [

	...args
]

# Rename a machine image
extern "machinectl rename" [

	...args
]

# Mark or unmark machine image as read-only
extern "machinectl read-only" [

	...args
]

# Remove machine images
extern "machinectl remove" [

	...args
]

# Set size limit for machine image
extern "machinectl set-limit" [

	...args
]

# Download a .tar container image
extern "machinectl pull-tar" [

	...args
]

# Download a .raw container image
extern "machinectl pull-raw" [

	...args
]

# Download a .dkr container image
extern "machinectl pull-dkr" [

	...args
]

# Import a .tar container image
extern "machinectl import-tar" [

	...args
]

# Import a .raw container image
extern "machinectl import-raw" [

	...args
]

# Export a .tar container image
extern "machinectl export-tar" [
	--format					# Specify compression format
	...args
]

# Export a .raw container image
extern "machinectl export-raw" [
	--format					# Specify compression format
	...args
]

# Specify compression format
extern "machinectl uncompressed xz gzip bzip2" [

	...args
]

# Show running downloads, imports and exports
extern "machinectl list-transfers" [

	...args
]

# Abort running downloads, imports or exports
extern "machinectl cancel-transfers" [

	...args
]

# 
extern "machinectl yes no" [

	...args
]