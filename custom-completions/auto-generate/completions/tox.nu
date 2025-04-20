# Report version information to stdout
extern "tox" [
	--version					# Report version information to stdout
	--help(-h)					# Show help about options
	--hi					# Show help about ini-names
	--verbose(-v)					# Increase verbosity of reporting output
	--quiet(-q)					# Progressively silence reporting output
	--showconfig					# Show live configuration
	--listenvs(-l)					# Show list of test environments
	--listenvs-all(-a)					# Show list of all defined environments
	--devenv					# Sets up a development environment at ENVIDR
	--notest					# Skip invoking test commands
	--sdistonly					# Only perform the sdist packaging activity
	--skip-pkg-install					# Skip package installation for this run
	--parallel-live(-o)					# Connect to stdout while running environments
	--installpkg					# Use specified package for installation into venv, instead of creating an sdist
	--develop					# Install package in the venv using 'setup.py develop' via 'pip -e .'
	--pre					# Install pre-releases and development versions of dependencies
	--recreate(-r)					# Force recreation of virtual environments
	--sitepackages					# Override sitepackages setting to True in all envs
	--alwayscopy					# Override alwayscopy setting to True in all envs
	--no-provision					# Do not perform provision but write JSON metadata to this file
	...args
]