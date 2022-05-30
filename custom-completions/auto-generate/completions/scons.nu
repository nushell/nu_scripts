# Clean up by removing all target files for which a construction command is specified
extern "scons" [
	--remove(-c)					# Clean up by removing all target files for which a construction command is specified
	--cache-debug					# Print debug information about the CacheDir() derived-file caching to the specified file
	--no-cache					# Disable the derived-file caching specified by CacheDir()
	--cache-populate					# When using CacheDir(), populate a cache by copying any already- existing, up-to-date derived files to the cache, in addition to files built by this invocation
	--cache-show					# When using CacheDir() and retrieving a derived file from the cache, show the command that would have been executed to build the file, instead of the usual report, "Retrieved file from cache
	--config					# This specifies how the Configure call should use or generate the results of configuration tests
	--sconstruct(-f)					# Use file as the initial SConscript file
	--help(-h)					# Print a local help message for this build, if one is defined in the SConscript file(s), plus a line that describes the -H option for command-line option help
	--help-options(-H)					# Print the standard help message about command-line options and exit
	--ignore-errors(-i)					# Ignore all errors from commands executed to rebuild files
	--include-dir(-I)					# Specifies a directory to search for imported Python modules
	--implicit-cache					# Cache implicit dependencies
	--implicit-deps-changed					# Force SCons to ignore the cached implicit dependencies
	--implicit-deps-unchanged					# Force SCons to ignore changes in the implicit dependencies
	--jobs(-j)					# Specifies the number of jobs (commands) to run simultaneously
	--keep-going(-k)					# Continue as much as possible after an error
	--duplicate					# There are three ways to duplicate files in a build tree: hard links, soft (symbolic) links and copies
	--max-drift					# Set the maximum expected drift in the modification time of files to SECONDS
	--recon(-n)					# No execute
	--profile					# Run SCons under the Python profiler and save the results in the specified file
	--question(-q)					# Do not run any commands, or print anything
	--random					# Build dependencies in a random order
	--quiet(-s)					# Silent
	--taskmastertrace					# Prints trace information to the specified file about how the internal Taskmaster object evaluates and controls the order in which Nodes are built
	--search-up(-u)					# Walks up the directory structure until an SConstruct , Scon struct or sconstruct file is found, and uses that as the top of the directory tree
	--version(-v)					# Print the scons version, copyright information, list of authors, and any other relevant information
	--print-directory(-w)					# Print a message containing the working directory before and after other processing
	--no-print-directory					# Turn off -w, even if it was turned on implicitly
	--repository(-Y)					# Search the specified repository for any input and target files not found in the local directory hierarchy
	...args
]