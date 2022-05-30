# List all devices
extern "kdeconnect-cli" [
	--list-devices(-l)					# List all devices
	--list-available(-a)					# List available (paired and reachable) devices
	--id-only					# Make --list-devices or --list-available print the devices id, to ease scripting
	--refresh					# Search for devices in the network and re-establish connections
	--pair					# Request pairing to a said device
	--ring					# Find the said device by ringing it.
	--unpair					# Stop pairing to a said device
	--ping					# Sends a ping to said device
	--list-notifications					# Display the notifications on a said device
	--lock					# Lock the specified device
	--destination
	--encryption-info					# Get encryption info about said device
	--list-commands					# Lists remote commands and their ids
	--help(-h)					# Displays this help.
	--version(-v)					# Displays version information.
	--author					# Show author information.
	--license					# Show license information.
	--desktopfile
	...args
]