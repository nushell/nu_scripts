# Clean up all target files
extern "scons" [
	--remove(-c)					# Clean up all target files
	--cache-debug					# Print debug information about the CacheDir() derived-file caching to the specified file
	--no-cache					# Disable the derived-file caching specified by CacheDir()
	--cache-populate					# Populate cache with already existing files
	--cache-show					# Show how a cached file would be built
	--config					# How the Configure call should run the config tests
	--directory(-C)					# Change to this directory before searching for the sconstruct file
	--sconstruct(-f)					# Use file as the initial SConscript file
	--help(-h)					# Print a help message for this build
	--help-options(-H)					# Print the standard help message about command-line options and exit
	--ignore-errors(-i)					# Ignore all errors from commands executed to rebuild files
	--include-dir(-I)					# Specifies a directory to search for imported Python modules
	--implicit-cache					# Cache implicit dependencies
	--implicit-deps-changed					# Force SCons to ignore the cached implicit dependencies
	--implicit-deps-unchanged					# Force SCons to ignore changes in the implicit dependencies
	--jobs(-j)					# Specifies the number of jobs (commands) to run simultaneously
	--keep-going(-k)					# Continue as much as possible after an error
	--duplicate					# How to duplicate files
	--max-drift					# Set the maximum expected drift in the modification time of files to SECONDS
	--recon(-n)					# No execute
	--profile					# Run SCons under the Python profiler and save the results in the specified file
	--question(-q)					# Do not run any commands, or print anything
	--random					# Build dependencies in a random order
	--quiet(-s)					# Silent
	--taskmastertrace					# Prints Taskmaster trace information to the specified file
	--search-up(-u)					# Walks up directories for an SConstruct file, and uses that as the top of the directory tree
	--version(-v)					# Print the scons version information
	--print-directory(-w)					# Print the working directory
	--no-print-directory					# Turn off -w, even if it was turned on implicitly
	--repository(-Y)					# Search this repo for input and target files not in the local directory tree
	...args
]

# How to duplicate files
extern "scons hard-soft-copy soft-hard-copy hard-copy soft-copy copy" [
	--remove(-c)					# Clean up all target files
	--cache-debug					# Print debug information about the CacheDir() derived-file caching to the specified file
	--no-cache					# Disable the derived-file caching specified by CacheDir()
	--cache-populate					# Populate cache with already existing files
	--cache-show					# Show how a cached file would be built
	--config					# How the Configure call should run the config tests
	--directory(-C)					# Change to this directory before searching for the sconstruct file
	--sconstruct(-f)					# Use file as the initial SConscript file
	--help(-h)					# Print a help message for this build
	--help-options(-H)					# Print the standard help message about command-line options and exit
	--ignore-errors(-i)					# Ignore all errors from commands executed to rebuild files
	--include-dir(-I)					# Specifies a directory to search for imported Python modules
	--implicit-cache					# Cache implicit dependencies
	--implicit-deps-changed					# Force SCons to ignore the cached implicit dependencies
	--implicit-deps-unchanged					# Force SCons to ignore changes in the implicit dependencies
	--jobs(-j)					# Specifies the number of jobs (commands) to run simultaneously
	--keep-going(-k)					# Continue as much as possible after an error
	--duplicate					# How to duplicate files
	--max-drift					# Set the maximum expected drift in the modification time of files to SECONDS
	--recon(-n)					# No execute
	--profile					# Run SCons under the Python profiler and save the results in the specified file
	--question(-q)					# Do not run any commands, or print anything
	--random					# Build dependencies in a random order
	--quiet(-s)					# Silent
	--taskmastertrace					# Prints Taskmaster trace information to the specified file
	--search-up(-u)					# Walks up directories for an SConstruct file, and uses that as the top of the directory tree
	--version(-v)					# Print the scons version information
	--print-directory(-w)					# Print the working directory
	--no-print-directory					# Turn off -w, even if it was turned on implicitly
	--repository(-Y)					# Search this repo for input and target files not in the local directory tree
	...args
]