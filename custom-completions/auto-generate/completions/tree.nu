# All files are listed
extern "tree" [
	--gitignore					# Filter by using .gitignore files
	--ignore-case					# Ignore case when pattern matching
	--matchdirs					# Include directory names in -P pattern matching
	--metafirst					# Print meta-data at the beginning of each line
	--prune					# Prune empty directories from the output
	--info					# Print information about files found in .info files
	--noreport					# Turn off file/directory count at end of tree listing
	--si					# Like -h, but use in SI units (powers of 1000)
	--du					# Compute size of directories by their contents
	--inodes					# Print inode number of each file
	--device					# Print device ID number to which each file belongs
	--dirsfirst					# List directories before files (-U disables)
	--filesfirst					# List files before directories (-U disables)
	--sort					# Select sort
	--nolinks					# Turn off hyperlinks in HTML output
	--version					# Print version and exit
	--help					# Print usage and this help message and exit
	...args
]