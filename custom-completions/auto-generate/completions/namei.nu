# displays this help text
extern "namei" [
	--help(-h)					# displays this help text
	--version(-V)					# output version information and exit
	--mountpoints(-x)					# show mount point directories with a D
	--modes(-m)					# show the mode bits of each file
	--owners(-o)					# show owner and group name of each file
	--long(-l)					# use a long listing format (-m -o -v)
	--nosymlinks(-n)					# dont follow symlinks
	--vertical(-v)					# vertical align of modes and owners
	...args
]