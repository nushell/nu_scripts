# Display help and exit
extern "apt-get" [

	...args
]

# Update sources
extern "apt-get update" [

	...args
]

# Upgrade or install newest packages
extern "apt-get upgrade" [

	...args
]

# Use with dselect front-end
extern "apt-get dselect-upgrade" [

	...args
]

# Distro upgrade
extern "apt-get dist-upgrade" [

	...args
]

# Install one or more packages
extern "apt-get install" [

	...args
]

# Display changelog of one or more packages
extern "apt-get changelog" [

	...args
]

# Remove and purge one or more packages
extern "apt-get purge" [

	...args
]

# Remove one or more packages
extern "apt-get remove" [

	...args
]

# Fetch source packages
extern "apt-get source" [

	...args
]

# Install/remove packages for dependencies
extern "apt-get build-dep" [

	...args
]

# Update cache and check dependencies
extern "apt-get check" [

	...args
]

# Clean local caches and packages
extern "apt-get clean" [

	...args
]

# Clean packages no longer be downloaded
extern "apt-get autoclean" [

	...args
]

# Remove automatically installed packages
extern "apt-get autoremove" [

	...args
]