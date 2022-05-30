# Display help and exit
extern "fish" [
	--help(-h)					# Display help and exit
	--version(-v)					# Display version and exit
	--no-config(-N)					# Do not read configuration files
	--no-execute(-n)					# Only parse input, do not execute
	--interactive(-i)					# Run in interactive mode
	--login(-l)					# Run as a login shell
	--private(-P)					# Do not persist history
	...args
]