# 
extern "iw" [
	--debug					# Enable netlink message debugging
	--version					# Print the version
	...args
]

# Reload the kernel\'s
extern "iw reload" [
	--debug					# Enable netlink message debugging
	--version					# Print the version
	...args
]

# Print the kernel\'s
extern "iw get" [
	--debug					# Enable netlink message debugging
	--version					# Print the version
	...args
]

# Notify the kernel about the current regulatory domain
extern "iw set" [
	--debug					# Enable netlink message debugging
	--version					# Print the version
	...args
]