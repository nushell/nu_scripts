# Display this help message
extern "btrbk" [
	--help(-h)					# Display this help message
	--version					# Display version information
	--dry-run(-n)					# Perform a trial run with no changes made
	--preserve(-p)					# Preserve all (do not delete anything)
	--preserve-snapshots					# Preserve snapshots (do not delete snapshots)
	--preserve-backups					# Preserve backups (do not delete backups)
	--wipe					# Delete all but latest snapshots
	--verbose(-v)					# Be more verbose (increase logging level)
	--quiet(-q)					# Be quiet (do not print backup summary)
	--table(-t)					# Change output to table format
	--long(-L)					# Change output to long format
	--print-schedule(-S)					# Print scheduler details (for the "run" command)
	--progress					# Show progress bar on send-receive operation
	--single-column(-1)					# Print output as a single column
	--pretty					# Print pretty table output with lowercase and underlined column headings
	--raw					# Create raw targets for archive command
	...args
]

# Run snapshot and backup operations
extern "btrbk run" [
	--help(-h)					# Display this help message
	--version					# Display version information
	--dry-run(-n)					# Perform a trial run with no changes made
	--preserve(-p)					# Preserve all (do not delete anything)
	--preserve-snapshots					# Preserve snapshots (do not delete snapshots)
	--preserve-backups					# Preserve backups (do not delete backups)
	--wipe					# Delete all but latest snapshots
	--verbose(-v)					# Be more verbose (increase logging level)
	--quiet(-q)					# Be quiet (do not print backup summary)
	--table(-t)					# Change output to table format
	--long(-L)					# Change output to long format
	--print-schedule(-S)					# Print scheduler details (for the "run" command)
	--progress					# Show progress bar on send-receive operation
	--single-column(-1)					# Print output as a single column
	--pretty					# Print pretty table output with lowercase and underlined column headings
	--raw					# Create raw targets for archive command
	...args
]

# Show what would be executed without running btrfs commands
extern "btrbk dryrun" [
	--help(-h)					# Display this help message
	--version					# Display version information
	--dry-run(-n)					# Perform a trial run with no changes made
	--preserve(-p)					# Preserve all (do not delete anything)
	--preserve-snapshots					# Preserve snapshots (do not delete snapshots)
	--preserve-backups					# Preserve backups (do not delete backups)
	--wipe					# Delete all but latest snapshots
	--verbose(-v)					# Be more verbose (increase logging level)
	--quiet(-q)					# Be quiet (do not print backup summary)
	--table(-t)					# Change output to table format
	--long(-L)					# Change output to long format
	--print-schedule(-S)					# Print scheduler details (for the "run" command)
	--progress					# Show progress bar on send-receive operation
	--single-column(-1)					# Print output as a single column
	--pretty					# Print pretty table output with lowercase and underlined column headings
	--raw					# Create raw targets for archive command
	...args
]

# Run snapshot operations only
extern "btrbk snapshot" [
	--help(-h)					# Display this help message
	--version					# Display version information
	--dry-run(-n)					# Perform a trial run with no changes made
	--preserve(-p)					# Preserve all (do not delete anything)
	--preserve-snapshots					# Preserve snapshots (do not delete snapshots)
	--preserve-backups					# Preserve backups (do not delete backups)
	--wipe					# Delete all but latest snapshots
	--verbose(-v)					# Be more verbose (increase logging level)
	--quiet(-q)					# Be quiet (do not print backup summary)
	--table(-t)					# Change output to table format
	--long(-L)					# Change output to long format
	--print-schedule(-S)					# Print scheduler details (for the "run" command)
	--progress					# Show progress bar on send-receive operation
	--single-column(-1)					# Print output as a single column
	--pretty					# Print pretty table output with lowercase and underlined column headings
	--raw					# Create raw targets for archive command
	...args
]

# Run backup operations and delete snapshots
extern "btrbk resume" [
	--help(-h)					# Display this help message
	--version					# Display version information
	--dry-run(-n)					# Perform a trial run with no changes made
	--preserve(-p)					# Preserve all (do not delete anything)
	--preserve-snapshots					# Preserve snapshots (do not delete snapshots)
	--preserve-backups					# Preserve backups (do not delete backups)
	--wipe					# Delete all but latest snapshots
	--verbose(-v)					# Be more verbose (increase logging level)
	--quiet(-q)					# Be quiet (do not print backup summary)
	--table(-t)					# Change output to table format
	--long(-L)					# Change output to long format
	--print-schedule(-S)					# Print scheduler details (for the "run" command)
	--progress					# Show progress bar on send-receive operation
	--single-column(-1)					# Print output as a single column
	--pretty					# Print pretty table output with lowercase and underlined column headings
	--raw					# Create raw targets for archive command
	...args
]

# Only delete snapshots and backups
extern "btrbk prune" [
	--help(-h)					# Display this help message
	--version					# Display version information
	--dry-run(-n)					# Perform a trial run with no changes made
	--preserve(-p)					# Preserve all (do not delete anything)
	--preserve-snapshots					# Preserve snapshots (do not delete snapshots)
	--preserve-backups					# Preserve backups (do not delete backups)
	--wipe					# Delete all but latest snapshots
	--verbose(-v)					# Be more verbose (increase logging level)
	--quiet(-q)					# Be quiet (do not print backup summary)
	--table(-t)					# Change output to table format
	--long(-L)					# Change output to long format
	--print-schedule(-S)					# Print scheduler details (for the "run" command)
	--progress					# Show progress bar on send-receive operation
	--single-column(-1)					# Print output as a single column
	--pretty					# Print pretty table output with lowercase and underlined column headings
	--raw					# Create raw targets for archive command
	...args
]

# Recursively copy all subvolumes (src -> dst)
extern "btrbk archive" [
	--help(-h)					# Display this help message
	--version					# Display version information
	--dry-run(-n)					# Perform a trial run with no changes made
	--preserve(-p)					# Preserve all (do not delete anything)
	--preserve-snapshots					# Preserve snapshots (do not delete snapshots)
	--preserve-backups					# Preserve backups (do not delete backups)
	--wipe					# Delete all but latest snapshots
	--verbose(-v)					# Be more verbose (increase logging level)
	--quiet(-q)					# Be quiet (do not print backup summary)
	--table(-t)					# Change output to table format
	--long(-L)					# Change output to long format
	--print-schedule(-S)					# Print scheduler details (for the "run" command)
	--progress					# Show progress bar on send-receive operation
	--single-column(-1)					# Print output as a single column
	--pretty					# Print pretty table output with lowercase and underlined column headings
	--raw					# Create raw targets for archive command
	...args
]

# Delete incomplete (garbled) backups
extern "btrbk clean" [
	--help(-h)					# Display this help message
	--version					# Display version information
	--dry-run(-n)					# Perform a trial run with no changes made
	--preserve(-p)					# Preserve all (do not delete anything)
	--preserve-snapshots					# Preserve snapshots (do not delete snapshots)
	--preserve-backups					# Preserve backups (do not delete backups)
	--wipe					# Delete all but latest snapshots
	--verbose(-v)					# Be more verbose (increase logging level)
	--quiet(-q)					# Be quiet (do not print backup summary)
	--table(-t)					# Change output to table format
	--long(-L)					# Change output to long format
	--print-schedule(-S)					# Print scheduler details (for the "run" command)
	--progress					# Show progress bar on send-receive operation
	--single-column(-1)					# Print output as a single column
	--pretty					# Print pretty table output with lowercase and underlined column headings
	--raw					# Create raw targets for archive command
	...args
]

# Print snapshot/backup statistics
extern "btrbk stats" [
	--help(-h)					# Display this help message
	--version					# Display version information
	--dry-run(-n)					# Perform a trial run with no changes made
	--preserve(-p)					# Preserve all (do not delete anything)
	--preserve-snapshots					# Preserve snapshots (do not delete snapshots)
	--preserve-backups					# Preserve backups (do not delete backups)
	--wipe					# Delete all but latest snapshots
	--verbose(-v)					# Be more verbose (increase logging level)
	--quiet(-q)					# Be quiet (do not print backup summary)
	--table(-t)					# Change output to table format
	--long(-L)					# Change output to long format
	--print-schedule(-S)					# Print scheduler details (for the "run" command)
	--progress					# Show progress bar on send-receive operation
	--single-column(-1)					# Print output as a single column
	--pretty					# Print pretty table output with lowercase and underlined column headings
	--raw					# Create raw targets for archive command
	...args
]

# Print filesystem usage
extern "btrbk usage" [
	--help(-h)					# Display this help message
	--version					# Display version information
	--dry-run(-n)					# Perform a trial run with no changes made
	--preserve(-p)					# Preserve all (do not delete anything)
	--preserve-snapshots					# Preserve snapshots (do not delete snapshots)
	--preserve-backups					# Preserve backups (do not delete backups)
	--wipe					# Delete all but latest snapshots
	--verbose(-v)					# Be more verbose (increase logging level)
	--quiet(-q)					# Be quiet (do not print backup summary)
	--table(-t)					# Change output to table format
	--long(-L)					# Change output to long format
	--print-schedule(-S)					# Print scheduler details (for the "run" command)
	--progress					# Show progress bar on send-receive operation
	--single-column(-1)					# Print output as a single column
	--pretty					# Print pretty table output with lowercase and underlined column headings
	--raw					# Create raw targets for archive command
	...args
]

# List all btrfs subvolumes below a given path
extern "btrbk ls" [
	--help(-h)					# Display this help message
	--version					# Display version information
	--dry-run(-n)					# Perform a trial run with no changes made
	--preserve(-p)					# Preserve all (do not delete anything)
	--preserve-snapshots					# Preserve snapshots (do not delete snapshots)
	--preserve-backups					# Preserve backups (do not delete backups)
	--wipe					# Delete all but latest snapshots
	--verbose(-v)					# Be more verbose (increase logging level)
	--quiet(-q)					# Be quiet (do not print backup summary)
	--table(-t)					# Change output to table format
	--long(-L)					# Change output to long format
	--print-schedule(-S)					# Print scheduler details (for the "run" command)
	--progress					# Show progress bar on send-receive operation
	--single-column(-1)					# Print output as a single column
	--pretty					# Print pretty table output with lowercase and underlined column headings
	--raw					# Create raw targets for archive command
	...args
]

# Print origin information for a subvolume
extern "btrbk origin" [
	--help(-h)					# Display this help message
	--version					# Display version information
	--dry-run(-n)					# Perform a trial run with no changes made
	--preserve(-p)					# Preserve all (do not delete anything)
	--preserve-snapshots					# Preserve snapshots (do not delete snapshots)
	--preserve-backups					# Preserve backups (do not delete backups)
	--wipe					# Delete all but latest snapshots
	--verbose(-v)					# Be more verbose (increase logging level)
	--quiet(-q)					# Be quiet (do not print backup summary)
	--table(-t)					# Change output to table format
	--long(-L)					# Change output to long format
	--print-schedule(-S)					# Print scheduler details (for the "run" command)
	--progress					# Show progress bar on send-receive operation
	--single-column(-1)					# Print output as a single column
	--pretty					# Print pretty table output with lowercase and underlined column headings
	--raw					# Create raw targets for archive command
	...args
]

# List file changes between related subvolumes
extern "btrbk diff" [
	--help(-h)					# Display this help message
	--version					# Display version information
	--dry-run(-n)					# Perform a trial run with no changes made
	--preserve(-p)					# Preserve all (do not delete anything)
	--preserve-snapshots					# Preserve snapshots (do not delete snapshots)
	--preserve-backups					# Preserve backups (do not delete backups)
	--wipe					# Delete all but latest snapshots
	--verbose(-v)					# Be more verbose (increase logging level)
	--quiet(-q)					# Be quiet (do not print backup summary)
	--table(-t)					# Change output to table format
	--long(-L)					# Change output to long format
	--print-schedule(-S)					# Print scheduler details (for the "run" command)
	--progress					# Show progress bar on send-receive operation
	--single-column(-1)					# Print output as a single column
	--pretty					# Print pretty table output with lowercase and underlined column headings
	--raw					# Create raw targets for archive command
	...args
]

# Calculate accurate disk space usage for a path
extern "btrbk extents" [
	--help(-h)					# Display this help message
	--version					# Display version information
	--dry-run(-n)					# Perform a trial run with no changes made
	--preserve(-p)					# Preserve all (do not delete anything)
	--preserve-snapshots					# Preserve snapshots (do not delete snapshots)
	--preserve-backups					# Preserve backups (do not delete backups)
	--wipe					# Delete all but latest snapshots
	--verbose(-v)					# Be more verbose (increase logging level)
	--quiet(-q)					# Be quiet (do not print backup summary)
	--table(-t)					# Change output to table format
	--long(-L)					# Change output to long format
	--print-schedule(-S)					# Print scheduler details (for the "run" command)
	--progress					# Show progress bar on send-receive operation
	--single-column(-1)					# Print output as a single column
	--pretty					# Print pretty table output with lowercase and underlined column headings
	--raw					# Create raw targets for archive command
	...args
]

# List snapshots and backups
extern "btrbk list" [
	--help(-h)					# Display this help message
	--version					# Display version information
	--dry-run(-n)					# Perform a trial run with no changes made
	--preserve(-p)					# Preserve all (do not delete anything)
	--preserve-snapshots					# Preserve snapshots (do not delete snapshots)
	--preserve-backups					# Preserve backups (do not delete backups)
	--wipe					# Delete all but latest snapshots
	--verbose(-v)					# Be more verbose (increase logging level)
	--quiet(-q)					# Be quiet (do not print backup summary)
	--table(-t)					# Change output to table format
	--long(-L)					# Change output to long format
	--print-schedule(-S)					# Print scheduler details (for the "run" command)
	--progress					# Show progress bar on send-receive operation
	--single-column(-1)					# Print output as a single column
	--pretty					# Print pretty table output with lowercase and underlined column headings
	--raw					# Create raw targets for archive command
	...args
]

# List all snapshots and backups
extern "btrbk all" [
	--help(-h)					# Display this help message
	--version					# Display version information
	--dry-run(-n)					# Perform a trial run with no changes made
	--preserve(-p)					# Preserve all (do not delete anything)
	--preserve-snapshots					# Preserve snapshots (do not delete snapshots)
	--preserve-backups					# Preserve backups (do not delete backups)
	--wipe					# Delete all but latest snapshots
	--verbose(-v)					# Be more verbose (increase logging level)
	--quiet(-q)					# Be quiet (do not print backup summary)
	--table(-t)					# Change output to table format
	--long(-L)					# Change output to long format
	--print-schedule(-S)					# Print scheduler details (for the "run" command)
	--progress					# Show progress bar on send-receive operation
	--single-column(-1)					# Print output as a single column
	--pretty					# Print pretty table output with lowercase and underlined column headings
	--raw					# Create raw targets for archive command
	...args
]

# List snapshots only
extern "btrbk snapshots" [
	--help(-h)					# Display this help message
	--version					# Display version information
	--dry-run(-n)					# Perform a trial run with no changes made
	--preserve(-p)					# Preserve all (do not delete anything)
	--preserve-snapshots					# Preserve snapshots (do not delete snapshots)
	--preserve-backups					# Preserve backups (do not delete backups)
	--wipe					# Delete all but latest snapshots
	--verbose(-v)					# Be more verbose (increase logging level)
	--quiet(-q)					# Be quiet (do not print backup summary)
	--table(-t)					# Change output to table format
	--long(-L)					# Change output to long format
	--print-schedule(-S)					# Print scheduler details (for the "run" command)
	--progress					# Show progress bar on send-receive operation
	--single-column(-1)					# Print output as a single column
	--pretty					# Print pretty table output with lowercase and underlined column headings
	--raw					# Create raw targets for archive command
	...args
]

# List backups and correlated snapshots
extern "btrbk backups" [
	--help(-h)					# Display this help message
	--version					# Display version information
	--dry-run(-n)					# Perform a trial run with no changes made
	--preserve(-p)					# Preserve all (do not delete anything)
	--preserve-snapshots					# Preserve snapshots (do not delete snapshots)
	--preserve-backups					# Preserve backups (do not delete backups)
	--wipe					# Delete all but latest snapshots
	--verbose(-v)					# Be more verbose (increase logging level)
	--quiet(-q)					# Be quiet (do not print backup summary)
	--table(-t)					# Change output to table format
	--long(-L)					# Change output to long format
	--print-schedule(-S)					# Print scheduler details (for the "run" command)
	--progress					# Show progress bar on send-receive operation
	--single-column(-1)					# Print output as a single column
	--pretty					# Print pretty table output with lowercase and underlined column headings
	--raw					# Create raw targets for archive command
	...args
]

# List most recent snapshots and backups
extern "btrbk latest" [
	--help(-h)					# Display this help message
	--version					# Display version information
	--dry-run(-n)					# Perform a trial run with no changes made
	--preserve(-p)					# Preserve all (do not delete anything)
	--preserve-snapshots					# Preserve snapshots (do not delete snapshots)
	--preserve-backups					# Preserve backups (do not delete backups)
	--wipe					# Delete all but latest snapshots
	--verbose(-v)					# Be more verbose (increase logging level)
	--quiet(-q)					# Be quiet (do not print backup summary)
	--table(-t)					# Change output to table format
	--long(-L)					# Change output to long format
	--print-schedule(-S)					# Print scheduler details (for the "run" command)
	--progress					# Show progress bar on send-receive operation
	--single-column(-1)					# Print output as a single column
	--pretty					# Print pretty table output with lowercase and underlined column headings
	--raw					# Create raw targets for archive command
	...args
]

# List configured source/snapshot/target relations
extern "btrbk config" [
	--help(-h)					# Display this help message
	--version					# Display version information
	--dry-run(-n)					# Perform a trial run with no changes made
	--preserve(-p)					# Preserve all (do not delete anything)
	--preserve-snapshots					# Preserve snapshots (do not delete snapshots)
	--preserve-backups					# Preserve backups (do not delete backups)
	--wipe					# Delete all but latest snapshots
	--verbose(-v)					# Be more verbose (increase logging level)
	--quiet(-q)					# Be quiet (do not print backup summary)
	--table(-t)					# Change output to table format
	--long(-L)					# Change output to long format
	--print-schedule(-S)					# Print scheduler details (for the "run" command)
	--progress					# Show progress bar on send-receive operation
	--single-column(-1)					# Print output as a single column
	--pretty					# Print pretty table output with lowercase and underlined column headings
	--raw					# Create raw targets for archive command
	...args
]

# List configured source/snapshot relations
extern "btrbk source" [
	--help(-h)					# Display this help message
	--version					# Display version information
	--dry-run(-n)					# Perform a trial run with no changes made
	--preserve(-p)					# Preserve all (do not delete anything)
	--preserve-snapshots					# Preserve snapshots (do not delete snapshots)
	--preserve-backups					# Preserve backups (do not delete backups)
	--wipe					# Delete all but latest snapshots
	--verbose(-v)					# Be more verbose (increase logging level)
	--quiet(-q)					# Be quiet (do not print backup summary)
	--table(-t)					# Change output to table format
	--long(-L)					# Change output to long format
	--print-schedule(-S)					# Print scheduler details (for the "run" command)
	--progress					# Show progress bar on send-receive operation
	--single-column(-1)					# Print output as a single column
	--pretty					# Print pretty table output with lowercase and underlined column headings
	--raw					# Create raw targets for archive command
	...args
]

# List configured volume sections
extern "btrbk volume" [
	--help(-h)					# Display this help message
	--version					# Display version information
	--dry-run(-n)					# Perform a trial run with no changes made
	--preserve(-p)					# Preserve all (do not delete anything)
	--preserve-snapshots					# Preserve snapshots (do not delete snapshots)
	--preserve-backups					# Preserve backups (do not delete backups)
	--wipe					# Delete all but latest snapshots
	--verbose(-v)					# Be more verbose (increase logging level)
	--quiet(-q)					# Be quiet (do not print backup summary)
	--table(-t)					# Change output to table format
	--long(-L)					# Change output to long format
	--print-schedule(-S)					# Print scheduler details (for the "run" command)
	--progress					# Show progress bar on send-receive operation
	--single-column(-1)					# Print output as a single column
	--pretty					# Print pretty table output with lowercase and underlined column headings
	--raw					# Create raw targets for archive command
	...args
]

# List configured targets
extern "btrbk target" [
	--help(-h)					# Display this help message
	--version					# Display version information
	--dry-run(-n)					# Perform a trial run with no changes made
	--preserve(-p)					# Preserve all (do not delete anything)
	--preserve-snapshots					# Preserve snapshots (do not delete snapshots)
	--preserve-backups					# Preserve backups (do not delete backups)
	--wipe					# Delete all but latest snapshots
	--verbose(-v)					# Be more verbose (increase logging level)
	--quiet(-q)					# Be quiet (do not print backup summary)
	--table(-t)					# Change output to table format
	--long(-L)					# Change output to long format
	--print-schedule(-S)					# Print scheduler details (for the "run" command)
	--progress					# Show progress bar on send-receive operation
	--single-column(-1)					# Print output as a single column
	--pretty					# Print pretty table output with lowercase and underlined column headings
	--raw					# Create raw targets for archive command
	...args
]