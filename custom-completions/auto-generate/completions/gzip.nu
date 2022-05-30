# Compress to stdout
extern "gzip" [
	--stdout(-c)					# Compress to stdout
	--decompress(-d)
	--force(-f)					# Overwrite
	--help(-h)					# Display help and exit
	--list(-l)					# List compression information
	--license(-L)					# Print license
	--no-name(-n)					# Do not save/restore filename
	--name(-N)					# Save/restore filename
	--quiet(-q)					# Suppress warnings
	--recursive(-r)					# Recurse directories
	--test(-t)					# Check integrity
	--verbose(-v)					# Display compression ratios
	--version(-V)					# Display version and exit
	--fast(-1)					# Use fast setting
	--best(-9)					# Use high compression setting
	...args
]