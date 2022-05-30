# Show all files specified on the command line
extern "fuser" [
	--all(-a)					# Show all files specified on the command line
	--kill(-k)					# Kill processes, accessing the file
	--list-signals(-l)					# List all known signal names
	--mount(-m)					# All processes accessing files on that file system are listed
	--ismountpoint(-M)					# Request will be fulfilled if -m specifies a mountpoint
	--silent(-s)					# Silent operation
	--user(-u)					# Append the user name of the process owner to each PID
	--verbose(-v)					# Verbose mode
	--ipv4(-4)					# Search only for IPv4 sockets
	--ip64(-6)					# Search only for IPv6 sockets
	...args
]