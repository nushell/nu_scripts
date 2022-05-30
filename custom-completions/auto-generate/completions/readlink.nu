# Canonicalize, follow symlinks, last can be missing
extern "readlink" [
	--canonicalize(-f)					# Canonicalize, follow symlinks, last can be missing
	--canonicalize-existing(-e)					# Canonicalize, follow symlinks, none can be missing
	--canonicalize-missing(-m)					# Canonicalize, follow symlinks, all can be missing
	--no-newline(-n)					# Do not output the trailing newline
	--silent(-s)					# Suppress most error messages
	--verbose(-v)					# Report error messages
	--help					# Display this help and exit
	--version					# Output version information and exit
	...args
]