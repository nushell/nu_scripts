# Compress (default)
extern "lz4" [
	--compress(-z)					# Compress (default)
	--uncompress(-d)					# Decompress
	--test(-t)					# Test the integrity
	--list					# List information about .lz4 file(s)
	--fast					# Ultra-fast compression
	--best					# Highest compression, same as -12
	--favor-decSpeed					# Generate file(s) optimized for decompression speed
	--force(-f)					# Overwrite without prompting
	--to-stdout(-c)					# Force write to stdout
	--multiple(-m)					# Multiple input files
	--no-frame-crc					# Disable frame checksum
	--content-size					# Header includes original size
	--sparse					# Enable sparse mode
	--no-sparse					# Disable sparse mode
	--verbose(-v)					# Be verbose
	--quiet(-q)					# Suppress warnings
	--help(-h)					# Show help
	--version(-V)					# Show version
	--keep(-k)					# Keep input file(s) (default)
	--rm					# Remove input file(s) after de/compression
	...args
]