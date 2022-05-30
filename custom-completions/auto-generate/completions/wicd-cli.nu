# Print help and exit
extern "wicd-cli" [
	--help(-h)					# Print help and exit
	--scan(-S)					# Scan for networks
	--list-networks(-l)					# List networks
	--network-details(-d)					# Show network details
	--disconnect(-x)					# Disconnect
	--connect(-c)					# Connect
	--list-encryption-types(-e)					# List encryption types
	--wireless(-y)					# Perform operation on wireless network
	--wired(-z)					# Perform operation on wired network
	--save(-w)					# Save profile
	--load-profile(-o)					# Load profile
	--name(-m)					# Set name for profile to save/load
	--network(-n)					# Set the network
	...args
]