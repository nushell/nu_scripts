# Do system commands everything quietly.
extern "wajig" [

	...args
]

# Add a CD-ROM to the list of available sources of packages
extern "wajig addcdrom" [

	...args
]

# Mark the alternative to be auto set (using set priorities)
extern "wajig auto-alts" [

	...args
]

# Remove superseded deb files from the download cache
extern "wajig auto-clean" [

	...args
]

# Do an update followed by a download of all updated packages
extern "wajig auto-download" [

	...args
]

# Perform an install without asking questions (non-interactive)
extern "wajig auto-install" [

	...args
]

# List versions of packages available for installation
extern "wajig available" [

	...args
]

# Check reported bugs in package using the Debian Bug Tracker
extern "wajig bug" [

	...args
]

# Retrieve/unpack sources and build .deb for the named packages
extern "wajig build" [

	...args
]

# Retrieve packages required to build listed packages
extern "wajig build-depend" [

	...args
]

# Retrieve latest changelog for the package
extern "wajig changelog" [

	...args
]

# Remove all deb files from the download cache
extern "wajig clean" [

	...args
]

# List all the JIG commands and one line descriptions for each
extern "wajig commands" [

	...args
]

# Perform an update then a dist-upgrade
extern "wajig daily-upgrade" [

	...args
]

# List of packages which depend/recommend/suggest the package
extern "wajig dependents" [

	...args
]

# One line description of packages (-v and -vv for more detail)
extern "wajig describe" [

	...args
]

# One line description of new packages
extern "wajig describe-new" [

	...args
]

# Provide a detailed description of package (describe -vv)
extern "wajig detail" [

	...args
]

# Provide a detailed description of new packages (describe -vv)
extern "wajig detail-new" [

	...args
]

# Upgrade to new distribution (installed and new rqd packages)
extern "wajig dist-upgrade" [

	...args
]

# Equivalent to help with -verbose=2
extern "wajig docs" [

	...args
]

# Download package files ready for an install
extern "wajig download" [

	...args
]

# Download packages listed in file ready for an install
extern "wajig file-download" [

	...args
]

# Install packages listed in a file
extern "wajig file-install" [

	...args
]

# Remove packages listed in a file
extern "wajig file-remove" [

	...args
]

# Search for a file within installed packages
extern "wajig find-file" [

	...args
]

# Search for an unofficial Debian package at apt-get.org
extern "wajig find-pkg" [

	...args
]

# Perform dpkg --configure -a (to fix interrupted configure)
extern "wajig fix-configure" [

	...args
]

# Perform apt-get install (to fix broken dependencies)
extern "wajig fix-install" [

	...args
]

# Perform apt-get --fix-missing upgrade
extern "wajig fix-missing" [

	...args
]

# Install packages and ignore file overwrites and depends
extern "wajig force" [

	...args
]

# Print documentation (detail depends on --verbose)
extern "wajig help" [

	...args
]

# Place listed packages on hold so they are not upgraded
extern "wajig hold" [

	...args
]

# Initialise or reset the JIG archive files
extern "wajig init" [

	...args
]

# Install (or upgrade) one or more packages or .deb files
extern "wajig install" [

	...args
]

# Install package and associated recommended packages
extern "wajig installr" [

	...args
]

# Install package and recommended and suggested packages
extern "wajig installrs" [

	...args
]

# Install package and associated suggested packages
extern "wajig installs" [

	...args
]

# Check the integrity of installed packages (through checksums)
extern "wajig integrity" [

	...args
]

# List size of all large (>10MB) installed packages
extern "wajig large" [

	...args
]

# Identify when an update was last performed
extern "wajig last-update" [

	...args
]

# List the status and description of installed packages
extern "wajig list" [

	...args
]

# List a one line description of given or all packages
extern "wajig list-all" [

	...args
]

# List the objects that can have alternatives configured
extern "wajig list-alts" [

	...args
]

# List the contents of the download cache
extern "wajig list-cache" [

	...args
]

# List all the JIG commands and one line descriptions for each
extern "wajig list-commands" [

	...args
]

# List the daemons that JIG can start/stop/restart
extern "wajig list-daemons" [

	...args
]

# List the files that are supplied by the named package
extern "wajig list-files" [

	...args
]

# List those packages on hold
extern "wajig list-hold" [

	...args
]

# List packages (with optional argument substring) installed
extern "wajig list-installed" [

	...args
]

# List the contents of the install/remove log file (filtered)
extern "wajig list-log" [

	...args
]

# List all known packages or those containing supplied string
extern "wajig list-names" [

	...args
]

# List libraries not required by any installed package
extern "wajig list-orphans" [

	...args
]

# List the control scripts of the package of deb file
extern "wajig list-scripts" [

	...args
]

# List packages that belong to a specific section
extern "wajig list-section" [

	...args
]

# Same as list but only prints first two columns, not truncated
extern "wajig list-status" [

	...args
]

# Same as list but avoids truncating package names
extern "wajig list-wide" [

	...args
]

# Dist-upgrade using packages already downloaded
extern "wajig local-dist-upgrade" [

	...args
]

# Upgrade using packages already downloaded, but not any others
extern "wajig local-upgrade" [

	...args
]

# Runs the madison command of apt-cache.
extern "wajig madison" [

	...args
]

# Move packages in the download cache to a local Debian mirror
extern "wajig move" [

	...args
]

# List packages that became available since last update
extern "wajig new" [

	...args
]

# Obtain the latest news about the package
extern "wajig news" [

	...args
]

# List packages newly available for upgrading
extern "wajig new-upgrades" [

	...args
]

# List installed packages that do not meet the DFSG
extern "wajig non-free" [

	...args
]

# List libraries not required by any installed package
extern "wajig orphans" [

	...args
]

# Generate a .deb file for an installed package
extern "wajig package" [

	...args
]

# From preferences file show priorities/policy (available)
extern "wajig policy" [

	...args
]

# Remove one or more packages and configuration files
extern "wajig purge" [

	...args
]

# Purge package and those it depend on and not required by others
extern "wajig purge-depend" [

	...args
]

# Purge orphaned libraries (not required by installed packages)
extern "wajig purge-orphans" [

	...args
]

# Display the packages README file from /usr/share/doc
extern "wajig readme" [

	...args
]

# Download package and any packages it depends on
extern "wajig recursive" [

	...args
]

# Install package and associated recommended packages
extern "wajig recommended" [

	...args
]

# Reconfigure the named installed packages or run gkdebconf
extern "wajig reconfigure" [

	...args
]

# Reinstall each of the named packages
extern "wajig reinstall" [

	...args
]

# Reload daemon configs, e.g., gdm, apache (see list-daemons)
extern "wajig reload" [

	...args
]

# Remove one or more packages (see also purge)
extern "wajig remove" [

	...args
]

# Remove package and its dependees not required by others
extern "wajig remove-depend" [

	...args
]

# Remove orphaned libraries (not required by installed packages)
extern "wajig remove-orphans" [

	...args
]

# Generate a .deb file for an installed package
extern "wajig repackage" [

	...args
]

# Initialise or reset the JIG archive files
extern "wajig reset" [

	...args
]

# Stop then start a daemon, e.g., gdm, apache (see list-daemons)
extern "wajig restart" [

	...args
]

# Install a RedHat .rpm package
extern "wajig rpminstall" [

	...args
]

# Convert a RedHat .rpm file to a Debian .deb file
extern "wajig rpmtodeb" [

	...args
]

# Search for packages containing listed words
extern "wajig search" [

	...args
]

# Find local Debian archives suitable for sources.list
extern "wajig search-apt" [

	...args
]

# Configure the sources.list file which locates Debian archives
extern "wajig setup" [

	...args
]

# Provide a detailed description of package [same as detail]
extern "wajig show" [

	...args
]

# Trace the steps that a dist-upgrade would perform
extern "wajig showdistupgrade" [

	...args
]

# Trace the steps that an install would perform
extern "wajig showinstall" [

	...args
]

# Trace the steps that a remove would perform
extern "wajig showremove" [

	...args
]

# Trace the steps that an upgrade would perform
extern "wajig showupgrade" [

	...args
]

# Print out the size (in K) of all, or listed, installed packages
extern "wajig size" [

	...args
]

# Print out the size (in K) of all, or listed, installed packages
extern "wajig sizes" [

	...args
]

# Generates list of package=version for all installed packages
extern "wajig snapshot" [

	...args
]

# Retrieve and unpack sources for the named packages
extern "wajig source" [

	...args
]

# Start a daemon, e.g., gdm, apache (see list-daemons)
extern "wajig start" [

	...args
]

# Show the version and available version of packages
extern "wajig status" [

	...args
]

# Show the version and available version of matching packages
extern "wajig status-match" [

	...args
]

# Show the version and available version of matching packages
extern "wajig status-search" [

	...args
]

# Stop a daemon, e.g., gdm, apache (see list-daemons)
extern "wajig stop" [

	...args
]

# Install package and associated suggested packages
extern "wajig suggested" [

	...args
]

# Run the Gnome task selector to install groups of packages
extern "wajig tasksel" [

	...args
]

# List packages with newer versions available for upgrading
extern "wajig toupgrade" [

	...args
]

# Remove listed packages from hold so they are again upgraded
extern "wajig unhold" [

	...args
]

# Search for an unofficial Debian package at apt-get.org
extern "wajig unofficial" [

	...args
]

# Update the list of down-loadable packages
extern "wajig update" [

	...args
]

# Update default alternative for things like x-window-manager
extern "wajig update-alts" [

	...args
]

# Updates the local list of PCI ids from the internet master list
extern "wajig update-pci-ids" [

	...args
]

# Updates the local list of USB ids from the internet master list
extern "wajig update-usb-ids" [

	...args
]

# Upgrade all of the installed packages or just those listed
extern "wajig upgrade" [

	...args
]

# List version and distribution of (all) packages.
extern "wajig versions" [

	...args
]

# A synonym for describe
extern "wajig whatis" [

	...args
]

# Find the package that supplies the given command or file
extern "wajig whichpkg" [

	...args
]