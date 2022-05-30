# Display help
extern "netctl" [

	...args
]

# List available profiles
extern "netctl list" [

	...args
]

# Save which profiles are active
extern "netctl store" [

	...args
]

# Load saved profiles
extern "netctl restore" [

	...args
]

# Stops all profiles
extern "netctl stop-all" [

	...args
]

# Start a profile
extern "netctl start" [

	...args
]

# Stop a profile
extern "netctl stop" [

	...args
]

# Restart a profile
extern "netctl restart" [

	...args
]

# Switch to a profile
extern "netctl switch-to" [

	...args
]

# Show runtime status of a profile
extern "netctl status" [

	...args
]

# Enable the systemd unit for a profile
extern "netctl enable" [

	...args
]

# Disable the systemd unit for a profile
extern "netctl disable" [

	...args
]

# Reenable the systemd unit for a profile
extern "netctl reenable" [

	...args
]

# Check whether the unit is enabled
extern "netctl is-enabled" [

	...args
]

# Open the specified profile in an editor
extern "netctl edit" [

	...args
]