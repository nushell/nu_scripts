# 
extern "pactl" [
	--version					# Print a short version and exit
	--help(-h)					# Print help text and exit
	...args
]

# Show statistics about memory usage
extern "pactl stat" [
	--version					# Print a short version and exit
	--help(-h)					# Print help text and exit
	...args
]

# Show info about the daemon
extern "pactl info" [
	--version					# Print a short version and exit
	--help(-h)					# Print help text and exit
	...args
]

# Show all loaded things of the specified type
extern "pactl list" [
	--version					# Print a short version and exit
	--help(-h)					# Print help text and exit
	...args
]

# 
extern "pactl modules sinks sources sink-inputs source-outputs clients samples cards" [
	--version					# Print a short version and exit
	--help(-h)					# Print help text and exit
	...args
]

# Show shorter output
extern "pactl short" [
	--version					# Print a short version and exit
	--help(-h)					# Print help text and exit
	...args
]

# Ask the daemon to exit
extern "pactl exit" [
	--version					# Print a short version and exit
	--help(-h)					# Print help text and exit
	...args
]

# Upload a file to the sample cache
extern "pactl upload-sample" [
	--version					# Print a short version and exit
	--help(-h)					# Print help text and exit
	...args
]

# Play a sample from the cache
extern "pactl play-sample" [
	--version					# Print a short version and exit
	--help(-h)					# Print help text and exit
	...args
]

# Remove a sample from the cache
extern "pactl remove-sample" [
	--version					# Print a short version and exit
	--help(-h)					# Print help text and exit
	...args
]