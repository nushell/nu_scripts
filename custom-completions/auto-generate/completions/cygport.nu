# Build for 32-bit Cygwin
extern "cygport" [

	...args
]

# Cygport file
extern "cygport *.cygport" [

	...args
]

# Download all sources
extern "cygport downloadall fetchall wgetall getall" [

	...args
]

# Download missing sources
extern "cygport download fetch wget get" [

	...args
]

# Prepare source directory
extern "cygport prep unpack" [

	...args
]

# Build software
extern "cygport compile build make" [

	...args
]

# Run test suite
extern "cygport check test" [

	...args
]

# Install into DESTDIR and run post-installation steps
extern "cygport inst install" [

	...args
]

# Run post-installation steps
extern "cygport postinst" [

	...args
]

# List package files
extern "cygport list" [

	...args
]

# List debug package files
extern "cygport listdebug listdbg" [

	...args
]

# Show dependencies
extern "cygport dep" [

	...args
]

# Show packaging info
extern "cygport info" [

	...args
]

# Show project homepage URL
extern "cygport homepage web www" [

	...args
]

# Create packages, marked as test
extern "cygport package-test pkg-test" [

	...args
]

# Create packages
extern "cygport package pkg" [

	...args
]

# Create source patches
extern "cygport diff mkdiff mkpatch" [

	...args
]

# Upload finished packages
extern "cygport upload up" [

	...args
]

# Upload packages without marking !ready
extern "cygport stage" [

	...args
]

# Send announcement email
extern "cygport announce" [

	...args
]

# Delete working directory
extern "cygport clean finish" [

	...args
]

# Same as prep build inst pkg
extern "cygport almostall all" [

	...args
]

# Show help
extern "cygport help" [

	...args
]

# Show version
extern "cygport version" [

	...args
]