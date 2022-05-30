# Display version and exit
extern "icdiff" [
	--version					# Display version and exit
	--help(-h)					# Display help and exit
	--cols					# Specify the width of the screen
	--encoding					# Specify file encoding
	--exclude-lines(-E)					# Ignore lines that match this regex
	--head					# Consider only the first N lines of each file
	--highlight(-H)					# Use the background instead of foreground color for diff
	--label(-L)					# Override file label. Use twice for both files
	--line-numbers(-N)					# Show line numbers
	--no-bold					# Use non-bold colors
	--no-headers					# Don't show file labels
	--output-encoding					# Specify output encoding
	--recursive(-r)					# Recursive search
	--report-identical-files(-s)					# Report when two files are same
	--show-all-spaces					# Color non-matchining whitespace changes
	--tabsize					# Tab stop spacing
	--numlines(-U)					# Print N lines of sourrounding context
	--whole-file(-W)					# Show the whole file instead of just changings
	--strip-trailing-cr					# Strip trailing carriage return at the end of an input line
	--color-map					# Specify color map
	...args
]