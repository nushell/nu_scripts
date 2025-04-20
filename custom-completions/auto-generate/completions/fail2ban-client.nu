# Configuration dir
extern "fail2ban-client" [
	--conf(-c)					# Configuration dir
	--socket(-s)					# Socket path
	--pidfile(-p)					# Pidfile path
	--pname					# Name of the process
	--loglevel					# loglevel of client
	--dump-pretty					# Dump configuration (pretty)
	--test(-t)					# Test configuration
	--str2sec					# Convert time abbr format to secs
	--help(-h)					# Display help message
	--version(-V)					# Display client version
	--unban
	--if-exists
	--restart
	--unban
	--all
	--if-exists
	--all
	...args
]