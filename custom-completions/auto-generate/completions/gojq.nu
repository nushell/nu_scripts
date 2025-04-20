# Compact output, no pretty-print
extern "gojq" [
	--compact-output(-c)					# Compact output, no pretty-print
	--raw-output(-r)					# Output raw strings without quotes
	--join-output(-j)					# Stop printing a newline after each output
	--nul-output(-0)					# Print NUL after each output
	--color-output(-C)					# Colorize output even if piped
	--monochrome-output(-M)					# Stop colorizing output
	--yaml-output					# Output as YAML
	--tab					# Use tabs for indentation
	--null-input(-n)					# Use null as input value
	--raw-input(-R)					# Read input as raw strings
	--slurp(-s)					# Read all inputs into an array
	--stream					# Parse input in stream fashion
	--yaml-input					# Read input as YAML
	--args					# Consume remaining arguments as positional string values
	--jsonargs					# Consume remaining arguments as positional JSON values
	--exit-status(-e)					# Exit 1 when the last value is false or null
	--version(-v)					# Print gojq version
	--help(-h)					# Print help
	...args
]