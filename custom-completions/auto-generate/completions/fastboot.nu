# Show this message
extern "fastboot" [
	--help(-h)					# Show this message
	--verbose(-v)					# Verbose output
	--version					# Display version
	--slot					# Use SLOT; \'all\' for both slots, \'other\' for non-current slot (default: current active slot)
	--set-active					# Sets the active slot before rebooting
	--skip-reboot					# Don\'t
	--disable-verity					# Sets disable-verity when flashing vbmeta
	--disable-verification					# Sets disable-verification when flashing vbmeta
	--force					# Force a flash operation that may be unsafe
	...args
]

# Flash all partitions from $ANDROID_PRODUCT_OUT
extern "fastboot flashall" [
	--help(-h)					# Show this message
	--verbose(-v)					# Verbose output
	--version					# Display version
	--slot					# Use SLOT; \'all\' for both slots, \'other\' for non-current slot (default: current active slot)
	--set-active					# Sets the active slot before rebooting
	--skip-reboot					# Don\'t
	--disable-verity					# Sets disable-verity when flashing vbmeta
	--disable-verification					# Sets disable-verification when flashing vbmeta
	--force					# Force a flash operation that may be unsafe
	...args
]

# Display given bootloader variable
extern "fastboot getvar" [
	--help(-h)					# Show this message
	--verbose(-v)					# Verbose output
	--version					# Display version
	--slot					# Use SLOT; \'all\' for both slots, \'other\' for non-current slot (default: current active slot)
	--set-active					# Sets the active slot before rebooting
	--skip-reboot					# Don\'t
	--disable-verity					# Sets disable-verity when flashing vbmeta
	--disable-verification					# Sets disable-verification when flashing vbmeta
	--force					# Force a flash operation that may be unsafe
	...args
]

# Execute OEM-specific command
extern "fastboot oem" [
	--help(-h)					# Show this message
	--verbose(-v)					# Verbose output
	--version					# Display version
	--slot					# Use SLOT; \'all\' for both slots, \'other\' for non-current slot (default: current active slot)
	--set-active					# Sets the active slot before rebooting
	--skip-reboot					# Don\'t
	--disable-verity					# Sets disable-verity when flashing vbmeta
	--disable-verification					# Sets disable-verification when flashing vbmeta
	--force					# Force a flash operation that may be unsafe
	...args
]

# Lock/unlock
extern "fastboot flashing" [
	--help(-h)					# Show this message
	--verbose(-v)					# Verbose output
	--version					# Display version
	--slot					# Use SLOT; \'all\' for both slots, \'other\' for non-current slot (default: current active slot)
	--set-active					# Sets the active slot before rebooting
	--skip-reboot					# Don\'t
	--disable-verity					# Sets disable-verity when flashing vbmeta
	--disable-verification					# Sets disable-verification when flashing vbmeta
	--force					# Force a flash operation that may be unsafe
	...args
]

# Reboot device
extern "fastboot reboot" [
	--help(-h)					# Show this message
	--verbose(-v)					# Verbose output
	--version					# Display version
	--slot					# Use SLOT; \'all\' for both slots, \'other\' for non-current slot (default: current active slot)
	--set-active					# Sets the active slot before rebooting
	--skip-reboot					# Don\'t
	--disable-verity					# Sets disable-verity when flashing vbmeta
	--disable-verification					# Sets disable-verification when flashing vbmeta
	--force					# Force a flash operation that may be unsafe
	...args
]

# Flash all partitions from an update.zip package
extern "fastboot update" [
	--help(-h)					# Show this message
	--verbose(-v)					# Verbose output
	--version					# Display version
	--slot					# Use SLOT; \'all\' for both slots, \'other\' for non-current slot (default: current active slot)
	--set-active					# Sets the active slot before rebooting
	--skip-reboot					# Don\'t
	--disable-verity					# Sets disable-verity when flashing vbmeta
	--disable-verification					# Sets disable-verification when flashing vbmeta
	--force					# Force a flash operation that may be unsafe
	...args
]

# Erase a flash partition
extern "fastboot erase" [
	--help(-h)					# Show this message
	--verbose(-v)					# Verbose output
	--version					# Display version
	--slot					# Use SLOT; \'all\' for both slots, \'other\' for non-current slot (default: current active slot)
	--set-active					# Sets the active slot before rebooting
	--skip-reboot					# Don\'t
	--disable-verity					# Sets disable-verity when flashing vbmeta
	--disable-verification					# Sets disable-verification when flashing vbmeta
	--force					# Force a flash operation that may be unsafe
	...args
]

# Format a flash partition
extern "fastboot format" [
	--help(-h)					# Show this message
	--verbose(-v)					# Verbose output
	--version					# Display version
	--slot					# Use SLOT; \'all\' for both slots, \'other\' for non-current slot (default: current active slot)
	--set-active					# Sets the active slot before rebooting
	--skip-reboot					# Don\'t
	--disable-verity					# Sets disable-verity when flashing vbmeta
	--disable-verification					# Sets disable-verification when flashing vbmeta
	--force					# Force a flash operation that may be unsafe
	...args
]

# List devices in bootloader
extern "fastboot devices" [
	--help(-h)					# Show this message
	--verbose(-v)					# Verbose output
	--version					# Display version
	--slot					# Use SLOT; \'all\' for both slots, \'other\' for non-current slot (default: current active slot)
	--set-active					# Sets the active slot before rebooting
	--skip-reboot					# Don\'t
	--disable-verity					# Sets disable-verity when flashing vbmeta
	--disable-verification					# Sets disable-verification when flashing vbmeta
	--force					# Force a flash operation that may be unsafe
	...args
]

# Flash given partition
extern "fastboot flash" [
	--help(-h)					# Show this message
	--verbose(-v)					# Verbose output
	--version					# Display version
	--slot					# Use SLOT; \'all\' for both slots, \'other\' for non-current slot (default: current active slot)
	--set-active					# Sets the active slot before rebooting
	--skip-reboot					# Don\'t
	--disable-verity					# Sets disable-verity when flashing vbmeta
	--disable-verification					# Sets disable-verification when flashing vbmeta
	--force					# Force a flash operation that may be unsafe
	...args
]

# Show help message
extern "fastboot help" [
	--help(-h)					# Show this message
	--verbose(-v)					# Verbose output
	--version					# Display version
	--slot					# Use SLOT; \'all\' for both slots, \'other\' for non-current slot (default: current active slot)
	--set-active					# Sets the active slot before rebooting
	--skip-reboot					# Don\'t
	--disable-verity					# Sets disable-verity when flashing vbmeta
	--disable-verification					# Sets disable-verification when flashing vbmeta
	--force					# Force a flash operation that may be unsafe
	...args
]

# Sends given file to stage for the next command
extern "fastboot stage" [
	--help(-h)					# Show this message
	--verbose(-v)					# Verbose output
	--version					# Display version
	--slot					# Use SLOT; \'all\' for both slots, \'other\' for non-current slot (default: current active slot)
	--set-active					# Sets the active slot before rebooting
	--skip-reboot					# Don\'t
	--disable-verity					# Sets disable-verity when flashing vbmeta
	--disable-verification					# Sets disable-verification when flashing vbmeta
	--force					# Force a flash operation that may be unsafe
	...args
]

# Writes data staged by the last command to a file
extern "fastboot get_staged" [
	--help(-h)					# Show this message
	--verbose(-v)					# Verbose output
	--version					# Display version
	--slot					# Use SLOT; \'all\' for both slots, \'other\' for non-current slot (default: current active slot)
	--set-active					# Sets the active slot before rebooting
	--skip-reboot					# Don\'t
	--disable-verity					# Sets disable-verity when flashing vbmeta
	--disable-verification					# Sets disable-verification when flashing vbmeta
	--force					# Force a flash operation that may be unsafe
	...args
]

# Fetch a partition image from the device
extern "fastboot fetch" [
	--help(-h)					# Show this message
	--verbose(-v)					# Verbose output
	--version					# Display version
	--slot					# Use SLOT; \'all\' for both slots, \'other\' for non-current slot (default: current active slot)
	--set-active					# Sets the active slot before rebooting
	--skip-reboot					# Don\'t
	--disable-verity					# Sets disable-verity when flashing vbmeta
	--disable-verification					# Sets disable-verification when flashing vbmeta
	--force					# Force a flash operation that may be unsafe
	...args
]

# Download and boot kernel from RAM
extern "fastboot boot" [
	--help(-h)					# Show this message
	--verbose(-v)					# Verbose output
	--version					# Display version
	--slot					# Use SLOT; \'all\' for both slots, \'other\' for non-current slot (default: current active slot)
	--set-active					# Sets the active slot before rebooting
	--skip-reboot					# Don\'t
	--disable-verity					# Sets disable-verity when flashing vbmeta
	--disable-verification					# Sets disable-verification when flashing vbmeta
	--force					# Force a flash operation that may be unsafe
	...args
]

# 
extern "fastboot lock unlock lock_critical unlock_critical get_unlock_ability" [
	--help(-h)					# Show this message
	--verbose(-v)					# Verbose output
	--version					# Display version
	--slot					# Use SLOT; \'all\' for both slots, \'other\' for non-current slot (default: current active slot)
	--set-active					# Sets the active slot before rebooting
	--skip-reboot					# Don\'t
	--disable-verity					# Sets disable-verity when flashing vbmeta
	--disable-verification					# Sets disable-verification when flashing vbmeta
	--force					# Force a flash operation that may be unsafe
	...args
]