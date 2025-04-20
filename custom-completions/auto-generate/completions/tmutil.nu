# Add an exclusion not to back up a file
extern "tmutil addexclusion" [
	--auto(-a)					# Automatic mode
	--block(-b)					# Block until finished
	--rotation(-r)					# Automatic rotation
	...args
]

# Volume exclusion
extern "tmutil" [
	--auto(-a)					# Automatic mode
	--block(-b)					# Block until finished
	--rotation(-r)					# Automatic rotation
	...args
]

# Print information about destinations
extern "tmutil destinationinfo" [
	--auto(-a)					# Automatic mode
	--block(-b)					# Block until finished
	--rotation(-r)					# Automatic rotation
	...args
]

# Turn off automatic backups
extern "tmutil disable" [
	--auto(-a)					# Automatic mode
	--block(-b)					# Block until finished
	--rotation(-r)					# Automatic rotation
	...args
]

# Turn off local Time Machine snapshots
extern "tmutil disablelocal" [
	--auto(-a)					# Automatic mode
	--block(-b)					# Block until finished
	--rotation(-r)					# Automatic rotation
	...args
]

# Turn on automatic backups
extern "tmutil enable" [
	--auto(-a)					# Automatic mode
	--block(-b)					# Block until finished
	--rotation(-r)					# Automatic rotation
	...args
]

# Turn on local Time Machine snapshots
extern "tmutil enablelocal" [
	--auto(-a)					# Automatic mode
	--block(-b)					# Block until finished
	--rotation(-r)					# Automatic rotation
	...args
]

# Determine if a file, directory, or volume are excluded from backups
extern "tmutil isexcluded" [
	--auto(-a)					# Automatic mode
	--block(-b)					# Block until finished
	--rotation(-r)					# Automatic rotation
	...args
]

# Print the path to the latest snapshot
extern "tmutil latestbackup" [
	--auto(-a)					# Automatic mode
	--block(-b)					# Block until finished
	--rotation(-r)					# Automatic rotation
	...args
]

# List the creation dates of all local Time Machine snapshots
extern "tmutil listlocalsnapshotdates" [
	--auto(-a)					# Automatic mode
	--block(-b)					# Block until finished
	--rotation(-r)					# Automatic rotation
	...args
]

# Print paths for all snapshots
extern "tmutil listbackups" [
	--auto(-a)					# Automatic mode
	--block(-b)					# Block until finished
	--rotation(-r)					# Automatic rotation
	...args
]

# Create new local Time Machine snapshot of APFS volume in TM backup
extern "tmutil localsnapshot" [
	--auto(-a)					# Automatic mode
	--block(-b)					# Block until finished
	--rotation(-r)					# Automatic rotation
	...args
]

# Print the path to the current machine directory
extern "tmutil machinedirectory" [
	--auto(-a)					# Automatic mode
	--block(-b)					# Block until finished
	--rotation(-r)					# Automatic rotation
	...args
]

# Removes a backup destination
extern "tmutil removedestination" [
	--auto(-a)					# Automatic mode
	--block(-b)					# Block until finished
	--rotation(-r)					# Automatic rotation
	...args
]

# Remove an exclusion
extern "tmutil removeexclusion" [
	--auto(-a)					# Automatic mode
	--block(-b)					# Block until finished
	--rotation(-r)					# Automatic rotation
	...args
]

# Restore an item
extern "tmutil restore" [
	--auto(-a)					# Automatic mode
	--block(-b)					# Block until finished
	--rotation(-r)					# Automatic rotation
	...args
]

# Create new local Time Machine snapshot
extern "tmutil snapshot" [
	--auto(-a)					# Automatic mode
	--block(-b)					# Block until finished
	--rotation(-r)					# Automatic rotation
	...args
]

# Begin a backup if one is not already running
extern "tmutil startbackup" [
	--auto(-a)					# Automatic mode
	--block(-b)					# Block until finished
	--rotation(-r)					# Automatic rotation
	...args
]

# Cancel a backup currently in progress
extern "tmutil stopbackup" [
	--auto(-a)					# Automatic mode
	--block(-b)					# Block until finished
	--rotation(-r)					# Automatic rotation
	...args
]

# Print version
extern "tmutil version" [
	--auto(-a)					# Automatic mode
	--block(-b)					# Block until finished
	--rotation(-r)					# Automatic rotation
	...args
]