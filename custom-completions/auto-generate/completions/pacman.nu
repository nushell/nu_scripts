# Modify the package database
extern "$progname" [
	--database(-D)					# Modify the package database
	--query(-Q)					# Query the package database
	--remove(-R)					# Remove packages from the system
	--sync(-S)					# Synchronize packages
	--deptest(-T)					# Check dependencies
	--upgrade(-U)					# Upgrade or add a local package
	--files(-F)					# Query the files database
	--version(-V)					# Display version and exit
	--help(-h)					# Display help
	--dbpath(-b)					# Alternate database location
	--root(-r)					# Alternate installation root
	--cachedir					# Alternate package cache location
	--color					# Colorize the output
	--gpgdir					# Alternate home directory for GnuPG
	--hookdir					# Alternate hook location
	--logfile					# Alternate log file
	--sysroot					# Operate on a mounted guest system (root-only)
	--check(-k)					# Check database validity
	--list(-l)					# List all packages in REPOSITORY
	--sysupgrade(-u)					# Upgrade all packages that are out of date
	--downloadonly(-w)					# Only download the target packages
	...args
]