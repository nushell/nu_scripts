# Display help and exit
extern "apt-rdepends" [
	--help					# Display help and exit
	--build-depends(-b)					# Show build dependencies
	--dotty(-d)					# Generate a dotty graph
	--print-state(-p)					# Show state of dependencies
	--reverse(-r)					# List packages depending on
	--man					# Display man page
	--version					# Display version and exit
	...args
]