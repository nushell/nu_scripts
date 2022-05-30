# list files in archive (als)
extern "atool" [
	--list(-l)					# list files in archive (als)
	--extract(-x)					# extract files from archive (aunpack)
	--add(-a)					# create archive (apack)
	--cat(-c)					# extract file to standard out (acat)
	--diff(-d)					# generate a diff between two archives (adiff)
	--repack(-r)					# repack archives to a different format (arepack)
	--help					# display this help and exit
	--version					# output version information and exit
	--each(-e)					# execute command above for each file specified
	--format(-F)					# override archive format (see below)
	--subdir(-D)					# always create subdirectory when extracting
	--force(-f)					# allow overwriting of local files
	--quiet(-q)					# decrease verbosity level by one
	--verbose(-v)					# increase verbosity level by one
	--verbosity(-V)					# specify verbosity (0, 1 or 2)
	--page(-p)					# send output through pager
	--null(-0)					# filenames from standard in are null-byte separated
	--explain(-E)					# explain what is being done by atool
	--simulate(-S)					# simulation mode - no filesystem changes are made
	...args
]