# Display version
extern "xxh64sum" [
	--version(-V)					# Display version
	--little-endian					# Display hashes in little endian
	--help(-h)					# Display help
	--check(-c)					# Check xxHash sums
	--quiet(-q)					# Don't print OK when the checksum match
	--strict					# Exit non-zero if any line is invalid
	--status					# Don't output anything
	--warn(-w)					# Warn about invalid lines
	...args
]