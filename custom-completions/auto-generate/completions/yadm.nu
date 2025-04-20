# Override location of yadm repository
extern "yadm" [
	--yadm-repo					# Override location of yadm repository
	--yadm-config					# Override location of yadm configuration file
	--yadm-encrypt					# Override location of yadm encryption configuration
	--yadm-archive					# Override location of yadm encrypted files archive
	--yadm-bootstrap					# Override location of yadm bootstrap program
	--bootstrap					# Force run the bootstrap script
	--no-bootstrap					# Do not execute bootstrap script
	...args
]

# Print yadm version
extern "yadm version" [
	--yadm-repo					# Override location of yadm repository
	--yadm-config					# Override location of yadm configuration file
	--yadm-encrypt					# Override location of yadm encryption configuration
	--yadm-archive					# Override location of yadm encrypted files archive
	--yadm-bootstrap					# Override location of yadm bootstrap program
	--bootstrap					# Force run the bootstrap script
	--no-bootstrap					# Do not execute bootstrap script
	...args
]

# Initialize new repository for tracking dotfiles
extern "yadm init" [
	--yadm-repo					# Override location of yadm repository
	--yadm-config					# Override location of yadm configuration file
	--yadm-encrypt					# Override location of yadm encryption configuration
	--yadm-archive					# Override location of yadm encrypted files archive
	--yadm-bootstrap					# Override location of yadm bootstrap program
	--bootstrap					# Force run the bootstrap script
	--no-bootstrap					# Do not execute bootstrap script
	...args
]

# Manage configuration for yadm
extern "yadm config" [
	--yadm-repo					# Override location of yadm repository
	--yadm-config					# Override location of yadm configuration file
	--yadm-encrypt					# Override location of yadm encryption configuration
	--yadm-archive					# Override location of yadm encrypted files archive
	--yadm-bootstrap					# Override location of yadm bootstrap program
	--bootstrap					# Force run the bootstrap script
	--no-bootstrap					# Do not execute bootstrap script
	...args
]

# Print list of files managed by yadm
extern "yadm list" [
	--yadm-repo					# Override location of yadm repository
	--yadm-config					# Override location of yadm configuration file
	--yadm-encrypt					# Override location of yadm encryption configuration
	--yadm-archive					# Override location of yadm encrypted files archive
	--yadm-bootstrap					# Override location of yadm bootstrap program
	--bootstrap					# Force run the bootstrap script
	--no-bootstrap					# Do not execute bootstrap script
	...args
]

# Execute bootstrap script
extern "yadm bootstrap" [
	--yadm-repo					# Override location of yadm repository
	--yadm-config					# Override location of yadm configuration file
	--yadm-encrypt					# Override location of yadm encryption configuration
	--yadm-archive					# Override location of yadm encrypted files archive
	--yadm-bootstrap					# Override location of yadm bootstrap program
	--bootstrap					# Force run the bootstrap script
	--no-bootstrap					# Do not execute bootstrap script
	...args
]

# Encrypt files matched by encrypt spec file
extern "yadm encrypt" [
	--yadm-repo					# Override location of yadm repository
	--yadm-config					# Override location of yadm configuration file
	--yadm-encrypt					# Override location of yadm encryption configuration
	--yadm-archive					# Override location of yadm encrypted files archive
	--yadm-bootstrap					# Override location of yadm bootstrap program
	--bootstrap					# Force run the bootstrap script
	--no-bootstrap					# Do not execute bootstrap script
	...args
]

# Decrypt files matched by encrypt spec file
extern "yadm decrypt" [
	--yadm-repo					# Override location of yadm repository
	--yadm-config					# Override location of yadm configuration file
	--yadm-encrypt					# Override location of yadm encryption configuration
	--yadm-archive					# Override location of yadm encrypted files archive
	--yadm-bootstrap					# Override location of yadm bootstrap program
	--bootstrap					# Force run the bootstrap script
	--no-bootstrap					# Do not execute bootstrap script
	...args
]

# Setup and process alternate files
extern "yadm alt" [
	--yadm-repo					# Override location of yadm repository
	--yadm-config					# Override location of yadm configuration file
	--yadm-encrypt					# Override location of yadm encryption configuration
	--yadm-archive					# Override location of yadm encrypted files archive
	--yadm-bootstrap					# Override location of yadm bootstrap program
	--bootstrap					# Force run the bootstrap script
	--no-bootstrap					# Do not execute bootstrap script
	...args
]

# Update permissions
extern "yadm perms" [
	--yadm-repo					# Override location of yadm repository
	--yadm-config					# Override location of yadm configuration file
	--yadm-encrypt					# Override location of yadm encryption configuration
	--yadm-archive					# Override location of yadm encrypted files archive
	--yadm-bootstrap					# Override location of yadm bootstrap program
	--bootstrap					# Force run the bootstrap script
	--no-bootstrap					# Do not execute bootstrap script
	...args
]

# Run sub-shell with all git variables set
extern "yadm enter" [
	--yadm-repo					# Override location of yadm repository
	--yadm-config					# Override location of yadm configuration file
	--yadm-encrypt					# Override location of yadm encryption configuration
	--yadm-archive					# Override location of yadm encrypted files archive
	--yadm-bootstrap					# Override location of yadm bootstrap program
	--bootstrap					# Force run the bootstrap script
	--no-bootstrap					# Do not execute bootstrap script
	...args
]

# Pass options to git-crypt if installed
extern "yadm git-crypt" [
	--yadm-repo					# Override location of yadm repository
	--yadm-config					# Override location of yadm configuration file
	--yadm-encrypt					# Override location of yadm encryption configuration
	--yadm-archive					# Override location of yadm encrypted files archive
	--yadm-bootstrap					# Override location of yadm bootstrap program
	--bootstrap					# Force run the bootstrap script
	--no-bootstrap					# Do not execute bootstrap script
	...args
]

# Pass options to the git config command
extern "yadm gitconfig" [
	--yadm-repo					# Override location of yadm repository
	--yadm-config					# Override location of yadm configuration file
	--yadm-encrypt					# Override location of yadm encryption configuration
	--yadm-archive					# Override location of yadm encrypted files archive
	--yadm-bootstrap					# Override location of yadm bootstrap program
	--bootstrap					# Force run the bootstrap script
	--no-bootstrap					# Do not execute bootstrap script
	...args
]

# Migrate from v1 to v2
extern "yadm upgrade" [
	--yadm-repo					# Override location of yadm repository
	--yadm-config					# Override location of yadm configuration file
	--yadm-encrypt					# Override location of yadm encryption configuration
	--yadm-archive					# Override location of yadm encrypted files archive
	--yadm-bootstrap					# Override location of yadm bootstrap program
	--bootstrap					# Force run the bootstrap script
	--no-bootstrap					# Do not execute bootstrap script
	...args
]

# Report internal yadm data
extern "yadm introspect" [
	--yadm-repo					# Override location of yadm repository
	--yadm-config					# Override location of yadm configuration file
	--yadm-encrypt					# Override location of yadm encryption configuration
	--yadm-archive					# Override location of yadm encrypted files archive
	--yadm-bootstrap					# Override location of yadm bootstrap program
	--bootstrap					# Force run the bootstrap script
	--no-bootstrap					# Do not execute bootstrap script
	...args
]

# Clone remote repository for tracking dotfiles
extern "yadm clone" [
	--yadm-repo					# Override location of yadm repository
	--yadm-config					# Override location of yadm configuration file
	--yadm-encrypt					# Override location of yadm encryption configuration
	--yadm-archive					# Override location of yadm encrypted files archive
	--yadm-bootstrap					# Override location of yadm bootstrap program
	--bootstrap					# Force run the bootstrap script
	--no-bootstrap					# Do not execute bootstrap script
	...args
]