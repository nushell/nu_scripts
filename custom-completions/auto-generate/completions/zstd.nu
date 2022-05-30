# Compress (default)
extern "zstd" [
	--compress(-z)					# Compress (default)
	--uncompress(-d)					# Decompress
	--test(-t)					# Test the integrity
	--list(-l)					# List information about .zst file(s)
	--fast					# Ultra-fast compression
	--ultra					# Enable compression level beyond 19
	--long					# Enable long distance matching with specified windowLog
	--threads=0					# Compress using as many threads as there are CPU cores on the system
	--single-thread					# Single-thread mode
	--adapt					# Dynamically adapt compression level to I/O conditions
	--stream-size					# Optimize compression parameters for streaming input of specified bytes
	--size-hint					# Optimize compression parameters for streaming input of approximately this size
	--rsyncable					# Compress using a rsync-friendly method
	--no-dictID					# Do not write dictID into header
	--force(-f)					# Overwrite without prompting
	--stdout(-c)					# Force write to stdout
	--sparse					# Enable sparse mode
	--no-sparse					# Disable sparse mode
	--rm					# Remove input file(s) after de/compression
	--keep(-k)					# Keep input file(s) (default)
	--filelist					# Read a list of files
	--output-dir-flat					# Specify a directory to output all files
	--help(-h)					# Show help
	--version(-V)					# Show version
	--verbose(-v)					# Be verbose
	--quiet(-q)					# Suppress warnings
	--no-progress					# Do not show the progress bar
	--no-check					# Disable integrity check
	...args
]