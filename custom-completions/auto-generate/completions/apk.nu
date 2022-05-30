# Show help
extern "apk" [

	...args
]

# Add packages
extern "apk add" [
	--simulate(-s)					# Simulate the requested operation
	--clean-protected					# Don't create .apk-new files
	--overlay-from-stdin					# Read list of overlay files from stdin
	--no-scripts					# Don't execute any scripts
	--no-commit-hooks					# Skip pre/post hook scripts
	--initramfs-diskless-boot					# Enables options for diskless initramfs boot
	--initdb					# Initialize database
	--upgrade(-u)					# Prefer to upgrade package
	--latest(-l)					# Select latest version of package
	--no-chown					# Don't change file owner or group
	...args
]

# Remove packages
extern "apk del" [
	--simulate(-s)					# Simulate the requested operation
	--clean-protected					# Don't create .apk-new files
	--overlay-from-stdin					# Read list of overlay files from stdin
	--no-scripts					# Don't execute any scripts
	--no-commit-hooks					# Skip pre/post hook scripts
	--initramfs-diskless-boot					# Enables options for diskless initramfs boot
	--rdepends(-r)					# Remove unneeded dependencies too
	...args
]

# Repair package
extern "apk fix" [
	--simulate(-s)					# Simulate the requested operation
	--clean-protected					# Don't create .apk-new files
	--overlay-from-stdin					# Read list of overlay files from stdin
	--no-scripts					# Don't execute any scripts
	--no-commit-hooks					# Skip pre/post hook scripts
	--initramfs-diskless-boot					# Enables options for diskless initramfs boot
	--depends(-d)					# Fix all dependencies too
	--reinstall(-r)					# Reinstall the package
	--upgrade(-u)					# Prefer to upgrade package
	--xattr(-x)					# Fix packages with broken xattrs
	--directory-permissions					# Reset all directory permissions
	...args
]

# Update repository indexes
extern "apk update" [

	...args
]

# Give detailed information about packages
extern "apk info" [
	--contents(-L)					# List included files
	--installed(-e)					# Check PACKAGE installed status
	--depends(-R)					# List the dependencies
	--provides(-P)					# List virtual packages provided
	--rdepends(-r)					# List reverse dependencies
	--replaces					# List packages that PACKAGE might replace
	--install-if					# List install_if rule
	--rinstall-if					# List packages having install_if referencing PACKAGE
	--webpage(-w)					# Print the URL for the upstream
	--size(-s)					# Show installed size
	--description(-d)					# Print the description
	--license					# Print the license
	--triggers					# Print active triggers
	--all(-a)					# Print all information
	...args
]

# List packages
extern "apk list" [
	--installed(-I)					# List installed packages only
	--orphaned(-O)					# List orphaned packages only
	--available(-a)					# List available packages only
	--upgradable(-u)					# List upgradable packages only
	--origin(-o)					# List packages by origin
	--depends(-d)					# List packages by dependency
	--providers(-P)					# List packages by provider
	...args
]

# Search package
extern "apk search" [
	--all(-a)					# Show all package versions
	--description(-d)					# Search package descriptions
	--exact(-x)					# Require exact match
	--origin(-o)					# Print origin package name
	--rdepends(-r)					# Print reverse dependencies
	--has-origin					# List packages that have the given origin
	...args
]

# Upgrade installed packages
extern "apk upgrade" [
	--simulate(-s)					# Simulate the requested operation
	--clean-protected					# Don't create .apk-new files
	--overlay-from-stdin					# Read list of overlay files from stdin
	--no-scripts					# Don't execute any scripts
	--no-commit-hooks					# Skip pre/post hook scripts
	--initramfs-diskless-boot					# Enables options for diskless initramfs boot
	--available(-a)					# Reset all packages to the provided versions
	--latest(-l)					# Select latest version of package
	--no-self-upgrade					# Don't do early upgrade of the apk
	--self-upgrade-only					# Only do self-upgrade
	--ignore					# Ignore the upgrade of PACKAGE
	--prune					# Prune the WORLD by removing packages which are no longer available
	...args
]

# Manage local package cache
extern "apk cache" [
	--upgrade(-u)					# Prefer to upgrade package
	--latest(-l)					# Select latest version of package
	...args
]

# Compare package versions
extern "apk version" [
	--indexes(-I)					# Print description and versions of indexes
	--test(-t)					# Compare two given versions
	--check(-c)					# Check the given version strings
	--all(-a)					# Consider packages from all repository tags
	...args
]

# Create repository index file
extern "apk index" [
	--no-warnings					# Disable the warning about missing dependencies
	...args
]

# Download packages
extern "apk fetch" [
	--link(-L)					# Create hard links
	--recursive(-R)					# Fetch all dependencies too
	--simulate					# Simulate the requested operation
	--stdout(-s)					# Dump the .apk to stdout
	...args
]

# Audit the directories for changes
extern "apk audit" [
	--backup					# Audit configuration files only
	--system					# Audit all system files
	--check-permissions					# Check file permissions too
	--recursive(-r)					# Descend into directories and audit them as well
	--packages					# List only the changed packages
	...args
]

# Verify package integrity and signature
extern "apk verify" [

	...args
]

# Generate graphviz graphs
extern "apk dot" [
	--errors					# Consider only packages with errors
	--installed					# Consider only installed packages
	...args
]

# Show repository policy for packages
extern "apk policy" [

	...args
]

# Show statistics about repositories and installations
extern "apk stats" [

	...args
]

# Show checksums of package contents
extern "apk manifest" [

	...args
]