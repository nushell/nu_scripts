# Show version and config
extern "ansible-galaxy" [
	--version					# Show version and config
	--verbose(-v)					# Verbose mode (-vvv for more, -vvvv for connection debugging)
	...args
]

# 
extern "ansible-galaxy download\t'Download collections as tarball" [

	...args
]

# 
extern "ansible-galaxy init\t'Initialize new role with the base structure" [

	...args
]