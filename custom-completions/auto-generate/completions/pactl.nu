# 
extern "pactl" [

	...args
]

# Show statistics about memory usage
extern "pactl stat" [

	...args
]

# Show info about the daemon
extern "pactl info" [

	...args
]

# Show all loaded things of the specified type
extern "pactl list" [

	...args
]

# 
extern "pactl modules sinks sources sink-inputs source-outputs clients samples cards" [

	...args
]

# Show shorter output
extern "pactl short" [

	...args
]

# Ask the daemon to exit
extern "pactl exit" [

	...args
]

# Upload a file to the sample cache
extern "pactl upload-sample" [

	...args
]

# Play a sample from the cache
extern "pactl play-sample" [

	...args
]

# Remove a sample from the cache
extern "pactl remove-sample" [

	...args
]