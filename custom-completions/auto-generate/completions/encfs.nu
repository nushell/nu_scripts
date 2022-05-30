# Unmount when idle for specified MINUTES
extern "encfs" [
	--idle(-i)					# Unmount when idle for specified MINUTES
	--verbose(-v)					# Verbose messages when run foreground
	--fuse-debug(-d)					# Enables debugging within the FUSE library
	--forcedecode					# Return data even from corrupted files
	--public					# Make files public to all other users
	--ondemand					# Mount the filesystem on-demand
	--reverse					# Produce encrypted view of plain files
	--standard					# Use standard options when creating filesystem
	--no-default-flags					# Don't use the default FUSE flags
	--extpass					# Get password from an external program
	--stdinpass(-S)					# Read password from standard input
	--anykey					# Turn off key validation checking
	...args
]