# Display help and exit
extern "fish_indent" [
	--help(-h)					# Display help and exit
	--version(-v)					# Display version and exit
	--no-indent(-i)					# Do not indent output, only reformat into one job per line
	--ansi					# Colorize the output using ANSI escape sequences
	--html					# Output in HTML format
	--write(-w)					# Write to file
	--dump-parse-tree					# Dump information about parsed statements to stderr
	...args
]