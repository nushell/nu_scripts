# 
extern "iwctl" [
	--help(-h)
	--dont-ask(-v)					# Don't ask for missing credentials
	...args
]

# List devices in Ad-Hoc mode
extern "iwctl list" [
	--help(-h)
	--dont-ask(-v)					# Don't ask for missing credentials
	...args
]

# Start or join an Ad-Hoc network
extern "iwctl start" [
	--help(-h)
	--dont-ask(-v)					# Don't ask for missing credentials
	...args
]

# Start of join an open Ad-Hoc network
extern "iwctl start_open" [
	--help(-h)
	--dont-ask(-v)					# Don't ask for missing credentials
	...args
]

# Leave an Ad-Hoc network
extern "iwctl stop" [
	--help(-h)
	--dont-ask(-v)					# Don't ask for missing credentials
	...args
]

# Show adapter info
extern "iwctl show" [
	--help(-h)
	--dont-ask(-v)					# Don't ask for missing credentials
	...args
]

# Set property
extern "iwctl set-property" [
	--help(-h)
	--dont-ask(-v)					# Don't ask for missing credentials
	...args
]

# Start an access point based on a disk profile
extern "iwctl start-profile" [
	--help(-h)
	--dont-ask(-v)					# Don't ask for missing credentials
	...args
]

# Get network list after scanning
extern "iwctl get-networks" [
	--help(-h)
	--dont-ask(-v)					# Don't ask for missing credentials
	...args
]

# Connect to a specific BSS
extern "iwctl connect" [
	--help(-h)
	--dont-ask(-v)					# Don't ask for missing credentials
	...args
]

# Roam to a BSS
extern "iwctl roam" [
	--help(-h)
	--dont-ask(-v)					# Don't ask for missing credentials
	...args
]

# Set autoconnect property
extern "iwctl autoconnect" [
	--help(-h)
	--dont-ask(-v)					# Don't ask for missing credentials
	...args
]

# Set autoconnect property
extern "iwctl on off" [
	--help(-h)
	--dont-ask(-v)					# Don't ask for missing credentials
	...args
]

# Starts a DPP Enrollee
extern "iwctl start-enrollee" [
	--help(-h)
	--dont-ask(-v)					# Don't ask for missing credentials
	...args
]

# Starts a DPP Configurator
extern "iwctl start-configurator" [
	--help(-h)
	--dont-ask(-v)					# Don't ask for missing credentials
	...args
]

# Forget a known network
extern "iwctl forget" [
	--help(-h)
	--dont-ask(-v)					# Don't ask for missing credentials
	...args
]

# Connect to hidden network
extern "iwctl connect-hidden" [
	--help(-h)
	--dont-ask(-v)					# Don't ask for missing credentials
	...args
]

# Disconnect
extern "iwctl disconnect" [
	--help(-h)
	--dont-ask(-v)					# Don't ask for missing credentials
	...args
]

# 
extern "iwctl rssi-dbms rssi-bars" [
	--help(-h)
	--dont-ask(-v)					# Don't ask for missing credentials
	...args
]

# Get hidden APs
extern "iwctl get-hidden-access-points" [
	--help(-h)
	--dont-ask(-v)					# Don't ask for missing credentials
	...args
]

# 
extern "iwctl rssi-dbms" [
	--help(-h)
	--dont-ask(-v)					# Don't ask for missing credentials
	...args
]

# Scan for networks
extern "iwctl scan" [
	--help(-h)
	--dont-ask(-v)					# Don't ask for missing credentials
	...args
]

# PushButton Mode
extern "iwctl push-button" [
	--help(-h)
	--dont-ask(-v)					# Don't ask for missing credentials
	...args
]

# PIN mode
extern "iwctl start-user-pin" [
	--help(-h)
	--dont-ask(-v)					# Don't ask for missing credentials
	...args
]

# PIN mode with generated PIN
extern "iwctl start-pin" [
	--help(-h)
	--dont-ask(-v)					# Don't ask for missing credentials
	...args
]

# Aborts WSC operations
extern "iwctl cancel" [
	--help(-h)
	--dont-ask(-v)					# Don't ask for missing credentials
	...args
]