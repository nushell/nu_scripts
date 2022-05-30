# Display help and exit
extern "apt-config" [
	--help(-h)					# Display help and exit
	--version(-v)					# Display version and exit
	...args
]

# Access config file from shell
extern "apt-config shell" [
	--help(-h)					# Display help and exit
	--version(-v)					# Display version and exit
	...args
]

# Dump contents of config file
extern "apt-config dump" [
	--help(-h)					# Display help and exit
	--version(-v)					# Display version and exit
	...args
]