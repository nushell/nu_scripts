# All files are listed
extern "tree" [
	--noreport					# Turn off file/directory count at end of tree listing
	--si					# Like -h, but use in SI units (powers of 1000)
	--inodes					# Print inode number of each file
	--device					# Print device ID number to which each file belongs
	--dirsfirst					# List directories before files (-U disables)
	--nolinks					# Turn off hyperlinks in HTML output
	--version					# Print version and exit
	--help					# Print usage and this help message and exit
	...args
]