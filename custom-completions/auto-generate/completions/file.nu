# Do not prepend filenames to output lines
extern "file" [
	--brief(-b)					# Do not prepend filenames to output lines
	--checking-printout(-c)					# Print the parsed form of the magic file
	--compile(-C)					# Write an output file containing a pre-parsed version of file
	--no-dereference(-h)					# Do not follow symlinks
	--mime(-i)					# Output mime type strings instead human readable strings
	--keep-going(-k)					# Dont stop at the first match
	--dereference(-L)					# Follow symlinks
	--no-buffer(-n)					# Flush stdout after checking each file
	--no-pad(-N)					# Dont pad filenames so that they align in the output
	--preserve-date(-p)					# Attempt to preserve the access time of files analyzed
	--raw(-r)					# Dont translate unprintable characters to octal
	--special-files(-s)					# Read block and character device files too
	--version(-v)					# Print the version of the program and exit
	--uncompress(-z)					# Try to look inside compressed files
	--help					# Print a help message and exit
	...args
]