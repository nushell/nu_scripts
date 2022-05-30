# Read in binary mode
extern "md5sum" [
	--binary(-b)					# Read in binary mode
	--check(-c)					# Read sums from files and check them
	--text(-t)					# Read in text mode
	--quiet					# Don''t print OK for each successfully verified file
	--status					# Don''t output anything, status code shows success
	--warn(-w)					# Warn about improperly formatted checksum lines
	--strict					# With --check, exit non-zero for any invalid input
	--help					# Display help text
	--version					# Output version information and exit
	...args
]