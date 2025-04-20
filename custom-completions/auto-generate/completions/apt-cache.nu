# Display help and exit
extern "apt-cache" [
	--help(-h)					# Display help and exit
	--full					# Search full package name
	--quiet(-q)					# Quiet mode
	--important(-i)					# Print important dependencies
	--all-versions(-a)					# Print full records
	--generate(-g)					# Auto-gen package cache
	--all-names					# Print all names
	--recurse					# Dep and rdep recursive
	--installed					# Limit to installed
	--version(-v)					# Display version and exit
	...args
]

# Build apt cache
extern "apt-cache gencaches" [
	--help(-h)					# Display help and exit
	--full					# Search full package name
	--quiet(-q)					# Quiet mode
	--important(-i)					# Print important dependencies
	--all-versions(-a)					# Print full records
	--generate(-g)					# Auto-gen package cache
	--all-names					# Print all names
	--recurse					# Dep and rdep recursive
	--installed					# Limit to installed
	--version(-v)					# Display version and exit
	...args
]

# Show cache statistics
extern "apt-cache stats" [
	--help(-h)					# Display help and exit
	--full					# Search full package name
	--quiet(-q)					# Quiet mode
	--important(-i)					# Print important dependencies
	--all-versions(-a)					# Print full records
	--generate(-g)					# Auto-gen package cache
	--all-names					# Print all names
	--recurse					# Dep and rdep recursive
	--installed					# Limit to installed
	--version(-v)					# Display version and exit
	...args
]

# Show packages in cache
extern "apt-cache dump" [
	--help(-h)					# Display help and exit
	--full					# Search full package name
	--quiet(-q)					# Quiet mode
	--important(-i)					# Print important dependencies
	--all-versions(-a)					# Print full records
	--generate(-g)					# Auto-gen package cache
	--all-names					# Print all names
	--recurse					# Dep and rdep recursive
	--installed					# Limit to installed
	--version(-v)					# Display version and exit
	...args
]

# Print available list
extern "apt-cache dumpavail" [
	--help(-h)					# Display help and exit
	--full					# Search full package name
	--quiet(-q)					# Quiet mode
	--important(-i)					# Print important dependencies
	--all-versions(-a)					# Print full records
	--generate(-g)					# Auto-gen package cache
	--all-names					# Print all names
	--recurse					# Dep and rdep recursive
	--installed					# Limit to installed
	--version(-v)					# Display version and exit
	...args
]

# List unmet dependencies in cache
extern "apt-cache unmet" [
	--help(-h)					# Display help and exit
	--full					# Search full package name
	--quiet(-q)					# Quiet mode
	--important(-i)					# Print important dependencies
	--all-versions(-a)					# Print full records
	--generate(-g)					# Auto-gen package cache
	--all-names					# Print all names
	--recurse					# Dep and rdep recursive
	--installed					# Limit to installed
	--version(-v)					# Display version and exit
	...args
]

# Search full package name
extern "apt-cache search" [
	--help(-h)					# Display help and exit
	--full					# Search full package name
	--quiet(-q)					# Quiet mode
	--important(-i)					# Print important dependencies
	--all-versions(-a)					# Print full records
	--generate(-g)					# Auto-gen package cache
	--all-names					# Print all names
	--recurse					# Dep and rdep recursive
	--installed					# Limit to installed
	--version(-v)					# Display version and exit
	...args
]