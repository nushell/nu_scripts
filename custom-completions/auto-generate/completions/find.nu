# Never follow symlinks
extern "find" [
	--help					# Display help and exit
	--version					# Display version and exit
	...args
]

# Maximum recursion depth
extern "find 1 2 3 4 5 6 7 8 9" [
	--help					# Display help and exit
	--version					# Display version and exit
	...args
]

# Specify regular expression type
extern "find emacs posix-awk posix-basic posix-egrep posix-extended" [
	--help					# Display help and exit
	--version					# Display version and exit
	...args
]