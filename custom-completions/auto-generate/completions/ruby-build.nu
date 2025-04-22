# Do not remove source tree after installation
extern "ruby-build" [
	--keep(-k)					# Do not remove source tree after installation
	--verbose(-v)					# Verbose mode: print compilation status to stdout
	--definitions					# List all built-in definitions
	--help(-h)					# Display help information
	...args
]