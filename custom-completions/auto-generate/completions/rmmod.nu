# Prints the help text
extern "rmmod" [
	--help(-h)					# Prints the help text
	--syslog(-s)					# Send errors to syslog instead of standard error
	--verbose(-v)					# Print messages about what the program is doing
	--version(-V)					# Show version of program and exit
	--force(-f)					# remove being used, unsafe or not-for-removal modules
	...args
]