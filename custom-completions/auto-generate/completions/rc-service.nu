# Tests if the service exists or not
extern "rc-service" [
	--exists(-e)					# Tests if the service exists or not
	--list(-l)					# List all available services
	--help(-h)					# Display the help output
	--nocolor(-C)					# Disable color output
	--version(-V)					# Display software version
	--verbose(-v)					# Run verbosely
	--quiet(-q)					# Run quietly (Does not affect errors)
	...args
]