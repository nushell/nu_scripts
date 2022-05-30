# Display the help output
extern "rc-status" [
	--help(-h)					# Display the help output
	--all(-a)					# Show services from all run levels
	--format(-f)					# format status to be parsable
	--list(-l)					# Show list of run levels
	--runlevel(-r)					# Show the name of the current runlevel
	--manual(-m)					# Show manually started services
	...args
]