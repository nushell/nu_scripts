# Add abbreviation
extern "abbr" [
	--add(-a)					# Add abbreviation
	--query(-q)					# Check if an abbreviation exists
	--rename					# Rename an abbreviation
	--erase(-e)					# Erase abbreviation
	--show(-s)					# Print all abbreviations
	--list(-l)					# Print all abbreviation names
	--help(-h)					# Help
	--function(-f)					# Treat expansion argument as a fish function
	--set-cursor					# Position the cursor at % post-expansion
	...args
]