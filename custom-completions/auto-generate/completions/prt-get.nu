# Install listed ports
extern "prt-get install" [
	--cache					# Use cache
	--test					# Dry run
	--pre-install					# Exec eventual pre-install script
	--post-install					# Exec eventual post-install script
	--install-scripts					# Exec eventual pre-post-install scripts
	--prefer-higher					# Prefer higher version
	--strict-diff					# Override prefer-higher
	--log					# Write output to log file
	...args
]

# Install listed ports and their deps
extern "prt-get depinst" [
	--cache					# Use cache
	--test					# Dry run
	--pre-install					# Exec eventual pre-install script
	--post-install					# Exec eventual post-install script
	--install-scripts					# Exec eventual pre-post-install scripts
	--prefer-higher					# Prefer higher version
	--strict-diff					# Override prefer-higher
	--log					# Write output to log file
	...args
]

# Install listed ports, stop if one fails
extern "prt-get grpinst" [
	--cache					# Use cache
	--test					# Dry run
	--pre-install					# Exec eventual pre-install script
	--post-install					# Exec eventual post-install script
	--install-scripts					# Exec eventual pre-post-install scripts
	--prefer-higher					# Prefer higher version
	--strict-diff					# Override prefer-higher
	--log					# Write output to log file
	...args
]

# Update listed packages
extern "prt-get update" [
	--cache					# Use cache
	--test					# Dry run
	--pre-install					# Exec eventual pre-install script
	--post-install					# Exec eventual post-install script
	--install-scripts					# Exec eventual pre-post-install scripts
	--prefer-higher					# Prefer higher version
	--strict-diff					# Override prefer-higher
	--log					# Write output to log file
	...args
]

# Remove listed packages
extern "prt-get remove" [
	--cache					# Use cache
	--test					# Dry run
	--pre-install					# Exec eventual pre-install script
	--post-install					# Exec eventual post-install script
	--install-scripts					# Exec eventual pre-post-install scripts
	--prefer-higher					# Prefer higher version
	--strict-diff					# Override prefer-higher
	--log					# Write output to log file
	...args
]

# Update all outdated installed packages
extern "prt-get sysup" [
	--cache					# Use cache
	--test					# Dry run
	--pre-install					# Exec eventual pre-install script
	--post-install					# Exec eventual post-install script
	--install-scripts					# Exec eventual pre-post-install scripts
	--prefer-higher					# Prefer higher version
	--strict-diff					# Override prefer-higher
	--log					# Write output to log file
	...args
]

# Do not update this in sysup
extern "prt-get lock" [
	--cache					# Use cache
	--test					# Dry run
	--pre-install					# Exec eventual pre-install script
	--post-install					# Exec eventual post-install script
	--install-scripts					# Exec eventual pre-post-install scripts
	--prefer-higher					# Prefer higher version
	--strict-diff					# Override prefer-higher
	--log					# Write output to log file
	...args
]

# Remove this from lock
extern "prt-get unlock" [
	--cache					# Use cache
	--test					# Dry run
	--pre-install					# Exec eventual pre-install script
	--post-install					# Exec eventual post-install script
	--install-scripts					# Exec eventual pre-post-install scripts
	--prefer-higher					# Prefer higher version
	--strict-diff					# Override prefer-higher
	--log					# Write output to log file
	...args
]

# Print differences between installed packages and ports in the port tree
extern "prt-get diff" [
	--cache					# Use cache
	--test					# Dry run
	--pre-install					# Exec eventual pre-install script
	--post-install					# Exec eventual post-install script
	--install-scripts					# Exec eventual pre-post-install scripts
	--prefer-higher					# Prefer higher version
	--strict-diff					# Override prefer-higher
	--log					# Write output to log file
	...args
]

# Search for an expr in port names
extern "prt-get search" [
	--cache					# Use cache
	--test					# Dry run
	--pre-install					# Exec eventual pre-install script
	--post-install					# Exec eventual post-install script
	--install-scripts					# Exec eventual pre-post-install scripts
	--prefer-higher					# Prefer higher version
	--strict-diff					# Override prefer-higher
	--log					# Write output to log file
	...args
]

# Search for an expr in port names and descriptions
extern "prt-get dsearch" [
	--cache					# Use cache
	--test					# Dry run
	--pre-install					# Exec eventual pre-install script
	--post-install					# Exec eventual post-install script
	--install-scripts					# Exec eventual pre-post-install scripts
	--prefer-higher					# Prefer higher version
	--strict-diff					# Override prefer-higher
	--log					# Write output to log file
	...args
]

# Print info on a port
extern "prt-get info" [
	--cache					# Use cache
	--test					# Dry run
	--pre-install					# Exec eventual pre-install script
	--post-install					# Exec eventual post-install script
	--install-scripts					# Exec eventual pre-post-install scripts
	--prefer-higher					# Prefer higher version
	--strict-diff					# Override prefer-higher
	--log					# Write output to log file
	...args
]

# Search for a pattern in the footprints in the ports tree
extern "prt-get fsearch" [
	--cache					# Use cache
	--test					# Dry run
	--pre-install					# Exec eventual pre-install script
	--post-install					# Exec eventual post-install script
	--install-scripts					# Exec eventual pre-post-install scripts
	--prefer-higher					# Prefer higher version
	--strict-diff					# Override prefer-higher
	--log					# Write output to log file
	...args
]

# Print the path of a port
extern "prt-get path" [
	--cache					# Use cache
	--test					# Dry run
	--pre-install					# Exec eventual pre-install script
	--post-install					# Exec eventual post-install script
	--install-scripts					# Exec eventual pre-post-install scripts
	--prefer-higher					# Prefer higher version
	--strict-diff					# Override prefer-higher
	--log					# Write output to log file
	...args
]

# Print the eventual README of a port
extern "prt-get readme" [
	--cache					# Use cache
	--test					# Dry run
	--pre-install					# Exec eventual pre-install script
	--post-install					# Exec eventual post-install script
	--install-scripts					# Exec eventual pre-post-install scripts
	--prefer-higher					# Prefer higher version
	--strict-diff					# Override prefer-higher
	--log					# Write output to log file
	...args
]

# Print a list of deps for the listed ports
extern "prt-get depends" [
	--cache					# Use cache
	--test					# Dry run
	--pre-install					# Exec eventual pre-install script
	--post-install					# Exec eventual post-install script
	--install-scripts					# Exec eventual pre-post-install scripts
	--prefer-higher					# Prefer higher version
	--strict-diff					# Override prefer-higher
	--log					# Write output to log file
	...args
]

# Print a simple list of deps for the listed ports
extern "prt-get quickdeo" [
	--cache					# Use cache
	--test					# Dry run
	--pre-install					# Exec eventual pre-install script
	--post-install					# Exec eventual post-install script
	--install-scripts					# Exec eventual pre-post-install scripts
	--prefer-higher					# Prefer higher version
	--strict-diff					# Override prefer-higher
	--log					# Write output to log file
	...args
]

# Print a deptree for the port
extern "prt-get deptree" [
	--cache					# Use cache
	--test					# Dry run
	--pre-install					# Exec eventual pre-install script
	--post-install					# Exec eventual post-install script
	--install-scripts					# Exec eventual pre-post-install scripts
	--prefer-higher					# Prefer higher version
	--strict-diff					# Override prefer-higher
	--log					# Write output to log file
	...args
]

# List ports in multiple directories
extern "prt-get dup" [
	--cache					# Use cache
	--test					# Dry run
	--pre-install					# Exec eventual pre-install script
	--post-install					# Exec eventual post-install script
	--install-scripts					# Exec eventual pre-post-install scripts
	--prefer-higher					# Prefer higher version
	--strict-diff					# Override prefer-higher
	--log					# Write output to log file
	...args
]

# List all the ports
extern "prt-get list" [
	--cache					# Use cache
	--test					# Dry run
	--pre-install					# Exec eventual pre-install script
	--post-install					# Exec eventual post-install script
	--install-scripts					# Exec eventual pre-post-install scripts
	--prefer-higher					# Prefer higher version
	--strict-diff					# Override prefer-higher
	--log					# Write output to log file
	...args
]

# Print formatted list of ports
extern "prt-get printf" [
	--cache					# Use cache
	--test					# Dry run
	--pre-install					# Exec eventual pre-install script
	--post-install					# Exec eventual post-install script
	--install-scripts					# Exec eventual pre-post-install scripts
	--prefer-higher					# Prefer higher version
	--strict-diff					# Override prefer-higher
	--log					# Write output to log file
	...args
]

# List installed packages
extern "prt-get listinst" [
	--cache					# Use cache
	--test					# Dry run
	--pre-install					# Exec eventual pre-install script
	--post-install					# Exec eventual post-install script
	--install-scripts					# Exec eventual pre-post-install scripts
	--prefer-higher					# Prefer higher version
	--strict-diff					# Override prefer-higher
	--log					# Write output to log file
	...args
]

# List installed packages which have no dependent packages
extern "prt-get listorphans" [
	--cache					# Use cache
	--test					# Dry run
	--pre-install					# Exec eventual pre-install script
	--post-install					# Exec eventual post-install script
	--install-scripts					# Exec eventual pre-post-install scripts
	--prefer-higher					# Prefer higher version
	--strict-diff					# Override prefer-higher
	--log					# Write output to log file
	...args
]

# Check if a port is installed
extern "prt-get isinst" [
	--cache					# Use cache
	--test					# Dry run
	--pre-install					# Exec eventual pre-install script
	--post-install					# Exec eventual post-install script
	--install-scripts					# Exec eventual pre-post-install scripts
	--prefer-higher					# Prefer higher version
	--strict-diff					# Override prefer-higher
	--log					# Write output to log file
	...args
]

# Print the version of an installed package
extern "prt-get current" [
	--cache					# Use cache
	--test					# Dry run
	--pre-install					# Exec eventual pre-install script
	--post-install					# Exec eventual post-install script
	--install-scripts					# Exec eventual pre-post-install scripts
	--prefer-higher					# Prefer higher version
	--strict-diff					# Override prefer-higher
	--log					# Write output to log file
	...args
]

# Print the listing of the directory of a port
extern "prt-get ls" [
	--cache					# Use cache
	--test					# Dry run
	--pre-install					# Exec eventual pre-install script
	--post-install					# Exec eventual post-install script
	--install-scripts					# Exec eventual pre-post-install scripts
	--prefer-higher					# Prefer higher version
	--strict-diff					# Override prefer-higher
	--log					# Write output to log file
	...args
]

# Print a file in a port to stdout
extern "prt-get cat" [
	--cache					# Use cache
	--test					# Dry run
	--pre-install					# Exec eventual pre-install script
	--post-install					# Exec eventual post-install script
	--install-scripts					# Exec eventual pre-post-install scripts
	--prefer-higher					# Prefer higher version
	--strict-diff					# Override prefer-higher
	--log					# Write output to log file
	...args
]

# Edit a file in a port
extern "prt-get edit" [
	--cache					# Use cache
	--test					# Dry run
	--pre-install					# Exec eventual pre-install script
	--post-install					# Exec eventual post-install script
	--install-scripts					# Exec eventual pre-post-install scripts
	--prefer-higher					# Prefer higher version
	--strict-diff					# Override prefer-higher
	--log					# Write output to log file
	...args
]

# Shows a help screen
extern "prt-get help" [
	--cache					# Use cache
	--test					# Dry run
	--pre-install					# Exec eventual pre-install script
	--post-install					# Exec eventual post-install script
	--install-scripts					# Exec eventual pre-post-install scripts
	--prefer-higher					# Prefer higher version
	--strict-diff					# Override prefer-higher
	--log					# Write output to log file
	...args
]

# Print the configuration of prt-get
extern "prt-get dumpconfig" [
	--cache					# Use cache
	--test					# Dry run
	--pre-install					# Exec eventual pre-install script
	--post-install					# Exec eventual post-install script
	--install-scripts					# Exec eventual pre-post-install scripts
	--prefer-higher					# Prefer higher version
	--strict-diff					# Override prefer-higher
	--log					# Write output to log file
	...args
]

# Show the current version of prt-get
extern "prt-get version" [
	--cache					# Use cache
	--test					# Dry run
	--pre-install					# Exec eventual pre-install script
	--post-install					# Exec eventual post-install script
	--install-scripts					# Exec eventual pre-post-install scripts
	--prefer-higher					# Prefer higher version
	--strict-diff					# Override prefer-higher
	--log					# Write output to log file
	...args
]

# Create a cache for prt-get
extern "prt-get cache" [
	--cache					# Use cache
	--test					# Dry run
	--pre-install					# Exec eventual pre-install script
	--post-install					# Exec eventual post-install script
	--install-scripts					# Exec eventual pre-post-install scripts
	--prefer-higher					# Prefer higher version
	--strict-diff					# Override prefer-higher
	--log					# Write output to log file
	...args
]

# Force install
extern "prt-get" [
	--cache					# Use cache
	--test					# Dry run
	--pre-install					# Exec eventual pre-install script
	--post-install					# Exec eventual post-install script
	--install-scripts					# Exec eventual pre-post-install scripts
	--prefer-higher					# Prefer higher version
	--strict-diff					# Override prefer-higher
	--log					# Write output to log file
	...args
]

# Install listed ports
extern "prt-cache install" [
	--test					# Dry run
	--pre-install					# Exec eventual pre-install script
	--post-install					# Exec eventual post-install script
	--install-scripts					# Exec eventual pre-post-install scripts
	--prefer-higher					# Prefer higher version
	--strict-diff					# Override prefer-higher
	--log					# Write output to log file
	...args
]

# Install listed ports and their deps
extern "prt-cache depinst" [
	--test					# Dry run
	--pre-install					# Exec eventual pre-install script
	--post-install					# Exec eventual post-install script
	--install-scripts					# Exec eventual pre-post-install scripts
	--prefer-higher					# Prefer higher version
	--strict-diff					# Override prefer-higher
	--log					# Write output to log file
	...args
]

# Install listed ports, stop if one fails
extern "prt-cache grpinst" [
	--test					# Dry run
	--pre-install					# Exec eventual pre-install script
	--post-install					# Exec eventual post-install script
	--install-scripts					# Exec eventual pre-post-install scripts
	--prefer-higher					# Prefer higher version
	--strict-diff					# Override prefer-higher
	--log					# Write output to log file
	...args
]

# Update listed packages
extern "prt-cache update" [
	--test					# Dry run
	--pre-install					# Exec eventual pre-install script
	--post-install					# Exec eventual post-install script
	--install-scripts					# Exec eventual pre-post-install scripts
	--prefer-higher					# Prefer higher version
	--strict-diff					# Override prefer-higher
	--log					# Write output to log file
	...args
]

# Remove listed packages
extern "prt-cache remove" [
	--test					# Dry run
	--pre-install					# Exec eventual pre-install script
	--post-install					# Exec eventual post-install script
	--install-scripts					# Exec eventual pre-post-install scripts
	--prefer-higher					# Prefer higher version
	--strict-diff					# Override prefer-higher
	--log					# Write output to log file
	...args
]

# Update all outdated installed packages
extern "prt-cache sysup" [
	--test					# Dry run
	--pre-install					# Exec eventual pre-install script
	--post-install					# Exec eventual post-install script
	--install-scripts					# Exec eventual pre-post-install scripts
	--prefer-higher					# Prefer higher version
	--strict-diff					# Override prefer-higher
	--log					# Write output to log file
	...args
]

# Do not update this in sysup
extern "prt-cache lock" [
	--test					# Dry run
	--pre-install					# Exec eventual pre-install script
	--post-install					# Exec eventual post-install script
	--install-scripts					# Exec eventual pre-post-install scripts
	--prefer-higher					# Prefer higher version
	--strict-diff					# Override prefer-higher
	--log					# Write output to log file
	...args
]

# Remove this from lock
extern "prt-cache unlock" [
	--test					# Dry run
	--pre-install					# Exec eventual pre-install script
	--post-install					# Exec eventual post-install script
	--install-scripts					# Exec eventual pre-post-install scripts
	--prefer-higher					# Prefer higher version
	--strict-diff					# Override prefer-higher
	--log					# Write output to log file
	...args
]

# Print differences between installed packages and ports in the port tree
extern "prt-cache diff" [
	--test					# Dry run
	--pre-install					# Exec eventual pre-install script
	--post-install					# Exec eventual post-install script
	--install-scripts					# Exec eventual pre-post-install scripts
	--prefer-higher					# Prefer higher version
	--strict-diff					# Override prefer-higher
	--log					# Write output to log file
	...args
]

# Search for an expr in port names
extern "prt-cache search" [
	--test					# Dry run
	--pre-install					# Exec eventual pre-install script
	--post-install					# Exec eventual post-install script
	--install-scripts					# Exec eventual pre-post-install scripts
	--prefer-higher					# Prefer higher version
	--strict-diff					# Override prefer-higher
	--log					# Write output to log file
	...args
]

# Search for an expr in port names and descriptions
extern "prt-cache dsearch" [
	--test					# Dry run
	--pre-install					# Exec eventual pre-install script
	--post-install					# Exec eventual post-install script
	--install-scripts					# Exec eventual pre-post-install scripts
	--prefer-higher					# Prefer higher version
	--strict-diff					# Override prefer-higher
	--log					# Write output to log file
	...args
]

# Print info on a port
extern "prt-cache info" [
	--test					# Dry run
	--pre-install					# Exec eventual pre-install script
	--post-install					# Exec eventual post-install script
	--install-scripts					# Exec eventual pre-post-install scripts
	--prefer-higher					# Prefer higher version
	--strict-diff					# Override prefer-higher
	--log					# Write output to log file
	...args
]

# Search for a pattern in the footprints in the ports tree
extern "prt-cache fsearch" [
	--test					# Dry run
	--pre-install					# Exec eventual pre-install script
	--post-install					# Exec eventual post-install script
	--install-scripts					# Exec eventual pre-post-install scripts
	--prefer-higher					# Prefer higher version
	--strict-diff					# Override prefer-higher
	--log					# Write output to log file
	...args
]

# Print the path of a port
extern "prt-cache path" [
	--test					# Dry run
	--pre-install					# Exec eventual pre-install script
	--post-install					# Exec eventual post-install script
	--install-scripts					# Exec eventual pre-post-install scripts
	--prefer-higher					# Prefer higher version
	--strict-diff					# Override prefer-higher
	--log					# Write output to log file
	...args
]

# Print the eventual README of a port
extern "prt-cache readme" [
	--test					# Dry run
	--pre-install					# Exec eventual pre-install script
	--post-install					# Exec eventual post-install script
	--install-scripts					# Exec eventual pre-post-install scripts
	--prefer-higher					# Prefer higher version
	--strict-diff					# Override prefer-higher
	--log					# Write output to log file
	...args
]

# Print a list of deps for the listed ports
extern "prt-cache depends" [
	--test					# Dry run
	--pre-install					# Exec eventual pre-install script
	--post-install					# Exec eventual post-install script
	--install-scripts					# Exec eventual pre-post-install scripts
	--prefer-higher					# Prefer higher version
	--strict-diff					# Override prefer-higher
	--log					# Write output to log file
	...args
]

# Print a simple list of deps for the listed ports
extern "prt-cache quickdeo" [
	--test					# Dry run
	--pre-install					# Exec eventual pre-install script
	--post-install					# Exec eventual post-install script
	--install-scripts					# Exec eventual pre-post-install scripts
	--prefer-higher					# Prefer higher version
	--strict-diff					# Override prefer-higher
	--log					# Write output to log file
	...args
]

# Print a deptree for the port
extern "prt-cache deptree" [
	--test					# Dry run
	--pre-install					# Exec eventual pre-install script
	--post-install					# Exec eventual post-install script
	--install-scripts					# Exec eventual pre-post-install scripts
	--prefer-higher					# Prefer higher version
	--strict-diff					# Override prefer-higher
	--log					# Write output to log file
	...args
]

# List all the ports
extern "prt-cache list" [
	--test					# Dry run
	--pre-install					# Exec eventual pre-install script
	--post-install					# Exec eventual post-install script
	--install-scripts					# Exec eventual pre-post-install scripts
	--prefer-higher					# Prefer higher version
	--strict-diff					# Override prefer-higher
	--log					# Write output to log file
	...args
]

# Print formatted list of ports
extern "prt-cache printf" [
	--test					# Dry run
	--pre-install					# Exec eventual pre-install script
	--post-install					# Exec eventual post-install script
	--install-scripts					# Exec eventual pre-post-install scripts
	--prefer-higher					# Prefer higher version
	--strict-diff					# Override prefer-higher
	--log					# Write output to log file
	...args
]

# List installed packages
extern "prt-cache listinst" [
	--test					# Dry run
	--pre-install					# Exec eventual pre-install script
	--post-install					# Exec eventual post-install script
	--install-scripts					# Exec eventual pre-post-install scripts
	--prefer-higher					# Prefer higher version
	--strict-diff					# Override prefer-higher
	--log					# Write output to log file
	...args
]

# List installed packages which have no dependent packages
extern "prt-cache listorphans" [
	--test					# Dry run
	--pre-install					# Exec eventual pre-install script
	--post-install					# Exec eventual post-install script
	--install-scripts					# Exec eventual pre-post-install scripts
	--prefer-higher					# Prefer higher version
	--strict-diff					# Override prefer-higher
	--log					# Write output to log file
	...args
]

# Print the version of an installed package
extern "prt-cache current" [
	--test					# Dry run
	--pre-install					# Exec eventual pre-install script
	--post-install					# Exec eventual post-install script
	--install-scripts					# Exec eventual pre-post-install scripts
	--prefer-higher					# Prefer higher version
	--strict-diff					# Override prefer-higher
	--log					# Write output to log file
	...args
]

# Print the listing of the directory of a port
extern "prt-cache ls" [
	--test					# Dry run
	--pre-install					# Exec eventual pre-install script
	--post-install					# Exec eventual post-install script
	--install-scripts					# Exec eventual pre-post-install scripts
	--prefer-higher					# Prefer higher version
	--strict-diff					# Override prefer-higher
	--log					# Write output to log file
	...args
]

# Print a file in a port to stdout
extern "prt-cache cat" [
	--test					# Dry run
	--pre-install					# Exec eventual pre-install script
	--post-install					# Exec eventual post-install script
	--install-scripts					# Exec eventual pre-post-install scripts
	--prefer-higher					# Prefer higher version
	--strict-diff					# Override prefer-higher
	--log					# Write output to log file
	...args
]

# Edit a file in a port
extern "prt-cache edit" [
	--test					# Dry run
	--pre-install					# Exec eventual pre-install script
	--post-install					# Exec eventual post-install script
	--install-scripts					# Exec eventual pre-post-install scripts
	--prefer-higher					# Prefer higher version
	--strict-diff					# Override prefer-higher
	--log					# Write output to log file
	...args
]

# Shows a help screen
extern "prt-cache help" [
	--test					# Dry run
	--pre-install					# Exec eventual pre-install script
	--post-install					# Exec eventual post-install script
	--install-scripts					# Exec eventual pre-post-install scripts
	--prefer-higher					# Prefer higher version
	--strict-diff					# Override prefer-higher
	--log					# Write output to log file
	...args
]

# Print the configuration of prt-get
extern "prt-cache dumpconfig" [
	--test					# Dry run
	--pre-install					# Exec eventual pre-install script
	--post-install					# Exec eventual post-install script
	--install-scripts					# Exec eventual pre-post-install scripts
	--prefer-higher					# Prefer higher version
	--strict-diff					# Override prefer-higher
	--log					# Write output to log file
	...args
]

# Show the current version of prt-get
extern "prt-cache version" [
	--test					# Dry run
	--pre-install					# Exec eventual pre-install script
	--post-install					# Exec eventual post-install script
	--install-scripts					# Exec eventual pre-post-install scripts
	--prefer-higher					# Prefer higher version
	--strict-diff					# Override prefer-higher
	--log					# Write output to log file
	...args
]

# Create a cache for prt-get
extern "prt-cache cache" [
	--test					# Dry run
	--pre-install					# Exec eventual pre-install script
	--post-install					# Exec eventual post-install script
	--install-scripts					# Exec eventual pre-post-install scripts
	--prefer-higher					# Prefer higher version
	--strict-diff					# Override prefer-higher
	--log					# Write output to log file
	...args
]

# Force install
extern "prt-cache" [
	--test					# Dry run
	--pre-install					# Exec eventual pre-install script
	--post-install					# Exec eventual post-install script
	--install-scripts					# Exec eventual pre-post-install scripts
	--prefer-higher					# Prefer higher version
	--strict-diff					# Override prefer-higher
	--log					# Write output to log file
	...args
]