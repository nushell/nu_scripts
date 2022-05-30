# Set or get soft limit
extern "ulimit" [
	--soft(-S)					# Set or get soft limit
	--hard(-H)					# Set or get hard limit
	--all(-a)					# Get all current limits
	--socket-buffers(-b)					# Maximum size of socket buffers
	--core-size(-c)					# Maximum size of core files created
	--data-size(-d)					# Maximum size of a process's data segment
	--nice(-e)					# Control of maximum nice priority
	--file-size(-f)					# Maximum size of files created by the shell
	--pending-signals(-i)					# Maximum number of pending signals
	--lock-size(-l)					# Maximum size that may be locked into memory
	--resident-set-size(-m)					# Maximum resident set size
	--file-descriptor-count(-n)					# Maximum number of open file descriptors
	--queue-size(-q)					# Maximum bytes in POSIX message queues
	--realtime-priority(-r)					# Maximum realtime scheduling priority
	--stack-size(-s)					# Maximum stack size
	--cpu-time(-t)					# Maximum amount of cpu time in seconds
	--process-count(-u)					# Maximum number of processes available to a single user
	--virtual-memory-size(-v)					# Maximum amount of virtual memory available to the shell
	--swap-size(-w)					# Maximum swap space
	--realtime-maxtime(-y)					# Maximum contiguous realtime CPU time
	--kernel-queues(-K)					# Maximum number of kqueues
	--ptys(-P)					# Maximum number of pseudo-terminals
	--threads(-T)					# Maximum number of simultaneous threads
	--help(-h)					# Display help and exit
	...args
]

# New resource limit
extern "ulimit unlimited soft hard" [
	--soft(-S)					# Set or get soft limit
	--hard(-H)					# Set or get hard limit
	--all(-a)					# Get all current limits
	--socket-buffers(-b)					# Maximum size of socket buffers
	--core-size(-c)					# Maximum size of core files created
	--data-size(-d)					# Maximum size of a process's data segment
	--nice(-e)					# Control of maximum nice priority
	--file-size(-f)					# Maximum size of files created by the shell
	--pending-signals(-i)					# Maximum number of pending signals
	--lock-size(-l)					# Maximum size that may be locked into memory
	--resident-set-size(-m)					# Maximum resident set size
	--file-descriptor-count(-n)					# Maximum number of open file descriptors
	--queue-size(-q)					# Maximum bytes in POSIX message queues
	--realtime-priority(-r)					# Maximum realtime scheduling priority
	--stack-size(-s)					# Maximum stack size
	--cpu-time(-t)					# Maximum amount of cpu time in seconds
	--process-count(-u)					# Maximum number of processes available to a single user
	--virtual-memory-size(-v)					# Maximum amount of virtual memory available to the shell
	--swap-size(-w)					# Maximum swap space
	--realtime-maxtime(-y)					# Maximum contiguous realtime CPU time
	--kernel-queues(-K)					# Maximum number of kqueues
	--ptys(-P)					# Maximum number of pseudo-terminals
	--threads(-T)					# Maximum number of simultaneous threads
	--help(-h)					# Display help and exit
	...args
]