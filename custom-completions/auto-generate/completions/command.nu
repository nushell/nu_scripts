# Display help and exit
extern "command" [
	--help(-h)					# Display help and exit
	--all(-a)					# Print all external commands by the given name
	--query(-q)					# Do not print anything, only set exit status
	--search(-v)					# Print the file that would be executed
	...args
]