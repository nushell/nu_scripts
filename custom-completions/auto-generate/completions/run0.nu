# 
extern "run0" [
	--help(-h)					# Show help
	--version(-V)					# Show version
	--user(-u)					# Switches to the specified user instead of root
	--group(-g)					# Switches to the specified group instead of root
	--no-ask-password					# Do not query the user for authentication for privileged operations
	--machine					# Execute operation on a local container
	--slice					# Make the new .service unit part of the specified slice, instead of user.slice.
	--slice-inherit					# Make the new .service unit part of the slice the run0 itself has been invoked in
	--nice					# Runs the invoked session with the specified nice level
	--chdir(-D)					# Set working directory
	--pty					# Request allocation of a pseudo TTY for stdio
	--pipe					# Request redirect pipe for stdio
	...args
]