# Show this help message and exit
extern "nodeenv" [
	--help(-h)					# Show this help message and exit
	--version					# Show nodeenv\'s
	--without-ssl					# Build Node.js without SSL support
	--debug					# Enable debug build of Node.js
	--profile					# Enable profiling of Node.js
	--source					# Install Node.js from source
	--verbose(-v)					# Verbose mode
	--quiet(-q)					# Quiet mode
	--list(-l)					# List available Node.js versions
	--update					# Install npm packages from file without Node.js
	--with-npm					# Build without installing npm into the new virtual environment
	--no-npm-clean					# Skip the npm 0.x cleanup
	--python-virtualenv(-p)					# Use the currently-active Python virtualenv
	--clean-src(-c)					# Remove "src" directory after installation
	--force					# Force installation to an existing directory
	--prebuilt					# Install Node.js from a prebuilt package (default)
	--ignore_ssl_certs					# UNSAFE! Ignore SSL certs for package downloads
	...args
]