# Ignore errors from non-empty directories
extern "rmdir" [
	--ignore-fail-on-non-empty					# Ignore errors from non-empty directories
	--parents(-p)					# Remove each component of path
	--verbose(-v)					# Verbose mode
	--help					# Display help and exit
	--version					# Display version and exit
	...args
]