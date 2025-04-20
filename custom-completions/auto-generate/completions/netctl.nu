# Display help
extern "netctl" [
	--help					# Display help
	--version					# Display version
	...args
]

# List available profiles
extern "netctl list" [
	--help					# Display help
	--version					# Display version
	...args
]

# Save which profiles are active
extern "netctl store" [
	--help					# Display help
	--version					# Display version
	...args
]

# Load saved profiles
extern "netctl restore" [
	--help					# Display help
	--version					# Display version
	...args
]

# Stops all profiles
extern "netctl stop-all" [
	--help					# Display help
	--version					# Display version
	...args
]

# Start a profile
extern "netctl start" [
	--help					# Display help
	--version					# Display version
	...args
]

# Stop a profile
extern "netctl stop" [
	--help					# Display help
	--version					# Display version
	...args
]

# Restart a profile
extern "netctl restart" [
	--help					# Display help
	--version					# Display version
	...args
]

# Switch to a profile
extern "netctl switch-to" [
	--help					# Display help
	--version					# Display version
	...args
]

# Show runtime status of a profile
extern "netctl status" [
	--help					# Display help
	--version					# Display version
	...args
]

# Enable the systemd unit for a profile
extern "netctl enable" [
	--help					# Display help
	--version					# Display version
	...args
]

# Disable the systemd unit for a profile
extern "netctl disable" [
	--help					# Display help
	--version					# Display version
	...args
]

# Reenable the systemd unit for a profile
extern "netctl reenable" [
	--help					# Display help
	--version					# Display version
	...args
]

# Check whether the unit is enabled
extern "netctl is-enabled" [
	--help					# Display help
	--version					# Display version
	...args
]

# Open the specified profile in an editor
extern "netctl edit" [
	--help					# Display help
	--version					# Display version
	...args
]