# Build for 32-bit Cygwin
extern "cygport" [
	--32(-4)					# Build for 32-bit Cygwin
	--64(-8)					# Build for 64-bit Cygwin
	--debug					# Enable debugging messages
	...args
]

# Cygport file
extern "cygport *.cygport" [
	--32(-4)					# Build for 32-bit Cygwin
	--64(-8)					# Build for 64-bit Cygwin
	--debug					# Enable debugging messages
	...args
]

# Download all sources
extern "cygport downloadall fetchall wgetall getall" [
	--32(-4)					# Build for 32-bit Cygwin
	--64(-8)					# Build for 64-bit Cygwin
	--debug					# Enable debugging messages
	...args
]

# Download missing sources
extern "cygport download fetch wget get" [
	--32(-4)					# Build for 32-bit Cygwin
	--64(-8)					# Build for 64-bit Cygwin
	--debug					# Enable debugging messages
	...args
]

# Prepare source directory
extern "cygport prep unpack" [
	--32(-4)					# Build for 32-bit Cygwin
	--64(-8)					# Build for 64-bit Cygwin
	--debug					# Enable debugging messages
	...args
]

# Build software
extern "cygport compile build make" [
	--32(-4)					# Build for 32-bit Cygwin
	--64(-8)					# Build for 64-bit Cygwin
	--debug					# Enable debugging messages
	...args
]

# Run test suite
extern "cygport check test" [
	--32(-4)					# Build for 32-bit Cygwin
	--64(-8)					# Build for 64-bit Cygwin
	--debug					# Enable debugging messages
	...args
]

# Install into DESTDIR and run post-installation steps
extern "cygport inst install" [
	--32(-4)					# Build for 32-bit Cygwin
	--64(-8)					# Build for 64-bit Cygwin
	--debug					# Enable debugging messages
	...args
]

# Run post-installation steps
extern "cygport postinst" [
	--32(-4)					# Build for 32-bit Cygwin
	--64(-8)					# Build for 64-bit Cygwin
	--debug					# Enable debugging messages
	...args
]

# List package files
extern "cygport list" [
	--32(-4)					# Build for 32-bit Cygwin
	--64(-8)					# Build for 64-bit Cygwin
	--debug					# Enable debugging messages
	...args
]

# List debug package files
extern "cygport listdebug listdbg" [
	--32(-4)					# Build for 32-bit Cygwin
	--64(-8)					# Build for 64-bit Cygwin
	--debug					# Enable debugging messages
	...args
]

# Show dependencies
extern "cygport dep" [
	--32(-4)					# Build for 32-bit Cygwin
	--64(-8)					# Build for 64-bit Cygwin
	--debug					# Enable debugging messages
	...args
]

# Show packaging info
extern "cygport info" [
	--32(-4)					# Build for 32-bit Cygwin
	--64(-8)					# Build for 64-bit Cygwin
	--debug					# Enable debugging messages
	...args
]

# Show project homepage URL
extern "cygport homepage web www" [
	--32(-4)					# Build for 32-bit Cygwin
	--64(-8)					# Build for 64-bit Cygwin
	--debug					# Enable debugging messages
	...args
]

# Create packages, marked as test
extern "cygport package-test pkg-test" [
	--32(-4)					# Build for 32-bit Cygwin
	--64(-8)					# Build for 64-bit Cygwin
	--debug					# Enable debugging messages
	...args
]

# Create packages
extern "cygport package pkg" [
	--32(-4)					# Build for 32-bit Cygwin
	--64(-8)					# Build for 64-bit Cygwin
	--debug					# Enable debugging messages
	...args
]

# Create source patches
extern "cygport diff mkdiff mkpatch" [
	--32(-4)					# Build for 32-bit Cygwin
	--64(-8)					# Build for 64-bit Cygwin
	--debug					# Enable debugging messages
	...args
]

# Upload finished packages
extern "cygport upload up" [
	--32(-4)					# Build for 32-bit Cygwin
	--64(-8)					# Build for 64-bit Cygwin
	--debug					# Enable debugging messages
	...args
]

# Upload packages without marking !ready
extern "cygport stage" [
	--32(-4)					# Build for 32-bit Cygwin
	--64(-8)					# Build for 64-bit Cygwin
	--debug					# Enable debugging messages
	...args
]

# Send announcement email
extern "cygport announce" [
	--32(-4)					# Build for 32-bit Cygwin
	--64(-8)					# Build for 64-bit Cygwin
	--debug					# Enable debugging messages
	...args
]

# Delete working directory
extern "cygport clean finish" [
	--32(-4)					# Build for 32-bit Cygwin
	--64(-8)					# Build for 64-bit Cygwin
	--debug					# Enable debugging messages
	...args
]

# Same as prep build inst pkg
extern "cygport almostall all" [
	--32(-4)					# Build for 32-bit Cygwin
	--64(-8)					# Build for 64-bit Cygwin
	--debug					# Enable debugging messages
	...args
]

# Show help
extern "cygport help" [
	--32(-4)					# Build for 32-bit Cygwin
	--64(-8)					# Build for 64-bit Cygwin
	--debug					# Enable debugging messages
	...args
]

# Show version
extern "cygport version" [
	--32(-4)					# Build for 32-bit Cygwin
	--64(-8)					# Build for 64-bit Cygwin
	--debug					# Enable debugging messages
	...args
]