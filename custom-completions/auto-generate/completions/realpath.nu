# all components of the path must exist
extern "realpath" [
	--canonicalize-existing(-e)					# all components of the path must exist
	--canonicalize-missing(-m)					# no components of the path need exist
	--logical(-L)					# resolve .. components before symlinks
	--physical(-P)					# resolve symlinks as encountered (default)
	--quiet(-q)					# suppress most error messages
	--no-symlinks(-s)					# dont expand symlinks
	--zero(-z)					# separate output with NUL rather than newline
	--help					# display this help and exit
	--version					# output version information and exit
	...args
]