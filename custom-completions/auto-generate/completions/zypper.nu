# 
extern "zypper" [

	...args
]

# Print help
extern "zypper help ?" [

	...args
]

# Accept multiple commands at once
extern "zypper shell sh" [

	...args
]

# List all defined repositories
extern "zypper repos lr" [

	...args
]

# Add a new repository
extern "zypper addrepo ar" [

	...args
]

# Remove specified repository
extern "zypper removerepo rr" [

	...args
]

# Rename specified repository
extern "zypper renamerepo nr" [

	...args
]

# Modify specified repository
extern "zypper modifyrepo mr" [

	...args
]

# Refresh all repositories
extern "zypper refresh ref" [

	...args
]

# Clean local caches
extern "zypper clean cc" [

	...args
]

# List all defined services
extern "zypper services ls" [

	...args
]

# Add a new service
extern "zypper addservice as" [

	...args
]

# Modify specified service
extern "zypper modifyservice ms" [

	...args
]

# Remove specified service
extern "zypper removeservice rs" [

	...args
]

# Refresh all services
extern "zypper refresh-services refs" [

	...args
]

# Install packages
extern "zypper install in" [

	...args
]

# Remove packages
extern "zypper remove rm" [

	...args
]

# Verify integrity of package dependencies
extern "zypper verify ve" [

	...args
]

# Install source packages and their build dependencies
extern "zypper source-install si" [

	...args
]

# Install newly added packages recommended by installed packages
extern "zypper install-new-recommends inr" [

	...args
]

# Update installed packages with newer versions
extern "zypper update up" [

	...args
]

# List available updates
extern "zypper list-updates lu" [

	...args
]

# Install needed patches
extern "zypper patch" [
	--updatestack-only					# Consider only patches which affect the package management itself
	--with-update					# Additionally try to update all packages not covered by patches
	--details					# Show the detailed installation summary
	--replacefiles					# Install even if it replaces files from other installed packages
	--bugzilla(-b)					# Select applicable patches for the specified Bugzilla issues
	--cve					# Select applicable patches for the specified CVE issues
	--no-confirm(-y)					# Dont require user interaction
	--without-optional					# Whether applicable optional patches should be treated as needed or be excluded
	--with-interactive					# Do not skip interactive patches
	--skip-interactive					# Skip interactive patches
	--auto-agree-with-licenses(-l)					# Automatically say 'yes' to third party license confirmation prompt
	--dry-run(-D)					# Test the update, do not actually update
	--download-only(-d)					# Only download the packages, do not install
	...args
]

# List needed patches
extern "zypper list-patches lp" [

	...args
]

# Perform a distribution upgrade
extern "zypper dist-upgrade dup" [

	...args
]

# Check for patches
extern "zypper patch-check pchk" [

	...args
]

# Search for packages matching a pattern
extern "zypper search se" [

	...args
]

# Show full information for specified packages
extern "zypper info if" [

	...args
]

# Show full information for specified patches
extern "zypper patch-info" [

	...args
]

# Show full information for specified patterns
extern "zypper pattern-info" [

	...args
]

# Show full information for specified products
extern "zypper product-info" [

	...args
]

# List all available patches
extern "zypper patches pch" [

	...args
]

# List all available packages
extern "zypper packages pa" [

	...args
]

# List all available patterns
extern "zypper patterns pt" [

	...args
]

# List all available products
extern "zypper products pd" [

	...args
]

# List packages providing specified capability
extern "zypper what-provides wp" [

	...args
]

# Add a package lock
extern "zypper addlock al" [

	...args
]

# Remove a package lock
extern "zypper removelock rl" [

	...args
]

# List current package locks
extern "zypper locks ll" [

	...args
]

# Remove unused locks
extern "zypper cleanlocks cl" [

	...args
]

# List requested locales (languages codes)
extern "zypper locales lloc" [

	...args
]

# Add locale(s) to requested locales
extern "zypper addlocale aloc" [

	...args
]

# Remove locale(s) from requested locales
extern "zypper removelocale rloc" [

	...args
]

# Compare two version strings
extern "zypper versioncmp vcmp" [

	...args
]

# Print the target operating system ID string
extern "zypper targetos tos" [

	...args
]

# Print report about licenses and EULAs of installed packages
extern "zypper licenses" [

	...args
]

# Download rpms specified on the commandline to a local directory
extern "zypper download" [
	--delete					# Delete extraneous source rpms in the local directory
	--no-delete					# Do not delete extraneous source rpms
	--status					# Show which source rpms are missing or extraneous
	--all-matches					# Download all versions matching the commandline arguments
	--dry-run(-D)					# Dont change anything, just report what would be done
	...args
]

# Download source rpms for all installed packages to a local directory
extern "zypper source-download" [

	...args
]

# Check if the needs-reboot flag was set
extern "zypper needs-rebooting" [

	...args
]

# List running processes still using deleted files
extern "zypper ps" [
	--short(-s)					# Create a short table not showing the deleted files
	...args
]

# Lists available subcommands
extern "zypper subcommand" [
	--help(-h)					# Help
	--version(-V)					# Output the version number
	--promptids					# Output a list of zypper user prompts
	--userdata					# User defined transaction id used in history and plugins
	--quiet(-q)					# Suppress normal output, print only error messages
	--verbose(-v)					# Increase verbosity
	--no-abbrev(-A)					# Do not abbreviate text in tables
	--table-style(-s)					# Table style (integer)
	--rug-compatible(-r)					# Turn on rug compatibility
	--non-interactive(-n)					# Do not ask anything, use default answers automatically
	--non-interactive-include-reboot-patches					# Do not treat patches as interactive, which have the rebootSuggested-flag set
	--xmlout(-x)					# Switch to XML output
	--ignore-unknown(-i)					# Ignore unknown packages
	--terse(-t)					# Terse output for machine consumption. Implies --no-abbrev and --no-color
	--no-gpg-checks					# Ignore GPG check failures and continue
	--gpg-auto-import-keys					# Automatically trust and import new repository signing keys
	--disable-repositories					# Do not read meta-data from repositories
	--no-refresh					# Do not refresh the repositories
	--no-cd					# Ignore CD/DVD repositories
	--no-remote					# Ignore remote repositories
	--releasever					# Set the value of $releasever in all .repo files
	--disable-system-resolvables					# Do not read installed packages
	--alias(-a)					# Show also repository alias
	--name(-n)					# Show also repository name
	--refresh(-r)					# Show also the autorefresh flag
	--uri(-u)					# Show also base URI of repositories
	--priority(-p)					# Show also repository priority
	--details(-d)					# Show more information like URI, priority, type
	--service(-s)					# Show also alias of parent service
	--show-enabled-only(-E)					# Show enabled repos only
	--sort-by-uri(-U)					# Sort the list by URI
	--sort-by-name(-N)					# Sort the list by name
	--sort-by-priority(-P)					# Sort the list by repository priority
	--sort-by-alias(-A)					# Sort the list by alias
	--check(-c)					# Probe URI
	--no-check(-C)					# Don't probe URI, probe later during refresh
	--priority(-p)					# Set the priority of the repository
	--keep-packages(-k)					# Enable RPM files caching
	--no-keep-packages(-K)					# Disable RPM files caching
	--gpgcheck(-g)					# Enable GPG check for this repository
	--gpgcheck-strict					# Enable strict GPG check for this repository
	--gpgcheck-allow-unsigned					# Short hand for --gpgcheck-allow-unsigned-repo --gpgcheck-allow-unsigned-package
	--gpgcheck-allow-unsigned-repo					# Enable GPG check but allow the repository metadata to be unsigned
	--gpgcheck-allow-unsigned-package					# Enable GPG check but allow installing unsigned packages from this repository.
	--no-gpgcheck(-G)					# Disable GPG check for this repository
	--default-gpgcheck					# Use the global GPG check setting defined in /etc/zypp/zypp.conf
	--enable(-d)					# Add the repository as enabled
	--disable(-d)					# Add the repository as disabled
	--refresh(-f)					# Enable autorefresh of the repository
	--no-refresh(-F)					# Disable autorefresh of the repository
	--loose-auth					# Ignore user authentication data in the URI
	--loose-query					# Ignore query string in the URI
	--all(-a)					# Apply changes to all repositories
	--local(-l)					# Apply changes to all local repositories
	--remote(-t)					# Apply changes to all remote repositories
	--disable(-d)					# Disable the repository
	--enable(-e)					# Enable the repository
	--refresh(-f)					# Enable auto-refresh of the repository
	--no-refresh(-F)					# Disable auto-refresh of the repository
	--keep-packages(-k)					# Enable RPM files caching
	--no-keep-packages(-K)					# Disable RPM files caching
	--gpgcheck(-g)					# Enable GPG check for this repository
	--gpgcheck-strict					# Enable strict GPG check for this repository
	--gpgcheck-allow-unsigned					# Short hand for --gpgcheck-allow-unsigned-repo --gpgcheck-allow-unsigned-package
	--gpgcheck-allow-unsigned-repo					# Enable GPG check but allow the repository metadata to be unsigned
	--gpgcheck-allow-unsigned-package					# Enable GPG check but allow installing unsigned packages from this repository.
	--no-gpgcheck(-G)					# Disable GPG check for this repository
	--default-gpgcheck					# Use the global GPG check setting defined in /etc/zypp/zypp.conf
	--all(-a)					# Apply changes to all repositories
	--local(-l)					# Apply changes to all local repositories
	--remote(-t)					# Apply changes to all remote repositories
	--force(-f)					# Force a complete refresh
	--force-build(-b)					# Force rebuild of the database
	--force-download(-d)					# Force download of raw metadata
	--build-only(-B)					# Only build the database, don't download metadata
	--download-only(-D)					# Only download raw metadata, don't build the database
	--services(-s)					# Refresh also services before refreshing repos
	--uri(-u)					# Show also base URI of repositories
	--priority(-p)					# Show also repository priority
	--details(-d)					# Show more information like URI, priority, type
	--with-repos(-r)					# Show also repositories belonging to the services
	--show-enabled-only(-E)					# Show enabled repos only
	--sort-by-priority(-P)					# Sort the list by repository priority
	--sort-by-uri(-U)					# Sort the list by URI
	--sort-by-name(-N)					# Sort the list by name
	--enable(-d)					# Add the service as enabled
	--disable(-d)					# Add the service as disabled
	--refresh(-f)					# Enable autorefresh of the repository
	--no-refresh(-F)					# Disable autorefresh of the repository
	--enable(-e)					# Enable a disabled service
	--disable(-d)					# Disable the service (but don't remove it)
	--refresh(-r)					# Enable auto-refresh of the service
	--no-refresh(-R)					# Disable auto-refresh of the service
	--all(-a)					# Apply changes to all services
	--local(-l)					# Apply changes to all local services
	--remote(-t)					# Apply changes to all remote services
	--medium-type(-m)					# Apply changes to services of specified type
	--cl-to-enable(-k)					# Clear the list of RIS repositories to enable
	--cl-to-disable(-K)					# Clear the list of RIS repositories to disable
	--loose-auth					# Ignore user authentication data in the URI
	--loose-query					# Ignore query string in the URI
	--force(-f)					# Force a complete refresh
	--with-repos(-r)					# Refresh also repositories
	--restore-status(-R)					# Also restore service repositories enabled/disabled state
	--debug-solver					# Create solver test case for debugging
	--force-resolution					# Force the solver to find a solution (even an aggressive one)
	--no-force-resolution(-R)					# Do not force the solver to find solution, let it ask
	--recommends					# Install also recommended packages in addition to the required
	--no-recommends					# Do not install recommended packages, only required
	--no-allow-downgrade					# Whether to allow downgrading installed resolvables
	--no-allow-name-change					# Whether to allow changing the names of installed resolvables
	--no-allow-arch-change					# Whether to allow changing the architecture of installed resolvables
	--no-allow-vendor-change					# Whether to allow changing the vendor of installed resolvables
	--name(-n)					# Select packages by plain name, not by capability
	--capability(-C)					# Select packages by capability
	--details					# Show the detailed installation summary
	--oldpackage					# Allow to replace a newer item with an older one.
	--allow-unsigned-rpm					# Silently install unsigned rpm packages given as commandline parameters
	--force(-f)					# Install even if the item is installed, downgraded or changes vendor/architecture
	--no-confirm(-y)					# Dont require user interaction
	--dry-run(-D)					# Test the installation, do not actually install
	--replacefiles					# Install even if it replaces files from other installed packages
	--auto-agree-with-licenses(-l)					# Automatically say 'yes' to third party license confirmation prompt
	--download-only(-d)					# Only download the packages, do not install
	--name(-n)					# Select packages by plain name, not by capability
	--capability(-C)					# Select packages by capability
	--details					# Show the detailed installation summary
	--no-confirm(-y)					# Dont require user interaction
	--dry-run(-D)					# Test the removal, do not actually remove
	--clean-deps(-u)					# Automatically remove unneeded dependencies
	--no-clean-deps(-U)					# No automatic removal of unneeded dependencies
	--debug-solver					# Create solver test case for debugging
	--force-resolution					# Force the solver to find a solution (even an aggressive one)
	--no-force-resolution(-R)					# Do not force the solver to find solution, let it ask
	--details					# Show the detailed installation summary
	--dry-run(-D)					# Test the repair, do not actually do anything to the system
	--download-only(-d)					# Only download the packages, do not install
	--no-confirm(-y)					# Dont require user interaction
	--build-deps-only(-d)					# Install only build dependencies of specified packages
	--no-build-deps(-D)					# Don't install build dependencies
	--download-only(-d)					# Only download the packages, do not install
	--details					# Show the detailed installation summary
	--dry-run(-D)					# Test the installation, do not actually install
	--download-only(-d)					# Only download the packages, do not install
	--details					# Show the detailed installation summary
	--best-effort					# Accept updates to a lower than the latest version
	--replacefiles					# Install even if it replaces files from other installed packages
	--no-confirm(-y)					# Dont require user interaction
	--with-interactive					# Do not skip interactive updates
	--skip-interactive					# Skip interactive updates
	--auto-agree-with-licenses(-l)					# Automatically say 'yes' to third party license confirmation prompt
	--dry-run(-D)					# Test the update, do not actually update
	--download-only(-d)					# Only download the packages, do not install
	--best-effort					# Accept updates to a lower than the latest version
	--all(-a)					# List all packages with newer versions, even uninstalled
	--no-allow-downgrade					# Whether to allow downgrading installed resolvables
	--no-allow-name-change					# Whether to allow changing the names of installed resolvables
	--no-allow-arch-change					# Whether to allow changing the architecture of installed resolvables
	--no-allow-vendor-change					# Whether to allow changing the vendor of installed resolvables
	--all(-a)					# List all patches, not only the needed ones
	--bugzilla(-b)					# Select applicable patches for the specified Bugzilla issues
	--cve					# Select applicable patches for the specified CVE issues
	--issues					# Select issues matching the specified string
	--without-optional					# Whether applicable optional patches should be treated as needed or be excluded
	--details					# Show the detailed installation summary
	--replacefiles					# Install even if it replaces files from other installed packages
	--auto-agree-with-licenses(-l)					# Automatically say 'yes' to third party license confirmation prompt
	--dry-run(-D)					# Test the upgrade, do not actually upgrade
	--no-confirm(-y)					# Dont require user interaction
	--download-only(-d)					# Only download the packages, do not install
	--updatestack-only					# Consider only patches which affect the package management itself
	--without-optional					# Whether applicable optional patches should be treated as needed or be excluded
	--match-substrings					# Search for a match to partial words (default)
	--match-words					# Search for a match to whole words only
	--match-exact(-x)					# Searches for an exact package name
	--provides					# Search for packages which provide the search strings
	--requires					# Search for packages which require the search strings
	--recommends					# Search for packages which recommend the search strings
	--supplements					# Search for packages which supplements the search strings
	--conflicts					# Search packages conflicting with search strings
	--obsoletes					# Search for packages which obsolete the search strings
	--suggests					# Search for packages which suggest the search strings
	--name(-n)					# Search package name even with dependency options
	--file-list(-f)					# Search for a match in the file list of packages
	--search-descriptions(-d)					# Search also in package summaries and descriptions
	--case-sensitive(-C)					# Perform case-sensitive search
	--details(-s)					# Show each available version in each repository on a separate line
	--verbose(-s)					# Like --details, with additional information where the search has matched (useful for search in dependencies)
	--sort-by-name					# Sort packages by name (default)
	--sort-by-repo					# Sort packages by repository
	--installed-only(-i)					# Show only packages that are already installed
	--not-installed-only(-u)					# Show only packages that are not currently installed
	--match-substrings(-s)					# Print information for packages partially matching name
	--provides					# Show provides
	--requires					# Show requires and prerequires
	--conflicts					# Show conflicts
	--obsoletes					# Show obsoletes
	--recommends					# Show recommends
	--supplements					# Show supplements
	--suggests					# Show suggests
	--orphaned					# Show packages which are orphaned (without repository)
	--suggested					# Show packages which are suggested
	--recommended					# Show packages which are recommended
	--unneeded					# Show packages which are unneeded
	--sort-by-name(-N)					# Sort the list by package name
	--sort-by-repo(-R)					# Sort the list by repository
	--installed-only(-i)					# Show only installed packages
	--not-installed-only(-u)					# Show only packages which are not installed
	--installed-only(-i)					# Show only installed patterns
	--not-installed-only(-u)					# Show only patterns which are not installed
	--installed-only(-i)					# Show only installed products
	--not-installed-only(-u)					# Show only products which are not installed
	--only-duplicates(-d)					# Clean only duplicate locks
	--only-empty(-e)					# Clean only locks which doesn't lock anything
	--packages(-p)					# Show corresponding packages
	--all(-a)					# List all available locales
	--no-packages(-n)					# Do not install corresponding packages for given locale(s)
	--no-packages(-n)					# Do not remove corresponding packages for given locale(s)
	--match(-m)					# Takes missing release number as any release
	--label(-l)					# Show the operating system label
	--metadata(-m)					# Clean metadata cache
	--raw-metadata(-M)					# Clean raw metadata cache
	--all(-a)					# Clean both metadata and package caches
	--updatestack-only					# Consider only patches which affect the package management itself
	--with-update					# Additionally try to update all packages not covered by patches
	--details					# Show the detailed installation summary
	--replacefiles					# Install even if it replaces files from other installed packages
	--bugzilla(-b)					# Select applicable patches for the specified Bugzilla issues
	--cve					# Select applicable patches for the specified CVE issues
	--no-confirm(-y)					# Dont require user interaction
	--without-optional					# Whether applicable optional patches should be treated as needed or be excluded
	--with-interactive					# Do not skip interactive patches
	--skip-interactive					# Skip interactive patches
	--auto-agree-with-licenses(-l)					# Automatically say 'yes' to third party license confirmation prompt
	--dry-run(-D)					# Test the update, do not actually update
	--download-only(-d)					# Only download the packages, do not install
	--delete					# Delete extraneous source rpms in the local directory
	--no-delete					# Do not delete extraneous source rpms
	--status					# Show which source rpms are missing or extraneous
	--all-matches					# Download all versions matching the commandline arguments
	--dry-run(-D)					# Dont change anything, just report what would be done
	--short(-s)					# Create a short table not showing the deleted files
	...args
]