# Show help and exit
extern "xonsh" [
	--help(-h)					# Show help and exit
	--version(-v)					# Show version and exit
	--interactive(-i)					# Use interactive mode
	--login(-l)					# Use login shell
	--rc					# .rc files to load
	--no-rc					# Do not load .rc files
	--no-script-cache					# Do not use script cache
	--cache-everything					# Use script cache
	--timings					# Show timing information
	...args
]