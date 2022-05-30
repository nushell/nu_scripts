# Run COMMAND in the foreground
extern "timeout" [
	--foreground					# Run COMMAND in the foreground
	--signal(-s)					# Specify the signal to be sent
	--preserve-status					# Exit with same status as COMMAND
	...args
]