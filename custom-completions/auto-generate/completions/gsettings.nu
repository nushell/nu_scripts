# 
extern "gsettings" [

	...args
]

# Get the value of a key
extern "gsettings get" [

	...args
]

# Determine if a key is writable
extern "gsettings writable" [

	...args
]

# Determine the valid value range of a key
extern "gsettings range" [

	...args
]

# Print the description of a key
extern "gsettings describe" [

	...args
]

# Set the value of a key
extern "gsettings set" [

	...args
]

# Reset a key to its default value
extern "gsettings reset" [

	...args
]

# Reset all keys under the given schema
extern "gsettings reset-recursively" [

	...args
]

# List all installed, non-relocatable schemas
extern "gsettings list-schemas" [

	...args
]

# List all installed, relocatable schemas
extern "gsettings list-relocatable-schemas" [

	...args
]

# List all keys in a schema
extern "gsettings list-keys" [

	...args
]

# List all children of a schema
extern "gsettings list-children" [

	...args
]

# List keys and values, recursively
extern "gsettings list-recursively" [

	...args
]

# Print help
extern "gsettings help" [

	...args
]