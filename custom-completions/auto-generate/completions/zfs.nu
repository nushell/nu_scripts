# Display a help message
extern "zfs ?" [

	...args
]

# Create a volume or filesystem
extern "zfs create" [

	...args
]

# Destroy a dataset
extern "zfs destroy" [

	...args
]

# Create a snapshot
extern "zfs snapshot snap" [

	...args
]

# Roll back a filesystem to a previous snapshot
extern "zfs rollback" [

	...args
]

# Create a clone of a snapshot
extern "zfs clone" [

	...args
]

# Promotes a clone file system to no longer be dependent on its "origin" snapshot
extern "zfs promote" [

	...args
]

# Rename a dataset
extern "zfs rename" [

	...args
]

# List dataset properties
extern "zfs list" [

	...args
]

# Set a dataset property
extern "zfs set" [

	...args
]

# Get one or several dataset properties
extern "zfs get" [

	...args
]

# Set a dataset property to be inherited
extern "zfs inherit" [

	...args
]

# List upgradeable datasets, or upgrade one
extern "zfs upgrade" [

	...args
]

# Get dataset space consumed by each user
extern "zfs userspace" [

	...args
]

# Get dataset space consumed by each user group
extern "zfs groupspace" [

	...args
]

# Mount a filesystem
extern "zfs mount" [

	...args
]

# Unmount a filesystem
extern "zfs unmount umount" [

	...args
]

# Share a given filesystem, or all of them
extern "zfs share" [

	...args
]

# Stop sharing a given filesystem, or all of them
extern "zfs unshare" [

	...args
]

# Output a stream representation of a dataset
extern "zfs send" [

	...args
]

# Write on disk a dataset from the stream representation given on standard input
extern "zfs receive recv" [

	...args
]

# Delegate, or display delegations of, rights on a dataset to (groups of) users
extern "zfs allow" [

	...args
]

# Revoke delegations of rights on a dataset from (groups of) users
extern "zfs unallow" [

	...args
]

# Put a named hold on a snapshot
extern "zfs hold" [

	...args
]

# List holds on a snapshot
extern "zfs holds" [

	...args
]

# Remove a named hold from a snapshot
extern "zfs release" [

	...args
]

# List changed files between a snapshot, and a filesystem or a previous snapshot
extern "zfs diff" [

	...args
]

# Create all needed non-existing parent datasets
extern "zfs" [

	...args
]