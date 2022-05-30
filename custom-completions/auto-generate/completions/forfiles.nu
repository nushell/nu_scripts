# Specify the path from which to start the search
extern "forfiles /P" [

	...args
]

# Search files according to the specified search mask
extern "forfiles /M" [

	...args
]

# Instruct the forfiles command to search in subdirectories recursively
extern "forfiles /S" [

	...args
]

# Run the specified command on each file
extern "forfiles /C" [

	...args
]

# Show help
extern "forfiles /?" [

	...args
]