[# Debug
extern "whatis" [
	--debug(-d)					# Debug
	--verbose(-v)					# Verbose
	--regex(-r)					# Interpret each keyword as a regex
	--wildcard(-w)					# Allow wildcards
	--long(-l)					# Do not trim output to terminal width
	--usage(-?)					# Display help and exit
	--version(-V)					# Print program version
	...args
]]

[# Configuration file
extern "" [
	--config-file(-C)					# Configuration file
	--systems(-m)					# Set system
	--section(-s)					# Search only these sections (colon-separated)
	...args
]]