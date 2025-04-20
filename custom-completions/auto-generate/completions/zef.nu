# Display help text
extern "zef" [
	--help(-h)					# Display help text
	--version					# Detailed version information
	--config-path					# Load a specific Zef config file
	--error					# Verbosity level
	--warn					# Verbosity level
	--info					# Verbosity level (default)
	--verbose(-v)					# Verbosity level
	--debug					# Verbosity level
	--fetch
	--build
	--/build					# Skip the building phase
	--test
	--/test					# Skip the testing phase
	--depends
	--/depends					# Do not fetch runtime dependencies
	--build-depends
	--/build-depends					# Do not fetch build dependencies
	--test-depends
	--/test-depends					# Do not fetch test dependencies
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
	--/update					# Skip refreshing all module indexes or a specific ecosystem
	--exclude
	--to					# Short name or spec of CompUnit::Repository to install to
	--install-to					# Short name or spec of CompUnit::Repository to install to
	--upgrade
	--deps-only					# Install only the dependency chains of the requested distributions
	--contained					# Install dependencies regardless if they are already installed globally
	--from
	--uninstall-from
	--open
	--/open
	--installed(-i)
	--sha1
	--confirm
	...args
]

# Install specific distributions by name or path
extern "zef install" [
	--help(-h)					# Display help text
	--version					# Detailed version information
	--config-path					# Load a specific Zef config file
	--error					# Verbosity level
	--warn					# Verbosity level
	--info					# Verbosity level (default)
	--verbose(-v)					# Verbosity level
	--debug					# Verbosity level
	--fetch
	--build
	--/build					# Skip the building phase
	--test
	--/test					# Skip the testing phase
	--depends
	--/depends					# Do not fetch runtime dependencies
	--build-depends
	--/build-depends					# Do not fetch build dependencies
	--test-depends
	--/test-depends					# Do not fetch test dependencies
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
	--/update					# Skip refreshing all module indexes or a specific ecosystem
	--exclude
	--to					# Short name or spec of CompUnit::Repository to install to
	--install-to					# Short name or spec of CompUnit::Repository to install to
	--upgrade
	--deps-only					# Install only the dependency chains of the requested distributions
	--contained					# Install dependencies regardless if they are already installed globally
	--from
	--uninstall-from
	--open
	--/open
	--installed(-i)
	--sha1
	--confirm
	...args
]

# Uninstall specific distributions
extern "zef uninstall" [
	--help(-h)					# Display help text
	--version					# Detailed version information
	--config-path					# Load a specific Zef config file
	--error					# Verbosity level
	--warn					# Verbosity level
	--info					# Verbosity level (default)
	--verbose(-v)					# Verbosity level
	--debug					# Verbosity level
	--fetch
	--build
	--/build					# Skip the building phase
	--test
	--/test					# Skip the testing phase
	--depends
	--/depends					# Do not fetch runtime dependencies
	--build-depends
	--/build-depends					# Do not fetch build dependencies
	--test-depends
	--/test-depends					# Do not fetch test dependencies
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
	--/update					# Skip refreshing all module indexes or a specific ecosystem
	--exclude
	--to					# Short name or spec of CompUnit::Repository to install to
	--install-to					# Short name or spec of CompUnit::Repository to install to
	--upgrade
	--deps-only					# Install only the dependency chains of the requested distributions
	--contained					# Install dependencies regardless if they are already installed globally
	--from
	--uninstall-from
	--open
	--/open
	--installed(-i)
	--sha1
	--confirm
	...args
]

# Update package indexes for repositories
extern "zef update" [
	--help(-h)					# Display help text
	--version					# Detailed version information
	--config-path					# Load a specific Zef config file
	--error					# Verbosity level
	--warn					# Verbosity level
	--info					# Verbosity level (default)
	--verbose(-v)					# Verbosity level
	--debug					# Verbosity level
	--fetch
	--build
	--/build					# Skip the building phase
	--test
	--/test					# Skip the testing phase
	--depends
	--/depends					# Do not fetch runtime dependencies
	--build-depends
	--/build-depends					# Do not fetch build dependencies
	--test-depends
	--/test-depends					# Do not fetch test dependencies
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
	--/update					# Skip refreshing all module indexes or a specific ecosystem
	--exclude
	--to					# Short name or spec of CompUnit::Repository to install to
	--install-to					# Short name or spec of CompUnit::Repository to install to
	--upgrade
	--deps-only					# Install only the dependency chains of the requested distributions
	--contained					# Install dependencies regardless if they are already installed globally
	--from
	--uninstall-from
	--open
	--/open
	--installed(-i)
	--sha1
	--confirm
	...args
]

# Upgrade specific distributions (or all if no arguments)
extern "zef upgrade" [
	--help(-h)					# Display help text
	--version					# Detailed version information
	--config-path					# Load a specific Zef config file
	--error					# Verbosity level
	--warn					# Verbosity level
	--info					# Verbosity level (default)
	--verbose(-v)					# Verbosity level
	--debug					# Verbosity level
	--fetch
	--build
	--/build					# Skip the building phase
	--test
	--/test					# Skip the testing phase
	--depends
	--/depends					# Do not fetch runtime dependencies
	--build-depends
	--/build-depends					# Do not fetch build dependencies
	--test-depends
	--/test-depends					# Do not fetch test dependencies
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
	--/update					# Skip refreshing all module indexes or a specific ecosystem
	--exclude
	--to					# Short name or spec of CompUnit::Repository to install to
	--install-to					# Short name or spec of CompUnit::Repository to install to
	--upgrade
	--deps-only					# Install only the dependency chains of the requested distributions
	--contained					# Install dependencies regardless if they are already installed globally
	--from
	--uninstall-from
	--open
	--/open
	--installed(-i)
	--sha1
	--confirm
	...args
]

# Show a list of possible distribution candidates for the given terms
extern "zef search" [
	--help(-h)					# Display help text
	--version					# Detailed version information
	--config-path					# Load a specific Zef config file
	--error					# Verbosity level
	--warn					# Verbosity level
	--info					# Verbosity level (default)
	--verbose(-v)					# Verbosity level
	--debug					# Verbosity level
	--fetch
	--build
	--/build					# Skip the building phase
	--test
	--/test					# Skip the testing phase
	--depends
	--/depends					# Do not fetch runtime dependencies
	--build-depends
	--/build-depends					# Do not fetch build dependencies
	--test-depends
	--/test-depends					# Do not fetch test dependencies
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
	--/update					# Skip refreshing all module indexes or a specific ecosystem
	--exclude
	--to					# Short name or spec of CompUnit::Repository to install to
	--install-to					# Short name or spec of CompUnit::Repository to install to
	--upgrade
	--deps-only					# Install only the dependency chains of the requested distributions
	--contained					# Install dependencies regardless if they are already installed globally
	--from
	--uninstall-from
	--open
	--/open
	--installed(-i)
	--sha1
	--confirm
	...args
]

# Show detailed distribution information
extern "zef info" [
	--help(-h)					# Display help text
	--version					# Detailed version information
	--config-path					# Load a specific Zef config file
	--error					# Verbosity level
	--warn					# Verbosity level
	--info					# Verbosity level (default)
	--verbose(-v)					# Verbosity level
	--debug					# Verbosity level
	--fetch
	--build
	--/build					# Skip the building phase
	--test
	--/test					# Skip the testing phase
	--depends
	--/depends					# Do not fetch runtime dependencies
	--build-depends
	--/build-depends					# Do not fetch build dependencies
	--test-depends
	--/test-depends					# Do not fetch test dependencies
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
	--/update					# Skip refreshing all module indexes or a specific ecosystem
	--exclude
	--to					# Short name or spec of CompUnit::Repository to install to
	--install-to					# Short name or spec of CompUnit::Repository to install to
	--upgrade
	--deps-only					# Install only the dependency chains of the requested distributions
	--contained					# Install dependencies regardless if they are already installed globally
	--from
	--uninstall-from
	--open
	--/open
	--installed(-i)
	--sha1
	--confirm
	...args
]

# Browse support urls (bugtracker etc)
extern "zef browse" [
	--help(-h)					# Display help text
	--version					# Detailed version information
	--config-path					# Load a specific Zef config file
	--error					# Verbosity level
	--warn					# Verbosity level
	--info					# Verbosity level (default)
	--verbose(-v)					# Verbosity level
	--debug					# Verbosity level
	--fetch
	--build
	--/build					# Skip the building phase
	--test
	--/test					# Skip the testing phase
	--depends
	--/depends					# Do not fetch runtime dependencies
	--build-depends
	--/build-depends					# Do not fetch build dependencies
	--test-depends
	--/test-depends					# Do not fetch test dependencies
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
	--/update					# Skip refreshing all module indexes or a specific ecosystem
	--exclude
	--to					# Short name or spec of CompUnit::Repository to install to
	--install-to					# Short name or spec of CompUnit::Repository to install to
	--upgrade
	--deps-only					# Install only the dependency chains of the requested distributions
	--contained					# Install dependencies regardless if they are already installed globally
	--from
	--uninstall-from
	--open
	--/open
	--installed(-i)
	--sha1
	--confirm
	...args
]

# List available distributions
extern "zef list" [
	--help(-h)					# Display help text
	--version					# Detailed version information
	--config-path					# Load a specific Zef config file
	--error					# Verbosity level
	--warn					# Verbosity level
	--info					# Verbosity level (default)
	--verbose(-v)					# Verbosity level
	--debug					# Verbosity level
	--fetch
	--build
	--/build					# Skip the building phase
	--test
	--/test					# Skip the testing phase
	--depends
	--/depends					# Do not fetch runtime dependencies
	--build-depends
	--/build-depends					# Do not fetch build dependencies
	--test-depends
	--/test-depends					# Do not fetch test dependencies
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
	--/update					# Skip refreshing all module indexes or a specific ecosystem
	--exclude
	--to					# Short name or spec of CompUnit::Repository to install to
	--install-to					# Short name or spec of CompUnit::Repository to install to
	--upgrade
	--deps-only					# Install only the dependency chains of the requested distributions
	--contained					# Install dependencies regardless if they are already installed globally
	--from
	--uninstall-from
	--open
	--/open
	--installed(-i)
	--sha1
	--confirm
	...args
]

# List full dependencies for a given identity
extern "zef depends" [
	--help(-h)					# Display help text
	--version					# Detailed version information
	--config-path					# Load a specific Zef config file
	--error					# Verbosity level
	--warn					# Verbosity level
	--info					# Verbosity level (default)
	--verbose(-v)					# Verbosity level
	--debug					# Verbosity level
	--fetch
	--build
	--/build					# Skip the building phase
	--test
	--/test					# Skip the testing phase
	--depends
	--/depends					# Do not fetch runtime dependencies
	--build-depends
	--/build-depends					# Do not fetch build dependencies
	--test-depends
	--/test-depends					# Do not fetch test dependencies
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
	--/update					# Skip refreshing all module indexes or a specific ecosystem
	--exclude
	--to					# Short name or spec of CompUnit::Repository to install to
	--install-to					# Short name or spec of CompUnit::Repository to install to
	--upgrade
	--deps-only					# Install only the dependency chains of the requested distributions
	--contained					# Install dependencies regardless if they are already installed globally
	--from
	--uninstall-from
	--open
	--/open
	--installed(-i)
	--sha1
	--confirm
	...args
]

# List all distributions directly depending on a given identity
extern "zef rdepends" [
	--help(-h)					# Display help text
	--version					# Detailed version information
	--config-path					# Load a specific Zef config file
	--error					# Verbosity level
	--warn					# Verbosity level
	--info					# Verbosity level (default)
	--verbose(-v)					# Verbosity level
	--debug					# Verbosity level
	--fetch
	--build
	--/build					# Skip the building phase
	--test
	--/test					# Skip the testing phase
	--depends
	--/depends					# Do not fetch runtime dependencies
	--build-depends
	--/build-depends					# Do not fetch build dependencies
	--test-depends
	--/test-depends					# Do not fetch test dependencies
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
	--/update					# Skip refreshing all module indexes or a specific ecosystem
	--exclude
	--to					# Short name or spec of CompUnit::Repository to install to
	--install-to					# Short name or spec of CompUnit::Repository to install to
	--upgrade
	--deps-only					# Install only the dependency chains of the requested distributions
	--contained					# Install dependencies regardless if they are already installed globally
	--from
	--uninstall-from
	--open
	--/open
	--installed(-i)
	--sha1
	--confirm
	...args
]

# Lookup installed module information by short-name, name-path, sha1
extern "zef locate" [
	--help(-h)					# Display help text
	--version					# Detailed version information
	--config-path					# Load a specific Zef config file
	--error					# Verbosity level
	--warn					# Verbosity level
	--info					# Verbosity level (default)
	--verbose(-v)					# Verbosity level
	--debug					# Verbosity level
	--fetch
	--build
	--/build					# Skip the building phase
	--test
	--/test					# Skip the testing phase
	--depends
	--/depends					# Do not fetch runtime dependencies
	--build-depends
	--/build-depends					# Do not fetch build dependencies
	--test-depends
	--/test-depends					# Do not fetch test dependencies
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
	--/update					# Skip refreshing all module indexes or a specific ecosystem
	--exclude
	--to					# Short name or spec of CompUnit::Repository to install to
	--install-to					# Short name or spec of CompUnit::Repository to install to
	--upgrade
	--deps-only					# Install only the dependency chains of the requested distributions
	--contained					# Install dependencies regardless if they are already installed globally
	--from
	--uninstall-from
	--open
	--/open
	--installed(-i)
	--sha1
	--confirm
	...args
]

# Run smoke testing on available modules
extern "zef smoke" [
	--help(-h)					# Display help text
	--version					# Detailed version information
	--config-path					# Load a specific Zef config file
	--error					# Verbosity level
	--warn					# Verbosity level
	--info					# Verbosity level (default)
	--verbose(-v)					# Verbosity level
	--debug					# Verbosity level
	--fetch
	--build
	--/build					# Skip the building phase
	--test
	--/test					# Skip the testing phase
	--depends
	--/depends					# Do not fetch runtime dependencies
	--build-depends
	--/build-depends					# Do not fetch build dependencies
	--test-depends
	--/test-depends					# Do not fetch test dependencies
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
	--/update					# Skip refreshing all module indexes or a specific ecosystem
	--exclude
	--to					# Short name or spec of CompUnit::Repository to install to
	--install-to					# Short name or spec of CompUnit::Repository to install to
	--upgrade
	--deps-only					# Install only the dependency chains of the requested distributions
	--contained					# Install dependencies regardless if they are already installed globally
	--from
	--uninstall-from
	--open
	--/open
	--installed(-i)
	--sha1
	--confirm
	...args
]

# Delete directory/prefix containing matching configuration path or CURLI name
extern "zef nuke" [
	--help(-h)					# Display help text
	--version					# Detailed version information
	--config-path					# Load a specific Zef config file
	--error					# Verbosity level
	--warn					# Verbosity level
	--info					# Verbosity level (default)
	--verbose(-v)					# Verbosity level
	--debug					# Verbosity level
	--fetch
	--build
	--/build					# Skip the building phase
	--test
	--/test					# Skip the testing phase
	--depends
	--/depends					# Do not fetch runtime dependencies
	--build-depends
	--/build-depends					# Do not fetch build dependencies
	--test-depends
	--/test-depends					# Do not fetch test dependencies
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
	--/update					# Skip refreshing all module indexes or a specific ecosystem
	--exclude
	--to					# Short name or spec of CompUnit::Repository to install to
	--install-to					# Short name or spec of CompUnit::Repository to install to
	--upgrade
	--deps-only					# Install only the dependency chains of the requested distributions
	--contained					# Install dependencies regardless if they are already installed globally
	--from
	--uninstall-from
	--open
	--/open
	--installed(-i)
	--sha1
	--confirm
	...args
]