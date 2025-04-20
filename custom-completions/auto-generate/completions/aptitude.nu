# Display a brief help message. Identical to the help action
extern "aptitude" [
	--help(-h)					# Display a brief help message. Identical to the help action
	--show-deps(-D)					# Show explanations of automatic installations and removals
	--download-only(-d)					# Download Only
	--fix-broken(-f)					# Correct broken dependencies
	--purge-unused					# Purge packages that are not required by any installed package
	--prompt(-P)					# Always display a prompt
	--without-recommends(-R)					# Do not treat recommendations as dependencies
	--with-recommends(-r)					# Treat recommendations as dependencies
	--simulate(-s)					# Don\'t
	--schedule-only					# Schedule operations to be performed in the future
	--quiet(-q)					# Suppress incremental progress indicators
	--show-versions(-V)					# Show which versions of packages will be installed
	--verbose(-v)					# Display extra information
	--version					# Display the version of aptitude and compile information
	--visual-preview					# Start up the visual interface and display its preview screen
	--assume-yes(-y)					# Assume the answer yes for all question prompts
	...args
]

# Remove any cached packages which can no longer be downloaded
extern "aptitude autoclean" [
	--help(-h)					# Display a brief help message. Identical to the help action
	--show-deps(-D)					# Show explanations of automatic installations and removals
	--download-only(-d)					# Download Only
	--fix-broken(-f)					# Correct broken dependencies
	--purge-unused					# Purge packages that are not required by any installed package
	--prompt(-P)					# Always display a prompt
	--without-recommends(-R)					# Do not treat recommendations as dependencies
	--with-recommends(-r)					# Treat recommendations as dependencies
	--simulate(-s)					# Don\'t
	--schedule-only					# Schedule operations to be performed in the future
	--quiet(-q)					# Suppress incremental progress indicators
	--show-versions(-V)					# Show which versions of packages will be installed
	--verbose(-v)					# Display extra information
	--version					# Display the version of aptitude and compile information
	--visual-preview					# Start up the visual interface and display its preview screen
	--assume-yes(-y)					# Assume the answer yes for all question prompts
	...args
]

# Remove all downloaded .deb files from the package cache directory
extern "aptitude clean" [
	--help(-h)					# Display a brief help message. Identical to the help action
	--show-deps(-D)					# Show explanations of automatic installations and removals
	--download-only(-d)					# Download Only
	--fix-broken(-f)					# Correct broken dependencies
	--purge-unused					# Purge packages that are not required by any installed package
	--prompt(-P)					# Always display a prompt
	--without-recommends(-R)					# Do not treat recommendations as dependencies
	--with-recommends(-r)					# Treat recommendations as dependencies
	--simulate(-s)					# Don\'t
	--schedule-only					# Schedule operations to be performed in the future
	--quiet(-q)					# Suppress incremental progress indicators
	--show-versions(-V)					# Show which versions of packages will be installed
	--verbose(-v)					# Display extra information
	--version					# Display the version of aptitude and compile information
	--visual-preview					# Start up the visual interface and display its preview screen
	--assume-yes(-y)					# Assume the answer yes for all question prompts
	...args
]

# Forget all internal information about what packages are \'new\
extern "aptitude forget-new" [
	--help(-h)					# Display a brief help message. Identical to the help action
	--show-deps(-D)					# Show explanations of automatic installations and removals
	--download-only(-d)					# Download Only
	--fix-broken(-f)					# Correct broken dependencies
	--purge-unused					# Purge packages that are not required by any installed package
	--prompt(-P)					# Always display a prompt
	--without-recommends(-R)					# Do not treat recommendations as dependencies
	--with-recommends(-r)					# Treat recommendations as dependencies
	--simulate(-s)					# Don\'t
	--schedule-only					# Schedule operations to be performed in the future
	--quiet(-q)					# Suppress incremental progress indicators
	--show-versions(-V)					# Show which versions of packages will be installed
	--verbose(-v)					# Display extra information
	--version					# Display the version of aptitude and compile information
	--visual-preview					# Start up the visual interface and display its preview screen
	--assume-yes(-y)					# Assume the answer yes for all question prompts
	...args
]

# Cancel all scheduled actions on all packages
extern "aptitude keep-all" [
	--help(-h)					# Display a brief help message. Identical to the help action
	--show-deps(-D)					# Show explanations of automatic installations and removals
	--download-only(-d)					# Download Only
	--fix-broken(-f)					# Correct broken dependencies
	--purge-unused					# Purge packages that are not required by any installed package
	--prompt(-P)					# Always display a prompt
	--without-recommends(-R)					# Do not treat recommendations as dependencies
	--with-recommends(-r)					# Treat recommendations as dependencies
	--simulate(-s)					# Don\'t
	--schedule-only					# Schedule operations to be performed in the future
	--quiet(-q)					# Suppress incremental progress indicators
	--show-versions(-V)					# Show which versions of packages will be installed
	--verbose(-v)					# Display extra information
	--version					# Display the version of aptitude and compile information
	--visual-preview					# Start up the visual interface and display its preview screen
	--assume-yes(-y)					# Assume the answer yes for all question prompts
	...args
]

# Update the list of available packages from the apt sources
extern "aptitude update" [
	--help(-h)					# Display a brief help message. Identical to the help action
	--show-deps(-D)					# Show explanations of automatic installations and removals
	--download-only(-d)					# Download Only
	--fix-broken(-f)					# Correct broken dependencies
	--purge-unused					# Purge packages that are not required by any installed package
	--prompt(-P)					# Always display a prompt
	--without-recommends(-R)					# Do not treat recommendations as dependencies
	--with-recommends(-r)					# Treat recommendations as dependencies
	--simulate(-s)					# Don\'t
	--schedule-only					# Schedule operations to be performed in the future
	--quiet(-q)					# Suppress incremental progress indicators
	--show-versions(-V)					# Show which versions of packages will be installed
	--verbose(-v)					# Display extra information
	--version					# Display the version of aptitude and compile information
	--visual-preview					# Start up the visual interface and display its preview screen
	--assume-yes(-y)					# Assume the answer yes for all question prompts
	...args
]

# Upgrade installed packages to their most recent version
extern "aptitude safe-upgrade" [
	--help(-h)					# Display a brief help message. Identical to the help action
	--show-deps(-D)					# Show explanations of automatic installations and removals
	--download-only(-d)					# Download Only
	--fix-broken(-f)					# Correct broken dependencies
	--purge-unused					# Purge packages that are not required by any installed package
	--prompt(-P)					# Always display a prompt
	--without-recommends(-R)					# Do not treat recommendations as dependencies
	--with-recommends(-r)					# Treat recommendations as dependencies
	--simulate(-s)					# Don\'t
	--schedule-only					# Schedule operations to be performed in the future
	--quiet(-q)					# Suppress incremental progress indicators
	--show-versions(-V)					# Show which versions of packages will be installed
	--verbose(-v)					# Display extra information
	--version					# Display the version of aptitude and compile information
	--visual-preview					# Start up the visual interface and display its preview screen
	--assume-yes(-y)					# Assume the answer yes for all question prompts
	...args
]

# Download and displays the Debian changelog for the packages
extern "aptitude changelog" [
	--help(-h)					# Display a brief help message. Identical to the help action
	--show-deps(-D)					# Show explanations of automatic installations and removals
	--download-only(-d)					# Download Only
	--fix-broken(-f)					# Correct broken dependencies
	--purge-unused					# Purge packages that are not required by any installed package
	--prompt(-P)					# Always display a prompt
	--without-recommends(-R)					# Do not treat recommendations as dependencies
	--with-recommends(-r)					# Treat recommendations as dependencies
	--simulate(-s)					# Don\'t
	--schedule-only					# Schedule operations to be performed in the future
	--quiet(-q)					# Suppress incremental progress indicators
	--show-versions(-V)					# Show which versions of packages will be installed
	--verbose(-v)					# Display extra information
	--version					# Display the version of aptitude and compile information
	--visual-preview					# Start up the visual interface and display its preview screen
	--assume-yes(-y)					# Assume the answer yes for all question prompts
	...args
]

# Upgrade, removing or installing packages as necessary
extern "aptitude full-upgrade" [
	--help(-h)					# Display a brief help message. Identical to the help action
	--show-deps(-D)					# Show explanations of automatic installations and removals
	--download-only(-d)					# Download Only
	--fix-broken(-f)					# Correct broken dependencies
	--purge-unused					# Purge packages that are not required by any installed package
	--prompt(-P)					# Always display a prompt
	--without-recommends(-R)					# Do not treat recommendations as dependencies
	--with-recommends(-r)					# Treat recommendations as dependencies
	--simulate(-s)					# Don\'t
	--schedule-only					# Schedule operations to be performed in the future
	--quiet(-q)					# Suppress incremental progress indicators
	--show-versions(-V)					# Show which versions of packages will be installed
	--verbose(-v)					# Display extra information
	--version					# Display the version of aptitude and compile information
	--visual-preview					# Start up the visual interface and display its preview screen
	--assume-yes(-y)					# Assume the answer yes for all question prompts
	...args
]

# Download the packages to the current directory
extern "aptitude download" [
	--help(-h)					# Display a brief help message. Identical to the help action
	--show-deps(-D)					# Show explanations of automatic installations and removals
	--download-only(-d)					# Download Only
	--fix-broken(-f)					# Correct broken dependencies
	--purge-unused					# Purge packages that are not required by any installed package
	--prompt(-P)					# Always display a prompt
	--without-recommends(-R)					# Do not treat recommendations as dependencies
	--with-recommends(-r)					# Treat recommendations as dependencies
	--simulate(-s)					# Don\'t
	--schedule-only					# Schedule operations to be performed in the future
	--quiet(-q)					# Suppress incremental progress indicators
	--show-versions(-V)					# Show which versions of packages will be installed
	--verbose(-v)					# Display extra information
	--version					# Display the version of aptitude and compile information
	--visual-preview					# Start up the visual interface and display its preview screen
	--assume-yes(-y)					# Assume the answer yes for all question prompts
	...args
]

# Forbid the upgrade to a particular version
extern "aptitude forbid-version" [
	--help(-h)					# Display a brief help message. Identical to the help action
	--show-deps(-D)					# Show explanations of automatic installations and removals
	--download-only(-d)					# Download Only
	--fix-broken(-f)					# Correct broken dependencies
	--purge-unused					# Purge packages that are not required by any installed package
	--prompt(-P)					# Always display a prompt
	--without-recommends(-R)					# Do not treat recommendations as dependencies
	--with-recommends(-r)					# Treat recommendations as dependencies
	--simulate(-s)					# Don\'t
	--schedule-only					# Schedule operations to be performed in the future
	--quiet(-q)					# Suppress incremental progress indicators
	--show-versions(-V)					# Show which versions of packages will be installed
	--verbose(-v)					# Display extra information
	--version					# Display the version of aptitude and compile information
	--visual-preview					# Start up the visual interface and display its preview screen
	--assume-yes(-y)					# Assume the answer yes for all question prompts
	...args
]

# Ignore the packages by future upgrade commands
extern "aptitude hold" [
	--help(-h)					# Display a brief help message. Identical to the help action
	--show-deps(-D)					# Show explanations of automatic installations and removals
	--download-only(-d)					# Download Only
	--fix-broken(-f)					# Correct broken dependencies
	--purge-unused					# Purge packages that are not required by any installed package
	--prompt(-P)					# Always display a prompt
	--without-recommends(-R)					# Do not treat recommendations as dependencies
	--with-recommends(-r)					# Treat recommendations as dependencies
	--simulate(-s)					# Don\'t
	--schedule-only					# Schedule operations to be performed in the future
	--quiet(-q)					# Suppress incremental progress indicators
	--show-versions(-V)					# Show which versions of packages will be installed
	--verbose(-v)					# Display extra information
	--version					# Display the version of aptitude and compile information
	--visual-preview					# Start up the visual interface and display its preview screen
	--assume-yes(-y)					# Assume the answer yes for all question prompts
	...args
]

# Install the packages
extern "aptitude install" [
	--help(-h)					# Display a brief help message. Identical to the help action
	--show-deps(-D)					# Show explanations of automatic installations and removals
	--download-only(-d)					# Download Only
	--fix-broken(-f)					# Correct broken dependencies
	--purge-unused					# Purge packages that are not required by any installed package
	--prompt(-P)					# Always display a prompt
	--without-recommends(-R)					# Do not treat recommendations as dependencies
	--with-recommends(-r)					# Treat recommendations as dependencies
	--simulate(-s)					# Don\'t
	--schedule-only					# Schedule operations to be performed in the future
	--quiet(-q)					# Suppress incremental progress indicators
	--show-versions(-V)					# Show which versions of packages will be installed
	--verbose(-v)					# Display extra information
	--version					# Display the version of aptitude and compile information
	--visual-preview					# Start up the visual interface and display its preview screen
	--assume-yes(-y)					# Assume the answer yes for all question prompts
	...args
]

# Cancel any scheduled actions on the packages
extern "aptitude keep" [
	--help(-h)					# Display a brief help message. Identical to the help action
	--show-deps(-D)					# Show explanations of automatic installations and removals
	--download-only(-d)					# Download Only
	--fix-broken(-f)					# Correct broken dependencies
	--purge-unused					# Purge packages that are not required by any installed package
	--prompt(-P)					# Always display a prompt
	--without-recommends(-R)					# Do not treat recommendations as dependencies
	--with-recommends(-r)					# Treat recommendations as dependencies
	--simulate(-s)					# Don\'t
	--schedule-only					# Schedule operations to be performed in the future
	--quiet(-q)					# Suppress incremental progress indicators
	--show-versions(-V)					# Show which versions of packages will be installed
	--verbose(-v)					# Display extra information
	--version					# Display the version of aptitude and compile information
	--visual-preview					# Start up the visual interface and display its preview screen
	--assume-yes(-y)					# Assume the answer yes for all question prompts
	...args
]

# Mark packages as automatically installed
extern "aptitude markauto" [
	--help(-h)					# Display a brief help message. Identical to the help action
	--show-deps(-D)					# Show explanations of automatic installations and removals
	--download-only(-d)					# Download Only
	--fix-broken(-f)					# Correct broken dependencies
	--purge-unused					# Purge packages that are not required by any installed package
	--prompt(-P)					# Always display a prompt
	--without-recommends(-R)					# Do not treat recommendations as dependencies
	--with-recommends(-r)					# Treat recommendations as dependencies
	--simulate(-s)					# Don\'t
	--schedule-only					# Schedule operations to be performed in the future
	--quiet(-q)					# Suppress incremental progress indicators
	--show-versions(-V)					# Show which versions of packages will be installed
	--verbose(-v)					# Display extra information
	--version					# Display the version of aptitude and compile information
	--visual-preview					# Start up the visual interface and display its preview screen
	--assume-yes(-y)					# Assume the answer yes for all question prompts
	...args
]

# Remove and delete all associated configuration and data files
extern "aptitude purge" [
	--help(-h)					# Display a brief help message. Identical to the help action
	--show-deps(-D)					# Show explanations of automatic installations and removals
	--download-only(-d)					# Download Only
	--fix-broken(-f)					# Correct broken dependencies
	--purge-unused					# Purge packages that are not required by any installed package
	--prompt(-P)					# Always display a prompt
	--without-recommends(-R)					# Do not treat recommendations as dependencies
	--with-recommends(-r)					# Treat recommendations as dependencies
	--simulate(-s)					# Don\'t
	--schedule-only					# Schedule operations to be performed in the future
	--quiet(-q)					# Suppress incremental progress indicators
	--show-versions(-V)					# Show which versions of packages will be installed
	--verbose(-v)					# Display extra information
	--version					# Display the version of aptitude and compile information
	--visual-preview					# Start up the visual interface and display its preview screen
	--assume-yes(-y)					# Assume the answer yes for all question prompts
	...args
]

# Reinstall the packages
extern "aptitude reinstall" [
	--help(-h)					# Display a brief help message. Identical to the help action
	--show-deps(-D)					# Show explanations of automatic installations and removals
	--download-only(-d)					# Download Only
	--fix-broken(-f)					# Correct broken dependencies
	--purge-unused					# Purge packages that are not required by any installed package
	--prompt(-P)					# Always display a prompt
	--without-recommends(-R)					# Do not treat recommendations as dependencies
	--with-recommends(-r)					# Treat recommendations as dependencies
	--simulate(-s)					# Don\'t
	--schedule-only					# Schedule operations to be performed in the future
	--quiet(-q)					# Suppress incremental progress indicators
	--show-versions(-V)					# Show which versions of packages will be installed
	--verbose(-v)					# Display extra information
	--version					# Display the version of aptitude and compile information
	--visual-preview					# Start up the visual interface and display its preview screen
	--assume-yes(-y)					# Assume the answer yes for all question prompts
	...args
]

# Remove the packages
extern "aptitude remove" [
	--help(-h)					# Display a brief help message. Identical to the help action
	--show-deps(-D)					# Show explanations of automatic installations and removals
	--download-only(-d)					# Download Only
	--fix-broken(-f)					# Correct broken dependencies
	--purge-unused					# Purge packages that are not required by any installed package
	--prompt(-P)					# Always display a prompt
	--without-recommends(-R)					# Do not treat recommendations as dependencies
	--with-recommends(-r)					# Treat recommendations as dependencies
	--simulate(-s)					# Don\'t
	--schedule-only					# Schedule operations to be performed in the future
	--quiet(-q)					# Suppress incremental progress indicators
	--show-versions(-V)					# Show which versions of packages will be installed
	--verbose(-v)					# Display extra information
	--version					# Display the version of aptitude and compile information
	--visual-preview					# Start up the visual interface and display its preview screen
	--assume-yes(-y)					# Assume the answer yes for all question prompts
	...args
]

# Display detailed information about the packages
extern "aptitude show" [
	--help(-h)					# Display a brief help message. Identical to the help action
	--show-deps(-D)					# Show explanations of automatic installations and removals
	--download-only(-d)					# Download Only
	--fix-broken(-f)					# Correct broken dependencies
	--purge-unused					# Purge packages that are not required by any installed package
	--prompt(-P)					# Always display a prompt
	--without-recommends(-R)					# Do not treat recommendations as dependencies
	--with-recommends(-r)					# Treat recommendations as dependencies
	--simulate(-s)					# Don\'t
	--schedule-only					# Schedule operations to be performed in the future
	--quiet(-q)					# Suppress incremental progress indicators
	--show-versions(-V)					# Show which versions of packages will be installed
	--verbose(-v)					# Display extra information
	--version					# Display the version of aptitude and compile information
	--visual-preview					# Start up the visual interface and display its preview screen
	--assume-yes(-y)					# Assume the answer yes for all question prompts
	...args
]

# Consider the packages by future upgrade commands
extern "aptitude unhold" [
	--help(-h)					# Display a brief help message. Identical to the help action
	--show-deps(-D)					# Show explanations of automatic installations and removals
	--download-only(-d)					# Download Only
	--fix-broken(-f)					# Correct broken dependencies
	--purge-unused					# Purge packages that are not required by any installed package
	--prompt(-P)					# Always display a prompt
	--without-recommends(-R)					# Do not treat recommendations as dependencies
	--with-recommends(-r)					# Treat recommendations as dependencies
	--simulate(-s)					# Don\'t
	--schedule-only					# Schedule operations to be performed in the future
	--quiet(-q)					# Suppress incremental progress indicators
	--show-versions(-V)					# Show which versions of packages will be installed
	--verbose(-v)					# Display extra information
	--version					# Display the version of aptitude and compile information
	--visual-preview					# Start up the visual interface and display its preview screen
	--assume-yes(-y)					# Assume the answer yes for all question prompts
	...args
]

# Mark packages as manually installed
extern "aptitude unmarkauto" [
	--help(-h)					# Display a brief help message. Identical to the help action
	--show-deps(-D)					# Show explanations of automatic installations and removals
	--download-only(-d)					# Download Only
	--fix-broken(-f)					# Correct broken dependencies
	--purge-unused					# Purge packages that are not required by any installed package
	--prompt(-P)					# Always display a prompt
	--without-recommends(-R)					# Do not treat recommendations as dependencies
	--with-recommends(-r)					# Treat recommendations as dependencies
	--simulate(-s)					# Don\'t
	--schedule-only					# Schedule operations to be performed in the future
	--quiet(-q)					# Suppress incremental progress indicators
	--show-versions(-V)					# Show which versions of packages will be installed
	--verbose(-v)					# Display extra information
	--version					# Display the version of aptitude and compile information
	--visual-preview					# Start up the visual interface and display its preview screen
	--assume-yes(-y)					# Assume the answer yes for all question prompts
	...args
]

# Search for packages matching one of the patterns
extern "aptitude search" [
	--help(-h)					# Display a brief help message. Identical to the help action
	--show-deps(-D)					# Show explanations of automatic installations and removals
	--download-only(-d)					# Download Only
	--fix-broken(-f)					# Correct broken dependencies
	--purge-unused					# Purge packages that are not required by any installed package
	--prompt(-P)					# Always display a prompt
	--without-recommends(-R)					# Do not treat recommendations as dependencies
	--with-recommends(-r)					# Treat recommendations as dependencies
	--simulate(-s)					# Don\'t
	--schedule-only					# Schedule operations to be performed in the future
	--quiet(-q)					# Suppress incremental progress indicators
	--show-versions(-V)					# Show which versions of packages will be installed
	--verbose(-v)					# Display extra information
	--version					# Display the version of aptitude and compile information
	--visual-preview					# Start up the visual interface and display its preview screen
	--assume-yes(-y)					# Assume the answer yes for all question prompts
	...args
]

# Display brief summary of the available commands and options
extern "aptitude help" [
	--help(-h)					# Display a brief help message. Identical to the help action
	--show-deps(-D)					# Show explanations of automatic installations and removals
	--download-only(-d)					# Download Only
	--fix-broken(-f)					# Correct broken dependencies
	--purge-unused					# Purge packages that are not required by any installed package
	--prompt(-P)					# Always display a prompt
	--without-recommends(-R)					# Do not treat recommendations as dependencies
	--with-recommends(-r)					# Treat recommendations as dependencies
	--simulate(-s)					# Don\'t
	--schedule-only					# Schedule operations to be performed in the future
	--quiet(-q)					# Suppress incremental progress indicators
	--show-versions(-V)					# Show which versions of packages will be installed
	--verbose(-v)					# Display extra information
	--version					# Display the version of aptitude and compile information
	--visual-preview					# Start up the visual interface and display its preview screen
	--assume-yes(-y)					# Assume the answer yes for all question prompts
	...args
]