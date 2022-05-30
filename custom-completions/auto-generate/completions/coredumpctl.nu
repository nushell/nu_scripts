# List available coredumps
extern "coredumpctl list" [

	...args
]

# Show detailed information about coredump(s)
extern "coredumpctl info" [

	...args
]

# Print first matching coredump to stdout
extern "coredumpctl dump" [

	...args
]

# Start a debugger for the first matching coredump
extern "coredumpctl debug" [

	...args
]

# Show this help
extern "coredumpctl" [

	...args
]