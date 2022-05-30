# Activate debug mode
extern "ranger" [
	--debug(-d)					# Activate debug mode
	--clean(-c)					# Activate clean mode
	--confdir(-r)					# Change configuration directory
	--list-unused-keys					# List common keys which are not bound
	--list-tagged-files					# List all tagged files with given tag (default *)
	--profile					# Print statistics of CPU usage on exit
	--version					# Print version
	--help(-h)					# Print help
	...args
]