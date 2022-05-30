# Cancels all jobs on the named destination
extern "cupsdisable" [
	--hold					# Holds remaining jobs on the named printer
	--release					# Releases pending jobs for printing
	...args
]