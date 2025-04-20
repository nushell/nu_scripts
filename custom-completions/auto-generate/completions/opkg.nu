# Update list of available packages
extern "opkg update" [
	--verbosity(-V)					# Set verbosity level to <level>
	--conf(-f)					# Use <conf_file> as the opkg configuration file
	--cache					# Use a package cache
	--dest(-d)					# Use <dest_name> as the root directory
	--offline-root(-o)					# Use <dir> as the root directory for offline
	--add-arch					# Register architecture with given priority
	--add-dest					# Register destination with given path
	--force-depends					# Install/remove despite failed dependencies
	--force-maintainer					# Overwrite preexisting config files
	--force-reinstall					# Reinstall package(s)
	--force-overwrite					# Overwrite files from other package(s)
	--force-downgrade					# Allow opkg to downgrade packages
	--force-space					# Disable free space checks
	--force-postinstall					# Run postinstall scripts even in offline mode
	--force-remove					# Remove package even if prerm script fails
	--force-checksum					# Don\'t
	--noaction					# No action -- test only
	--download-only					# No action -- download only
	--nodeps					# Do not follow dependencies
	--nocase					# Perform case insensitive pattern matching
	--size					# Print package size when listing available packages
	--force-removal-of-dependent-packages					# Remove package and all dependencies
	--autoremove					# Remove automatically installed packages
	--tmp-dir(-t)					# Specify tmp-dir.
	--lists-dir(-l)					# Specify lists-dir.
	...args
]

# Upgrade packages
extern "opkg upgrade" [
	--verbosity(-V)					# Set verbosity level to <level>
	--conf(-f)					# Use <conf_file> as the opkg configuration file
	--cache					# Use a package cache
	--dest(-d)					# Use <dest_name> as the root directory
	--offline-root(-o)					# Use <dir> as the root directory for offline
	--add-arch					# Register architecture with given priority
	--add-dest					# Register destination with given path
	--force-depends					# Install/remove despite failed dependencies
	--force-maintainer					# Overwrite preexisting config files
	--force-reinstall					# Reinstall package(s)
	--force-overwrite					# Overwrite files from other package(s)
	--force-downgrade					# Allow opkg to downgrade packages
	--force-space					# Disable free space checks
	--force-postinstall					# Run postinstall scripts even in offline mode
	--force-remove					# Remove package even if prerm script fails
	--force-checksum					# Don\'t
	--noaction					# No action -- test only
	--download-only					# No action -- download only
	--nodeps					# Do not follow dependencies
	--nocase					# Perform case insensitive pattern matching
	--size					# Print package size when listing available packages
	--force-removal-of-dependent-packages					# Remove package and all dependencies
	--autoremove					# Remove automatically installed packages
	--tmp-dir(-t)					# Specify tmp-dir.
	--lists-dir(-l)					# Specify lists-dir.
	...args
]

# Install package(s)
extern "opkg install" [
	--verbosity(-V)					# Set verbosity level to <level>
	--conf(-f)					# Use <conf_file> as the opkg configuration file
	--cache					# Use a package cache
	--dest(-d)					# Use <dest_name> as the root directory
	--offline-root(-o)					# Use <dir> as the root directory for offline
	--add-arch					# Register architecture with given priority
	--add-dest					# Register destination with given path
	--force-depends					# Install/remove despite failed dependencies
	--force-maintainer					# Overwrite preexisting config files
	--force-reinstall					# Reinstall package(s)
	--force-overwrite					# Overwrite files from other package(s)
	--force-downgrade					# Allow opkg to downgrade packages
	--force-space					# Disable free space checks
	--force-postinstall					# Run postinstall scripts even in offline mode
	--force-remove					# Remove package even if prerm script fails
	--force-checksum					# Don\'t
	--noaction					# No action -- test only
	--download-only					# No action -- download only
	--nodeps					# Do not follow dependencies
	--nocase					# Perform case insensitive pattern matching
	--size					# Print package size when listing available packages
	--force-removal-of-dependent-packages					# Remove package and all dependencies
	--autoremove					# Remove automatically installed packages
	--tmp-dir(-t)					# Specify tmp-dir.
	--lists-dir(-l)					# Specify lists-dir.
	...args
]

# Configure unpacked package(s)
extern "opkg configure" [
	--verbosity(-V)					# Set verbosity level to <level>
	--conf(-f)					# Use <conf_file> as the opkg configuration file
	--cache					# Use a package cache
	--dest(-d)					# Use <dest_name> as the root directory
	--offline-root(-o)					# Use <dir> as the root directory for offline
	--add-arch					# Register architecture with given priority
	--add-dest					# Register destination with given path
	--force-depends					# Install/remove despite failed dependencies
	--force-maintainer					# Overwrite preexisting config files
	--force-reinstall					# Reinstall package(s)
	--force-overwrite					# Overwrite files from other package(s)
	--force-downgrade					# Allow opkg to downgrade packages
	--force-space					# Disable free space checks
	--force-postinstall					# Run postinstall scripts even in offline mode
	--force-remove					# Remove package even if prerm script fails
	--force-checksum					# Don\'t
	--noaction					# No action -- test only
	--download-only					# No action -- download only
	--nodeps					# Do not follow dependencies
	--nocase					# Perform case insensitive pattern matching
	--size					# Print package size when listing available packages
	--force-removal-of-dependent-packages					# Remove package and all dependencies
	--autoremove					# Remove automatically installed packages
	--tmp-dir(-t)					# Specify tmp-dir.
	--lists-dir(-l)					# Specify lists-dir.
	...args
]

# Remove package(s)
extern "opkg remove" [
	--verbosity(-V)					# Set verbosity level to <level>
	--conf(-f)					# Use <conf_file> as the opkg configuration file
	--cache					# Use a package cache
	--dest(-d)					# Use <dest_name> as the root directory
	--offline-root(-o)					# Use <dir> as the root directory for offline
	--add-arch					# Register architecture with given priority
	--add-dest					# Register destination with given path
	--force-depends					# Install/remove despite failed dependencies
	--force-maintainer					# Overwrite preexisting config files
	--force-reinstall					# Reinstall package(s)
	--force-overwrite					# Overwrite files from other package(s)
	--force-downgrade					# Allow opkg to downgrade packages
	--force-space					# Disable free space checks
	--force-postinstall					# Run postinstall scripts even in offline mode
	--force-remove					# Remove package even if prerm script fails
	--force-checksum					# Don\'t
	--noaction					# No action -- test only
	--download-only					# No action -- download only
	--nodeps					# Do not follow dependencies
	--nocase					# Perform case insensitive pattern matching
	--size					# Print package size when listing available packages
	--force-removal-of-dependent-packages					# Remove package and all dependencies
	--autoremove					# Remove automatically installed packages
	--tmp-dir(-t)					# Specify tmp-dir.
	--lists-dir(-l)					# Specify lists-dir.
	...args
]

# Flag package(s)
extern "opkg flag" [
	--verbosity(-V)					# Set verbosity level to <level>
	--conf(-f)					# Use <conf_file> as the opkg configuration file
	--cache					# Use a package cache
	--dest(-d)					# Use <dest_name> as the root directory
	--offline-root(-o)					# Use <dir> as the root directory for offline
	--add-arch					# Register architecture with given priority
	--add-dest					# Register destination with given path
	--force-depends					# Install/remove despite failed dependencies
	--force-maintainer					# Overwrite preexisting config files
	--force-reinstall					# Reinstall package(s)
	--force-overwrite					# Overwrite files from other package(s)
	--force-downgrade					# Allow opkg to downgrade packages
	--force-space					# Disable free space checks
	--force-postinstall					# Run postinstall scripts even in offline mode
	--force-remove					# Remove package even if prerm script fails
	--force-checksum					# Don\'t
	--noaction					# No action -- test only
	--download-only					# No action -- download only
	--nodeps					# Do not follow dependencies
	--nocase					# Perform case insensitive pattern matching
	--size					# Print package size when listing available packages
	--force-removal-of-dependent-packages					# Remove package and all dependencies
	--autoremove					# Remove automatically installed packages
	--tmp-dir(-t)					# Specify tmp-dir.
	--lists-dir(-l)					# Specify lists-dir.
	...args
]

# List available packages
extern "opkg list" [
	--verbosity(-V)					# Set verbosity level to <level>
	--conf(-f)					# Use <conf_file> as the opkg configuration file
	--cache					# Use a package cache
	--dest(-d)					# Use <dest_name> as the root directory
	--offline-root(-o)					# Use <dir> as the root directory for offline
	--add-arch					# Register architecture with given priority
	--add-dest					# Register destination with given path
	--force-depends					# Install/remove despite failed dependencies
	--force-maintainer					# Overwrite preexisting config files
	--force-reinstall					# Reinstall package(s)
	--force-overwrite					# Overwrite files from other package(s)
	--force-downgrade					# Allow opkg to downgrade packages
	--force-space					# Disable free space checks
	--force-postinstall					# Run postinstall scripts even in offline mode
	--force-remove					# Remove package even if prerm script fails
	--force-checksum					# Don\'t
	--noaction					# No action -- test only
	--download-only					# No action -- download only
	--nodeps					# Do not follow dependencies
	--nocase					# Perform case insensitive pattern matching
	--size					# Print package size when listing available packages
	--force-removal-of-dependent-packages					# Remove package and all dependencies
	--autoremove					# Remove automatically installed packages
	--tmp-dir(-t)					# Specify tmp-dir.
	--lists-dir(-l)					# Specify lists-dir.
	...args
]

# List installed packages
extern "opkg list-installed" [
	--verbosity(-V)					# Set verbosity level to <level>
	--conf(-f)					# Use <conf_file> as the opkg configuration file
	--cache					# Use a package cache
	--dest(-d)					# Use <dest_name> as the root directory
	--offline-root(-o)					# Use <dir> as the root directory for offline
	--add-arch					# Register architecture with given priority
	--add-dest					# Register destination with given path
	--force-depends					# Install/remove despite failed dependencies
	--force-maintainer					# Overwrite preexisting config files
	--force-reinstall					# Reinstall package(s)
	--force-overwrite					# Overwrite files from other package(s)
	--force-downgrade					# Allow opkg to downgrade packages
	--force-space					# Disable free space checks
	--force-postinstall					# Run postinstall scripts even in offline mode
	--force-remove					# Remove package even if prerm script fails
	--force-checksum					# Don\'t
	--noaction					# No action -- test only
	--download-only					# No action -- download only
	--nodeps					# Do not follow dependencies
	--nocase					# Perform case insensitive pattern matching
	--size					# Print package size when listing available packages
	--force-removal-of-dependent-packages					# Remove package and all dependencies
	--autoremove					# Remove automatically installed packages
	--tmp-dir(-t)					# Specify tmp-dir.
	--lists-dir(-l)					# Specify lists-dir.
	...args
]

# List installed and upgradable packages
extern "opkg list-upgradable" [
	--verbosity(-V)					# Set verbosity level to <level>
	--conf(-f)					# Use <conf_file> as the opkg configuration file
	--cache					# Use a package cache
	--dest(-d)					# Use <dest_name> as the root directory
	--offline-root(-o)					# Use <dir> as the root directory for offline
	--add-arch					# Register architecture with given priority
	--add-dest					# Register destination with given path
	--force-depends					# Install/remove despite failed dependencies
	--force-maintainer					# Overwrite preexisting config files
	--force-reinstall					# Reinstall package(s)
	--force-overwrite					# Overwrite files from other package(s)
	--force-downgrade					# Allow opkg to downgrade packages
	--force-space					# Disable free space checks
	--force-postinstall					# Run postinstall scripts even in offline mode
	--force-remove					# Remove package even if prerm script fails
	--force-checksum					# Don\'t
	--noaction					# No action -- test only
	--download-only					# No action -- download only
	--nodeps					# Do not follow dependencies
	--nocase					# Perform case insensitive pattern matching
	--size					# Print package size when listing available packages
	--force-removal-of-dependent-packages					# Remove package and all dependencies
	--autoremove					# Remove automatically installed packages
	--tmp-dir(-t)					# Specify tmp-dir.
	--lists-dir(-l)					# Specify lists-dir.
	...args
]

# List user modified configuration files
extern "opkg list-changed-conffiles" [
	--verbosity(-V)					# Set verbosity level to <level>
	--conf(-f)					# Use <conf_file> as the opkg configuration file
	--cache					# Use a package cache
	--dest(-d)					# Use <dest_name> as the root directory
	--offline-root(-o)					# Use <dir> as the root directory for offline
	--add-arch					# Register architecture with given priority
	--add-dest					# Register destination with given path
	--force-depends					# Install/remove despite failed dependencies
	--force-maintainer					# Overwrite preexisting config files
	--force-reinstall					# Reinstall package(s)
	--force-overwrite					# Overwrite files from other package(s)
	--force-downgrade					# Allow opkg to downgrade packages
	--force-space					# Disable free space checks
	--force-postinstall					# Run postinstall scripts even in offline mode
	--force-remove					# Remove package even if prerm script fails
	--force-checksum					# Don\'t
	--noaction					# No action -- test only
	--download-only					# No action -- download only
	--nodeps					# Do not follow dependencies
	--nocase					# Perform case insensitive pattern matching
	--size					# Print package size when listing available packages
	--force-removal-of-dependent-packages					# Remove package and all dependencies
	--autoremove					# Remove automatically installed packages
	--tmp-dir(-t)					# Specify tmp-dir.
	--lists-dir(-l)					# Specify lists-dir.
	...args
]

# List files belonging to <pkg>
extern "opkg files" [
	--verbosity(-V)					# Set verbosity level to <level>
	--conf(-f)					# Use <conf_file> as the opkg configuration file
	--cache					# Use a package cache
	--dest(-d)					# Use <dest_name> as the root directory
	--offline-root(-o)					# Use <dir> as the root directory for offline
	--add-arch					# Register architecture with given priority
	--add-dest					# Register destination with given path
	--force-depends					# Install/remove despite failed dependencies
	--force-maintainer					# Overwrite preexisting config files
	--force-reinstall					# Reinstall package(s)
	--force-overwrite					# Overwrite files from other package(s)
	--force-downgrade					# Allow opkg to downgrade packages
	--force-space					# Disable free space checks
	--force-postinstall					# Run postinstall scripts even in offline mode
	--force-remove					# Remove package even if prerm script fails
	--force-checksum					# Don\'t
	--noaction					# No action -- test only
	--download-only					# No action -- download only
	--nodeps					# Do not follow dependencies
	--nocase					# Perform case insensitive pattern matching
	--size					# Print package size when listing available packages
	--force-removal-of-dependent-packages					# Remove package and all dependencies
	--autoremove					# Remove automatically installed packages
	--tmp-dir(-t)					# Specify tmp-dir.
	--lists-dir(-l)					# Specify lists-dir.
	...args
]

# List package providing <file>
extern "opkg search" [
	--verbosity(-V)					# Set verbosity level to <level>
	--conf(-f)					# Use <conf_file> as the opkg configuration file
	--cache					# Use a package cache
	--dest(-d)					# Use <dest_name> as the root directory
	--offline-root(-o)					# Use <dir> as the root directory for offline
	--add-arch					# Register architecture with given priority
	--add-dest					# Register destination with given path
	--force-depends					# Install/remove despite failed dependencies
	--force-maintainer					# Overwrite preexisting config files
	--force-reinstall					# Reinstall package(s)
	--force-overwrite					# Overwrite files from other package(s)
	--force-downgrade					# Allow opkg to downgrade packages
	--force-space					# Disable free space checks
	--force-postinstall					# Run postinstall scripts even in offline mode
	--force-remove					# Remove package even if prerm script fails
	--force-checksum					# Don\'t
	--noaction					# No action -- test only
	--download-only					# No action -- download only
	--nodeps					# Do not follow dependencies
	--nocase					# Perform case insensitive pattern matching
	--size					# Print package size when listing available packages
	--force-removal-of-dependent-packages					# Remove package and all dependencies
	--autoremove					# Remove automatically installed packages
	--tmp-dir(-t)					# Specify tmp-dir.
	--lists-dir(-l)					# Specify lists-dir.
	...args
]

# List packages whose name or description matches <regexp>
extern "opkg find" [
	--verbosity(-V)					# Set verbosity level to <level>
	--conf(-f)					# Use <conf_file> as the opkg configuration file
	--cache					# Use a package cache
	--dest(-d)					# Use <dest_name> as the root directory
	--offline-root(-o)					# Use <dir> as the root directory for offline
	--add-arch					# Register architecture with given priority
	--add-dest					# Register destination with given path
	--force-depends					# Install/remove despite failed dependencies
	--force-maintainer					# Overwrite preexisting config files
	--force-reinstall					# Reinstall package(s)
	--force-overwrite					# Overwrite files from other package(s)
	--force-downgrade					# Allow opkg to downgrade packages
	--force-space					# Disable free space checks
	--force-postinstall					# Run postinstall scripts even in offline mode
	--force-remove					# Remove package even if prerm script fails
	--force-checksum					# Don\'t
	--noaction					# No action -- test only
	--download-only					# No action -- download only
	--nodeps					# Do not follow dependencies
	--nocase					# Perform case insensitive pattern matching
	--size					# Print package size when listing available packages
	--force-removal-of-dependent-packages					# Remove package and all dependencies
	--autoremove					# Remove automatically installed packages
	--tmp-dir(-t)					# Specify tmp-dir.
	--lists-dir(-l)					# Specify lists-dir.
	...args
]

# Display all info for <pkg>
extern "opkg info" [
	--verbosity(-V)					# Set verbosity level to <level>
	--conf(-f)					# Use <conf_file> as the opkg configuration file
	--cache					# Use a package cache
	--dest(-d)					# Use <dest_name> as the root directory
	--offline-root(-o)					# Use <dir> as the root directory for offline
	--add-arch					# Register architecture with given priority
	--add-dest					# Register destination with given path
	--force-depends					# Install/remove despite failed dependencies
	--force-maintainer					# Overwrite preexisting config files
	--force-reinstall					# Reinstall package(s)
	--force-overwrite					# Overwrite files from other package(s)
	--force-downgrade					# Allow opkg to downgrade packages
	--force-space					# Disable free space checks
	--force-postinstall					# Run postinstall scripts even in offline mode
	--force-remove					# Remove package even if prerm script fails
	--force-checksum					# Don\'t
	--noaction					# No action -- test only
	--download-only					# No action -- download only
	--nodeps					# Do not follow dependencies
	--nocase					# Perform case insensitive pattern matching
	--size					# Print package size when listing available packages
	--force-removal-of-dependent-packages					# Remove package and all dependencies
	--autoremove					# Remove automatically installed packages
	--tmp-dir(-t)					# Specify tmp-dir.
	--lists-dir(-l)					# Specify lists-dir.
	...args
]

# Display all status for <pkg>
extern "opkg status" [
	--verbosity(-V)					# Set verbosity level to <level>
	--conf(-f)					# Use <conf_file> as the opkg configuration file
	--cache					# Use a package cache
	--dest(-d)					# Use <dest_name> as the root directory
	--offline-root(-o)					# Use <dir> as the root directory for offline
	--add-arch					# Register architecture with given priority
	--add-dest					# Register destination with given path
	--force-depends					# Install/remove despite failed dependencies
	--force-maintainer					# Overwrite preexisting config files
	--force-reinstall					# Reinstall package(s)
	--force-overwrite					# Overwrite files from other package(s)
	--force-downgrade					# Allow opkg to downgrade packages
	--force-space					# Disable free space checks
	--force-postinstall					# Run postinstall scripts even in offline mode
	--force-remove					# Remove package even if prerm script fails
	--force-checksum					# Don\'t
	--noaction					# No action -- test only
	--download-only					# No action -- download only
	--nodeps					# Do not follow dependencies
	--nocase					# Perform case insensitive pattern matching
	--size					# Print package size when listing available packages
	--force-removal-of-dependent-packages					# Remove package and all dependencies
	--autoremove					# Remove automatically installed packages
	--tmp-dir(-t)					# Specify tmp-dir.
	--lists-dir(-l)					# Specify lists-dir.
	...args
]

# Download <pkg> to current directory
extern "opkg download" [
	--verbosity(-V)					# Set verbosity level to <level>
	--conf(-f)					# Use <conf_file> as the opkg configuration file
	--cache					# Use a package cache
	--dest(-d)					# Use <dest_name> as the root directory
	--offline-root(-o)					# Use <dir> as the root directory for offline
	--add-arch					# Register architecture with given priority
	--add-dest					# Register destination with given path
	--force-depends					# Install/remove despite failed dependencies
	--force-maintainer					# Overwrite preexisting config files
	--force-reinstall					# Reinstall package(s)
	--force-overwrite					# Overwrite files from other package(s)
	--force-downgrade					# Allow opkg to downgrade packages
	--force-space					# Disable free space checks
	--force-postinstall					# Run postinstall scripts even in offline mode
	--force-remove					# Remove package even if prerm script fails
	--force-checksum					# Don\'t
	--noaction					# No action -- test only
	--download-only					# No action -- download only
	--nodeps					# Do not follow dependencies
	--nocase					# Perform case insensitive pattern matching
	--size					# Print package size when listing available packages
	--force-removal-of-dependent-packages					# Remove package and all dependencies
	--autoremove					# Remove automatically installed packages
	--tmp-dir(-t)					# Specify tmp-dir.
	--lists-dir(-l)					# Specify lists-dir.
	...args
]

# compare versions using <= < > >= = << >>
extern "opkg compare-versions" [
	--verbosity(-V)					# Set verbosity level to <level>
	--conf(-f)					# Use <conf_file> as the opkg configuration file
	--cache					# Use a package cache
	--dest(-d)					# Use <dest_name> as the root directory
	--offline-root(-o)					# Use <dir> as the root directory for offline
	--add-arch					# Register architecture with given priority
	--add-dest					# Register destination with given path
	--force-depends					# Install/remove despite failed dependencies
	--force-maintainer					# Overwrite preexisting config files
	--force-reinstall					# Reinstall package(s)
	--force-overwrite					# Overwrite files from other package(s)
	--force-downgrade					# Allow opkg to downgrade packages
	--force-space					# Disable free space checks
	--force-postinstall					# Run postinstall scripts even in offline mode
	--force-remove					# Remove package even if prerm script fails
	--force-checksum					# Don\'t
	--noaction					# No action -- test only
	--download-only					# No action -- download only
	--nodeps					# Do not follow dependencies
	--nocase					# Perform case insensitive pattern matching
	--size					# Print package size when listing available packages
	--force-removal-of-dependent-packages					# Remove package and all dependencies
	--autoremove					# Remove automatically installed packages
	--tmp-dir(-t)					# Specify tmp-dir.
	--lists-dir(-l)					# Specify lists-dir.
	...args
]

# List installable package architectures
extern "opkg print-architecture" [
	--verbosity(-V)					# Set verbosity level to <level>
	--conf(-f)					# Use <conf_file> as the opkg configuration file
	--cache					# Use a package cache
	--dest(-d)					# Use <dest_name> as the root directory
	--offline-root(-o)					# Use <dir> as the root directory for offline
	--add-arch					# Register architecture with given priority
	--add-dest					# Register destination with given path
	--force-depends					# Install/remove despite failed dependencies
	--force-maintainer					# Overwrite preexisting config files
	--force-reinstall					# Reinstall package(s)
	--force-overwrite					# Overwrite files from other package(s)
	--force-downgrade					# Allow opkg to downgrade packages
	--force-space					# Disable free space checks
	--force-postinstall					# Run postinstall scripts even in offline mode
	--force-remove					# Remove package even if prerm script fails
	--force-checksum					# Don\'t
	--noaction					# No action -- test only
	--download-only					# No action -- download only
	--nodeps					# Do not follow dependencies
	--nocase					# Perform case insensitive pattern matching
	--size					# Print package size when listing available packages
	--force-removal-of-dependent-packages					# Remove package and all dependencies
	--autoremove					# Remove automatically installed packages
	--tmp-dir(-t)					# Specify tmp-dir.
	--lists-dir(-l)					# Specify lists-dir.
	...args
]

# list depends
extern "opkg depends" [
	--verbosity(-V)					# Set verbosity level to <level>
	--conf(-f)					# Use <conf_file> as the opkg configuration file
	--cache					# Use a package cache
	--dest(-d)					# Use <dest_name> as the root directory
	--offline-root(-o)					# Use <dir> as the root directory for offline
	--add-arch					# Register architecture with given priority
	--add-dest					# Register destination with given path
	--force-depends					# Install/remove despite failed dependencies
	--force-maintainer					# Overwrite preexisting config files
	--force-reinstall					# Reinstall package(s)
	--force-overwrite					# Overwrite files from other package(s)
	--force-downgrade					# Allow opkg to downgrade packages
	--force-space					# Disable free space checks
	--force-postinstall					# Run postinstall scripts even in offline mode
	--force-remove					# Remove package even if prerm script fails
	--force-checksum					# Don\'t
	--noaction					# No action -- test only
	--download-only					# No action -- download only
	--nodeps					# Do not follow dependencies
	--nocase					# Perform case insensitive pattern matching
	--size					# Print package size when listing available packages
	--force-removal-of-dependent-packages					# Remove package and all dependencies
	--autoremove					# Remove automatically installed packages
	--tmp-dir(-t)					# Specify tmp-dir.
	--lists-dir(-l)					# Specify lists-dir.
	...args
]

# list whatdepends
extern "opkg whatdepends" [
	--verbosity(-V)					# Set verbosity level to <level>
	--conf(-f)					# Use <conf_file> as the opkg configuration file
	--cache					# Use a package cache
	--dest(-d)					# Use <dest_name> as the root directory
	--offline-root(-o)					# Use <dir> as the root directory for offline
	--add-arch					# Register architecture with given priority
	--add-dest					# Register destination with given path
	--force-depends					# Install/remove despite failed dependencies
	--force-maintainer					# Overwrite preexisting config files
	--force-reinstall					# Reinstall package(s)
	--force-overwrite					# Overwrite files from other package(s)
	--force-downgrade					# Allow opkg to downgrade packages
	--force-space					# Disable free space checks
	--force-postinstall					# Run postinstall scripts even in offline mode
	--force-remove					# Remove package even if prerm script fails
	--force-checksum					# Don\'t
	--noaction					# No action -- test only
	--download-only					# No action -- download only
	--nodeps					# Do not follow dependencies
	--nocase					# Perform case insensitive pattern matching
	--size					# Print package size when listing available packages
	--force-removal-of-dependent-packages					# Remove package and all dependencies
	--autoremove					# Remove automatically installed packages
	--tmp-dir(-t)					# Specify tmp-dir.
	--lists-dir(-l)					# Specify lists-dir.
	...args
]

# list whatdepends recursively
extern "opkg whatdependsrec" [
	--verbosity(-V)					# Set verbosity level to <level>
	--conf(-f)					# Use <conf_file> as the opkg configuration file
	--cache					# Use a package cache
	--dest(-d)					# Use <dest_name> as the root directory
	--offline-root(-o)					# Use <dir> as the root directory for offline
	--add-arch					# Register architecture with given priority
	--add-dest					# Register destination with given path
	--force-depends					# Install/remove despite failed dependencies
	--force-maintainer					# Overwrite preexisting config files
	--force-reinstall					# Reinstall package(s)
	--force-overwrite					# Overwrite files from other package(s)
	--force-downgrade					# Allow opkg to downgrade packages
	--force-space					# Disable free space checks
	--force-postinstall					# Run postinstall scripts even in offline mode
	--force-remove					# Remove package even if prerm script fails
	--force-checksum					# Don\'t
	--noaction					# No action -- test only
	--download-only					# No action -- download only
	--nodeps					# Do not follow dependencies
	--nocase					# Perform case insensitive pattern matching
	--size					# Print package size when listing available packages
	--force-removal-of-dependent-packages					# Remove package and all dependencies
	--autoremove					# Remove automatically installed packages
	--tmp-dir(-t)					# Specify tmp-dir.
	--lists-dir(-l)					# Specify lists-dir.
	...args
]

# list whatrecommends
extern "opkg whatrecommends" [
	--verbosity(-V)					# Set verbosity level to <level>
	--conf(-f)					# Use <conf_file> as the opkg configuration file
	--cache					# Use a package cache
	--dest(-d)					# Use <dest_name> as the root directory
	--offline-root(-o)					# Use <dir> as the root directory for offline
	--add-arch					# Register architecture with given priority
	--add-dest					# Register destination with given path
	--force-depends					# Install/remove despite failed dependencies
	--force-maintainer					# Overwrite preexisting config files
	--force-reinstall					# Reinstall package(s)
	--force-overwrite					# Overwrite files from other package(s)
	--force-downgrade					# Allow opkg to downgrade packages
	--force-space					# Disable free space checks
	--force-postinstall					# Run postinstall scripts even in offline mode
	--force-remove					# Remove package even if prerm script fails
	--force-checksum					# Don\'t
	--noaction					# No action -- test only
	--download-only					# No action -- download only
	--nodeps					# Do not follow dependencies
	--nocase					# Perform case insensitive pattern matching
	--size					# Print package size when listing available packages
	--force-removal-of-dependent-packages					# Remove package and all dependencies
	--autoremove					# Remove automatically installed packages
	--tmp-dir(-t)					# Specify tmp-dir.
	--lists-dir(-l)					# Specify lists-dir.
	...args
]

# list whatsuggests
extern "opkg whatsuggests" [
	--verbosity(-V)					# Set verbosity level to <level>
	--conf(-f)					# Use <conf_file> as the opkg configuration file
	--cache					# Use a package cache
	--dest(-d)					# Use <dest_name> as the root directory
	--offline-root(-o)					# Use <dir> as the root directory for offline
	--add-arch					# Register architecture with given priority
	--add-dest					# Register destination with given path
	--force-depends					# Install/remove despite failed dependencies
	--force-maintainer					# Overwrite preexisting config files
	--force-reinstall					# Reinstall package(s)
	--force-overwrite					# Overwrite files from other package(s)
	--force-downgrade					# Allow opkg to downgrade packages
	--force-space					# Disable free space checks
	--force-postinstall					# Run postinstall scripts even in offline mode
	--force-remove					# Remove package even if prerm script fails
	--force-checksum					# Don\'t
	--noaction					# No action -- test only
	--download-only					# No action -- download only
	--nodeps					# Do not follow dependencies
	--nocase					# Perform case insensitive pattern matching
	--size					# Print package size when listing available packages
	--force-removal-of-dependent-packages					# Remove package and all dependencies
	--autoremove					# Remove automatically installed packages
	--tmp-dir(-t)					# Specify tmp-dir.
	--lists-dir(-l)					# Specify lists-dir.
	...args
]

# list whatprovides
extern "opkg whatprovides" [
	--verbosity(-V)					# Set verbosity level to <level>
	--conf(-f)					# Use <conf_file> as the opkg configuration file
	--cache					# Use a package cache
	--dest(-d)					# Use <dest_name> as the root directory
	--offline-root(-o)					# Use <dir> as the root directory for offline
	--add-arch					# Register architecture with given priority
	--add-dest					# Register destination with given path
	--force-depends					# Install/remove despite failed dependencies
	--force-maintainer					# Overwrite preexisting config files
	--force-reinstall					# Reinstall package(s)
	--force-overwrite					# Overwrite files from other package(s)
	--force-downgrade					# Allow opkg to downgrade packages
	--force-space					# Disable free space checks
	--force-postinstall					# Run postinstall scripts even in offline mode
	--force-remove					# Remove package even if prerm script fails
	--force-checksum					# Don\'t
	--noaction					# No action -- test only
	--download-only					# No action -- download only
	--nodeps					# Do not follow dependencies
	--nocase					# Perform case insensitive pattern matching
	--size					# Print package size when listing available packages
	--force-removal-of-dependent-packages					# Remove package and all dependencies
	--autoremove					# Remove automatically installed packages
	--tmp-dir(-t)					# Specify tmp-dir.
	--lists-dir(-l)					# Specify lists-dir.
	...args
]

# list whatconflicts
extern "opkg whatconflicts" [
	--verbosity(-V)					# Set verbosity level to <level>
	--conf(-f)					# Use <conf_file> as the opkg configuration file
	--cache					# Use a package cache
	--dest(-d)					# Use <dest_name> as the root directory
	--offline-root(-o)					# Use <dir> as the root directory for offline
	--add-arch					# Register architecture with given priority
	--add-dest					# Register destination with given path
	--force-depends					# Install/remove despite failed dependencies
	--force-maintainer					# Overwrite preexisting config files
	--force-reinstall					# Reinstall package(s)
	--force-overwrite					# Overwrite files from other package(s)
	--force-downgrade					# Allow opkg to downgrade packages
	--force-space					# Disable free space checks
	--force-postinstall					# Run postinstall scripts even in offline mode
	--force-remove					# Remove package even if prerm script fails
	--force-checksum					# Don\'t
	--noaction					# No action -- test only
	--download-only					# No action -- download only
	--nodeps					# Do not follow dependencies
	--nocase					# Perform case insensitive pattern matching
	--size					# Print package size when listing available packages
	--force-removal-of-dependent-packages					# Remove package and all dependencies
	--autoremove					# Remove automatically installed packages
	--tmp-dir(-t)					# Specify tmp-dir.
	--lists-dir(-l)					# Specify lists-dir.
	...args
]

# list whatreplaces
extern "opkg whatreplaces" [
	--verbosity(-V)					# Set verbosity level to <level>
	--conf(-f)					# Use <conf_file> as the opkg configuration file
	--cache					# Use a package cache
	--dest(-d)					# Use <dest_name> as the root directory
	--offline-root(-o)					# Use <dir> as the root directory for offline
	--add-arch					# Register architecture with given priority
	--add-dest					# Register destination with given path
	--force-depends					# Install/remove despite failed dependencies
	--force-maintainer					# Overwrite preexisting config files
	--force-reinstall					# Reinstall package(s)
	--force-overwrite					# Overwrite files from other package(s)
	--force-downgrade					# Allow opkg to downgrade packages
	--force-space					# Disable free space checks
	--force-postinstall					# Run postinstall scripts even in offline mode
	--force-remove					# Remove package even if prerm script fails
	--force-checksum					# Don\'t
	--noaction					# No action -- test only
	--download-only					# No action -- download only
	--nodeps					# Do not follow dependencies
	--nocase					# Perform case insensitive pattern matching
	--size					# Print package size when listing available packages
	--force-removal-of-dependent-packages					# Remove package and all dependencies
	--autoremove					# Remove automatically installed packages
	--tmp-dir(-t)					# Specify tmp-dir.
	--lists-dir(-l)					# Specify lists-dir.
	...args
]

# Query all packages not just those installed
extern "opkg" [
	--verbosity(-V)					# Set verbosity level to <level>
	--conf(-f)					# Use <conf_file> as the opkg configuration file
	--cache					# Use a package cache
	--dest(-d)					# Use <dest_name> as the root directory
	--offline-root(-o)					# Use <dir> as the root directory for offline
	--add-arch					# Register architecture with given priority
	--add-dest					# Register destination with given path
	--force-depends					# Install/remove despite failed dependencies
	--force-maintainer					# Overwrite preexisting config files
	--force-reinstall					# Reinstall package(s)
	--force-overwrite					# Overwrite files from other package(s)
	--force-downgrade					# Allow opkg to downgrade packages
	--force-space					# Disable free space checks
	--force-postinstall					# Run postinstall scripts even in offline mode
	--force-remove					# Remove package even if prerm script fails
	--force-checksum					# Don\'t
	--noaction					# No action -- test only
	--download-only					# No action -- download only
	--nodeps					# Do not follow dependencies
	--nocase					# Perform case insensitive pattern matching
	--size					# Print package size when listing available packages
	--force-removal-of-dependent-packages					# Remove package and all dependencies
	--autoremove					# Remove automatically installed packages
	--tmp-dir(-t)					# Specify tmp-dir.
	--lists-dir(-l)					# Specify lists-dir.
	...args
]