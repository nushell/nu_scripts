# Compress to stdout
extern "bzip2" [
	--stdout(-c)					# Compress to stdout
	--compress(-z)					# Compress file
	--test(-t)					# Check integrity
	--force(-f)					# Overwrite
	--keep(-k)					# Do not overwrite
	--small(-s)					# Reduce memory usage
	--quiet(-q)					# Suppress errors
	--verbose(-v)					# Print compression ratios
	--license(-L)					# Print license
	--version(-V)					# Display version and exit
	--fast(-1)					# Small block size
	--best(-9)					# Large block size
	...args
]