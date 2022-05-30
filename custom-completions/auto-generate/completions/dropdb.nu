# Show the commands being sent to the server
extern "dropdb" [
	--echo(-e)					# Show the commands being sent to the server
	--interactive(-i)					# Prompt before deleting anything
	--version(-V)					# Output version information, then exit
	--if-exists					# Don't report error if database doesn't exist
	--help(-?)					# Show help, then exit
	--no-password(-w)					# Never prompt for password
	--password(-W)					# Force password prompt
	...args
]