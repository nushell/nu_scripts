# show programs version number and exit
extern "pkgfile" [
	--version					# show programs version number and exit
	--help(-h)					# show this help message and exit
	--binaries(-b)					# only show files in a {s}bin/ directory. Works with -s, -l
	--case-sensitive(-c)					# make searches case sensitive
	--glob(-g)					# allow the use of * and ? as wildcards
	--regex(-r)					# allow the use of regex in searches
	--repo(-R)					# search only in the specified repository
	--verbose(-v)					# enable verbose output
	--list(-l)					# list files of a given package; similar to "pacman -Ql
	--update(-u)					# update to the latest filelist. This requires write permission to /var/cache/pkgtools/lists
	...args
]