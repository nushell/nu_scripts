# Only send ipc message and suppress output
extern "i3-msg" [
	--quiet(-q)					# Only send ipc message and suppress output
	--version(-v)					# Display version number and exit
	--help(-h)					# Display help and exit
	--socket(-s)					# Set socket
	...args
]