# Do not prepend filenames to output lines
extern "file" [
	--brief(-b)					# Do not prepend filenames to output lines
	--checking-printout(-c)					# Print the parsed form of the magic file
	--compile(-C)					# Write an output file containing a pre-parsed version of file
	--no-dereference(-h)					# Do not follow symlinks
	--dereference(-L)					# Follow symlinks
	--no-buffer(-n)					# Flush stdout after checking each file
	--preserve-date(-p)					# Attempt to preserve the access time of files analyzed
	--special-files(-s)					# Read block and character device files too
	--version(-v)					# Print the version of the program and exit
	--uncompress(-z)					# Try to look inside compressed files
	--help					# Print a help message and exit
	...args
]