# Display help and exit
extern "psub" [
	--help(-h)					# Display help and exit
	--file(-f)					# Communicate using a regular file, not a named pipe
	--fifo(-F)					# Communicate using a named pipe
	--suffix(-s)					# Append suffix to the filename
	...args
]