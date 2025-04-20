# Operates on the system systemd instance
extern "systemd-analyze" [
	--system					# Operates on the system systemd instance
	--user					# Operates on the user systemd instance
	--global					# Operates on the system-wide configuration for user systemd instance
	--order					# dot: show only After and Before dependencies
	--require					# dot: show only Requires, Requisite, Wants and Conflicts dependencies
	--from-pattern					# dot: show relationships matching left-hand nodes pattern
	--to-pattern					# dot: show relationships matching right-hand nodes pattern
	--man					# Do not invoke man to verify the existence of man pages
	--generators					# Invoke unit generators
	--root					# With cat-files, show config files underneath the specified root path
	--image-policy					# Disk image dissection policy
	--tldr					# cat-config: skip comments, empty lines and section headers
	--table					# plot: output raw time data in a table
	--no-legend					# plot: exclude legends/hints
	--detailed					# plot: show activation timestamps details in SVG plot
	--host(-H)					# Execute the operation on a remote host
	--machine(-M)					# Execute operation on a VM or container
	--help(-h)					# Print a short help and exit
	--version					# Print a short version and exit
	--no-pager					# Do not pipe output into a pager
	...args
]

# Print timing statistics
extern "systemd-analyze time" [
	--system					# Operates on the system systemd instance
	--user					# Operates on the user systemd instance
	--global					# Operates on the system-wide configuration for user systemd instance
	--order					# dot: show only After and Before dependencies
	--require					# dot: show only Requires, Requisite, Wants and Conflicts dependencies
	--from-pattern					# dot: show relationships matching left-hand nodes pattern
	--to-pattern					# dot: show relationships matching right-hand nodes pattern
	--man					# Do not invoke man to verify the existence of man pages
	--generators					# Invoke unit generators
	--root					# With cat-files, show config files underneath the specified root path
	--image-policy					# Disk image dissection policy
	--tldr					# cat-config: skip comments, empty lines and section headers
	--table					# plot: output raw time data in a table
	--no-legend					# plot: exclude legends/hints
	--detailed					# plot: show activation timestamps details in SVG plot
	--host(-H)					# Execute the operation on a remote host
	--machine(-M)					# Execute operation on a VM or container
	--help(-h)					# Print a short help and exit
	--version					# Print a short version and exit
	--no-pager					# Do not pipe output into a pager
	...args
]

# Print list of running units ordered by time to init
extern "systemd-analyze blame" [
	--system					# Operates on the system systemd instance
	--user					# Operates on the user systemd instance
	--global					# Operates on the system-wide configuration for user systemd instance
	--order					# dot: show only After and Before dependencies
	--require					# dot: show only Requires, Requisite, Wants and Conflicts dependencies
	--from-pattern					# dot: show relationships matching left-hand nodes pattern
	--to-pattern					# dot: show relationships matching right-hand nodes pattern
	--man					# Do not invoke man to verify the existence of man pages
	--generators					# Invoke unit generators
	--root					# With cat-files, show config files underneath the specified root path
	--image-policy					# Disk image dissection policy
	--tldr					# cat-config: skip comments, empty lines and section headers
	--table					# plot: output raw time data in a table
	--no-legend					# plot: exclude legends/hints
	--detailed					# plot: show activation timestamps details in SVG plot
	--host(-H)					# Execute the operation on a remote host
	--machine(-M)					# Execute operation on a VM or container
	--help(-h)					# Print a short help and exit
	--version					# Print a short version and exit
	--no-pager					# Do not pipe output into a pager
	...args
]

# Print a tree of the time critical chain of units
extern "systemd-analyze critical-chain" [
	--system					# Operates on the system systemd instance
	--user					# Operates on the user systemd instance
	--global					# Operates on the system-wide configuration for user systemd instance
	--order					# dot: show only After and Before dependencies
	--require					# dot: show only Requires, Requisite, Wants and Conflicts dependencies
	--from-pattern					# dot: show relationships matching left-hand nodes pattern
	--to-pattern					# dot: show relationships matching right-hand nodes pattern
	--man					# Do not invoke man to verify the existence of man pages
	--generators					# Invoke unit generators
	--root					# With cat-files, show config files underneath the specified root path
	--image-policy					# Disk image dissection policy
	--tldr					# cat-config: skip comments, empty lines and section headers
	--table					# plot: output raw time data in a table
	--no-legend					# plot: exclude legends/hints
	--detailed					# plot: show activation timestamps details in SVG plot
	--host(-H)					# Execute the operation on a remote host
	--machine(-M)					# Execute operation on a VM or container
	--help(-h)					# Print a short help and exit
	--version					# Print a short version and exit
	--no-pager					# Do not pipe output into a pager
	...args
]

# Output serialization of server state
extern "systemd-analyze dump" [
	--system					# Operates on the system systemd instance
	--user					# Operates on the user systemd instance
	--global					# Operates on the system-wide configuration for user systemd instance
	--order					# dot: show only After and Before dependencies
	--require					# dot: show only Requires, Requisite, Wants and Conflicts dependencies
	--from-pattern					# dot: show relationships matching left-hand nodes pattern
	--to-pattern					# dot: show relationships matching right-hand nodes pattern
	--man					# Do not invoke man to verify the existence of man pages
	--generators					# Invoke unit generators
	--root					# With cat-files, show config files underneath the specified root path
	--image-policy					# Disk image dissection policy
	--tldr					# cat-config: skip comments, empty lines and section headers
	--table					# plot: output raw time data in a table
	--no-legend					# plot: exclude legends/hints
	--detailed					# plot: show activation timestamps details in SVG plot
	--host(-H)					# Execute the operation on a remote host
	--machine(-M)					# Execute operation on a VM or container
	--help(-h)					# Print a short help and exit
	--version					# Print a short version and exit
	--no-pager					# Do not pipe output into a pager
	...args
]

# Output internal memory state of D-Bus service
extern "systemd-analyze malloc" [
	--system					# Operates on the system systemd instance
	--user					# Operates on the user systemd instance
	--global					# Operates on the system-wide configuration for user systemd instance
	--order					# dot: show only After and Before dependencies
	--require					# dot: show only Requires, Requisite, Wants and Conflicts dependencies
	--from-pattern					# dot: show relationships matching left-hand nodes pattern
	--to-pattern					# dot: show relationships matching right-hand nodes pattern
	--man					# Do not invoke man to verify the existence of man pages
	--generators					# Invoke unit generators
	--root					# With cat-files, show config files underneath the specified root path
	--image-policy					# Disk image dissection policy
	--tldr					# cat-config: skip comments, empty lines and section headers
	--table					# plot: output raw time data in a table
	--no-legend					# plot: exclude legends/hints
	--detailed					# plot: show activation timestamps details in SVG plot
	--host(-H)					# Execute the operation on a remote host
	--machine(-M)					# Execute operation on a VM or container
	--help(-h)					# Print a short help and exit
	--version					# Print a short version and exit
	--no-pager					# Do not pipe output into a pager
	...args
]

# Output SVG graphic showing service initialization
extern "systemd-analyze plot" [
	--system					# Operates on the system systemd instance
	--user					# Operates on the user systemd instance
	--global					# Operates on the system-wide configuration for user systemd instance
	--order					# dot: show only After and Before dependencies
	--require					# dot: show only Requires, Requisite, Wants and Conflicts dependencies
	--from-pattern					# dot: show relationships matching left-hand nodes pattern
	--to-pattern					# dot: show relationships matching right-hand nodes pattern
	--man					# Do not invoke man to verify the existence of man pages
	--generators					# Invoke unit generators
	--root					# With cat-files, show config files underneath the specified root path
	--image-policy					# Disk image dissection policy
	--tldr					# cat-config: skip comments, empty lines and section headers
	--table					# plot: output raw time data in a table
	--no-legend					# plot: exclude legends/hints
	--detailed					# plot: show activation timestamps details in SVG plot
	--host(-H)					# Execute the operation on a remote host
	--machine(-M)					# Execute operation on a VM or container
	--help(-h)					# Print a short help and exit
	--version					# Print a short version and exit
	--no-pager					# Do not pipe output into a pager
	...args
]

# Output dependency graph in dot(1) format
extern "systemd-analyze dot" [
	--system					# Operates on the system systemd instance
	--user					# Operates on the user systemd instance
	--global					# Operates on the system-wide configuration for user systemd instance
	--order					# dot: show only After and Before dependencies
	--require					# dot: show only Requires, Requisite, Wants and Conflicts dependencies
	--from-pattern					# dot: show relationships matching left-hand nodes pattern
	--to-pattern					# dot: show relationships matching right-hand nodes pattern
	--man					# Do not invoke man to verify the existence of man pages
	--generators					# Invoke unit generators
	--root					# With cat-files, show config files underneath the specified root path
	--image-policy					# Disk image dissection policy
	--tldr					# cat-config: skip comments, empty lines and section headers
	--table					# plot: output raw time data in a table
	--no-legend					# plot: exclude legends/hints
	--detailed					# plot: show activation timestamps details in SVG plot
	--host(-H)					# Execute the operation on a remote host
	--machine(-M)					# Execute operation on a VM or container
	--help(-h)					# Print a short help and exit
	--version					# Print a short version and exit
	--no-pager					# Do not pipe output into a pager
	...args
]

# List all directories from which unit files may be loaded
extern "systemd-analyze unit-paths" [
	--system					# Operates on the system systemd instance
	--user					# Operates on the user systemd instance
	--global					# Operates on the system-wide configuration for user systemd instance
	--order					# dot: show only After and Before dependencies
	--require					# dot: show only Requires, Requisite, Wants and Conflicts dependencies
	--from-pattern					# dot: show relationships matching left-hand nodes pattern
	--to-pattern					# dot: show relationships matching right-hand nodes pattern
	--man					# Do not invoke man to verify the existence of man pages
	--generators					# Invoke unit generators
	--root					# With cat-files, show config files underneath the specified root path
	--image-policy					# Disk image dissection policy
	--tldr					# cat-config: skip comments, empty lines and section headers
	--table					# plot: output raw time data in a table
	--no-legend					# plot: exclude legends/hints
	--detailed					# plot: show activation timestamps details in SVG plot
	--host(-H)					# Execute the operation on a remote host
	--machine(-M)					# Execute operation on a VM or container
	--help(-h)					# Print a short help and exit
	--version					# Print a short version and exit
	--no-pager					# Do not pipe output into a pager
	...args
]

# List exit statuses along with their class
extern "systemd-analyze exit-status" [
	--system					# Operates on the system systemd instance
	--user					# Operates on the user systemd instance
	--global					# Operates on the system-wide configuration for user systemd instance
	--order					# dot: show only After and Before dependencies
	--require					# dot: show only Requires, Requisite, Wants and Conflicts dependencies
	--from-pattern					# dot: show relationships matching left-hand nodes pattern
	--to-pattern					# dot: show relationships matching right-hand nodes pattern
	--man					# Do not invoke man to verify the existence of man pages
	--generators					# Invoke unit generators
	--root					# With cat-files, show config files underneath the specified root path
	--image-policy					# Disk image dissection policy
	--tldr					# cat-config: skip comments, empty lines and section headers
	--table					# plot: output raw time data in a table
	--no-legend					# plot: exclude legends/hints
	--detailed					# plot: show activation timestamps details in SVG plot
	--host(-H)					# Execute the operation on a remote host
	--machine(-M)					# Execute operation on a VM or container
	--help(-h)					# Print a short help and exit
	--version					# Print a short version and exit
	--no-pager					# Do not pipe output into a pager
	...args
]

# List Linux capabilities along with their numeric IDs
extern "systemd-analyze capability" [
	--system					# Operates on the system systemd instance
	--user					# Operates on the user systemd instance
	--global					# Operates on the system-wide configuration for user systemd instance
	--order					# dot: show only After and Before dependencies
	--require					# dot: show only Requires, Requisite, Wants and Conflicts dependencies
	--from-pattern					# dot: show relationships matching left-hand nodes pattern
	--to-pattern					# dot: show relationships matching right-hand nodes pattern
	--man					# Do not invoke man to verify the existence of man pages
	--generators					# Invoke unit generators
	--root					# With cat-files, show config files underneath the specified root path
	--image-policy					# Disk image dissection policy
	--tldr					# cat-config: skip comments, empty lines and section headers
	--table					# plot: output raw time data in a table
	--no-legend					# plot: exclude legends/hints
	--detailed					# plot: show activation timestamps details in SVG plot
	--host(-H)					# Execute the operation on a remote host
	--machine(-M)					# Execute operation on a VM or container
	--help(-h)					# Print a short help and exit
	--version					# Print a short version and exit
	--no-pager					# Do not pipe output into a pager
	...args
]

# Evaluate Condition and Assert assignments
extern "systemd-analyze condition" [
	--system					# Operates on the system systemd instance
	--user					# Operates on the user systemd instance
	--global					# Operates on the system-wide configuration for user systemd instance
	--order					# dot: show only After and Before dependencies
	--require					# dot: show only Requires, Requisite, Wants and Conflicts dependencies
	--from-pattern					# dot: show relationships matching left-hand nodes pattern
	--to-pattern					# dot: show relationships matching right-hand nodes pattern
	--man					# Do not invoke man to verify the existence of man pages
	--generators					# Invoke unit generators
	--root					# With cat-files, show config files underneath the specified root path
	--image-policy					# Disk image dissection policy
	--tldr					# cat-config: skip comments, empty lines and section headers
	--table					# plot: output raw time data in a table
	--no-legend					# plot: exclude legends/hints
	--detailed					# plot: show activation timestamps details in SVG plot
	--host(-H)					# Execute the operation on a remote host
	--machine(-M)					# Execute operation on a VM or container
	--help(-h)					# Print a short help and exit
	--version					# Print a short version and exit
	--no-pager					# Do not pipe output into a pager
	...args
]

# List system calls contained in the specified system call set
extern "systemd-analyze syscall-filter" [
	--system					# Operates on the system systemd instance
	--user					# Operates on the user systemd instance
	--global					# Operates on the system-wide configuration for user systemd instance
	--order					# dot: show only After and Before dependencies
	--require					# dot: show only Requires, Requisite, Wants and Conflicts dependencies
	--from-pattern					# dot: show relationships matching left-hand nodes pattern
	--to-pattern					# dot: show relationships matching right-hand nodes pattern
	--man					# Do not invoke man to verify the existence of man pages
	--generators					# Invoke unit generators
	--root					# With cat-files, show config files underneath the specified root path
	--image-policy					# Disk image dissection policy
	--tldr					# cat-config: skip comments, empty lines and section headers
	--table					# plot: output raw time data in a table
	--no-legend					# plot: exclude legends/hints
	--detailed					# plot: show activation timestamps details in SVG plot
	--host(-H)					# Execute the operation on a remote host
	--machine(-M)					# Execute operation on a VM or container
	--help(-h)					# Print a short help and exit
	--version					# Print a short version and exit
	--no-pager					# Do not pipe output into a pager
	...args
]

# List filesystems
extern "systemd-analyze filesystems" [
	--system					# Operates on the system systemd instance
	--user					# Operates on the user systemd instance
	--global					# Operates on the system-wide configuration for user systemd instance
	--order					# dot: show only After and Before dependencies
	--require					# dot: show only Requires, Requisite, Wants and Conflicts dependencies
	--from-pattern					# dot: show relationships matching left-hand nodes pattern
	--to-pattern					# dot: show relationships matching right-hand nodes pattern
	--man					# Do not invoke man to verify the existence of man pages
	--generators					# Invoke unit generators
	--root					# With cat-files, show config files underneath the specified root path
	--image-policy					# Disk image dissection policy
	--tldr					# cat-config: skip comments, empty lines and section headers
	--table					# plot: output raw time data in a table
	--no-legend					# plot: exclude legends/hints
	--detailed					# plot: show activation timestamps details in SVG plot
	--host(-H)					# Execute the operation on a remote host
	--machine(-M)					# Execute operation on a VM or container
	--help(-h)					# Print a short help and exit
	--version					# Print a short version and exit
	--no-pager					# Do not pipe output into a pager
	...args
]

# Normalize repetitive calendar events and calculate when they elapse next
extern "systemd-analyze calendar" [
	--system					# Operates on the system systemd instance
	--user					# Operates on the user systemd instance
	--global					# Operates on the system-wide configuration for user systemd instance
	--order					# dot: show only After and Before dependencies
	--require					# dot: show only Requires, Requisite, Wants and Conflicts dependencies
	--from-pattern					# dot: show relationships matching left-hand nodes pattern
	--to-pattern					# dot: show relationships matching right-hand nodes pattern
	--man					# Do not invoke man to verify the existence of man pages
	--generators					# Invoke unit generators
	--root					# With cat-files, show config files underneath the specified root path
	--image-policy					# Disk image dissection policy
	--tldr					# cat-config: skip comments, empty lines and section headers
	--table					# plot: output raw time data in a table
	--no-legend					# plot: exclude legends/hints
	--detailed					# plot: show activation timestamps details in SVG plot
	--host(-H)					# Execute the operation on a remote host
	--machine(-M)					# Execute operation on a VM or container
	--help(-h)					# Print a short help and exit
	--version					# Print a short version and exit
	--no-pager					# Do not pipe output into a pager
	...args
]

# Parse timestamp and output the normalized form
extern "systemd-analyze timestamp" [
	--system					# Operates on the system systemd instance
	--user					# Operates on the user systemd instance
	--global					# Operates on the system-wide configuration for user systemd instance
	--order					# dot: show only After and Before dependencies
	--require					# dot: show only Requires, Requisite, Wants and Conflicts dependencies
	--from-pattern					# dot: show relationships matching left-hand nodes pattern
	--to-pattern					# dot: show relationships matching right-hand nodes pattern
	--man					# Do not invoke man to verify the existence of man pages
	--generators					# Invoke unit generators
	--root					# With cat-files, show config files underneath the specified root path
	--image-policy					# Disk image dissection policy
	--tldr					# cat-config: skip comments, empty lines and section headers
	--table					# plot: output raw time data in a table
	--no-legend					# plot: exclude legends/hints
	--detailed					# plot: show activation timestamps details in SVG plot
	--host(-H)					# Execute the operation on a remote host
	--machine(-M)					# Execute operation on a VM or container
	--help(-h)					# Print a short help and exit
	--version					# Print a short version and exit
	--no-pager					# Do not pipe output into a pager
	...args
]

# Parse time span and output the normalized form
extern "systemd-analyze timespan" [
	--system					# Operates on the system systemd instance
	--user					# Operates on the user systemd instance
	--global					# Operates on the system-wide configuration for user systemd instance
	--order					# dot: show only After and Before dependencies
	--require					# dot: show only Requires, Requisite, Wants and Conflicts dependencies
	--from-pattern					# dot: show relationships matching left-hand nodes pattern
	--to-pattern					# dot: show relationships matching right-hand nodes pattern
	--man					# Do not invoke man to verify the existence of man pages
	--generators					# Invoke unit generators
	--root					# With cat-files, show config files underneath the specified root path
	--image-policy					# Disk image dissection policy
	--tldr					# cat-config: skip comments, empty lines and section headers
	--table					# plot: output raw time data in a table
	--no-legend					# plot: exclude legends/hints
	--detailed					# plot: show activation timestamps details in SVG plot
	--host(-H)					# Execute the operation on a remote host
	--machine(-M)					# Execute operation on a VM or container
	--help(-h)					# Print a short help and exit
	--version					# Print a short version and exit
	--no-pager					# Do not pipe output into a pager
	...args
]

# Show contents of a config file
extern "systemd-analyze cat-config" [
	--system					# Operates on the system systemd instance
	--user					# Operates on the user systemd instance
	--global					# Operates on the system-wide configuration for user systemd instance
	--order					# dot: show only After and Before dependencies
	--require					# dot: show only Requires, Requisite, Wants and Conflicts dependencies
	--from-pattern					# dot: show relationships matching left-hand nodes pattern
	--to-pattern					# dot: show relationships matching right-hand nodes pattern
	--man					# Do not invoke man to verify the existence of man pages
	--generators					# Invoke unit generators
	--root					# With cat-files, show config files underneath the specified root path
	--image-policy					# Disk image dissection policy
	--tldr					# cat-config: skip comments, empty lines and section headers
	--table					# plot: output raw time data in a table
	--no-legend					# plot: exclude legends/hints
	--detailed					# plot: show activation timestamps details in SVG plot
	--host(-H)					# Execute the operation on a remote host
	--machine(-M)					# Execute operation on a VM or container
	--help(-h)					# Print a short help and exit
	--version					# Print a short version and exit
	--no-pager					# Do not pipe output into a pager
	...args
]

# Compare two version strings
extern "systemd-analyze compare-versions" [
	--system					# Operates on the system systemd instance
	--user					# Operates on the user systemd instance
	--global					# Operates on the system-wide configuration for user systemd instance
	--order					# dot: show only After and Before dependencies
	--require					# dot: show only Requires, Requisite, Wants and Conflicts dependencies
	--from-pattern					# dot: show relationships matching left-hand nodes pattern
	--to-pattern					# dot: show relationships matching right-hand nodes pattern
	--man					# Do not invoke man to verify the existence of man pages
	--generators					# Invoke unit generators
	--root					# With cat-files, show config files underneath the specified root path
	--image-policy					# Disk image dissection policy
	--tldr					# cat-config: skip comments, empty lines and section headers
	--table					# plot: output raw time data in a table
	--no-legend					# plot: exclude legends/hints
	--detailed					# plot: show activation timestamps details in SVG plot
	--host(-H)					# Execute the operation on a remote host
	--machine(-M)					# Execute operation on a VM or container
	--help(-h)					# Print a short help and exit
	--version					# Print a short version and exit
	--no-pager					# Do not pipe output into a pager
	...args
]

# Check unit files for correctness
extern "systemd-analyze verify" [
	--system					# Operates on the system systemd instance
	--user					# Operates on the user systemd instance
	--global					# Operates on the system-wide configuration for user systemd instance
	--order					# dot: show only After and Before dependencies
	--require					# dot: show only Requires, Requisite, Wants and Conflicts dependencies
	--from-pattern					# dot: show relationships matching left-hand nodes pattern
	--to-pattern					# dot: show relationships matching right-hand nodes pattern
	--man					# Do not invoke man to verify the existence of man pages
	--generators					# Invoke unit generators
	--root					# With cat-files, show config files underneath the specified root path
	--image-policy					# Disk image dissection policy
	--tldr					# cat-config: skip comments, empty lines and section headers
	--table					# plot: output raw time data in a table
	--no-legend					# plot: exclude legends/hints
	--detailed					# plot: show activation timestamps details in SVG plot
	--host(-H)					# Execute the operation on a remote host
	--machine(-M)					# Execute operation on a VM or container
	--help(-h)					# Print a short help and exit
	--version					# Print a short version and exit
	--no-pager					# Do not pipe output into a pager
	...args
]

# Analyze security settings of specified service units
extern "systemd-analyze security" [
	--system					# Operates on the system systemd instance
	--user					# Operates on the user systemd instance
	--global					# Operates on the system-wide configuration for user systemd instance
	--order					# dot: show only After and Before dependencies
	--require					# dot: show only Requires, Requisite, Wants and Conflicts dependencies
	--from-pattern					# dot: show relationships matching left-hand nodes pattern
	--to-pattern					# dot: show relationships matching right-hand nodes pattern
	--man					# Do not invoke man to verify the existence of man pages
	--generators					# Invoke unit generators
	--root					# With cat-files, show config files underneath the specified root path
	--image-policy					# Disk image dissection policy
	--tldr					# cat-config: skip comments, empty lines and section headers
	--table					# plot: output raw time data in a table
	--no-legend					# plot: exclude legends/hints
	--detailed					# plot: show activation timestamps details in SVG plot
	--host(-H)					# Execute the operation on a remote host
	--machine(-M)					# Execute operation on a VM or container
	--help(-h)					# Print a short help and exit
	--version					# Print a short version and exit
	--no-pager					# Do not pipe output into a pager
	...args
]

# Parse and print ELF object packaging metadata
extern "systemd-analyze inspect-elf" [
	--system					# Operates on the system systemd instance
	--user					# Operates on the user systemd instance
	--global					# Operates on the system-wide configuration for user systemd instance
	--order					# dot: show only After and Before dependencies
	--require					# dot: show only Requires, Requisite, Wants and Conflicts dependencies
	--from-pattern					# dot: show relationships matching left-hand nodes pattern
	--to-pattern					# dot: show relationships matching right-hand nodes pattern
	--man					# Do not invoke man to verify the existence of man pages
	--generators					# Invoke unit generators
	--root					# With cat-files, show config files underneath the specified root path
	--image-policy					# Disk image dissection policy
	--tldr					# cat-config: skip comments, empty lines and section headers
	--table					# plot: output raw time data in a table
	--no-legend					# plot: exclude legends/hints
	--detailed					# plot: show activation timestamps details in SVG plot
	--host(-H)					# Execute the operation on a remote host
	--machine(-M)					# Execute operation on a VM or container
	--help(-h)					# Print a short help and exit
	--version					# Print a short version and exit
	--no-pager					# Do not pipe output into a pager
	...args
]

# List contents of service unit's file descriptor store
extern "systemd-analyze fdstore" [
	--system					# Operates on the system systemd instance
	--user					# Operates on the user systemd instance
	--global					# Operates on the system-wide configuration for user systemd instance
	--order					# dot: show only After and Before dependencies
	--require					# dot: show only Requires, Requisite, Wants and Conflicts dependencies
	--from-pattern					# dot: show relationships matching left-hand nodes pattern
	--to-pattern					# dot: show relationships matching right-hand nodes pattern
	--man					# Do not invoke man to verify the existence of man pages
	--generators					# Invoke unit generators
	--root					# With cat-files, show config files underneath the specified root path
	--image-policy					# Disk image dissection policy
	--tldr					# cat-config: skip comments, empty lines and section headers
	--table					# plot: output raw time data in a table
	--no-legend					# plot: exclude legends/hints
	--detailed					# plot: show activation timestamps details in SVG plot
	--host(-H)					# Execute the operation on a remote host
	--machine(-M)					# Execute operation on a VM or container
	--help(-h)					# Print a short help and exit
	--version					# Print a short version and exit
	--no-pager					# Do not pipe output into a pager
	...args
]

# Analyze image policy string
extern "systemd-analyze image-policy" [
	--system					# Operates on the system systemd instance
	--user					# Operates on the user systemd instance
	--global					# Operates on the system-wide configuration for user systemd instance
	--order					# dot: show only After and Before dependencies
	--require					# dot: show only Requires, Requisite, Wants and Conflicts dependencies
	--from-pattern					# dot: show relationships matching left-hand nodes pattern
	--to-pattern					# dot: show relationships matching right-hand nodes pattern
	--man					# Do not invoke man to verify the existence of man pages
	--generators					# Invoke unit generators
	--root					# With cat-files, show config files underneath the specified root path
	--image-policy					# Disk image dissection policy
	--tldr					# cat-config: skip comments, empty lines and section headers
	--table					# plot: output raw time data in a table
	--no-legend					# plot: exclude legends/hints
	--detailed					# plot: show activation timestamps details in SVG plot
	--host(-H)					# Execute the operation on a remote host
	--machine(-M)					# Execute operation on a VM or container
	--help(-h)					# Print a short help and exit
	--version					# Print a short version and exit
	--no-pager					# Do not pipe output into a pager
	...args
]

# Report TPM2 support
extern "systemd-analyze has-tpm2" [
	--system					# Operates on the system systemd instance
	--user					# Operates on the user systemd instance
	--global					# Operates on the system-wide configuration for user systemd instance
	--order					# dot: show only After and Before dependencies
	--require					# dot: show only Requires, Requisite, Wants and Conflicts dependencies
	--from-pattern					# dot: show relationships matching left-hand nodes pattern
	--to-pattern					# dot: show relationships matching right-hand nodes pattern
	--man					# Do not invoke man to verify the existence of man pages
	--generators					# Invoke unit generators
	--root					# With cat-files, show config files underneath the specified root path
	--image-policy					# Disk image dissection policy
	--tldr					# cat-config: skip comments, empty lines and section headers
	--table					# plot: output raw time data in a table
	--no-legend					# plot: exclude legends/hints
	--detailed					# plot: show activation timestamps details in SVG plot
	--host(-H)					# Execute the operation on a remote host
	--machine(-M)					# Execute operation on a VM or container
	--help(-h)					# Print a short help and exit
	--version					# Print a short version and exit
	--no-pager					# Do not pipe output into a pager
	...args
]

# Show known TPM2 PCRs
extern "systemd-analyze pcrs" [
	--system					# Operates on the system systemd instance
	--user					# Operates on the user systemd instance
	--global					# Operates on the system-wide configuration for user systemd instance
	--order					# dot: show only After and Before dependencies
	--require					# dot: show only Requires, Requisite, Wants and Conflicts dependencies
	--from-pattern					# dot: show relationships matching left-hand nodes pattern
	--to-pattern					# dot: show relationships matching right-hand nodes pattern
	--man					# Do not invoke man to verify the existence of man pages
	--generators					# Invoke unit generators
	--root					# With cat-files, show config files underneath the specified root path
	--image-policy					# Disk image dissection policy
	--tldr					# cat-config: skip comments, empty lines and section headers
	--table					# plot: output raw time data in a table
	--no-legend					# plot: exclude legends/hints
	--detailed					# plot: show activation timestamps details in SVG plot
	--host(-H)					# Execute the operation on a remote host
	--machine(-M)					# Execute operation on a VM or container
	--help(-h)					# Print a short help and exit
	--version					# Print a short version and exit
	--no-pager					# Do not pipe output into a pager
	...args
]

# Read Storage Root Key from TPM2 device
extern "systemd-analyze srk" [
	--system					# Operates on the system systemd instance
	--user					# Operates on the user systemd instance
	--global					# Operates on the system-wide configuration for user systemd instance
	--order					# dot: show only After and Before dependencies
	--require					# dot: show only Requires, Requisite, Wants and Conflicts dependencies
	--from-pattern					# dot: show relationships matching left-hand nodes pattern
	--to-pattern					# dot: show relationships matching right-hand nodes pattern
	--man					# Do not invoke man to verify the existence of man pages
	--generators					# Invoke unit generators
	--root					# With cat-files, show config files underneath the specified root path
	--image-policy					# Disk image dissection policy
	--tldr					# cat-config: skip comments, empty lines and section headers
	--table					# plot: output raw time data in a table
	--no-legend					# plot: exclude legends/hints
	--detailed					# plot: show activation timestamps details in SVG plot
	--host(-H)					# Execute the operation on a remote host
	--machine(-M)					# Execute operation on a VM or container
	--help(-h)					# Print a short help and exit
	--version					# Print a short version and exit
	--no-pager					# Do not pipe output into a pager
	...args
]

# List known CPU architectures
extern "systemd-analyze architectures" [
	--system					# Operates on the system systemd instance
	--user					# Operates on the user systemd instance
	--global					# Operates on the system-wide configuration for user systemd instance
	--order					# dot: show only After and Before dependencies
	--require					# dot: show only Requires, Requisite, Wants and Conflicts dependencies
	--from-pattern					# dot: show relationships matching left-hand nodes pattern
	--to-pattern					# dot: show relationships matching right-hand nodes pattern
	--man					# Do not invoke man to verify the existence of man pages
	--generators					# Invoke unit generators
	--root					# With cat-files, show config files underneath the specified root path
	--image-policy					# Disk image dissection policy
	--tldr					# cat-config: skip comments, empty lines and section headers
	--table					# plot: output raw time data in a table
	--no-legend					# plot: exclude legends/hints
	--detailed					# plot: show activation timestamps details in SVG plot
	--host(-H)					# Execute the operation on a remote host
	--machine(-M)					# Execute operation on a VM or container
	--help(-h)					# Print a short help and exit
	--version					# Print a short version and exit
	--no-pager					# Do not pipe output into a pager
	...args
]

# Show SMBIOS Type #11 strings passed to the system
extern "systemd-analyze smbios11" [
	--system					# Operates on the system systemd instance
	--user					# Operates on the user systemd instance
	--global					# Operates on the system-wide configuration for user systemd instance
	--order					# dot: show only After and Before dependencies
	--require					# dot: show only Requires, Requisite, Wants and Conflicts dependencies
	--from-pattern					# dot: show relationships matching left-hand nodes pattern
	--to-pattern					# dot: show relationships matching right-hand nodes pattern
	--man					# Do not invoke man to verify the existence of man pages
	--generators					# Invoke unit generators
	--root					# With cat-files, show config files underneath the specified root path
	--image-policy					# Disk image dissection policy
	--tldr					# cat-config: skip comments, empty lines and section headers
	--table					# plot: output raw time data in a table
	--no-legend					# plot: exclude legends/hints
	--detailed					# plot: show activation timestamps details in SVG plot
	--host(-H)					# Execute the operation on a remote host
	--machine(-M)					# Execute operation on a VM or container
	--help(-h)					# Print a short help and exit
	--version					# Print a short version and exit
	--no-pager					# Do not pipe output into a pager
	...args
]