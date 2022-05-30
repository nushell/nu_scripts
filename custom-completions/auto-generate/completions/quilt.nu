# Show help
extern "quilt" [
	--version					# Show version
	--quiltrc					# Give the config file to use
	--trace					# Runs the command in bash trace mode (-x). For internal debugging
	...args
]

# Fork the topmost patch
extern "quilt fork" [
	--version					# Show version
	--quiltrc					# Give the config file to use
	--trace					# Runs the command in bash trace mode (-x). For internal debugging
	...args
]

# Generates a dot directed graph of patch dependencies
extern "quilt graph" [
	--version					# Show version
	--quiltrc					# Give the config file to use
	--trace					# Runs the command in bash trace mode (-x). For internal debugging
	...args
]

# Grep through source files recursively
extern "quilt grep" [
	--version					# Show version
	--quiltrc					# Give the config file to use
	--trace					# Runs the command in bash trace mode (-x). For internal debugging
	...args
]

# Print/change the header of the topmost/given patch
extern "quilt header" [
	--version					# Show version
	--quiltrc					# Give the config file to use
	--trace					# Runs the command in bash trace mode (-x). For internal debugging
	...args
]

# Print the names of all patches in the series file
extern "quilt series" [
	--version					# Show version
	--quiltrc					# Give the config file to use
	--trace					# Runs the command in bash trace mode (-x). For internal debugging
	...args
]

# Take a snapshot of the current working state
extern "quilt snapshot" [
	--version					# Show version
	--quiltrc					# Give the config file to use
	--trace					# Runs the command in bash trace mode (-x). For internal debugging
	...args
]

# Prints name of the topmost patch in the current stack of applied patches
extern "quilt top" [
	--version					# Show version
	--quiltrc					# Give the config file to use
	--trace					# Runs the command in bash trace mode (-x). For internal debugging
	...args
]

# Upgrade meta-data in a working tree to the current version of quilt
extern "quilt upgrade" [
	--version					# Show version
	--quiltrc					# Give the config file to use
	--trace					# Runs the command in bash trace mode (-x). For internal debugging
	...args
]