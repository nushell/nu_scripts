# Display help and exit
extern "apropos" [
	--help(-?)					# Display help and exit
	--usage					# Display short usage message
	--debug(-d)					# Print debugging info
	--verbose(-v)					# Verbose mode
	--regex(-r)					# Keyword as regex (default)
	--wildcard(-w)					# Keyword as wildcards
	--exact(-e)					# Keyword as exactly match
	--version(-V)					# Display version and exit
	--and(-a)					# Match all keywords
	--long(-l)					# Do not trim output to terminal width
	...args
]