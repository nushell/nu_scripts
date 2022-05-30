# Install the latest version of a package
extern "yum" [

	...args
]

# List all packages
extern "yum all" [

	...args
]

# List packages available for installation
extern "yum available" [

	...args
]

# List packages with updates available
extern "yum updates" [

	...args
]

# List installed packages
extern "yum installed" [

	...args
]

# List packages not available in repositories
extern "yum extras" [

	...args
]

# List packages that are obsoleted by packages in repositories
extern "yum obsoletes" [

	...args
]