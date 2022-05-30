# 
extern "unlz4" [
	--test(-t)					# Test the integrity
	--list					# List information about .lz4 file(s)
	--force(-f)					# Overwrite without prompting
	--to-stdout(-c)					# Force write to stdout
	--multiple(-m)					# Multiple input files
	--sparse					# Enable sparse mode
	--no-sparse					# Disable sparse mode
	--verbose(-v)					# Be verbose
	--quiet(-q)					# Suppress warnings
	--help(-h)					# Show help
	--version(-V)					# Show version
	--keep(-k)					# Keep input file(s) (default)
	--rm					# Remove input file(s) after decompression
	...args
]