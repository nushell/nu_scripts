# Install the latest version of a package
extern "yum" [
	--help(-h)					# Display help and exit
	--tolerant(-t)					# Be tolerant of errors in commandline
	--version					# Display version and exit
	--obsoletes					# Enables obsolets processing logic
	...args
]

# List all packages
extern "yum all" [
	--help(-h)					# Display help and exit
	--tolerant(-t)					# Be tolerant of errors in commandline
	--version					# Display version and exit
	--obsoletes					# Enables obsolets processing logic
	...args
]

# List packages available for installation
extern "yum available" [
	--help(-h)					# Display help and exit
	--tolerant(-t)					# Be tolerant of errors in commandline
	--version					# Display version and exit
	--obsoletes					# Enables obsolets processing logic
	...args
]

# List packages with updates available
extern "yum updates" [
	--help(-h)					# Display help and exit
	--tolerant(-t)					# Be tolerant of errors in commandline
	--version					# Display version and exit
	--obsoletes					# Enables obsolets processing logic
	...args
]

# List installed packages
extern "yum installed" [
	--help(-h)					# Display help and exit
	--tolerant(-t)					# Be tolerant of errors in commandline
	--version					# Display version and exit
	--obsoletes					# Enables obsolets processing logic
	...args
]

# List packages not available in repositories
extern "yum extras" [
	--help(-h)					# Display help and exit
	--tolerant(-t)					# Be tolerant of errors in commandline
	--version					# Display version and exit
	--obsoletes					# Enables obsolets processing logic
	...args
]

# List packages that are obsoleted by packages in repositories
extern "yum obsoletes" [
	--help(-h)					# Display help and exit
	--tolerant(-t)					# Be tolerant of errors in commandline
	--version					# Display version and exit
	--obsoletes					# Enables obsolets processing logic
	...args
]