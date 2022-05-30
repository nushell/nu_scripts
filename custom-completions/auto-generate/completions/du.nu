# Write size for all files
extern "du" [
	--all(-a)					# Write size for all files
	--apparent-size					# Print file size, not disk usage
	--block-size(-B)					# Block size
	--bytes(-b)					# Use 1B block size
	--total(-c)					# Produce grand total
	--dereference-args(-D)					# Dereference file symlinks
	--human-readable(-h)					# Human readable sizes
	--si(-H)					# Human readable sizes, powers of 1000
	--count-links(-l)					# Count hard links multiple times
	--dereference(-L)					# Dereference all symlinks
	--separate-dirs(-S)					# Do not include subdirectory size
	--summarize(-s)					# Display only a total for each argument
	--one-file-system(-x)					# Skip other file systems
	--help					# Display help and exit
	--version					# Display version and exit
	...args
]