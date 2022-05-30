# 
extern "zstdcat" [
	--test(-t)					# Test the integrity
	--list(-l)					# List information about .zst file(s)
	--long					# Enable long distance matching with specified windowLog
	--single-thread					# Single-thread mode
	--sparse					# Enable sparse mode
	--no-sparse					# Disable sparse mode
	--filelist					# Read a list of files
	--help(-h)					# Show help
	--version(-V)					# Show version
	--verbose(-v)					# Be verbose
	--quiet(-q)					# Suppress warnings
	--no-progress					# Do not show the progress bar
	...args
]