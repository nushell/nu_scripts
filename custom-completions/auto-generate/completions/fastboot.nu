# Show this message
extern "fastboot" [

	...args
]

# Flash all partitions from $ANDROID_PRODUCT_OUT
extern "fastboot flashall" [

	...args
]

# Display given bootloader variable
extern "fastboot getvar" [

	...args
]

# Execute OEM-specific command
extern "fastboot oem" [

	...args
]

# Lock/unlock
extern "fastboot flashing" [

	...args
]

# Reboot device
extern "fastboot reboot" [

	...args
]

# Flash all partitions from an update.zip package
extern "fastboot update" [

	...args
]

# Erase a flash partition
extern "fastboot erase" [

	...args
]

# Format a flash partition
extern "fastboot format" [

	...args
]

# List devices in bootloader
extern "fastboot devices" [

	...args
]

# Flash given partition
extern "fastboot flash" [
	--skip-secondary					# Dont flash secondary slots in flashall/update
	--skip-reboot					# Dont reboot device after flashing
	--disable-verity					# Sets disable-verity when flashing vbmeta
	--disable-verification					# Sets disable-verification when flashing vbmeta
	--force					# Force a flash operation that may be unsafe
	...args
]

# Show help message
extern "fastboot help" [

	...args
]

# Sends given file to stage for the next command
extern "fastboot stage" [

	...args
]

# Writes data staged by the last command to a file
extern "fastboot get_staged" [

	...args
]

# Fetch a partition image from the device
extern "fastboot fetch" [

	...args
]

# Download and boot kernel from RAM
extern "fastboot boot" [

	...args
]

# 
extern "fastboot lock unlock lock_critical unlock_critical get_unlock_ability" [

	...args
]