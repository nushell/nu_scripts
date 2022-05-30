# Select the configuration file to use
extern "alsactl" [
	--file(-f)					# Select the configuration file to use
	--lock(-l)					# Use a lock file
	--no-lock(-L)					# Do not use a lock file
	--lock-state-file(-O)					# Select the state lock file path
	--runstate(-r)					# Save restore and init state to this file
	--remove(-R)					# Remove runstate file at first
	--env(-E)					# Set environment variable
	--initfile(-i)					# The configuration file for init
	--pid-file(-e)					# The PID file to use
	--background(-b)					# Run the task in background
	--syslog(-s)					# Use syslog for messages
	--sched-idle(-c)					# Set the process scheduling policy to idle (SCHED_IDLE)
	...args
]