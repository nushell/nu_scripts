[# Install listed ports
extern "prt-get install" [

	...args
]
# Install listed ports and their deps
extern "prt-get depinst" [

	...args
]
# Install listed ports, stop if one fails
extern "prt-get grpinst" [

	...args
]
# Update listed packages
extern "prt-get update" [

	...args
]
# Remove listed packages
extern "prt-get remove" [

	...args
]
# Update all outdated installed packages
extern "prt-get sysup" [

	...args
]
# Do not update this in sysup
extern "prt-get lock" [

	...args
]
# Remove this from lock
extern "prt-get unlock" [

	...args
]
# Print differences between installed packages and ports in the port tree
extern "prt-get diff" [

	...args
]
# Search for an expr in port names
extern "prt-get search" [

	...args
]
# Search for an expr in port names and descriptions
extern "prt-get dsearch" [

	...args
]
# Print info on a port
extern "prt-get info" [

	...args
]
# Search for a pattern in the footprints in the ports tree
extern "prt-get fsearch" [

	...args
]
# Print the path of a port
extern "prt-get path" [

	...args
]
# Print the eventual README of a port
extern "prt-get readme" [

	...args
]
# Print a list of deps for the listed ports
extern "prt-get depends" [

	...args
]
# Print a simple list of deps for the listed ports
extern "prt-get quickdeo" [

	...args
]
# Print a deptree for the port
extern "prt-get deptree" [

	...args
]
# List ports in multiple directories
extern "prt-get dup" [

	...args
]
# List all the ports
extern "prt-get list" [

	...args
]
# Print formatted list of ports
extern "prt-get printf" [

	...args
]
# List installed packages
extern "prt-get listinst" [

	...args
]
# List installed packages which have no dependent packages
extern "prt-get listorphans" [

	...args
]
# Check if a port is installed
extern "prt-get isinst" [

	...args
]
# Print the version of an installed package
extern "prt-get current" [

	...args
]
# Print the listing of the directory of a port
extern "prt-get ls" [

	...args
]
# Print a file in a port to stdout
extern "prt-get cat" [

	...args
]
# Edit a file in a port
extern "prt-get edit" [

	...args
]
# Shows a help screen
extern "prt-get help" [

	...args
]
# Print the configuration of prt-get
extern "prt-get dumpconfig" [

	...args
]
# Show the current version of prt-get
extern "prt-get version" [

	...args
]
# Create a cache for prt-get
extern "prt-get cache" [

	...args
]
# Force install
extern "prt-get" [

	...args
]]

[# Install listed ports
extern "prt-cache install" [

	...args
]
# Install listed ports and their deps
extern "prt-cache depinst" [

	...args
]
# Install listed ports, stop if one fails
extern "prt-cache grpinst" [

	...args
]
# Update listed packages
extern "prt-cache update" [

	...args
]
# Remove listed packages
extern "prt-cache remove" [

	...args
]
# Update all outdated installed packages
extern "prt-cache sysup" [

	...args
]
# Do not update this in sysup
extern "prt-cache lock" [

	...args
]
# Remove this from lock
extern "prt-cache unlock" [

	...args
]
# Print differences between installed packages and ports in the port tree
extern "prt-cache diff" [

	...args
]
# Search for an expr in port names
extern "prt-cache search" [

	...args
]
# Search for an expr in port names and descriptions
extern "prt-cache dsearch" [

	...args
]
# Print info on a port
extern "prt-cache info" [

	...args
]
# Search for a pattern in the footprints in the ports tree
extern "prt-cache fsearch" [

	...args
]
# Print the path of a port
extern "prt-cache path" [

	...args
]
# Print the eventual README of a port
extern "prt-cache readme" [

	...args
]
# Print a list of deps for the listed ports
extern "prt-cache depends" [

	...args
]
# Print a simple list of deps for the listed ports
extern "prt-cache quickdeo" [

	...args
]
# Print a deptree for the port
extern "prt-cache deptree" [

	...args
]
# List all the ports
extern "prt-cache list" [

	...args
]
# Print formatted list of ports
extern "prt-cache printf" [

	...args
]
# List installed packages
extern "prt-cache listinst" [

	...args
]
# List installed packages which have no dependent packages
extern "prt-cache listorphans" [

	...args
]
# Print the version of an installed package
extern "prt-cache current" [

	...args
]
# Print the listing of the directory of a port
extern "prt-cache ls" [

	...args
]
# Print a file in a port to stdout
extern "prt-cache cat" [

	...args
]
# Edit a file in a port
extern "prt-cache edit" [

	...args
]
# Shows a help screen
extern "prt-cache help" [

	...args
]
# Print the configuration of prt-get
extern "prt-cache dumpconfig" [

	...args
]
# Show the current version of prt-get
extern "prt-cache version" [

	...args
]
# Create a cache for prt-get
extern "prt-cache cache" [

	...args
]
# Force install
extern "prt-cache" [

	...args
]]