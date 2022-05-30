# show this help message
extern "pydf" [
	--help					# show this help message
	--version(-v)					# show version
	--all(-a)					# include filesystems having 0 blocks
	--human-readable(-h)					# print sizes in human readable format (e.g., 1K 234M 2G)
	--si(-H)					# likewise, but use powers of 1000 not 1024
	--local(-l)					# limit listing to local filesystems
	--kilobytes(-k)					# like --block-size=1024
	--megabytes(-m)					# like --block-size=1048576
	--gigabytes(-g)					# like --block-size=1073741824
	--blocks					# use filesystem native block size
	--bw					# do not use colours
	--show-binds(-B)					# show mount --bind mounts
	--inodes(-i)					# show inode instead of block usage
	...args
]