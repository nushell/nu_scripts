# Output version and exit
extern "jq" [
	--version					# Output version and exit
	--seq					# Use application/json-seq MIME type scheme
	--stream					# Parse input in streaming fasion
	--slurp(-s)					# Run filter just once in large array
	--raw-input(-R)					# Dont parse as JSON but as string
	--null-input(-n)					# Ignore input and treat it as null
	--compact-output(-c)					# Dont pretty-print JSON
	--tab					# Use a tab for indentation instead of 2 spaces
	--color-output(-C)					# Color output
	--monochrome-output(-M)					# Dont color output
	--ascii-output(-a)					# Replace UTF-8 characters with escape sequences
	--unbuffered					# Flush output after each JSON object is printed
	--sort-keys(-S)					# Sort object keys in output
	--raw-output(-r)					# If output is string output its content directly to stdout
	--join-output(-j)					# Raw output without newlines
	...args
]