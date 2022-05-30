# Display help and exit
extern "apt-zip-inst" [
	--help(-h)					# Display help and exit
	--version(-V)					# Display version and exit
	--medium(-m)					# Removable medium
	--aptgetaction(-a)					# Select an action
	--packages(-p)					# List of packages to install
	--fix-broken(-f)					# Fix broken option
	--skip-mount					# Specify a non-mountpoint dir
	...args
]

# Select an action
extern "apt-zip-inst dselect-upgrade upgrade dist-upgrade" [
	--help(-h)					# Display help and exit
	--version(-V)					# Display version and exit
	--medium(-m)					# Removable medium
	--aptgetaction(-a)					# Select an action
	--packages(-p)					# List of packages to install
	--fix-broken(-f)					# Fix broken option
	--skip-mount					# Specify a non-mountpoint dir
	...args
]