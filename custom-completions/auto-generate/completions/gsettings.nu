# 
extern "gsettings" [
	--version					# Print the version information
	--schemadir					# Specify a custom schemas directory
	...args
]

# Get the value of a key
extern "gsettings get" [
	--version					# Print the version information
	--schemadir					# Specify a custom schemas directory
	...args
]

# Determine if a key is writable
extern "gsettings writable" [
	--version					# Print the version information
	--schemadir					# Specify a custom schemas directory
	...args
]

# Determine the valid value range of a key
extern "gsettings range" [
	--version					# Print the version information
	--schemadir					# Specify a custom schemas directory
	...args
]

# Print the description of a key
extern "gsettings describe" [
	--version					# Print the version information
	--schemadir					# Specify a custom schemas directory
	...args
]

# Set the value of a key
extern "gsettings set" [
	--version					# Print the version information
	--schemadir					# Specify a custom schemas directory
	...args
]

# Reset a key to its default value
extern "gsettings reset" [
	--version					# Print the version information
	--schemadir					# Specify a custom schemas directory
	...args
]

# Reset all keys under the given schema
extern "gsettings reset-recursively" [
	--version					# Print the version information
	--schemadir					# Specify a custom schemas directory
	...args
]

# List all installed, non-relocatable schemas
extern "gsettings list-schemas" [
	--version					# Print the version information
	--schemadir					# Specify a custom schemas directory
	...args
]

# List all installed, relocatable schemas
extern "gsettings list-relocatable-schemas" [
	--version					# Print the version information
	--schemadir					# Specify a custom schemas directory
	...args
]

# List all keys in a schema
extern "gsettings list-keys" [
	--version					# Print the version information
	--schemadir					# Specify a custom schemas directory
	...args
]

# List all children of a schema
extern "gsettings list-children" [
	--version					# Print the version information
	--schemadir					# Specify a custom schemas directory
	...args
]

# List keys and values, recursively
extern "gsettings list-recursively" [
	--version					# Print the version information
	--schemadir					# Specify a custom schemas directory
	...args
]

# Print help
extern "gsettings help" [
	--version					# Print the version information
	--schemadir					# Specify a custom schemas directory
	...args
]