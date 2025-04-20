# Show help and exit
extern "firejail" [
	--help					# Show help and exit
	--version					# Show version and exit
	--debug					# Print debug info
	--debug-blacklists					# Debug blacklisting
	--debug-whitelists					# Debug whitelisting
	--debug-caps					# Print known capabilities and exit
	--debug-errnos					# Print known error numbers and exit
	--debug-private-lib					# Debug --private-lib
	--debug-protocols					# Print known protocols and exit
	--debug-syscalls					# Print known syscalls and exit
	--debug-syscalls32					# Print known 32-bit syscalls and exit
	--list					# List all sandboxes
	--tree					# Print a tree of all sandboxes
	--top					# Monitor sandboxes (like `top`)
	--shutdown					# Show help and exit
	...args
]