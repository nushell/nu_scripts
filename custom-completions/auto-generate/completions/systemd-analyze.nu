# Operates on the system systemd instance
extern "systemd-analyze" [

	...args
]

# Print timing statistics
extern "systemd-analyze time" [

	...args
]

# Print list of running units ordered by time to init
extern "systemd-analyze blame" [

	...args
]

# Print a tree of the time critical chain of units
extern "systemd-analyze critical-chain" [

	...args
]

# Output serialization of server state
extern "systemd-analyze dump" [

	...args
]

# Output SVG graphic showing service initialization
extern "systemd-analyze plot" [

	...args
]

# Output dependency graph in dot(1) format
extern "systemd-analyze dot" [

	...args
]

# List all directories from which unit files may be loaded
extern "systemd-analyze unit-paths" [

	...args
]

# List exit statuses along with their class
extern "systemd-analyze exit-status" [

	...args
]

# List Linux capabilities along with their numeric IDs
extern "systemd-analyze capability" [

	...args
]

# Evaluate Condition and Assert assignments
extern "systemd-analyze condition" [

	...args
]

# List system calls contained in the specified system call set
extern "systemd-analyze syscall-filter" [

	...args
]

# Normalize repetitive calendar events and calculate when they elapse next
extern "systemd-analyze calendar" [

	...args
]

# Parse timestamp and output the normalized form
extern "systemd-analyze timestamp" [

	...args
]

# Show contents of a config file
extern "systemd-analyze cat-config" [

	...args
]

# Check unit files for correctness
extern "systemd-analyze verify" [

	...args
]

# Analyze security settings of specified service units
extern "systemd-analyze security" [

	...args
]