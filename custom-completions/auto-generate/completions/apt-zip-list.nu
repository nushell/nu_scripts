# Display help and exit
extern "apt-zip-list" [
	--help(-h)					# Display help and exit
	--version(-V)					# Display version and exit
	--medium(-m)					# Removable medium
	--aptgetaction(-a)					# Select an action
	--packages(-p)					# List of packages to install
	--fix-broken(-f)					# Fix broken option
	--skip-mount					# Specify a non-mountpoint dir
	--method(-M)					# Select a method
	--options(-o)					# Specify options
	--accept(-A)					# Accept protocols
	--reject(-R)					# Reject protocols
	...args
]

# Select an action
extern "apt-zip-list dselect-upgrade upgrade dist-upgrade" [
	--help(-h)					# Display help and exit
	--version(-V)					# Display version and exit
	--medium(-m)					# Removable medium
	--aptgetaction(-a)					# Select an action
	--packages(-p)					# List of packages to install
	--fix-broken(-f)					# Fix broken option
	--skip-mount					# Specify a non-mountpoint dir
	--method(-M)					# Select a method
	--options(-o)					# Specify options
	--accept(-A)					# Accept protocols
	--reject(-R)					# Reject protocols
	...args
]

# Specify options
extern "apt-zip-list tar restart" [
	--help(-h)					# Display help and exit
	--version(-V)					# Display version and exit
	--medium(-m)					# Removable medium
	--aptgetaction(-a)					# Select an action
	--packages(-p)					# List of packages to install
	--fix-broken(-f)					# Fix broken option
	--skip-mount					# Specify a non-mountpoint dir
	--method(-M)					# Select a method
	--options(-o)					# Specify options
	--accept(-A)					# Accept protocols
	--reject(-R)					# Reject protocols
	...args
]

# Accept protocols
extern "apt-zip-list http ftp" [
	--help(-h)					# Display help and exit
	--version(-V)					# Display version and exit
	--medium(-m)					# Removable medium
	--aptgetaction(-a)					# Select an action
	--packages(-p)					# List of packages to install
	--fix-broken(-f)					# Fix broken option
	--skip-mount					# Specify a non-mountpoint dir
	--method(-M)					# Select a method
	--options(-o)					# Specify options
	--accept(-A)					# Accept protocols
	--reject(-R)					# Reject protocols
	...args
]