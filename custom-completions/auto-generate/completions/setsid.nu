# Set controlling terminal to current one
extern "setsid" [
	--ctty(-c)					# Set controlling terminal to current one
	--wait(-w)					# Wait until program ends and return its exit value
	--version(-V)					# Display version and exit
	--help(-h)					# Display help and exit
	...args
]