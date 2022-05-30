# 
extern "unzstd" [
	--test(-t)					# Test the integrity
	--list(-l)					# List information about .zst file(s)
	--long					# Enable long distance matching with specified windowLog
	--single-thread					# Single-thread mode
	--force(-f)					# Overwrite without prompting
	--stdout(-c)					# Force write to stdout
	--sparse					# Enable sparse mode
	--no-sparse					# Disable sparse mode
	--rm					# Remove input file(s) after decompression
	--keep(-k)					# Keep input file(s) (default)
	--filelist					# Read a list of files
	--output-dir-flat					# Specify a directory to output all files
	--help(-h)					# Show help
	--version(-V)					# Show version
	--verbose(-v)					# Be verbose
	--quiet(-q)					# Suppress warnings
	--no-progress					# Do not show the progress bar
	...args
]