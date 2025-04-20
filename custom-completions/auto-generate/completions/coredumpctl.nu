# List available coredumps
extern "coredumpctl list" [
	--help(-h)					# Show this help
	--version					# Print version string
	--no-pager					# Do not pipe output into a pager
	--no-legend					# Do not print the column headers
	--json					# JSON output format
	--reverse(-r)					# Show the newest entries first
	--quiet(-q)					# Do not show info messages and privilege warning
	...args
]

# Show detailed information about coredump(s)
extern "coredumpctl info" [
	--help(-h)					# Show this help
	--version					# Print version string
	--no-pager					# Do not pipe output into a pager
	--no-legend					# Do not print the column headers
	--json					# JSON output format
	--reverse(-r)					# Show the newest entries first
	--quiet(-q)					# Do not show info messages and privilege warning
	...args
]

# Print first matching coredump to stdout
extern "coredumpctl dump" [
	--help(-h)					# Show this help
	--version					# Print version string
	--no-pager					# Do not pipe output into a pager
	--no-legend					# Do not print the column headers
	--json					# JSON output format
	--reverse(-r)					# Show the newest entries first
	--quiet(-q)					# Do not show info messages and privilege warning
	...args
]

# Start a debugger for the first matching coredump
extern "coredumpctl debug" [
	--help(-h)					# Show this help
	--version					# Print version string
	--no-pager					# Do not pipe output into a pager
	--no-legend					# Do not print the column headers
	--json					# JSON output format
	--reverse(-r)					# Show the newest entries first
	--quiet(-q)					# Do not show info messages and privilege warning
	...args
]

# Show this help
extern "coredumpctl" [
	--help(-h)					# Show this help
	--version					# Print version string
	--no-pager					# Do not pipe output into a pager
	--no-legend					# Do not print the column headers
	--json					# JSON output format
	--reverse(-r)					# Show the newest entries first
	--quiet(-q)					# Do not show info messages and privilege warning
	...args
]