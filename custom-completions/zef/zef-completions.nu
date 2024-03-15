# Display help text
extern "zef" [

	...args
]

# Install specific distributions by name or path
extern "zef install" [
	# all the --/ commands break the parser
	--fetch
	--build
	#--/build					# Skip the building phase
	--test
	#--/test					# Skip the testing phase
	--depends
	#--/depends					# Do not fetch runtime dependencies
	--build-depends
	#--/build-depends					# Do not fetch build dependencies
	--test-depends
	#--/test-depends					# Do not fetch test dependencies
	--force					# Ignore errors
	--force-resolve					# Ignore errors
	--force-fetch					# Ignore errors
	--force-extract					# Ignore errors
	--force-build					# Ignore errors
	--force-test					# Ignore errors
	--force-install					# Ignore errors
	--dry					# Run all phases except the actual installations
	--serial					# Install each dependency after passing testing and before building/testing the next dependency
	--update					# Force a refresh for all module indexes or a specific ecosystem
	#--/update					# Skip refreshing all module indexes or a specific ecosystem
	--exclude
	--to					# Short name or spec of CompUnit::Repository to install to
	--install-to					# Short name or spec of CompUnit::Repository to install to
	--upgrade
	--deps-only					# Install only the dependency chains of the requested distributions
	--contained					# Install all transitive and direct dependencies regardless if they are already installed globally
	--from
	--uninstall-from
	...args
]

# Uninstall specific distributions
extern "zef uninstall" [
	--from
	--uninstall-from
	...args
]

# Run tests on a given modules path
extern "zef test" [
	--force					# Ignore errors
	--force-test					# Ignore errors
	...args
]

# Fetch and extract modules source
extern "zef fetch" [
	--force					# Ignore errors
	--force-fetch					# Ignore errors
	--update					# Force a refresh for all module indexes or a specific ecosystem
	#--/update					# Skip refreshing all module indexes or a specific ecosystem
	...args
]

# Run the Build.pm in a given modules path
extern "zef build" [
	--force					# Ignore errors
	--force-build					# Ignore errors
	...args
]

# Update package indexes for repositories
extern "zef update" [

	...args
]

# Upgrade specific distributions (or all if no arguments)
extern "zef upgrade" [
	--fetch
	--build
	#--/build					# Skip the building phase
	--test
	#--/test					# Skip the testing phase
	--depends
	#--/depends					# Do not fetch runtime dependencies
	--build-depends
	#--/build-depends					# Do not fetch build dependencies
	--test-depends
	#--/test-depends					# Do not fetch test dependencies
	--force					# Ignore errors
	--force-resolve					# Ignore errors
	--force-fetch					# Ignore errors
	--force-extract					# Ignore errors
	--force-build					# Ignore errors
	--force-test					# Ignore errors
	--force-install					# Ignore errors
	--dry					# Run all phases except the actual installations
	--serial					# Install each dependency after passing testing and before building/testing the next dependency
	--update					# Force a refresh for all module indexes or a specific ecosystem
	#--/update					# Skip refreshing all module indexes or a specific ecosystem
	--exclude
	--to					# Short name or spec of CompUnit::Repository to install to
	--install-to					# Short name or spec of CompUnit::Repository to install to
	...args
]

# Show a list of possible distribution candidates for the given terms
extern "zef search" [
	--update					# Force a refresh for all module indexes or a specific ecosystem
	#--/update					# Skip refreshing all module indexes or a specific ecosystem
	...args
]

# Show detailed distribution information
extern "zef info" [
	--update					# Force a refresh for all module indexes or a specific ecosystem
	#--/update					# Skip refreshing all module indexes or a specific ecosystem
	...args
]

# Browse support urls (bugtracker etc)
extern "zef browse" [
	--open
	#--/open
	...args
]

# List available distributions
extern "zef list" [
	--update					# Force a refresh for all module indexes or a specific ecosystem
	#--/update					# Skip refreshing all module indexes or a specific ecosystem
	--installed(-i)
	...args
]

# List full dependencies for a given identity
extern "zef depends" [
	--depends
	#--/depends					# Do not fetch runtime dependencies
	--build-depends
	#--/build-depends					# Do not fetch build dependencies
	--test-depends
	#--/test-depends					# Do not fetch test dependencies
	...args
]

# List all distributions directly depending on a given identity
extern "zef rdepends" [
	--depends
	#--/depends					# Do not fetch runtime dependencies
	--build-depends
	#--/build-depends					# Do not fetch build dependencies
	--test-depends
	#--/test-depends					# Do not fetch test dependencies
	...args
]

# Lookup installed module information by short-name, name-path, sha1
extern "zef locate" [
	--sha1
	--confirm
	...args
]

# Run smoke testing on available modules
extern "zef smoke" [
	--fetch
	--build
	#--/build					# Skip the building phase
	--test
	#--/test					# Skip the testing phase
	--depends
	#--/depends					# Do not fetch runtime dependencies
	--build-depends
	#--/build-depends					# Do not fetch build dependencies
	--test-depends
	#--/test-depends					# Do not fetch test dependencies
	--force					# Ignore errors
	--force-resolve					# Ignore errors
	--force-fetch					# Ignore errors
	--force-extract					# Ignore errors
	--force-build					# Ignore errors
	--force-test					# Ignore errors
	--force-install					# Ignore errors
	--dry					# Run all phases except the actual installations
	--serial					# Install each dependency after passing testing and before building/testing the next dependency
	--update					# Force a refresh for all module indexes or a specific ecosystem
	#--/update					# Skip refreshing all module indexes or a specific ecosystem
	--exclude
	--to					# Short name or spec of CompUnit::Repository to install to
	--install-to					# Short name or spec of CompUnit::Repository to install to
	...args
]

# Delete directory/prefix containing matching configuration path or CURLI name
extern "zef nuke" [

	...args
]