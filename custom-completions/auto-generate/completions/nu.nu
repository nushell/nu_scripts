# Display help and exit
extern "nu" [
	--help(-h)					# Display help and exit
	--version(-v)					# Display version and exit
	--stdin					# Redirect stdin
	--login(-l)					# Use login shell
	--interactive(-i)					# Use interactive mode
	--testbin					# Run internal test binary and exit
	--commands(-c)					# Run commands and exit
	--config					# Specify config
	--env-config					# Specify environment config
	--execute(-e)					# Run commands and exit and fall in interactive mode
	--threads(-t)					# Thread count for multithreading
	--table-mode(-m)					# Use table mode
	--plugin-config					# Specify plugin signature file
	...args
]