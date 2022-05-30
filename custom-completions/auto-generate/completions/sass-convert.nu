# Convert a file to its own syntax
extern "sass-convert" [
	--in-place(-i)					# Convert a file to its own syntax
	--recursive(-R)					# Convert all the files in a directory
	--help(-h)					# Show help message
	--version(-v)					# Print the Sass version
	--dasherize					# Convert underscores to dashes
	--old					# Output the old-style ':prop val' property syntax
	--stdin(-s)					# Read input from standard input instead of an input file
	--unix-newlines					# Use Unix-style newlines in written files
	--no-cache(-C)					# Don't cache to sassc files
	--trace					# Show a full Ruby stack trace on error
	...args
]