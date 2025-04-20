# Output jq version
extern "jq" [
	--version					# Output jq version
	--seq					# Use application/json-seq MIME type
	--stream					# Parse input in streaming fashion
	--slurp(-s)					# Read input to array and filter once
	--raw-input(-R)					# Parse input as string (not JSON)
	--null-input(-n)					# Ignore input and treat it as null
	--compact-output(-c)					# Don\'t
	--tab					# Indent w/ tabs instead of spaces
	--color-output(-C)					# Color output
	--monochrome-output(-M)					# Don\'t
	--ascii-output(-a)					# Replace UTF-8 chars w/ escape sequences
	--unbuffered					# Flush output after each JSON object
	--sort-keys(-S)					# Sort object keys in output
	--raw-output(-r)					# Write string output w/out quotes
	--join-output(-j)					# Raw output without newlines
	--exit-status(-e)					# Set exit status from output
	--args					# Remaining args are positional string args
	--jsonargs					# Remaining args are positional JSON text args
	--run-tests					# Run tests in given file
	...args
]