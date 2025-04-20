# Terminate filenames with a \0 instead of whitespace, ignore quotes and backslash
extern "xargs" [
	--null(-0)					# Terminate filenames with a \0 instead of whitespace, ignore quotes and backslash
	--eof(-e)					# Set the end of file string to eof-str
	--help					# Display help and exit
	--replace(-i)					# Replace replace-str in the initial arguments with names from standard input
	--max-lines(-l)					# Use at most max-lines nonblank input lines per command line
	--interactive(-p)					# Prompt the user before running each command line
	--no-run-if-empty(-r)					# If the standard input does not contain any nonblanks, do not run the command
	--verbose(-t)					# Print the command line on the standard error output before executing it
	--version					# Display version and exit
	--exit(-x)					# Exit if the size is exceeded
	...args
]