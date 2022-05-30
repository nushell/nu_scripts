# Print messages about what the program is doing
extern "modprobe" [
	--verbose(-v)					# Print messages about what the program is doing
	--showconfig(-c)					# Dump configuration file
	--dry-run(-n)					# Do not actually insert/remove module
	--ignore-install(-i)					# Ignore install and remove commands in configuration file
	--ignore-remove					# Ignore install and remove commands in configuration file
	--quiet(-q)					# Ignore bogus module names
	--remove(-r)					# Remove modules
	--version(-V)					# Display version and exit
	--force(-f)					# Ignore all version information
	--force-vermagic					# Ignore version magic information
	--force-modversion					# Ignore module interface version
	--list(-l)					# List all modules matching the given wildcard
	--all(-a)					# Insert modules matching the given wildcard
	--type(-t)					# Restrict wildcards to specified directory
	--syslog(-s)					# Send error messages through syslog
	--set-version					# Specify kernel version
	--show-depends					# List dependencies of module
	--name(-o)					# Rename module
	--first-time					# Fail if inserting already loaded module
	...args
]