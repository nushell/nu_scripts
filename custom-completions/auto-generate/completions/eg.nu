# Show version and exit
extern "eg" [
	--version(-v)					# Show version and exit
	--config-file(-f)					# A path to a .egrc file
	--edit(-e)					# Edit custom examples for a specific command
	--examples-dir					# A location to examples/ directory
	--custom-dir(-c)					# A path to a directory with user-defined examples
	--pager-cmd(-p)					# A pager
	--list(-l)					# Show all the programs with eg entries
	--color					# Colorize output
	--no-color					# Do not colorize output
	...args
]