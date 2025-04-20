# Do system commands everything quietly.
extern "wajig" [
	--quiet(-q)					# Do system commands everything quietly.
	--noauth(-n)					# Allow packages from unauthenticated archives.
	--simulate(-s)					# Trace but don\'t
	--teaching(-t)					# Trace the sequence of commands performed.
	--yes(-y)					# Assume yes for any questions asked.
	...args
]

# Add a CD-ROM to the list of available sources of packages
extern "wajig addcdrom" [
	--quiet(-q)					# Do system commands everything quietly.
	--noauth(-n)					# Allow packages from unauthenticated archives.
	--simulate(-s)					# Trace but don\'t
	--teaching(-t)					# Trace the sequence of commands performed.
	--yes(-y)					# Assume yes for any questions asked.
	...args
]

# Mark the alternative to be auto set (using set priorities)
extern "wajig auto-alts" [
	--quiet(-q)					# Do system commands everything quietly.
	--noauth(-n)					# Allow packages from unauthenticated archives.
	--simulate(-s)					# Trace but don\'t
	--teaching(-t)					# Trace the sequence of commands performed.
	--yes(-y)					# Assume yes for any questions asked.
	...args
]

# Remove superseded deb files from the download cache
extern "wajig auto-clean" [
	--quiet(-q)					# Do system commands everything quietly.
	--noauth(-n)					# Allow packages from unauthenticated archives.
	--simulate(-s)					# Trace but don\'t
	--teaching(-t)					# Trace the sequence of commands performed.
	--yes(-y)					# Assume yes for any questions asked.
	...args
]

# Do an update followed by a download of all updated packages
extern "wajig auto-download" [
	--quiet(-q)					# Do system commands everything quietly.
	--noauth(-n)					# Allow packages from unauthenticated archives.
	--simulate(-s)					# Trace but don\'t
	--teaching(-t)					# Trace the sequence of commands performed.
	--yes(-y)					# Assume yes for any questions asked.
	...args
]

# Perform an install without asking questions (non-interactive)
extern "wajig auto-install" [
	--quiet(-q)					# Do system commands everything quietly.
	--noauth(-n)					# Allow packages from unauthenticated archives.
	--simulate(-s)					# Trace but don\'t
	--teaching(-t)					# Trace the sequence of commands performed.
	--yes(-y)					# Assume yes for any questions asked.
	...args
]

# List versions of packages available for installation
extern "wajig available" [
	--quiet(-q)					# Do system commands everything quietly.
	--noauth(-n)					# Allow packages from unauthenticated archives.
	--simulate(-s)					# Trace but don\'t
	--teaching(-t)					# Trace the sequence of commands performed.
	--yes(-y)					# Assume yes for any questions asked.
	...args
]

# Check reported bugs in package using the Debian Bug Tracker
extern "wajig bug" [
	--quiet(-q)					# Do system commands everything quietly.
	--noauth(-n)					# Allow packages from unauthenticated archives.
	--simulate(-s)					# Trace but don\'t
	--teaching(-t)					# Trace the sequence of commands performed.
	--yes(-y)					# Assume yes for any questions asked.
	...args
]

# Retrieve/unpack sources and build .deb for the named packages
extern "wajig build" [
	--quiet(-q)					# Do system commands everything quietly.
	--noauth(-n)					# Allow packages from unauthenticated archives.
	--simulate(-s)					# Trace but don\'t
	--teaching(-t)					# Trace the sequence of commands performed.
	--yes(-y)					# Assume yes for any questions asked.
	...args
]

# Retrieve packages required to build listed packages
extern "wajig build-depend" [
	--quiet(-q)					# Do system commands everything quietly.
	--noauth(-n)					# Allow packages from unauthenticated archives.
	--simulate(-s)					# Trace but don\'t
	--teaching(-t)					# Trace the sequence of commands performed.
	--yes(-y)					# Assume yes for any questions asked.
	...args
]

# Retrieve latest changelog for the package
extern "wajig changelog" [
	--quiet(-q)					# Do system commands everything quietly.
	--noauth(-n)					# Allow packages from unauthenticated archives.
	--simulate(-s)					# Trace but don\'t
	--teaching(-t)					# Trace the sequence of commands performed.
	--yes(-y)					# Assume yes for any questions asked.
	...args
]

# Remove all deb files from the download cache
extern "wajig clean" [
	--quiet(-q)					# Do system commands everything quietly.
	--noauth(-n)					# Allow packages from unauthenticated archives.
	--simulate(-s)					# Trace but don\'t
	--teaching(-t)					# Trace the sequence of commands performed.
	--yes(-y)					# Assume yes for any questions asked.
	...args
]

# List all the JIG commands and one line descriptions for each
extern "wajig commands" [
	--quiet(-q)					# Do system commands everything quietly.
	--noauth(-n)					# Allow packages from unauthenticated archives.
	--simulate(-s)					# Trace but don\'t
	--teaching(-t)					# Trace the sequence of commands performed.
	--yes(-y)					# Assume yes for any questions asked.
	...args
]

# Perform an update then a dist-upgrade
extern "wajig daily-upgrade" [
	--quiet(-q)					# Do system commands everything quietly.
	--noauth(-n)					# Allow packages from unauthenticated archives.
	--simulate(-s)					# Trace but don\'t
	--teaching(-t)					# Trace the sequence of commands performed.
	--yes(-y)					# Assume yes for any questions asked.
	...args
]

# List of packages which depend/recommend/suggest the package
extern "wajig dependents" [
	--quiet(-q)					# Do system commands everything quietly.
	--noauth(-n)					# Allow packages from unauthenticated archives.
	--simulate(-s)					# Trace but don\'t
	--teaching(-t)					# Trace the sequence of commands performed.
	--yes(-y)					# Assume yes for any questions asked.
	...args
]

# One line description of packages (-v and -vv for more detail)
extern "wajig describe" [
	--quiet(-q)					# Do system commands everything quietly.
	--noauth(-n)					# Allow packages from unauthenticated archives.
	--simulate(-s)					# Trace but don\'t
	--teaching(-t)					# Trace the sequence of commands performed.
	--yes(-y)					# Assume yes for any questions asked.
	...args
]

# One line description of new packages
extern "wajig describe-new" [
	--quiet(-q)					# Do system commands everything quietly.
	--noauth(-n)					# Allow packages from unauthenticated archives.
	--simulate(-s)					# Trace but don\'t
	--teaching(-t)					# Trace the sequence of commands performed.
	--yes(-y)					# Assume yes for any questions asked.
	...args
]

# Provide a detailed description of package (describe -vv)
extern "wajig detail" [
	--quiet(-q)					# Do system commands everything quietly.
	--noauth(-n)					# Allow packages from unauthenticated archives.
	--simulate(-s)					# Trace but don\'t
	--teaching(-t)					# Trace the sequence of commands performed.
	--yes(-y)					# Assume yes for any questions asked.
	...args
]

# Provide a detailed description of new packages (describe -vv)
extern "wajig detail-new" [
	--quiet(-q)					# Do system commands everything quietly.
	--noauth(-n)					# Allow packages from unauthenticated archives.
	--simulate(-s)					# Trace but don\'t
	--teaching(-t)					# Trace the sequence of commands performed.
	--yes(-y)					# Assume yes for any questions asked.
	...args
]

# Upgrade to new distribution (installed and new rqd packages)
extern "wajig dist-upgrade" [
	--quiet(-q)					# Do system commands everything quietly.
	--noauth(-n)					# Allow packages from unauthenticated archives.
	--simulate(-s)					# Trace but don\'t
	--teaching(-t)					# Trace the sequence of commands performed.
	--yes(-y)					# Assume yes for any questions asked.
	...args
]

# Equivalent to help with -verbose=2
extern "wajig docs" [
	--quiet(-q)					# Do system commands everything quietly.
	--noauth(-n)					# Allow packages from unauthenticated archives.
	--simulate(-s)					# Trace but don\'t
	--teaching(-t)					# Trace the sequence of commands performed.
	--yes(-y)					# Assume yes for any questions asked.
	...args
]

# Download package files ready for an install
extern "wajig download" [
	--quiet(-q)					# Do system commands everything quietly.
	--noauth(-n)					# Allow packages from unauthenticated archives.
	--simulate(-s)					# Trace but don\'t
	--teaching(-t)					# Trace the sequence of commands performed.
	--yes(-y)					# Assume yes for any questions asked.
	...args
]

# Download packages listed in file ready for an install
extern "wajig file-download" [
	--quiet(-q)					# Do system commands everything quietly.
	--noauth(-n)					# Allow packages from unauthenticated archives.
	--simulate(-s)					# Trace but don\'t
	--teaching(-t)					# Trace the sequence of commands performed.
	--yes(-y)					# Assume yes for any questions asked.
	...args
]

# Install packages listed in a file
extern "wajig file-install" [
	--quiet(-q)					# Do system commands everything quietly.
	--noauth(-n)					# Allow packages from unauthenticated archives.
	--simulate(-s)					# Trace but don\'t
	--teaching(-t)					# Trace the sequence of commands performed.
	--yes(-y)					# Assume yes for any questions asked.
	...args
]

# Remove packages listed in a file
extern "wajig file-remove" [
	--quiet(-q)					# Do system commands everything quietly.
	--noauth(-n)					# Allow packages from unauthenticated archives.
	--simulate(-s)					# Trace but don\'t
	--teaching(-t)					# Trace the sequence of commands performed.
	--yes(-y)					# Assume yes for any questions asked.
	...args
]

# Search for a file within installed packages
extern "wajig find-file" [
	--quiet(-q)					# Do system commands everything quietly.
	--noauth(-n)					# Allow packages from unauthenticated archives.
	--simulate(-s)					# Trace but don\'t
	--teaching(-t)					# Trace the sequence of commands performed.
	--yes(-y)					# Assume yes for any questions asked.
	...args
]

# Search for an unofficial Debian package at apt-get.org
extern "wajig find-pkg" [
	--quiet(-q)					# Do system commands everything quietly.
	--noauth(-n)					# Allow packages from unauthenticated archives.
	--simulate(-s)					# Trace but don\'t
	--teaching(-t)					# Trace the sequence of commands performed.
	--yes(-y)					# Assume yes for any questions asked.
	...args
]

# Perform dpkg --configure -a (to fix interrupted configure)
extern "wajig fix-configure" [
	--quiet(-q)					# Do system commands everything quietly.
	--noauth(-n)					# Allow packages from unauthenticated archives.
	--simulate(-s)					# Trace but don\'t
	--teaching(-t)					# Trace the sequence of commands performed.
	--yes(-y)					# Assume yes for any questions asked.
	...args
]

# Perform apt-get install (to fix broken dependencies)
extern "wajig fix-install" [
	--quiet(-q)					# Do system commands everything quietly.
	--noauth(-n)					# Allow packages from unauthenticated archives.
	--simulate(-s)					# Trace but don\'t
	--teaching(-t)					# Trace the sequence of commands performed.
	--yes(-y)					# Assume yes for any questions asked.
	...args
]

# Perform apt-get --fix-missing upgrade
extern "wajig fix-missing" [
	--quiet(-q)					# Do system commands everything quietly.
	--noauth(-n)					# Allow packages from unauthenticated archives.
	--simulate(-s)					# Trace but don\'t
	--teaching(-t)					# Trace the sequence of commands performed.
	--yes(-y)					# Assume yes for any questions asked.
	...args
]

# Install packages and ignore file overwrites and depends
extern "wajig force" [
	--quiet(-q)					# Do system commands everything quietly.
	--noauth(-n)					# Allow packages from unauthenticated archives.
	--simulate(-s)					# Trace but don\'t
	--teaching(-t)					# Trace the sequence of commands performed.
	--yes(-y)					# Assume yes for any questions asked.
	...args
]

# Print documentation (detail depends on --verbose)
extern "wajig help" [
	--quiet(-q)					# Do system commands everything quietly.
	--noauth(-n)					# Allow packages from unauthenticated archives.
	--simulate(-s)					# Trace but don\'t
	--teaching(-t)					# Trace the sequence of commands performed.
	--yes(-y)					# Assume yes for any questions asked.
	...args
]

# Place listed packages on hold so they are not upgraded
extern "wajig hold" [
	--quiet(-q)					# Do system commands everything quietly.
	--noauth(-n)					# Allow packages from unauthenticated archives.
	--simulate(-s)					# Trace but don\'t
	--teaching(-t)					# Trace the sequence of commands performed.
	--yes(-y)					# Assume yes for any questions asked.
	...args
]

# Initialise or reset the JIG archive files
extern "wajig init" [
	--quiet(-q)					# Do system commands everything quietly.
	--noauth(-n)					# Allow packages from unauthenticated archives.
	--simulate(-s)					# Trace but don\'t
	--teaching(-t)					# Trace the sequence of commands performed.
	--yes(-y)					# Assume yes for any questions asked.
	...args
]

# Install (or upgrade) one or more packages or .deb files
extern "wajig install" [
	--quiet(-q)					# Do system commands everything quietly.
	--noauth(-n)					# Allow packages from unauthenticated archives.
	--simulate(-s)					# Trace but don\'t
	--teaching(-t)					# Trace the sequence of commands performed.
	--yes(-y)					# Assume yes for any questions asked.
	...args
]

# Install package and associated recommended packages
extern "wajig installr" [
	--quiet(-q)					# Do system commands everything quietly.
	--noauth(-n)					# Allow packages from unauthenticated archives.
	--simulate(-s)					# Trace but don\'t
	--teaching(-t)					# Trace the sequence of commands performed.
	--yes(-y)					# Assume yes for any questions asked.
	...args
]

# Install package and recommended and suggested packages
extern "wajig installrs" [
	--quiet(-q)					# Do system commands everything quietly.
	--noauth(-n)					# Allow packages from unauthenticated archives.
	--simulate(-s)					# Trace but don\'t
	--teaching(-t)					# Trace the sequence of commands performed.
	--yes(-y)					# Assume yes for any questions asked.
	...args
]

# Install package and associated suggested packages
extern "wajig installs" [
	--quiet(-q)					# Do system commands everything quietly.
	--noauth(-n)					# Allow packages from unauthenticated archives.
	--simulate(-s)					# Trace but don\'t
	--teaching(-t)					# Trace the sequence of commands performed.
	--yes(-y)					# Assume yes for any questions asked.
	...args
]

# Check the integrity of installed packages (through checksums)
extern "wajig integrity" [
	--quiet(-q)					# Do system commands everything quietly.
	--noauth(-n)					# Allow packages from unauthenticated archives.
	--simulate(-s)					# Trace but don\'t
	--teaching(-t)					# Trace the sequence of commands performed.
	--yes(-y)					# Assume yes for any questions asked.
	...args
]

# List size of all large (>10MB) installed packages
extern "wajig large" [
	--quiet(-q)					# Do system commands everything quietly.
	--noauth(-n)					# Allow packages from unauthenticated archives.
	--simulate(-s)					# Trace but don\'t
	--teaching(-t)					# Trace the sequence of commands performed.
	--yes(-y)					# Assume yes for any questions asked.
	...args
]

# Identify when an update was last performed
extern "wajig last-update" [
	--quiet(-q)					# Do system commands everything quietly.
	--noauth(-n)					# Allow packages from unauthenticated archives.
	--simulate(-s)					# Trace but don\'t
	--teaching(-t)					# Trace the sequence of commands performed.
	--yes(-y)					# Assume yes for any questions asked.
	...args
]

# List the status and description of installed packages
extern "wajig list" [
	--quiet(-q)					# Do system commands everything quietly.
	--noauth(-n)					# Allow packages from unauthenticated archives.
	--simulate(-s)					# Trace but don\'t
	--teaching(-t)					# Trace the sequence of commands performed.
	--yes(-y)					# Assume yes for any questions asked.
	...args
]

# List a one line description of given or all packages
extern "wajig list-all" [
	--quiet(-q)					# Do system commands everything quietly.
	--noauth(-n)					# Allow packages from unauthenticated archives.
	--simulate(-s)					# Trace but don\'t
	--teaching(-t)					# Trace the sequence of commands performed.
	--yes(-y)					# Assume yes for any questions asked.
	...args
]

# List the objects that can have alternatives configured
extern "wajig list-alts" [
	--quiet(-q)					# Do system commands everything quietly.
	--noauth(-n)					# Allow packages from unauthenticated archives.
	--simulate(-s)					# Trace but don\'t
	--teaching(-t)					# Trace the sequence of commands performed.
	--yes(-y)					# Assume yes for any questions asked.
	...args
]

# List the contents of the download cache
extern "wajig list-cache" [
	--quiet(-q)					# Do system commands everything quietly.
	--noauth(-n)					# Allow packages from unauthenticated archives.
	--simulate(-s)					# Trace but don\'t
	--teaching(-t)					# Trace the sequence of commands performed.
	--yes(-y)					# Assume yes for any questions asked.
	...args
]

# List all the JIG commands and one line descriptions for each
extern "wajig list-commands" [
	--quiet(-q)					# Do system commands everything quietly.
	--noauth(-n)					# Allow packages from unauthenticated archives.
	--simulate(-s)					# Trace but don\'t
	--teaching(-t)					# Trace the sequence of commands performed.
	--yes(-y)					# Assume yes for any questions asked.
	...args
]

# List the daemons that JIG can start/stop/restart
extern "wajig list-daemons" [
	--quiet(-q)					# Do system commands everything quietly.
	--noauth(-n)					# Allow packages from unauthenticated archives.
	--simulate(-s)					# Trace but don\'t
	--teaching(-t)					# Trace the sequence of commands performed.
	--yes(-y)					# Assume yes for any questions asked.
	...args
]

# List the files that are supplied by the named package
extern "wajig list-files" [
	--quiet(-q)					# Do system commands everything quietly.
	--noauth(-n)					# Allow packages from unauthenticated archives.
	--simulate(-s)					# Trace but don\'t
	--teaching(-t)					# Trace the sequence of commands performed.
	--yes(-y)					# Assume yes for any questions asked.
	...args
]

# List those packages on hold
extern "wajig list-hold" [
	--quiet(-q)					# Do system commands everything quietly.
	--noauth(-n)					# Allow packages from unauthenticated archives.
	--simulate(-s)					# Trace but don\'t
	--teaching(-t)					# Trace the sequence of commands performed.
	--yes(-y)					# Assume yes for any questions asked.
	...args
]

# List packages (with optional argument substring) installed
extern "wajig list-installed" [
	--quiet(-q)					# Do system commands everything quietly.
	--noauth(-n)					# Allow packages from unauthenticated archives.
	--simulate(-s)					# Trace but don\'t
	--teaching(-t)					# Trace the sequence of commands performed.
	--yes(-y)					# Assume yes for any questions asked.
	...args
]

# List the contents of the install/remove log file (filtered)
extern "wajig list-log" [
	--quiet(-q)					# Do system commands everything quietly.
	--noauth(-n)					# Allow packages from unauthenticated archives.
	--simulate(-s)					# Trace but don\'t
	--teaching(-t)					# Trace the sequence of commands performed.
	--yes(-y)					# Assume yes for any questions asked.
	...args
]

# List all known packages or those containing supplied string
extern "wajig list-names" [
	--quiet(-q)					# Do system commands everything quietly.
	--noauth(-n)					# Allow packages from unauthenticated archives.
	--simulate(-s)					# Trace but don\'t
	--teaching(-t)					# Trace the sequence of commands performed.
	--yes(-y)					# Assume yes for any questions asked.
	...args
]

# List libraries not required by any installed package
extern "wajig list-orphans" [
	--quiet(-q)					# Do system commands everything quietly.
	--noauth(-n)					# Allow packages from unauthenticated archives.
	--simulate(-s)					# Trace but don\'t
	--teaching(-t)					# Trace the sequence of commands performed.
	--yes(-y)					# Assume yes for any questions asked.
	...args
]

# List the control scripts of the package of deb file
extern "wajig list-scripts" [
	--quiet(-q)					# Do system commands everything quietly.
	--noauth(-n)					# Allow packages from unauthenticated archives.
	--simulate(-s)					# Trace but don\'t
	--teaching(-t)					# Trace the sequence of commands performed.
	--yes(-y)					# Assume yes for any questions asked.
	...args
]

# List packages that belong to a specific section
extern "wajig list-section" [
	--quiet(-q)					# Do system commands everything quietly.
	--noauth(-n)					# Allow packages from unauthenticated archives.
	--simulate(-s)					# Trace but don\'t
	--teaching(-t)					# Trace the sequence of commands performed.
	--yes(-y)					# Assume yes for any questions asked.
	...args
]

# Same as list but only prints first two columns, not truncated
extern "wajig list-status" [
	--quiet(-q)					# Do system commands everything quietly.
	--noauth(-n)					# Allow packages from unauthenticated archives.
	--simulate(-s)					# Trace but don\'t
	--teaching(-t)					# Trace the sequence of commands performed.
	--yes(-y)					# Assume yes for any questions asked.
	...args
]

# Same as list but avoids truncating package names
extern "wajig list-wide" [
	--quiet(-q)					# Do system commands everything quietly.
	--noauth(-n)					# Allow packages from unauthenticated archives.
	--simulate(-s)					# Trace but don\'t
	--teaching(-t)					# Trace the sequence of commands performed.
	--yes(-y)					# Assume yes for any questions asked.
	...args
]

# Dist-upgrade using packages already downloaded
extern "wajig local-dist-upgrade" [
	--quiet(-q)					# Do system commands everything quietly.
	--noauth(-n)					# Allow packages from unauthenticated archives.
	--simulate(-s)					# Trace but don\'t
	--teaching(-t)					# Trace the sequence of commands performed.
	--yes(-y)					# Assume yes for any questions asked.
	...args
]

# Upgrade using packages already downloaded, but not any others
extern "wajig local-upgrade" [
	--quiet(-q)					# Do system commands everything quietly.
	--noauth(-n)					# Allow packages from unauthenticated archives.
	--simulate(-s)					# Trace but don\'t
	--teaching(-t)					# Trace the sequence of commands performed.
	--yes(-y)					# Assume yes for any questions asked.
	...args
]

# Runs the madison command of apt-cache.
extern "wajig madison" [
	--quiet(-q)					# Do system commands everything quietly.
	--noauth(-n)					# Allow packages from unauthenticated archives.
	--simulate(-s)					# Trace but don\'t
	--teaching(-t)					# Trace the sequence of commands performed.
	--yes(-y)					# Assume yes for any questions asked.
	...args
]

# Move packages in the download cache to a local Debian mirror
extern "wajig move" [
	--quiet(-q)					# Do system commands everything quietly.
	--noauth(-n)					# Allow packages from unauthenticated archives.
	--simulate(-s)					# Trace but don\'t
	--teaching(-t)					# Trace the sequence of commands performed.
	--yes(-y)					# Assume yes for any questions asked.
	...args
]

# List packages that became available since last update
extern "wajig new" [
	--quiet(-q)					# Do system commands everything quietly.
	--noauth(-n)					# Allow packages from unauthenticated archives.
	--simulate(-s)					# Trace but don\'t
	--teaching(-t)					# Trace the sequence of commands performed.
	--yes(-y)					# Assume yes for any questions asked.
	...args
]

# Obtain the latest news about the package
extern "wajig news" [
	--quiet(-q)					# Do system commands everything quietly.
	--noauth(-n)					# Allow packages from unauthenticated archives.
	--simulate(-s)					# Trace but don\'t
	--teaching(-t)					# Trace the sequence of commands performed.
	--yes(-y)					# Assume yes for any questions asked.
	...args
]

# List packages newly available for upgrading
extern "wajig new-upgrades" [
	--quiet(-q)					# Do system commands everything quietly.
	--noauth(-n)					# Allow packages from unauthenticated archives.
	--simulate(-s)					# Trace but don\'t
	--teaching(-t)					# Trace the sequence of commands performed.
	--yes(-y)					# Assume yes for any questions asked.
	...args
]

# List installed packages that do not meet the DFSG
extern "wajig non-free" [
	--quiet(-q)					# Do system commands everything quietly.
	--noauth(-n)					# Allow packages from unauthenticated archives.
	--simulate(-s)					# Trace but don\'t
	--teaching(-t)					# Trace the sequence of commands performed.
	--yes(-y)					# Assume yes for any questions asked.
	...args
]

# List libraries not required by any installed package
extern "wajig orphans" [
	--quiet(-q)					# Do system commands everything quietly.
	--noauth(-n)					# Allow packages from unauthenticated archives.
	--simulate(-s)					# Trace but don\'t
	--teaching(-t)					# Trace the sequence of commands performed.
	--yes(-y)					# Assume yes for any questions asked.
	...args
]

# Generate a .deb file for an installed package
extern "wajig package" [
	--quiet(-q)					# Do system commands everything quietly.
	--noauth(-n)					# Allow packages from unauthenticated archives.
	--simulate(-s)					# Trace but don\'t
	--teaching(-t)					# Trace the sequence of commands performed.
	--yes(-y)					# Assume yes for any questions asked.
	...args
]

# From preferences file show priorities/policy (available)
extern "wajig policy" [
	--quiet(-q)					# Do system commands everything quietly.
	--noauth(-n)					# Allow packages from unauthenticated archives.
	--simulate(-s)					# Trace but don\'t
	--teaching(-t)					# Trace the sequence of commands performed.
	--yes(-y)					# Assume yes for any questions asked.
	...args
]

# Remove one or more packages and configuration files
extern "wajig purge" [
	--quiet(-q)					# Do system commands everything quietly.
	--noauth(-n)					# Allow packages from unauthenticated archives.
	--simulate(-s)					# Trace but don\'t
	--teaching(-t)					# Trace the sequence of commands performed.
	--yes(-y)					# Assume yes for any questions asked.
	...args
]

# Purge package and those it depend on and not required by others
extern "wajig purge-depend" [
	--quiet(-q)					# Do system commands everything quietly.
	--noauth(-n)					# Allow packages from unauthenticated archives.
	--simulate(-s)					# Trace but don\'t
	--teaching(-t)					# Trace the sequence of commands performed.
	--yes(-y)					# Assume yes for any questions asked.
	...args
]

# Purge orphaned libraries (not required by installed packages)
extern "wajig purge-orphans" [
	--quiet(-q)					# Do system commands everything quietly.
	--noauth(-n)					# Allow packages from unauthenticated archives.
	--simulate(-s)					# Trace but don\'t
	--teaching(-t)					# Trace the sequence of commands performed.
	--yes(-y)					# Assume yes for any questions asked.
	...args
]

# Display the package\'s
extern "wajig readme" [
	--quiet(-q)					# Do system commands everything quietly.
	--noauth(-n)					# Allow packages from unauthenticated archives.
	--simulate(-s)					# Trace but don\'t
	--teaching(-t)					# Trace the sequence of commands performed.
	--yes(-y)					# Assume yes for any questions asked.
	...args
]

# Download package and any packages it depends on
extern "wajig recursive" [
	--quiet(-q)					# Do system commands everything quietly.
	--noauth(-n)					# Allow packages from unauthenticated archives.
	--simulate(-s)					# Trace but don\'t
	--teaching(-t)					# Trace the sequence of commands performed.
	--yes(-y)					# Assume yes for any questions asked.
	...args
]

# Install package and associated recommended packages
extern "wajig recommended" [
	--quiet(-q)					# Do system commands everything quietly.
	--noauth(-n)					# Allow packages from unauthenticated archives.
	--simulate(-s)					# Trace but don\'t
	--teaching(-t)					# Trace the sequence of commands performed.
	--yes(-y)					# Assume yes for any questions asked.
	...args
]

# Reconfigure the named installed packages or run gkdebconf
extern "wajig reconfigure" [
	--quiet(-q)					# Do system commands everything quietly.
	--noauth(-n)					# Allow packages from unauthenticated archives.
	--simulate(-s)					# Trace but don\'t
	--teaching(-t)					# Trace the sequence of commands performed.
	--yes(-y)					# Assume yes for any questions asked.
	...args
]

# Reinstall each of the named packages
extern "wajig reinstall" [
	--quiet(-q)					# Do system commands everything quietly.
	--noauth(-n)					# Allow packages from unauthenticated archives.
	--simulate(-s)					# Trace but don\'t
	--teaching(-t)					# Trace the sequence of commands performed.
	--yes(-y)					# Assume yes for any questions asked.
	...args
]

# Reload daemon configs, e.g., gdm, apache (see list-daemons)
extern "wajig reload" [
	--quiet(-q)					# Do system commands everything quietly.
	--noauth(-n)					# Allow packages from unauthenticated archives.
	--simulate(-s)					# Trace but don\'t
	--teaching(-t)					# Trace the sequence of commands performed.
	--yes(-y)					# Assume yes for any questions asked.
	...args
]

# Remove one or more packages (see also purge)
extern "wajig remove" [
	--quiet(-q)					# Do system commands everything quietly.
	--noauth(-n)					# Allow packages from unauthenticated archives.
	--simulate(-s)					# Trace but don\'t
	--teaching(-t)					# Trace the sequence of commands performed.
	--yes(-y)					# Assume yes for any questions asked.
	...args
]

# Remove package and its dependees not required by others
extern "wajig remove-depend" [
	--quiet(-q)					# Do system commands everything quietly.
	--noauth(-n)					# Allow packages from unauthenticated archives.
	--simulate(-s)					# Trace but don\'t
	--teaching(-t)					# Trace the sequence of commands performed.
	--yes(-y)					# Assume yes for any questions asked.
	...args
]

# Remove orphaned libraries (not required by installed packages)
extern "wajig remove-orphans" [
	--quiet(-q)					# Do system commands everything quietly.
	--noauth(-n)					# Allow packages from unauthenticated archives.
	--simulate(-s)					# Trace but don\'t
	--teaching(-t)					# Trace the sequence of commands performed.
	--yes(-y)					# Assume yes for any questions asked.
	...args
]

# Generate a .deb file for an installed package
extern "wajig repackage" [
	--quiet(-q)					# Do system commands everything quietly.
	--noauth(-n)					# Allow packages from unauthenticated archives.
	--simulate(-s)					# Trace but don\'t
	--teaching(-t)					# Trace the sequence of commands performed.
	--yes(-y)					# Assume yes for any questions asked.
	...args
]

# Initialise or reset the JIG archive files
extern "wajig reset" [
	--quiet(-q)					# Do system commands everything quietly.
	--noauth(-n)					# Allow packages from unauthenticated archives.
	--simulate(-s)					# Trace but don\'t
	--teaching(-t)					# Trace the sequence of commands performed.
	--yes(-y)					# Assume yes for any questions asked.
	...args
]

# Stop then start a daemon, e.g., gdm, apache (see list-daemons)
extern "wajig restart" [
	--quiet(-q)					# Do system commands everything quietly.
	--noauth(-n)					# Allow packages from unauthenticated archives.
	--simulate(-s)					# Trace but don\'t
	--teaching(-t)					# Trace the sequence of commands performed.
	--yes(-y)					# Assume yes for any questions asked.
	...args
]

# Install a RedHat .rpm package
extern "wajig rpminstall" [
	--quiet(-q)					# Do system commands everything quietly.
	--noauth(-n)					# Allow packages from unauthenticated archives.
	--simulate(-s)					# Trace but don\'t
	--teaching(-t)					# Trace the sequence of commands performed.
	--yes(-y)					# Assume yes for any questions asked.
	...args
]

# Convert a RedHat .rpm file to a Debian .deb file
extern "wajig rpmtodeb" [
	--quiet(-q)					# Do system commands everything quietly.
	--noauth(-n)					# Allow packages from unauthenticated archives.
	--simulate(-s)					# Trace but don\'t
	--teaching(-t)					# Trace the sequence of commands performed.
	--yes(-y)					# Assume yes for any questions asked.
	...args
]

# Search for packages containing listed words
extern "wajig search" [
	--quiet(-q)					# Do system commands everything quietly.
	--noauth(-n)					# Allow packages from unauthenticated archives.
	--simulate(-s)					# Trace but don\'t
	--teaching(-t)					# Trace the sequence of commands performed.
	--yes(-y)					# Assume yes for any questions asked.
	...args
]

# Find local Debian archives suitable for sources.list
extern "wajig search-apt" [
	--quiet(-q)					# Do system commands everything quietly.
	--noauth(-n)					# Allow packages from unauthenticated archives.
	--simulate(-s)					# Trace but don\'t
	--teaching(-t)					# Trace the sequence of commands performed.
	--yes(-y)					# Assume yes for any questions asked.
	...args
]

# Configure the sources.list file which locates Debian archives
extern "wajig setup" [
	--quiet(-q)					# Do system commands everything quietly.
	--noauth(-n)					# Allow packages from unauthenticated archives.
	--simulate(-s)					# Trace but don\'t
	--teaching(-t)					# Trace the sequence of commands performed.
	--yes(-y)					# Assume yes for any questions asked.
	...args
]

# Provide a detailed description of package [same as detail]
extern "wajig show" [
	--quiet(-q)					# Do system commands everything quietly.
	--noauth(-n)					# Allow packages from unauthenticated archives.
	--simulate(-s)					# Trace but don\'t
	--teaching(-t)					# Trace the sequence of commands performed.
	--yes(-y)					# Assume yes for any questions asked.
	...args
]

# Trace the steps that a dist-upgrade would perform
extern "wajig showdistupgrade" [
	--quiet(-q)					# Do system commands everything quietly.
	--noauth(-n)					# Allow packages from unauthenticated archives.
	--simulate(-s)					# Trace but don\'t
	--teaching(-t)					# Trace the sequence of commands performed.
	--yes(-y)					# Assume yes for any questions asked.
	...args
]

# Trace the steps that an install would perform
extern "wajig showinstall" [
	--quiet(-q)					# Do system commands everything quietly.
	--noauth(-n)					# Allow packages from unauthenticated archives.
	--simulate(-s)					# Trace but don\'t
	--teaching(-t)					# Trace the sequence of commands performed.
	--yes(-y)					# Assume yes for any questions asked.
	...args
]

# Trace the steps that a remove would perform
extern "wajig showremove" [
	--quiet(-q)					# Do system commands everything quietly.
	--noauth(-n)					# Allow packages from unauthenticated archives.
	--simulate(-s)					# Trace but don\'t
	--teaching(-t)					# Trace the sequence of commands performed.
	--yes(-y)					# Assume yes for any questions asked.
	...args
]

# Trace the steps that an upgrade would perform
extern "wajig showupgrade" [
	--quiet(-q)					# Do system commands everything quietly.
	--noauth(-n)					# Allow packages from unauthenticated archives.
	--simulate(-s)					# Trace but don\'t
	--teaching(-t)					# Trace the sequence of commands performed.
	--yes(-y)					# Assume yes for any questions asked.
	...args
]

# Print out the size (in K) of all, or listed, installed packages
extern "wajig size" [
	--quiet(-q)					# Do system commands everything quietly.
	--noauth(-n)					# Allow packages from unauthenticated archives.
	--simulate(-s)					# Trace but don\'t
	--teaching(-t)					# Trace the sequence of commands performed.
	--yes(-y)					# Assume yes for any questions asked.
	...args
]

# Print out the size (in K) of all, or listed, installed packages
extern "wajig sizes" [
	--quiet(-q)					# Do system commands everything quietly.
	--noauth(-n)					# Allow packages from unauthenticated archives.
	--simulate(-s)					# Trace but don\'t
	--teaching(-t)					# Trace the sequence of commands performed.
	--yes(-y)					# Assume yes for any questions asked.
	...args
]

# Generates list of package=version for all installed packages
extern "wajig snapshot" [
	--quiet(-q)					# Do system commands everything quietly.
	--noauth(-n)					# Allow packages from unauthenticated archives.
	--simulate(-s)					# Trace but don\'t
	--teaching(-t)					# Trace the sequence of commands performed.
	--yes(-y)					# Assume yes for any questions asked.
	...args
]

# Retrieve and unpack sources for the named packages
extern "wajig source" [
	--quiet(-q)					# Do system commands everything quietly.
	--noauth(-n)					# Allow packages from unauthenticated archives.
	--simulate(-s)					# Trace but don\'t
	--teaching(-t)					# Trace the sequence of commands performed.
	--yes(-y)					# Assume yes for any questions asked.
	...args
]

# Start a daemon, e.g., gdm, apache (see list-daemons)
extern "wajig start" [
	--quiet(-q)					# Do system commands everything quietly.
	--noauth(-n)					# Allow packages from unauthenticated archives.
	--simulate(-s)					# Trace but don\'t
	--teaching(-t)					# Trace the sequence of commands performed.
	--yes(-y)					# Assume yes for any questions asked.
	...args
]

# Show the version and available version of packages
extern "wajig status" [
	--quiet(-q)					# Do system commands everything quietly.
	--noauth(-n)					# Allow packages from unauthenticated archives.
	--simulate(-s)					# Trace but don\'t
	--teaching(-t)					# Trace the sequence of commands performed.
	--yes(-y)					# Assume yes for any questions asked.
	...args
]

# Show the version and available version of matching packages
extern "wajig status-match" [
	--quiet(-q)					# Do system commands everything quietly.
	--noauth(-n)					# Allow packages from unauthenticated archives.
	--simulate(-s)					# Trace but don\'t
	--teaching(-t)					# Trace the sequence of commands performed.
	--yes(-y)					# Assume yes for any questions asked.
	...args
]

# Show the version and available version of matching packages
extern "wajig status-search" [
	--quiet(-q)					# Do system commands everything quietly.
	--noauth(-n)					# Allow packages from unauthenticated archives.
	--simulate(-s)					# Trace but don\'t
	--teaching(-t)					# Trace the sequence of commands performed.
	--yes(-y)					# Assume yes for any questions asked.
	...args
]

# Stop a daemon, e.g., gdm, apache (see list-daemons)
extern "wajig stop" [
	--quiet(-q)					# Do system commands everything quietly.
	--noauth(-n)					# Allow packages from unauthenticated archives.
	--simulate(-s)					# Trace but don\'t
	--teaching(-t)					# Trace the sequence of commands performed.
	--yes(-y)					# Assume yes for any questions asked.
	...args
]

# Install package and associated suggested packages
extern "wajig suggested" [
	--quiet(-q)					# Do system commands everything quietly.
	--noauth(-n)					# Allow packages from unauthenticated archives.
	--simulate(-s)					# Trace but don\'t
	--teaching(-t)					# Trace the sequence of commands performed.
	--yes(-y)					# Assume yes for any questions asked.
	...args
]

# Run the Gnome task selector to install groups of packages
extern "wajig tasksel" [
	--quiet(-q)					# Do system commands everything quietly.
	--noauth(-n)					# Allow packages from unauthenticated archives.
	--simulate(-s)					# Trace but don\'t
	--teaching(-t)					# Trace the sequence of commands performed.
	--yes(-y)					# Assume yes for any questions asked.
	...args
]

# List packages with newer versions available for upgrading
extern "wajig toupgrade" [
	--quiet(-q)					# Do system commands everything quietly.
	--noauth(-n)					# Allow packages from unauthenticated archives.
	--simulate(-s)					# Trace but don\'t
	--teaching(-t)					# Trace the sequence of commands performed.
	--yes(-y)					# Assume yes for any questions asked.
	...args
]

# Remove listed packages from hold so they are again upgraded
extern "wajig unhold" [
	--quiet(-q)					# Do system commands everything quietly.
	--noauth(-n)					# Allow packages from unauthenticated archives.
	--simulate(-s)					# Trace but don\'t
	--teaching(-t)					# Trace the sequence of commands performed.
	--yes(-y)					# Assume yes for any questions asked.
	...args
]

# Search for an unofficial Debian package at apt-get.org
extern "wajig unofficial" [
	--quiet(-q)					# Do system commands everything quietly.
	--noauth(-n)					# Allow packages from unauthenticated archives.
	--simulate(-s)					# Trace but don\'t
	--teaching(-t)					# Trace the sequence of commands performed.
	--yes(-y)					# Assume yes for any questions asked.
	...args
]

# Update the list of down-loadable packages
extern "wajig update" [
	--quiet(-q)					# Do system commands everything quietly.
	--noauth(-n)					# Allow packages from unauthenticated archives.
	--simulate(-s)					# Trace but don\'t
	--teaching(-t)					# Trace the sequence of commands performed.
	--yes(-y)					# Assume yes for any questions asked.
	...args
]

# Update default alternative for things like x-window-manager
extern "wajig update-alts" [
	--quiet(-q)					# Do system commands everything quietly.
	--noauth(-n)					# Allow packages from unauthenticated archives.
	--simulate(-s)					# Trace but don\'t
	--teaching(-t)					# Trace the sequence of commands performed.
	--yes(-y)					# Assume yes for any questions asked.
	...args
]

# Updates the local list of PCI ids from the internet master list
extern "wajig update-pci-ids" [
	--quiet(-q)					# Do system commands everything quietly.
	--noauth(-n)					# Allow packages from unauthenticated archives.
	--simulate(-s)					# Trace but don\'t
	--teaching(-t)					# Trace the sequence of commands performed.
	--yes(-y)					# Assume yes for any questions asked.
	...args
]

# Updates the local list of USB ids from the internet master list
extern "wajig update-usb-ids" [
	--quiet(-q)					# Do system commands everything quietly.
	--noauth(-n)					# Allow packages from unauthenticated archives.
	--simulate(-s)					# Trace but don\'t
	--teaching(-t)					# Trace the sequence of commands performed.
	--yes(-y)					# Assume yes for any questions asked.
	...args
]

# Upgrade all of the installed packages or just those listed
extern "wajig upgrade" [
	--quiet(-q)					# Do system commands everything quietly.
	--noauth(-n)					# Allow packages from unauthenticated archives.
	--simulate(-s)					# Trace but don\'t
	--teaching(-t)					# Trace the sequence of commands performed.
	--yes(-y)					# Assume yes for any questions asked.
	...args
]

# List version and distribution of (all) packages.
extern "wajig versions" [
	--quiet(-q)					# Do system commands everything quietly.
	--noauth(-n)					# Allow packages from unauthenticated archives.
	--simulate(-s)					# Trace but don\'t
	--teaching(-t)					# Trace the sequence of commands performed.
	--yes(-y)					# Assume yes for any questions asked.
	...args
]

# A synonym for describe
extern "wajig whatis" [
	--quiet(-q)					# Do system commands everything quietly.
	--noauth(-n)					# Allow packages from unauthenticated archives.
	--simulate(-s)					# Trace but don\'t
	--teaching(-t)					# Trace the sequence of commands performed.
	--yes(-y)					# Assume yes for any questions asked.
	...args
]

# Find the package that supplies the given command or file
extern "wajig whichpkg" [
	--quiet(-q)					# Do system commands everything quietly.
	--noauth(-n)					# Allow packages from unauthenticated archives.
	--simulate(-s)					# Trace but don\'t
	--teaching(-t)					# Trace the sequence of commands performed.
	--yes(-y)					# Assume yes for any questions asked.
	...args
]