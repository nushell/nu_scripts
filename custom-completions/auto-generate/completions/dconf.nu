# 
extern "dconf" [

	...args
]

# Read the value of a key
extern "dconf read" [

	...args
]

# List the sub-keys and sub-directories of a directory
extern "dconf list" [

	...args
]

# Write a new value to a key
extern "dconf write" [

	...args
]

# Delete a key or an entire directory
extern "dconf reset" [

	...args
]

# Compile a binary database from keyfiles
extern "dconf compile" [

	...args
]

# Update the system dconf databases
extern "dconf update" [

	...args
]

# Watch a key or directory for changes
extern "dconf watch" [

	...args
]

# Dump an entire subpath to stdout
extern "dconf dump" [

	...args
]

# Populate a subpath from stdin
extern "dconf load" [

	...args
]

# Display help and exit
extern "dconf help" [

	...args
]