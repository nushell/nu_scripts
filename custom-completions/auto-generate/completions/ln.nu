# Make a backup of each existing destination file
extern "ln none off numbered t existing nil simple never" [
	--backup					# Make a backup of each existing destination file
	--directory(-d)					# Allow superuser to attempt to hard link directories
	--force(-f)					# Remove existing destination files
	--interactive(-i)					# Prompt whether to remove destinations
	--logical(-L)					# Dereference TARGETs that are symbolic links
	--no-dereference(-n)					# Treat symlink to directory as if it were a file
	--physical(-P)					# Make hard links directly to symbolic links
	--relative(-r)					# With -s, create links relative to link location
	--symbolic(-s)					# Make symbolic links instead of hard links
	--suffix(-S)					# Override the usual ~ backup suffix
	--no-target-directory(-T)					# Treat LINK_NAME as a normal file
	--verbose(-v)					# Print name of each linked file
	--help					# Display help and exit
	--version					# Output version information and exit
	...args
]

# Make a backup of each existing destination file
extern "ln" [
	--backup					# Make a backup of each existing destination file
	--directory(-d)					# Allow superuser to attempt to hard link directories
	--force(-f)					# Remove existing destination files
	--interactive(-i)					# Prompt whether to remove destinations
	--logical(-L)					# Dereference TARGETs that are symbolic links
	--no-dereference(-n)					# Treat symlink to directory as if it were a file
	--physical(-P)					# Make hard links directly to symbolic links
	--relative(-r)					# With -s, create links relative to link location
	--symbolic(-s)					# Make symbolic links instead of hard links
	--suffix(-S)					# Override the usual ~ backup suffix
	--no-target-directory(-T)					# Treat LINK_NAME as a normal file
	--verbose(-v)					# Print name of each linked file
	--help					# Display help and exit
	--version					# Output version information and exit
	...args
]