# Show help and exit
extern "yash" [
	--help					# Show help and exit
	--version(-V)					# Show version and exit
	--cmdline(-c)					# Commands to run
	--stdin(-s)					# Read commands from stdin
	--verbose(-v)					# List optional features
	--login(-l)					# Use login shell
	--interactive(-i)					# Use interactive shell
	--profile					# Load profile
	--noprofile					# Do not load profile
	--rcfile					# Load .rc file
	--norcfile					# Do not load .rc file
	...args
]