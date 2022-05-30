# Match all non-option arguments
extern "locate" [
	--all(-A)					# Match all non-option arguments
	--basename(-b)					# Match against the base name of the file
	--count(-c)					# Print only the number of matches found
	--existing(-e)					# Match only existing files
	--follow(-L)					# Consider broken symbolic links to be non-existing files
	--nofollow(-P)					# Treat broken symbolic links as if they were existing
	--nofollow(-H)					# Treat broken symbolic links as if they were existing
	--ignore-case(-i)					# Ignore case distinctions
	--null(-0)					# Use ASCII NUL as a separator
	--statistics(-S)					# Print statistics about databases and exit
	--wholename(-w)					# Match against the whole name of the file
	--regex(-r)					# The pattern is a regular expression
	--help(-h)					# Print a summary of the options and exit
	--version(-V)					# Print the version number and exit
	...args
]