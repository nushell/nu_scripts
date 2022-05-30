# Start the service
extern "invoke-rc.d start" [

	...args
]

# Stop the service
extern "invoke-rc.d stop" [

	...args
]

# Restart the service
extern "invoke-rc.d restart" [

	...args
]

# Reload Configuration
extern "invoke-rc.d reload" [

	...args
]

# Force reloading configuration
extern "invoke-rc.d force-reload" [

	...args
]

# Print the status of the service
extern "invoke-rc.d status" [

	...args
]