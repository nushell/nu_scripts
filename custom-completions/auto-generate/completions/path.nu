# Display help and exit
extern "path" [
	--help(-h)					# Display help and exit
	--quiet(-q)					# Only return status, no output
	--null-in(-z)					# Handle NULL-delimited input
	--null-out(-Z)					# Print NULL-delimited output
	--no-extension(-E)					# Remove the extension
	--invert(-v)					# Invert meaning of filters
	--relative(-R)					# Show seconds since the modification time
	--unique(-u)					# Only leave the first of each run with the same key
	--reverse(-r)					# Reverse the order
	...args
]

# Give basename for given paths
extern "path basename" [
	--help(-h)					# Display help and exit
	--quiet(-q)					# Only return status, no output
	--null-in(-z)					# Handle NULL-delimited input
	--null-out(-Z)					# Print NULL-delimited output
	--no-extension(-E)					# Remove the extension
	--invert(-v)					# Invert meaning of filters
	--relative(-R)					# Show seconds since the modification time
	--unique(-u)					# Only leave the first of each run with the same key
	--reverse(-r)					# Reverse the order
	...args
]

# Give dirname for given paths
extern "path dirname" [
	--help(-h)					# Display help and exit
	--quiet(-q)					# Only return status, no output
	--null-in(-z)					# Handle NULL-delimited input
	--null-out(-Z)					# Print NULL-delimited output
	--no-extension(-E)					# Remove the extension
	--invert(-v)					# Invert meaning of filters
	--relative(-R)					# Show seconds since the modification time
	--unique(-u)					# Only leave the first of each run with the same key
	--reverse(-r)					# Reverse the order
	...args
]

# Give extension for given paths
extern "path extension" [
	--help(-h)					# Display help and exit
	--quiet(-q)					# Only return status, no output
	--null-in(-z)					# Handle NULL-delimited input
	--null-out(-Z)					# Print NULL-delimited output
	--no-extension(-E)					# Remove the extension
	--invert(-v)					# Invert meaning of filters
	--relative(-R)					# Show seconds since the modification time
	--unique(-u)					# Only leave the first of each run with the same key
	--reverse(-r)					# Reverse the order
	...args
]

# Change extension for given paths
extern "path change-extension" [
	--help(-h)					# Display help and exit
	--quiet(-q)					# Only return status, no output
	--null-in(-z)					# Handle NULL-delimited input
	--null-out(-Z)					# Print NULL-delimited output
	--no-extension(-E)					# Remove the extension
	--invert(-v)					# Invert meaning of filters
	--relative(-R)					# Show seconds since the modification time
	--unique(-u)					# Only leave the first of each run with the same key
	--reverse(-r)					# Reverse the order
	...args
]

# Show modification time
extern "path mtime" [
	--help(-h)					# Display help and exit
	--quiet(-q)					# Only return status, no output
	--null-in(-z)					# Handle NULL-delimited input
	--null-out(-Z)					# Print NULL-delimited output
	--no-extension(-E)					# Remove the extension
	--invert(-v)					# Invert meaning of filters
	--relative(-R)					# Show seconds since the modification time
	--unique(-u)					# Only leave the first of each run with the same key
	--reverse(-r)					# Reverse the order
	...args
]

# Normalize given paths (remove ./, resolve ../ against other components..)
extern "path normalize" [
	--help(-h)					# Display help and exit
	--quiet(-q)					# Only return status, no output
	--null-in(-z)					# Handle NULL-delimited input
	--null-out(-Z)					# Print NULL-delimited output
	--no-extension(-E)					# Remove the extension
	--invert(-v)					# Invert meaning of filters
	--relative(-R)					# Show seconds since the modification time
	--unique(-u)					# Only leave the first of each run with the same key
	--reverse(-r)					# Reverse the order
	...args
]

# Normalize given paths and resolve symlinks
extern "path resolve" [
	--help(-h)					# Display help and exit
	--quiet(-q)					# Only return status, no output
	--null-in(-z)					# Handle NULL-delimited input
	--null-out(-Z)					# Print NULL-delimited output
	--no-extension(-E)					# Remove the extension
	--invert(-v)					# Invert meaning of filters
	--relative(-R)					# Show seconds since the modification time
	--unique(-u)					# Only leave the first of each run with the same key
	--reverse(-r)					# Reverse the order
	...args
]

# Print paths that match a filter
extern "path filter" [
	--help(-h)					# Display help and exit
	--quiet(-q)					# Only return status, no output
	--null-in(-z)					# Handle NULL-delimited input
	--null-out(-Z)					# Print NULL-delimited output
	--no-extension(-E)					# Remove the extension
	--invert(-v)					# Invert meaning of filters
	--relative(-R)					# Show seconds since the modification time
	--unique(-u)					# Only leave the first of each run with the same key
	--reverse(-r)					# Reverse the order
	...args
]

# Return true if any path matched a filter
extern "path is" [
	--help(-h)					# Display help and exit
	--quiet(-q)					# Only return status, no output
	--null-in(-z)					# Handle NULL-delimited input
	--null-out(-Z)					# Print NULL-delimited output
	--no-extension(-E)					# Remove the extension
	--invert(-v)					# Invert meaning of filters
	--relative(-R)					# Show seconds since the modification time
	--unique(-u)					# Only leave the first of each run with the same key
	--reverse(-r)					# Reverse the order
	...args
]

# Sort paths
extern "path sort" [
	--help(-h)					# Display help and exit
	--quiet(-q)					# Only return status, no output
	--null-in(-z)					# Handle NULL-delimited input
	--null-out(-Z)					# Print NULL-delimited output
	--no-extension(-E)					# Remove the extension
	--invert(-v)					# Invert meaning of filters
	--relative(-R)					# Show seconds since the modification time
	--unique(-u)					# Only leave the first of each run with the same key
	--reverse(-r)					# Reverse the order
	...args
]