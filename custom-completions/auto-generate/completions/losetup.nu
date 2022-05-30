# List all used devices
extern "losetup" [
	--all(-a)					# List all used devices
	--detach-all(-D)					# Detach all used devices
	--find(-f)					# Find first unused device
	--nooverlap(-L)					# Avoid possible conflict between devices
	--partscan(-P)					# Create a partitioned loop device
	--read-only(-r)					# Set up a read-only loop device
	--show					# Print device name after setup
	--verbose(-v)					# Verbose mode
	--json(-J)					# Use JSON --list output format
	--list(-l)					# List info about all or specified
	--noheadings(-n)					# Don't print headings for --list output
	--output-all					# Output all columns
	--raw					# Use raw --list output format
	--help(-h)					# Display help
	--version(-V)					# Display version
	...args
]