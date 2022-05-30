# Display a brief help message. Identical to the help action
extern "aptitude" [

	...args
]

# Remove any cached packages which can no longer be downloaded
extern "aptitude autoclean" [

	...args
]

# Remove all downloaded .deb files from the package cache directory
extern "aptitude clean" [

	...args
]

# Forget all internal information about what packages are new
extern "aptitude forget-new" [

	...args
]

# Cancel all scheduled actions on all packages
extern "aptitude keep-all" [

	...args
]

# Update the list of available packages from the apt sources
extern "aptitude update" [

	...args
]

# Upgrade installed packages to their most recent version
extern "aptitude safe-upgrade" [

	...args
]

# Download and displays the Debian changelog for the packages
extern "aptitude changelog" [

	...args
]

# Upgrade, removing or installing packages as necessary
extern "aptitude full-upgrade" [

	...args
]

# Download the packages to the current directory
extern "aptitude download" [

	...args
]

# Forbid the upgrade to a particular version
extern "aptitude forbid-version" [

	...args
]

# Ignore the packages by future upgrade commands
extern "aptitude hold" [

	...args
]

# Install the packages
extern "aptitude install" [

	...args
]

# Cancel any scheduled actions on the packages
extern "aptitude keep" [

	...args
]

# Mark packages as automatically installed
extern "aptitude markauto" [

	...args
]

# Remove and delete all associated configuration and data files
extern "aptitude purge" [

	...args
]

# Reinstall the packages
extern "aptitude reinstall" [

	...args
]

# Remove the packages
extern "aptitude remove" [

	...args
]

# Display detailed information about the packages
extern "aptitude show" [

	...args
]

# Consider the packages by future upgrade commands
extern "aptitude unhold" [

	...args
]

# Mark packages as manually installed
extern "aptitude unmarkauto" [

	...args
]

# Search for packages matching one of the patterns
extern "aptitude search" [

	...args
]

# Display brief summary of the available commands and options
extern "aptitude help" [

	...args
]