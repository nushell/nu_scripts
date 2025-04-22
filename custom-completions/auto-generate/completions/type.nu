# Display help and exit
extern "type" [
	--help(-h)					# Display help and exit
	--all(-a)					# Print all possible definitions of the specified name
	--no-functions(-f)					# Suppress function and builtin lookup
	--type(-t)					# Print command type
	--path(-p)					# Print path to command, or nothing if name is not a command
	--force-path(-P)					# Print path to command
	--quiet(-q)					# Check if something exists without output
	--short(-s)					# Don't print function definition
	...args
]