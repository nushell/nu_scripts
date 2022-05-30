# Generate master file
extern "apt-move get" [

	...args
]

# Alias for 'get'
extern "apt-move getlocal" [

	...args
]

# Move packages to local tree
extern "apt-move move" [

	...args
]

# Delete obsolete package files
extern "apt-move delete" [

	...args
]

# Build new local files
extern "apt-move packages" [

	...args
]

# Rebuild index files
extern "apt-move fsck" [

	...args
]

# Move packages from cache to local mirror
extern "apt-move update" [

	...args
]

# Alias for 'move delete packages'
extern "apt-move local" [

	...args
]

# Alias for 'update'
extern "apt-move localupdate" [

	...args
]

# Download package missing from mirror
extern "apt-move mirror" [

	...args
]

# Sync packages installed
extern "apt-move sync" [

	...args
]

# test $LOCALDIR/.exclude file
extern "apt-move exclude" [

	...args
]

# Move file specified on commandline
extern "apt-move movefile" [

	...args
]

# List packages that may serve as input to mirrorbin or mirrorsource
extern "apt-move listbin" [

	...args
]

# Fetch package from STDIN
extern "apt-move mirrorbin" [

	...args
]

# Fetch source package from STDIN
extern "apt-move mirrorsrc" [

	...args
]

# Process all packages
extern "apt-move" [

	...args
]