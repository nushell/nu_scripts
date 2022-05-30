# Add an exclusion not to back up a file
extern "tmutil addexclusion" [

	...args
]

# Volume exclusion
extern "tmutil" [

	...args
]

# Print information about destinations
extern "tmutil destinationinfo" [

	...args
]

# Turn off automatic backups
extern "tmutil disable" [

	...args
]

# Turn off local Time Machine snapshots
extern "tmutil disablelocal" [

	...args
]

# Turn on automatic backups
extern "tmutil enable" [

	...args
]

# Turn on local Time Machine snapshots
extern "tmutil enablelocal" [

	...args
]

# Determine if a file, directory, or volume are excluded from backups
extern "tmutil isexcluded" [

	...args
]

# Print the path to the latest snapshot
extern "tmutil latestbackup" [

	...args
]

# List the creation dates of all local Time Machine snapshots
extern "tmutil listlocalsnapshotdates" [

	...args
]

# Print paths for all snapshots
extern "tmutil listbackups" [

	...args
]

# Create new local Time Machine snapshot of APFS volume in TM backup
extern "tmutil localsnapshot" [

	...args
]

# Print the path to the current machine directory
extern "tmutil machinedirectory" [

	...args
]

# Removes a backup destination
extern "tmutil removedestination" [

	...args
]

# Remove an exclusion
extern "tmutil removeexclusion" [

	...args
]

# Restore an item
extern "tmutil restore" [

	...args
]

# Create new local Time Machine snapshot
extern "tmutil snapshot" [

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

	...args
]

# Print version
extern "tmutil version" [

	...args
]