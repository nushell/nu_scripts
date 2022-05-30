# Beep if command has a non-zero exit
extern "watch" [
	--beep(-b)					# Beep if command has a non-zero exit
	--color(-c)					# Interpret ANSI color sequences
	--differences(-d)					# Highlight changes between updates
	--differences=permanent(-d)					# Highlight changes between updates
	--errexit(-e)					# Exit if command has a non-zero exit
	--chgexit(-g)					# Exit when output from command changes
	--precise(-p)					# Attempt run command in precise intervals
	--no-title(-t)					# Turn off header
	--exec(-x)					# Pass command to exec instead of "sh -c
	--help(-h)					# Display this help and exit
	--version(-v)					# Output version information and exit
	...args
]