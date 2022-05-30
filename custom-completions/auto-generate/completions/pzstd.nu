# Decompress
extern "pzstd" [
	--decompress(-d)					# Decompress
	--test(-t)					# Test the integrity
	--ultra					# Enable compression level beyond 19
	--force(-f)					# Overwrite without prompting
	--stdout(-c)					# Force write to stdout
	--rm					# Remove input file(s) after de/compression
	--keep(-k)					# Keep input file(s) (default)
	--help(-h)					# Show help
	--version(-V)					# Show version
	--verbose(-v)					# Be verbose
	--quiet(-q)					# Suppress warnings
	--no-check					# Disable integrity check
	...args
]