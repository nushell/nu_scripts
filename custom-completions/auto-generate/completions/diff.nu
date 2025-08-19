# Ignore case differences
extern "diff" [
	--ignore-case(-i)					# Ignore case differences
	--ignore-file-name-case					# Ignore case when comparing file names
	--no-ignore-file-name-case					# Consider case when comparing file names
	--ignore-tab-expansion(-E)					# Ignore changes due to tab expansion
	--ignore-space-change(-b)					# Ignore changes in the amount of white space
	--ignore-all-space(-w)					# Ignore all white space
	--ignore-blank-lines(-B)					# Ignore changes whose lines are all blank
	--text(-a)					# Treat all files as text
	--recursive(-r)					# Recursively compare subdirectories
	--new-file(-N)					# Treat absent files as empty
	--unified(-u)					# Output NUM lines of unified context (default 3)
	--brief(-q)					# Output only whether the files differ
	--normal					# Output a normal diff
	--side-by-side(-y)					# Output in two columns
	--minimal(-d)					# Try to find a smaller set of changes
	--paginate(-l)					# Pass the output through 'pr'
	--version(-v)					# Display version and exit
	--help					# Display help and exit
	--color					# Colorize the output
	...args
]