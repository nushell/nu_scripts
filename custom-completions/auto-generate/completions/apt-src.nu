# Display help and exit
extern "apt-src" [
	--help(-h)					# Display help and exit
	--build(-b)					# Build source packages
	--installdebs(-i)					# Install after build
	--patch(-p)					# Patch local changes
	--here(-c)					# Run on current dir
	--upstream-version					# Omit debian version
	--keep-built(-k)					# Do not del built files
	--no-delete-source(-n)					# Do not del source files
	--version					# Source tree version
	--quiet(-q)					# Output to /dev/null
	--trace(-t)					# Output trace
	...args
]

# Update list of source packages
extern "apt-src update" [
	--help(-h)					# Display help and exit
	--build(-b)					# Build source packages
	--installdebs(-i)					# Install after build
	--patch(-p)					# Patch local changes
	--here(-c)					# Run on current dir
	--upstream-version					# Omit debian version
	--keep-built(-k)					# Do not del built files
	--no-delete-source(-n)					# Do not del source files
	--version					# Source tree version
	--quiet(-q)					# Output to /dev/null
	--trace(-t)					# Output trace
	...args
]

# Install source packages
extern "apt-src install" [
	--help(-h)					# Display help and exit
	--build(-b)					# Build source packages
	--installdebs(-i)					# Install after build
	--patch(-p)					# Patch local changes
	--here(-c)					# Run on current dir
	--upstream-version					# Omit debian version
	--keep-built(-k)					# Do not del built files
	--no-delete-source(-n)					# Do not del source files
	--version					# Source tree version
	--quiet(-q)					# Output to /dev/null
	--trace(-t)					# Output trace
	...args
]

# Upgrade source packages
extern "apt-src upgrade" [
	--help(-h)					# Display help and exit
	--build(-b)					# Build source packages
	--installdebs(-i)					# Install after build
	--patch(-p)					# Patch local changes
	--here(-c)					# Run on current dir
	--upstream-version					# Omit debian version
	--keep-built(-k)					# Do not del built files
	--no-delete-source(-n)					# Do not del source files
	--version					# Source tree version
	--quiet(-q)					# Output to /dev/null
	--trace(-t)					# Output trace
	...args
]

# Remove source packages
extern "apt-src remove" [
	--help(-h)					# Display help and exit
	--build(-b)					# Build source packages
	--installdebs(-i)					# Install after build
	--patch(-p)					# Patch local changes
	--here(-c)					# Run on current dir
	--upstream-version					# Omit debian version
	--keep-built(-k)					# Do not del built files
	--no-delete-source(-n)					# Do not del source files
	--version					# Source tree version
	--quiet(-q)					# Output to /dev/null
	--trace(-t)					# Output trace
	...args
]

# Build source packages
extern "apt-src build" [
	--help(-h)					# Display help and exit
	--build(-b)					# Build source packages
	--installdebs(-i)					# Install after build
	--patch(-p)					# Patch local changes
	--here(-c)					# Run on current dir
	--upstream-version					# Omit debian version
	--keep-built(-k)					# Do not del built files
	--no-delete-source(-n)					# Do not del source files
	--version					# Source tree version
	--quiet(-q)					# Output to /dev/null
	--trace(-t)					# Output trace
	...args
]

# Clean source packages
extern "apt-src clean" [
	--help(-h)					# Display help and exit
	--build(-b)					# Build source packages
	--installdebs(-i)					# Install after build
	--patch(-p)					# Patch local changes
	--here(-c)					# Run on current dir
	--upstream-version					# Omit debian version
	--keep-built(-k)					# Do not del built files
	--no-delete-source(-n)					# Do not del source files
	--version					# Source tree version
	--quiet(-q)					# Output to /dev/null
	--trace(-t)					# Output trace
	...args
]

# Detect known source tree
extern "apt-src import" [
	--help(-h)					# Display help and exit
	--build(-b)					# Build source packages
	--installdebs(-i)					# Install after build
	--patch(-p)					# Patch local changes
	--here(-c)					# Run on current dir
	--upstream-version					# Omit debian version
	--keep-built(-k)					# Do not del built files
	--no-delete-source(-n)					# Do not del source files
	--version					# Source tree version
	--quiet(-q)					# Output to /dev/null
	--trace(-t)					# Output trace
	...args
]

# List installed source package\(s\)
extern "apt-src list" [
	--help(-h)					# Display help and exit
	--build(-b)					# Build source packages
	--installdebs(-i)					# Install after build
	--patch(-p)					# Patch local changes
	--here(-c)					# Run on current dir
	--upstream-version					# Omit debian version
	--keep-built(-k)					# Do not del built files
	--no-delete-source(-n)					# Do not del source files
	--version					# Source tree version
	--quiet(-q)					# Output to /dev/null
	--trace(-t)					# Output trace
	...args
]

# Root source tree
extern "apt-src location" [
	--help(-h)					# Display help and exit
	--build(-b)					# Build source packages
	--installdebs(-i)					# Install after build
	--patch(-p)					# Patch local changes
	--here(-c)					# Run on current dir
	--upstream-version					# Omit debian version
	--keep-built(-k)					# Do not del built files
	--no-delete-source(-n)					# Do not del source files
	--version					# Source tree version
	--quiet(-q)					# Output to /dev/null
	--trace(-t)					# Output trace
	...args
]

# Version of source package
extern "apt-src version" [
	--help(-h)					# Display help and exit
	--build(-b)					# Build source packages
	--installdebs(-i)					# Install after build
	--patch(-p)					# Patch local changes
	--here(-c)					# Run on current dir
	--upstream-version					# Omit debian version
	--keep-built(-k)					# Do not del built files
	--no-delete-source(-n)					# Do not del source files
	--version					# Source tree version
	--quiet(-q)					# Output to /dev/null
	--trace(-t)					# Output trace
	...args
]

# Name of the source package
extern "apt-src name" [
	--help(-h)					# Display help and exit
	--build(-b)					# Build source packages
	--installdebs(-i)					# Install after build
	--patch(-p)					# Patch local changes
	--here(-c)					# Run on current dir
	--upstream-version					# Omit debian version
	--keep-built(-k)					# Do not del built files
	--no-delete-source(-n)					# Do not del source files
	--version					# Source tree version
	--quiet(-q)					# Output to /dev/null
	--trace(-t)					# Output trace
	...args
]