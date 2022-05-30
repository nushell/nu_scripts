# Directory containing additional DB migrations
extern "msfconsole" [
	--migration-path(-M)					# Directory containing additional DB migrations
	--no-database(-n)					# Disable database support
	--version(-V)					# Show version
	--defer-module-loads					# Defer module loading
	--module-path(-m)					# Load an additional module path
	--ask(-a)					# Ask before exiting Metasploit
	--logger(-l)					# Specify a logger to use
	--real-readline(-L)					# Use the system Readline library
	--quiet(-q)					# Do not print the banner on startup
	--help(-h)					# Show help message
	...args
]