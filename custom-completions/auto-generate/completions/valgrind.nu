# Skin
extern "" [
	--$skin					# Skin
	--trace-children					# Valgrind-ise children
	--track-fds					# Track file descriptors
	--log-fd					# Log to file descriptor
	--log-file					# Log to file
	--logsocket					# Log to socket
	--num-callers					# Callers in stack trace
	--error-limit					# Stop showing errors if too many
	--show-below-main					# Continue trace below main()
	--suppressions					# Suppress errors from file
	--db-attach					# Start debugger on error
	--db-command					# Debugger command
	--input-fd					# File descriptor for input
	--leak-check					# Check for memory leaks
	--show-reachable					# Show reachable leaked memory
	--leak-resolution					# Determines how willingly Memcheck considers different backtraces to be the same
	--freelist-vol					# Set size of freed memory pool
	--partial-loads-ok					# How to handle loads of words that are partially addressable
	--avoid-strlen-errors					# Whether to skip error reporting for the strlen function
	--leak-check					# Check for memory leaks
	--show-reachable					# Show reachable leaked memory
	--leak-resolution					# Determines how willingly Addrcheck considers different backtraces to be the same
	--freelist-vol					# Set size of freed memory pool
	--partial-loads-ok					# How to handle loads of words that are partially addressable
	--avoid-strlen-errors					# Whether to skip error reporting for the strlen function
	--I1					# Type of L1 instruction cache
	--D1					# Type of L1 data cache
	--L2					# Type of L2 cache
	...args
]

# Valgrind-ise children
extern "yes no" [
	--$skin					# Skin
	--trace-children					# Valgrind-ise children
	--track-fds					# Track file descriptors
	--log-fd					# Log to file descriptor
	--log-file					# Log to file
	--logsocket					# Log to socket
	--num-callers					# Callers in stack trace
	--error-limit					# Stop showing errors if too many
	--show-below-main					# Continue trace below main()
	--suppressions					# Suppress errors from file
	--db-attach					# Start debugger on error
	--db-command					# Debugger command
	--input-fd					# File descriptor for input
	--leak-check					# Check for memory leaks
	--show-reachable					# Show reachable leaked memory
	--leak-resolution					# Determines how willingly Memcheck considers different backtraces to be the same
	--freelist-vol					# Set size of freed memory pool
	--partial-loads-ok					# How to handle loads of words that are partially addressable
	--avoid-strlen-errors					# Whether to skip error reporting for the strlen function
	--leak-check					# Check for memory leaks
	--show-reachable					# Show reachable leaked memory
	--leak-resolution					# Determines how willingly Addrcheck considers different backtraces to be the same
	--freelist-vol					# Set size of freed memory pool
	--partial-loads-ok					# How to handle loads of words that are partially addressable
	--avoid-strlen-errors					# Whether to skip error reporting for the strlen function
	--I1					# Type of L1 instruction cache
	--D1					# Type of L1 data cache
	--L2					# Type of L2 cache
	...args
]

# Log to file descriptor
extern "0 1 2 3 4 5 6 7 8 9" [
	--$skin					# Skin
	--trace-children					# Valgrind-ise children
	--track-fds					# Track file descriptors
	--log-fd					# Log to file descriptor
	--log-file					# Log to file
	--logsocket					# Log to socket
	--num-callers					# Callers in stack trace
	--error-limit					# Stop showing errors if too many
	--show-below-main					# Continue trace below main()
	--suppressions					# Suppress errors from file
	--db-attach					# Start debugger on error
	--db-command					# Debugger command
	--input-fd					# File descriptor for input
	--leak-check					# Check for memory leaks
	--show-reachable					# Show reachable leaked memory
	--leak-resolution					# Determines how willingly Memcheck considers different backtraces to be the same
	--freelist-vol					# Set size of freed memory pool
	--partial-loads-ok					# How to handle loads of words that are partially addressable
	--avoid-strlen-errors					# Whether to skip error reporting for the strlen function
	--leak-check					# Check for memory leaks
	--show-reachable					# Show reachable leaked memory
	--leak-resolution					# Determines how willingly Addrcheck considers different backtraces to be the same
	--freelist-vol					# Set size of freed memory pool
	--partial-loads-ok					# How to handle loads of words that are partially addressable
	--avoid-strlen-errors					# Whether to skip error reporting for the strlen function
	--I1					# Type of L1 instruction cache
	--D1					# Type of L1 data cache
	--L2					# Type of L2 cache
	...args
]

# Check for memory leaks
extern "no\tDon\'t\ check\ for\ memory\ leaks summary\t'Show a leak summary' full\t'Describe memory leaks in detail'" [
	--$skin					# Skin
	--trace-children					# Valgrind-ise children
	--track-fds					# Track file descriptors
	--log-fd					# Log to file descriptor
	--log-file					# Log to file
	--logsocket					# Log to socket
	--num-callers					# Callers in stack trace
	--error-limit					# Stop showing errors if too many
	--show-below-main					# Continue trace below main()
	--suppressions					# Suppress errors from file
	--db-attach					# Start debugger on error
	--db-command					# Debugger command
	--input-fd					# File descriptor for input
	--leak-check					# Check for memory leaks
	--show-reachable					# Show reachable leaked memory
	--leak-resolution					# Determines how willingly Memcheck considers different backtraces to be the same
	--freelist-vol					# Set size of freed memory pool
	--partial-loads-ok					# How to handle loads of words that are partially addressable
	--avoid-strlen-errors					# Whether to skip error reporting for the strlen function
	--leak-check					# Check for memory leaks
	--show-reachable					# Show reachable leaked memory
	--leak-resolution					# Determines how willingly Addrcheck considers different backtraces to be the same
	--freelist-vol					# Set size of freed memory pool
	--partial-loads-ok					# How to handle loads of words that are partially addressable
	--avoid-strlen-errors					# Whether to skip error reporting for the strlen function
	--I1					# Type of L1 instruction cache
	--D1					# Type of L1 data cache
	--L2					# Type of L2 cache
	...args
]

# Show reachable leaked memory
extern "yes\t'Show reachable leaked memory' no\t'Do not show reachable leaked memory'" [
	--$skin					# Skin
	--trace-children					# Valgrind-ise children
	--track-fds					# Track file descriptors
	--log-fd					# Log to file descriptor
	--log-file					# Log to file
	--logsocket					# Log to socket
	--num-callers					# Callers in stack trace
	--error-limit					# Stop showing errors if too many
	--show-below-main					# Continue trace below main()
	--suppressions					# Suppress errors from file
	--db-attach					# Start debugger on error
	--db-command					# Debugger command
	--input-fd					# File descriptor for input
	--leak-check					# Check for memory leaks
	--show-reachable					# Show reachable leaked memory
	--leak-resolution					# Determines how willingly Memcheck considers different backtraces to be the same
	--freelist-vol					# Set size of freed memory pool
	--partial-loads-ok					# How to handle loads of words that are partially addressable
	--avoid-strlen-errors					# Whether to skip error reporting for the strlen function
	--leak-check					# Check for memory leaks
	--show-reachable					# Show reachable leaked memory
	--leak-resolution					# Determines how willingly Addrcheck considers different backtraces to be the same
	--freelist-vol					# Set size of freed memory pool
	--partial-loads-ok					# How to handle loads of words that are partially addressable
	--avoid-strlen-errors					# Whether to skip error reporting for the strlen function
	--I1					# Type of L1 instruction cache
	--D1					# Type of L1 data cache
	--L2					# Type of L2 cache
	...args
]

# Determines how willingly Memcheck considers different backtraces to be the same
extern "low\t'Two entries need to match' med\t'Four entries need to match' high\t'All entries need to match'" [
	--$skin					# Skin
	--trace-children					# Valgrind-ise children
	--track-fds					# Track file descriptors
	--log-fd					# Log to file descriptor
	--log-file					# Log to file
	--logsocket					# Log to socket
	--num-callers					# Callers in stack trace
	--error-limit					# Stop showing errors if too many
	--show-below-main					# Continue trace below main()
	--suppressions					# Suppress errors from file
	--db-attach					# Start debugger on error
	--db-command					# Debugger command
	--input-fd					# File descriptor for input
	--leak-check					# Check for memory leaks
	--show-reachable					# Show reachable leaked memory
	--leak-resolution					# Determines how willingly Memcheck considers different backtraces to be the same
	--freelist-vol					# Set size of freed memory pool
	--partial-loads-ok					# How to handle loads of words that are partially addressable
	--avoid-strlen-errors					# Whether to skip error reporting for the strlen function
	--leak-check					# Check for memory leaks
	--show-reachable					# Show reachable leaked memory
	--leak-resolution					# Determines how willingly Addrcheck considers different backtraces to be the same
	--freelist-vol					# Set size of freed memory pool
	--partial-loads-ok					# How to handle loads of words that are partially addressable
	--avoid-strlen-errors					# Whether to skip error reporting for the strlen function
	--I1					# Type of L1 instruction cache
	--D1					# Type of L1 data cache
	--L2					# Type of L2 cache
	...args
]

# How to handle loads of words that are partially addressable
extern "yes\t"Do not emit errors on partial loads" no\t"Emit errors on partial loads" [
	--$skin					# Skin
	--trace-children					# Valgrind-ise children
	--track-fds					# Track file descriptors
	--log-fd					# Log to file descriptor
	--log-file					# Log to file
	--logsocket					# Log to socket
	--num-callers					# Callers in stack trace
	--error-limit					# Stop showing errors if too many
	--show-below-main					# Continue trace below main()
	--suppressions					# Suppress errors from file
	--db-attach					# Start debugger on error
	--db-command					# Debugger command
	--input-fd					# File descriptor for input
	--leak-check					# Check for memory leaks
	--show-reachable					# Show reachable leaked memory
	--leak-resolution					# Determines how willingly Memcheck considers different backtraces to be the same
	--freelist-vol					# Set size of freed memory pool
	--partial-loads-ok					# How to handle loads of words that are partially addressable
	--avoid-strlen-errors					# Whether to skip error reporting for the strlen function
	--leak-check					# Check for memory leaks
	--show-reachable					# Show reachable leaked memory
	--leak-resolution					# Determines how willingly Addrcheck considers different backtraces to be the same
	--freelist-vol					# Set size of freed memory pool
	--partial-loads-ok					# How to handle loads of words that are partially addressable
	--avoid-strlen-errors					# Whether to skip error reporting for the strlen function
	--I1					# Type of L1 instruction cache
	--D1					# Type of L1 data cache
	--L2					# Type of L2 cache
	...args
]

# Check for memory leaks
extern "no\t'Do not check for memory leaks' summary\t'Show a leak summary' full\t'Describe memory leaks in detail'" [
	--$skin					# Skin
	--trace-children					# Valgrind-ise children
	--track-fds					# Track file descriptors
	--log-fd					# Log to file descriptor
	--log-file					# Log to file
	--logsocket					# Log to socket
	--num-callers					# Callers in stack trace
	--error-limit					# Stop showing errors if too many
	--show-below-main					# Continue trace below main()
	--suppressions					# Suppress errors from file
	--db-attach					# Start debugger on error
	--db-command					# Debugger command
	--input-fd					# File descriptor for input
	--leak-check					# Check for memory leaks
	--show-reachable					# Show reachable leaked memory
	--leak-resolution					# Determines how willingly Memcheck considers different backtraces to be the same
	--freelist-vol					# Set size of freed memory pool
	--partial-loads-ok					# How to handle loads of words that are partially addressable
	--avoid-strlen-errors					# Whether to skip error reporting for the strlen function
	--leak-check					# Check for memory leaks
	--show-reachable					# Show reachable leaked memory
	--leak-resolution					# Determines how willingly Addrcheck considers different backtraces to be the same
	--freelist-vol					# Set size of freed memory pool
	--partial-loads-ok					# How to handle loads of words that are partially addressable
	--avoid-strlen-errors					# Whether to skip error reporting for the strlen function
	--I1					# Type of L1 instruction cache
	--D1					# Type of L1 data cache
	--L2					# Type of L2 cache
	...args
]

# Display help and exit
extern "valgrind" [
	--help					# Display help and exit
	--help-debug					# Display help and debug options
	--version					# Display version and exit
	--quiet(-q)					# Quiet mode
	--verbose(-v)					# Verbose mode
	--demangle
	--gen-suppressions					# Print suppressions for detected errors
	...args
]

# 
extern "valgrind yes no" [
	--help					# Display help and exit
	--help-debug					# Display help and debug options
	--version					# Display version and exit
	--quiet(-q)					# Quiet mode
	--verbose(-v)					# Verbose mode
	--demangle
	--gen-suppressions					# Print suppressions for detected errors
	...args
]