# Use tab separation. Shortcut for -d '\t'
extern "csvlens" [
	--tab-separated(-t)					# Use tab separation. Shortcut for -d '\t'
	--no-headers					# Do not interpret the first row as headers
	--ignore-case(-i)					# Searches ignore case. Ignored if any uppercase letters are present in the search string
	--debug					# Show stats for debugging
	--help(-h)					# Print help
	--version(-V)					# Print version
	...args
]