# Compress
extern "xz" [
	--compress(-z)					# Compress
	--uncompress(-d)					# Decompress
	--test(-t)					# Test the integrity of compressed files
	--list(-l)					# Print information about compressed files
	--keep(-k)					# Dont delete the input files
	--force(-f)
	--to-stdout(-c)					# Write to stdout instead of file
	--single-stream					# Decompress only the first .xz stream
	--no-sparse					# Disable creation of sparse files
	--suffix(-S)					# Use SUFFIX as the suffix for target file
	--ignore-check					# Dont verify the integrity check
	--extreme(-e)					# Use slower variant
	--fast					# Alias of -0
	--best					# Alias of -9
	--memory(-M)					# Set a memory usage for compression/decompression
	--no-adjust					# Display error and exit if exceed memory usage limit
	--delta					# Add Delta filter to filter chain
	--quiet(-q)					# Suppress warnings/notices
	--verbose(-v)					# Be verbose
	--no-warn(-Q)					# Dont set the exit status to 2
	--robot					# Print messages in a machine-parsable format
	--info-memory					# Display memory informations (physical, usage limits)
	--help(-h)					# Display help
	--long-help(-H)					# Display long help
	--version(-V)					# Display version
	...args
]