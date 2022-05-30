# Override location of yadm repository
extern "yadm" [

	...args
]

# Print yadm version
extern "yadm version" [

	...args
]

# Initialize new repository for tracking dotfiles
extern "yadm init" [

	...args
]

# Manage configuration for yadm
extern "yadm config" [

	...args
]

# Print list of files managed by yadm
extern "yadm list" [

	...args
]

# Execute bootstrap script
extern "yadm bootstrap" [

	...args
]

# Encrypt files matched by encrypt spec file
extern "yadm encrypt" [

	...args
]

# Decrypt files matched by encrypt spec file
extern "yadm decrypt" [

	...args
]

# Setup and process alternate files
extern "yadm alt" [

	...args
]

# Update permissions
extern "yadm perms" [

	...args
]

# Run sub-shell with all git variables set
extern "yadm enter" [

	...args
]

# Pass options to git-crypt if installed
extern "yadm git-crypt" [

	...args
]

# Pass options to the git config command
extern "yadm gitconfig" [

	...args
]

# Migrate from v1 to v2
extern "yadm upgrade" [

	...args
]

# Report internal yadm data
extern "yadm introspect" [

	...args
]

# Clone remote repository for tracking dotfiles
extern "yadm clone" [
	--bootstrap					# Force run the bootstrap script
	--no-bootstrap					# Do not execute bootstrap script
	...args
]