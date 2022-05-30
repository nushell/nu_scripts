# Show only a summary
extern "hwinfo" [
	--short					# Show only a summary
	--listmd					# Report RAID devices
	--only					# Show only entries in the device list matching DEVNAME
	--save-config					# Store config for a particular device
	--show-config					# Show saved config data
	--map					# Prints a list of disk name mappings
	--debug					# Set debug level
	--verbose					# Increase verbosity
	--log					# Write log
	--dump-db					# Dump hardware database
	--version					# Show libhd version
	--help					# Show help message
	...args
]