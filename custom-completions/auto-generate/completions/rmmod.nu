# Prints the help text
extern "rmmod" [
	--help(-h)					# Prints the help text
	--syslog(-s)					# Send errors to syslog instead of standard error
	--verbose(-v)					# Print messages about what the program is doing
	--version(-V)					# Show version of program and exit
	--force(-f)					# With this option, you can remove modules which are being used, or which are not designed to be removed, or have been marked as unsafe
	...args
]