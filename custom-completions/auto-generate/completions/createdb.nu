# Show the commands being sent to the server
extern "createdb" [
	--echo(-e)					# Show the commands being sent to the server
	--version(-V)					# Output version information, then exit
	--help(-?)					# Show help, then exit
	--no-password(-w)					# Never prompt for password
	--password(-W)					# Force password prompt
	...args
]