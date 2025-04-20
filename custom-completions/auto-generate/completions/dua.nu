# Display apparent size instead of disk usage
extern "dua" [
	--apparent-size(-A)					# Display apparent size instead of disk usage
	--help(-h)					# Print help information
	--ignore-dirs(-i)					# One or more absolute directories to ignore
	--count-hard-links(-l)					# Count hard-linked files each time they are seen
	--version(-V)					# Print version information
	--stay-on-filesystem(-x)					# If set, we will not cross filesystems or traverse mount points
	--no-sort					# Do not sort paths by their size in bytes
	--no-total					# Do not compute total column for multiple inputs
	--stats					# Print additional statistics about the file traversal to stderr
	...args
]

# Aggregate the consumed space of one or more directories or files
extern "dua aggregate" [
	--apparent-size(-A)					# Display apparent size instead of disk usage
	--help(-h)					# Print help information
	--ignore-dirs(-i)					# One or more absolute directories to ignore
	--count-hard-links(-l)					# Count hard-linked files each time they are seen
	--version(-V)					# Print version information
	--stay-on-filesystem(-x)					# If set, we will not cross filesystems or traverse mount points
	--no-sort					# Do not sort paths by their size in bytes
	--no-total					# Do not compute total column for multiple inputs
	--stats					# Print additional statistics about the file traversal to stderr
	...args
]

# Aggregate the consumed space of one or more directories or files
extern "dua a" [
	--apparent-size(-A)					# Display apparent size instead of disk usage
	--help(-h)					# Print help information
	--ignore-dirs(-i)					# One or more absolute directories to ignore
	--count-hard-links(-l)					# Count hard-linked files each time they are seen
	--version(-V)					# Print version information
	--stay-on-filesystem(-x)					# If set, we will not cross filesystems or traverse mount points
	--no-sort					# Do not sort paths by their size in bytes
	--no-total					# Do not compute total column for multiple inputs
	--stats					# Print additional statistics about the file traversal to stderr
	...args
]

# Print help message or the help of the given subcommand(s)
extern "dua help" [
	--apparent-size(-A)					# Display apparent size instead of disk usage
	--help(-h)					# Print help information
	--ignore-dirs(-i)					# One or more absolute directories to ignore
	--count-hard-links(-l)					# Count hard-linked files each time they are seen
	--version(-V)					# Print version information
	--stay-on-filesystem(-x)					# If set, we will not cross filesystems or traverse mount points
	--no-sort					# Do not sort paths by their size in bytes
	--no-total					# Do not compute total column for multiple inputs
	--stats					# Print additional statistics about the file traversal to stderr
	...args
]

# Launch the terminal user interface
extern "dua interactive" [
	--apparent-size(-A)					# Display apparent size instead of disk usage
	--help(-h)					# Print help information
	--ignore-dirs(-i)					# One or more absolute directories to ignore
	--count-hard-links(-l)					# Count hard-linked files each time they are seen
	--version(-V)					# Print version information
	--stay-on-filesystem(-x)					# If set, we will not cross filesystems or traverse mount points
	--no-sort					# Do not sort paths by their size in bytes
	--no-total					# Do not compute total column for multiple inputs
	--stats					# Print additional statistics about the file traversal to stderr
	...args
]

# Launch the terminal user interface
extern "dua i" [
	--apparent-size(-A)					# Display apparent size instead of disk usage
	--help(-h)					# Print help information
	--ignore-dirs(-i)					# One or more absolute directories to ignore
	--count-hard-links(-l)					# Count hard-linked files each time they are seen
	--version(-V)					# Print version information
	--stay-on-filesystem(-x)					# If set, we will not cross filesystems or traverse mount points
	--no-sort					# Do not sort paths by their size in bytes
	--no-total					# Do not compute total column for multiple inputs
	--stats					# Print additional statistics about the file traversal to stderr
	...args
]