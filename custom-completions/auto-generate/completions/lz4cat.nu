# 
extern "lz4cat" [
	--test(-t)					# Test the integrity
	--list					# List information about .lz4 file(s)
	--sparse					# Enable sparse mode
	--no-sparse					# Disable sparse mode
	--verbose(-v)					# Be verbose
	--quiet(-q)					# Suppress warnings
	--help(-h)					# Show help
	--version(-V)					# Show version
	...args
]