# Create dirs instead of symlinks to whole dirs
extern "stow" [
	--no-folding					# Create dirs instead of symlinks to whole dirs
	--adopt					# Move existing files into stow dir if target exists (AND OVERWRITE!)
	--simulate(-n)					# Don't modify the file system
	--verbose(-v)					# Increase verbosity by 1 (levels are from 0 to 5)
	--verbose					# Increase verbosity by 1 or set it with verbose=N [0..5]
	--compat(-p)					# Use legacy algorithm for unstowing
	--version(-V)					# Show stow version number
	--help(-h)					# Show help
	...args
]

# Increase verbosity by 1 or set it with verbose=N [0..5]
extern "stow 0 1 2 3 4 5" [
	--no-folding					# Create dirs instead of symlinks to whole dirs
	--adopt					# Move existing files into stow dir if target exists (AND OVERWRITE!)
	--simulate(-n)					# Don't modify the file system
	--verbose(-v)					# Increase verbosity by 1 (levels are from 0 to 5)
	--verbose					# Increase verbosity by 1 or set it with verbose=N [0..5]
	--compat(-p)					# Use legacy algorithm for unstowing
	--version(-V)					# Show stow version number
	--help(-h)					# Show help
	...args
]