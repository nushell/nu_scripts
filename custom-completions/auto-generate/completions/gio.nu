# Print help
extern "gio help" [

	...args
]

# Print version
extern "gio version" [

	...args
]

# Concatenate files to stdout
extern "gio cat" [

	...args
]

# Copy files
extern "gio copy" [
	--no-target-directory(-T)					# No target directory
	--progress(-p)					# Show progress
	--interactive(-i)					# Prompt before overwrite
	--backup(-b)					# Backup existing destination files
	--preserve					# Preserve all attributes
	--no-dereference(-P)					# Never follow symbolic links
	--default-permissions					# Use default permissions
	...args
]

# Show information about locations
extern "gio info" [
	--nofollow-symlinks(-n)					# Don't follow symbolic links
	--query-writable(-w)					# List writable attributes
	--filesystem(-f)					# Get file system info
	...args
]

# List the contents of locations
extern "gio list" [
	--nofollow-symlinks(-n)					# Don't follow symbolic links
	--hidden(-h)					# Show hidden files
	--long(-l)					# Use a long listing format
	--print-display-names(-d)					# Print display names
	--print-uris(-u)					# Print full URIs
	...args
]

# Get or set the handler
extern "gio mime" [

	...args
]

# Create directories
extern "gio mkdir" [
	--parent(-p)					# Create parent directories
	...args
]

# Monitor files
extern "gio monitor" [
	--no-moves(-n)					# Don't report move events
	--mounts(-m)					# Watch for mount events
	...args
]

# Mount or unmount the locations
extern "gio mount" [
	--mountable(-m)					# Mount as mountable
	--unmount(-u)					# Unmount
	--eject(-e)					# Eject
	--force(-f)					# Ignore outstanding file operations
	--anonymous(-a)					# Use an anonymous user
	--list(-l)					# List
	--monitor(-o)					# Monitor events
	--detail(-i)					# Show extra information
	--tcrypt-hidden					# Mount a TCRYPT hidden volume
	--tcrypt-system					# Mount a TCRYPT system volume
	...args
]

# Move files
extern "gio move" [
	--no-target-directory(-T)					# No target directory
	--progress(-p)					# Show progress
	--interactive(-i)					# Prompt before overwrite
	--backup(-b)					# Backup existing destination files
	--force(-f)					# Ignore nonexistent files
	--no-copy-fallback(-C)					# Don't use copy and delete fallback
	...args
]

# Open files
extern "gio open" [

	...args
]

# Rename a file
extern "gio rename" [

	...args
]

# Delete files
extern "gio remove" [
	--force(-f)					# Ignore nonexistent files
	...args
]

# Read from stdin and save
extern "gio save" [
	--backup(-b)					# Backup existing destination files
	--create(-c)					# Only create if not existing
	--append(-a)					# Append to end of file
	--private(-p)					# Restrict access to the current user
	--unlink(-u)					# Replace as if the destination didn't exist
	--print-etag(-v)					# Print new etag at end
	...args
]

# Set a file attribute
extern "gio set" [
	--nofollow-symlinks(-n)					# Don't follow symbolic links
	...args
]

# Move files to the trash
extern "gio trash" [
	--force(-f)					# Ignore nonexistent files
	--empty					# Empty the trash
	...args
]

# Lists the contents of locations in a tree
extern "gio tree" [
	--hidden(-h)					# Show hidden files
	--follow-symlinks(-l)					# Follow symbolic links
	...args
]

# Command
extern "gio version cat copy info list mime mkdir monitor mount move open rename remove save set trash tree" [

	...args
]

# No target directory
extern "gio" [

	...args
]