# Read in binary mode
extern "md5sum" [
	--binary(-b)					# Read in binary mode
	--check(-c)					# Read sums from files and check them
	--tag					# Create a BSD-style checksum
	--text(-t)					# Read in text mode (default)
	--zero(-z)					# End each output line with NUL, not newline, and disable file name escaping
	--status					# Don\'t
	--strict					# With --check, exit non-zero for any invalid input
	--warn(-w)					# Warn about improperly formatted checksum lines
	--help					# Display help text
	--version					# Output version information and exit
	...args
]