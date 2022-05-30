# Start one or more units
extern "systemctl start" [

	...args
]

# Stop one or more units
extern "systemctl stop" [

	...args
]

# Restart one or more units
extern "systemctl restart" [

	...args
]

# Runtime status about one or more units
extern "systemctl status" [

	...args
]

# Enable one or more units
extern "systemctl enable" [

	...args
]

# Disable one or more units
extern "systemctl disable" [

	...args
]

# Start a unit and dependencies and disable all others
extern "systemctl isolate" [

	...args
]

# Set the default target to boot into
extern "systemctl set-default" [

	...args
]

# Sets one or more properties of a unit
extern "systemctl set-property" [

	...args
]

# List of unit types
extern "systemctl" [

	...args
]