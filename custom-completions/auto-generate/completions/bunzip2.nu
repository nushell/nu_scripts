# Decompress to stdout
extern "bunzip2" [
	--stdout(-c)					# Decompress to stdout
	--force(-f)					# Overwrite
	--keep(-k)					# Do not overwrite
	--small(-s)					# Reduce memory usage
	--verbose(-v)					# Print compression ratios
	--license(-L)					# Print license
	--version(-V)					# Display version and exit
	...args
]