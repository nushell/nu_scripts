# Show help
extern "web-ext" [
	--help(-h)					# Show help
	--version					# Show version
	--source-dir(-s)					# Set the extension source directory
	--artifacts-dir(-a)					# Set the directory where artifacts will be saved
	--verbose(-v)					# Show verbose output
	--ignore-files(-i)					# List glob patterns to define which files should be ignored
	--no-input					# Disable all features that require standard input
	--config(-c)					# Set the path to a CommonJS config file to set option defaults
	--config-discovery					# Discover the config files in home directory and working directory
	...args
]

# Create the extension package from source
extern "web-ext build" [
	--help(-h)					# Show help
	--version					# Show version
	--source-dir(-s)					# Set the extension source directory
	--artifacts-dir(-a)					# Set the directory where artifacts will be saved
	--verbose(-v)					# Show verbose output
	--ignore-files(-i)					# List glob patterns to define which files should be ignored
	--no-input					# Disable all features that require standard input
	--config(-c)					# Set the path to a CommonJS config file to set option defaults
	--config-discovery					# Discover the config files in home directory and working directory
	...args
]

# Run the config discovery and dump the resulting config data as JSON
extern "web-ext dump-config" [
	--help(-h)					# Show help
	--version					# Show version
	--source-dir(-s)					# Set the extension source directory
	--artifacts-dir(-a)					# Set the directory where artifacts will be saved
	--verbose(-v)					# Show verbose output
	--ignore-files(-i)					# List glob patterns to define which files should be ignored
	--no-input					# Disable all features that require standard input
	--config(-c)					# Set the path to a CommonJS config file to set option defaults
	--config-discovery					# Discover the config files in home directory and working directory
	...args
]

# Sign the extension so it can be installed in Firefox
extern "web-ext sign" [
	--help(-h)					# Show help
	--version					# Show version
	--source-dir(-s)					# Set the extension source directory
	--artifacts-dir(-a)					# Set the directory where artifacts will be saved
	--verbose(-v)					# Show verbose output
	--ignore-files(-i)					# List glob patterns to define which files should be ignored
	--no-input					# Disable all features that require standard input
	--config(-c)					# Set the path to a CommonJS config file to set option defaults
	--config-discovery					# Discover the config files in home directory and working directory
	...args
]

# Run the extension
extern "web-ext run" [
	--help(-h)					# Show help
	--version					# Show version
	--source-dir(-s)					# Set the extension source directory
	--artifacts-dir(-a)					# Set the directory where artifacts will be saved
	--verbose(-v)					# Show verbose output
	--ignore-files(-i)					# List glob patterns to define which files should be ignored
	--no-input					# Disable all features that require standard input
	--config(-c)					# Set the path to a CommonJS config file to set option defaults
	--config-discovery					# Discover the config files in home directory and working directory
	...args
]

# Validate the extension source
extern "web-ext lint" [
	--help(-h)					# Show help
	--version					# Show version
	--source-dir(-s)					# Set the extension source directory
	--artifacts-dir(-a)					# Set the directory where artifacts will be saved
	--verbose(-v)					# Show verbose output
	--ignore-files(-i)					# List glob patterns to define which files should be ignored
	--no-input					# Disable all features that require standard input
	--config(-c)					# Set the path to a CommonJS config file to set option defaults
	--config-discovery					# Discover the config files in home directory and working directory
	...args
]

# Show help in the browser
extern "web-ext docs" [
	--help(-h)					# Show help
	--version					# Show version
	--source-dir(-s)					# Set the extension source directory
	--artifacts-dir(-a)					# Set the directory where artifacts will be saved
	--verbose(-v)					# Show verbose output
	--ignore-files(-i)					# List glob patterns to define which files should be ignored
	--no-input					# Disable all features that require standard input
	--config(-c)					# Set the path to a CommonJS config file to set option defaults
	--config-discovery					# Discover the config files in home directory and working directory
	...args
]