# Display the help output
extern "rc-status" [
	--help(-h)					# Display the help output
	--all(-a)					# Show services from all run levels
	--format(-f)					# format status to be parsable
	--list(-l)					# Show list of run levels
	--runlevel(-r)					# Show the name of the current runlevel
	--manual(-m)					# Show manually started services
	--servicelist(-s)					# Show service list
	--supervised(-S)					# Show supervised services
	--unused(-u)					# Show services not assigned to any runlevel
	--version(-v)					# Display software version
	--quiet(-q)					# Run quietly
	--nocolor(-C)					# Disable color output
	--version(-V)					# Display software version
	...args
]