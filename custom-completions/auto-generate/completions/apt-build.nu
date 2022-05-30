[# Display help and exit
extern "apt-build" [
	--help					# Display help and exit
	--nowrapper					# Do not use gcc wrapper
	--remove-builddep					# Remove build-dep
	--no-source					# Do not download source
	--build-dir					# Specify build-dir
	--rebuild					# Rebuild a package
	--reinstall					# Rebuild and install an installed package
	--patch-strip(-p)					# Prefix to strip on patch
	--yes(-y)					# Assume yes to all questions
	--purge					# Use purge instead of remove
	--noupdate					# Do not run update
	--version(-v)					# Display version and exit
	...args
]
# Update list of packages
extern "apt-build update" [
	--help					# Display help and exit
	--nowrapper					# Do not use gcc wrapper
	--remove-builddep					# Remove build-dep
	--no-source					# Do not download source
	--build-dir					# Specify build-dir
	--rebuild					# Rebuild a package
	--reinstall					# Rebuild and install an installed package
	--patch-strip(-p)					# Prefix to strip on patch
	--yes(-y)					# Assume yes to all questions
	--purge					# Use purge instead of remove
	--noupdate					# Do not run update
	--version(-v)					# Display version and exit
	...args
]
# Upgrade packages
extern "apt-build upgrade" [
	--help					# Display help and exit
	--nowrapper					# Do not use gcc wrapper
	--remove-builddep					# Remove build-dep
	--no-source					# Do not download source
	--build-dir					# Specify build-dir
	--rebuild					# Rebuild a package
	--reinstall					# Rebuild and install an installed package
	--patch-strip(-p)					# Prefix to strip on patch
	--yes(-y)					# Assume yes to all questions
	--purge					# Use purge instead of remove
	--noupdate					# Do not run update
	--version(-v)					# Display version and exit
	...args
]]

[# Rebuild your system
extern "apt-bulid world" [

	...args
]]