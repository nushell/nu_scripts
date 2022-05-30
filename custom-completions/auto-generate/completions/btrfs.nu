# Display help information
extern "btrfs" [

	...args
]

# Check structural integrity of a filesystem (unmounted).
extern "btrfs check" [
	--super(-s)					# Use this SUPERBLOCK copy
	--backup(-b)					# Use the first valid BACKUP root copy
	--tree-root(-r)					# Use the given bytenr for the TREE root
	--chunk-root					# Use the given bytenr for the CHUNK-TREE root
	--readonly					# Run in read-only mode
	--repair					# Try to repair the filesystem
	--force					# Skip mount checks, repair is not possible
	--mode					# Allows choice of memory/IO trade-offs
	--init-csum-tree					# Create a new CRC tree (repair only)
	--init-extent-tree					# Create a new extent tree (repair only)
	--clear-space-cache					# clear space cache (repair only)
	--check-data-csum					# Verify checksums of data blocks
	--qgroup-report(-Q)					# Print a report on qgroup consistency
	--subvol-extents(-E)					# Print subvolume extents and sharing state
	--progress(-p)					# Indicate progress
	...args
]

# Try to restore files from a damaged filesystem (unmounted)
extern "btrfs restore" [
	--snapshots(-s)					# Get snapshots
	--xattr(-x)					# Restore extended attributes
	--metadata(-m)					# Restore owner, mode and times
	--symlink(-S)					# Restore symbolic links
	--verbose(-v)					# Verbose
	--ignore-errors(-i)					# Ignore errors
	--overwrite(-o)					# Overwrite
	--super(-u)					# Super mirror
	--root(-r)					# Root objectid
	--list-roots(-l)					# List tree roots
	--dry-run(-D)					# Only list files that would be recovered
	--path-regex					# Restore only filenames matching regex
	...args
]

# Send the subvolume(s) to stdout.
extern "btrfs send" [
	--no-data					# send in NO_FILE_DATA mode
	--verbose(-v)					# Enable verbose output to stderr
	--quiet(-q)					# Suppress all messages, except errors
	...args
]

# Receive subvolumes from a stream
extern "btrfs receive" [
	--quiet(-q)					# Suppress all messages, except errors
	--chroot(-C)					# Confine the process to <mount> using chroot
	--max-errors(-E)					# Terminate when NUMBER errors occur
	--dump					# Dump stream metadata
	...args
]

# Display help information
extern "btrfs help" [
	--full					# Display detailed help on every command
	--box					# Show list of built-in tools (busybox style)
	...args
]

# Display btrfs-progs version
extern "btrfs version" [

	...args
]

# manage subvolumes: create, delete, list, etc
extern "btrfs subvolume" [
	--commit-after(-c)					# Wait for transaction commit at the end of the operation
	--commit-each(-C)					# Wait for transaction commit after deleting each subvolume
	--verbose(-v)					# Verbose output of operations
	--sort					# List the subvolume in order
	--rootid(-r)					# Show rootid of the subvolume
	--uuid(-u)					# Show uuid of the subvolume
	--raw(-b)					# Show raw numbers in bytes
	--human-readable(-h)					# Show human friendly numbers, base 1024
	--iec					# Use 1024 as a base (KiB, MiB, GiB, TiB)
	--si					# Use 1000 as a base (kB, MB, GB, TB)
	--kbytes(-k)					# Show sizes in KiB, or kB with --si
	--mbytes(-m)					# Show sizes in MiB, or MB with --si
	--gbytes(-g)					# Show sizes in GiB, or GB with --si
	--tbytes(-t)					# Show sizes in TiB, or TB with --si
	...args
]

# overall filesystem tasks and information
extern "btrfs filesystem" [
	--raw(-b)					# Show raw numbers in bytes
	--human-readable(-h)					# Show human friendly numbers, base 1024
	--iec					# Use 1024 as a base (KiB, MiB, GiB, TiB)
	--si					# Use 1000 as a base (kB, MB, GB, TB)
	--kbytes(-k)					# Show sizes in KiB, or kB with --si
	--mbytes(-m)					# Show sizes in MiB, or MB with --si
	--gbytes(-g)					# Show sizes in GiB, or GB with --si
	--tbytes(-t)					# Show sizes in TiB, or TB with --si
	--summarize(-s)					# Display only a total for each argument
	--raw					# Show raw numbers in bytes
	--human-readable					# Show human friendly numbers, base 1024
	--iec					# Use 1024 as a base (KiB, MiB, GiB, TiB)
	--si					# Use 1000 as a base (kB, MB, GB, TB)
	--kbytes					# Show sizes in KiB, or kB with --si
	--mbytes					# Show sizes in MiB, or MB with --si
	--gbytes					# Show sizes in GiB, or GB with --si
	--tbytes					# Show sizes in TiB, or TB with --si
	--all-devices(-d)					# Show only disks under /dev containing btrfs filesystem
	--mounted(-m)					# Show only mounted btrfs
	--raw					# Show raw numbers in bytes
	--human-readable					# Show human friendly numbers, base 1024
	--iec					# Use 1024 as a base (KiB, MiB, GiB, TiB)
	--si					# Use 1000 as a base (kB, MB, GB, TB)
	--kbytes					# Show sizes in KiB, or kB with --si
	--mbytes					# Show sizes in MiB, or MB with --si
	--gbytes					# Show sizes in GiB, or GB with --si
	--tbytes					# Show sizes in TiB, or TB with --si
	--raw(-b)					# Show raw numbers in bytes
	--human-readable(-h)					# Show human friendly numbers, base 1024
	--iec					# Use 1024 as a base (KiB, MiB, GiB, TiB)
	--si					# Use 1000 as a base (kB, MB, GB, TB)
	--kbytes(-k)					# Show sizes in KiB, or kB with --si
	--mbytes(-m)					# Show sizes in MiB, or MB with --si
	--gbytes(-g)					# Show sizes in GiB, or GB with --si
	--tbytes(-t)					# Show sizes in TiB, or TB with --si
	...args
]

# balance data across devices, or change block groups using filters
extern "btrfs balance" [
	--full-balance					# Do not print warning and do not delay start
	--bg					# Run the balance as a background process
	...args
]

# manage and query devices in the filesystem
extern "btrfs device" [
	--nodiscard(-K)					# Do not perform TRIM on DEVICES
	--force(-f)					# Force overwrite existing filesystem on the disk
	--all-devices(-d)					# Enumerate and register all devices
	--forget(-u)					# Unregister a given device or all stale devices
	--check(-c)					# Return non-zero if any stat counter is not zero
	--reset(-z)					# Show current stats and reset values to zero
	--raw(-b)					# Show raw numbers in bytes
	--human-readable(-h)					# Show human friendly numbers, base 1024
	--iec					# Use 1024 as a base (KiB, MiB, GiB, TiB)
	--si					# Use 1000 as a base (kB, MB, GB, TB)
	--kbytes(-k)					# Show sizes in KiB, or kB with --si
	--mbytes(-m)					# Show sizes in MiB, or MB with --si
	--gbytes(-g)					# Show sizes in GiB, or GB with --si
	--tbytes(-t)					# Show sizes in TiB, or TB with --si
	...args
]

# verify checksums of data and metadata
extern "btrfs scrub" [

	...args
]

# toolbox for specific rescue operations
extern "btrfs rescue" [

	...args
]

# query various internal information
extern "btrfs inspect-internal" [
	--id					# Specify the DEVICE-ID to query
	--extents(-e)					# Print only extent info: extent and device trees
	--device(-d)					# Print only device info: tree root, chunk and device trees
	--roots(-r)					# Print only short root node info
	--backups(-R)					# Print short root node info and backup root info
	--uuid(-u)					# Print only the uuid tree
	--block(-b)					# Print info from the specified BLOCK only
	--tree(-t)					# Print only tree with the given ID
	--follow					# Use with -b, to show all children tree blocks of <block_num>
	--noscan					# Do not scan the devices from the filesystem
	--bfs					# Breadth-first traversal of the trees, print nodes, then leaves
	--dfs					# Depth-first traversal of the trees
	--full(-f)					# Print full superblock information, backup roots etc.
	--all(-a)					# Print information about all superblocks
	--super(-s)					# Specify which SUPER-BLOCK copy to print out
	--force(-F)					# Attempt to dump superblocks with bad magic
	--bytenr					# Specify alternate superblock OFFSET
	...args
]

# modify properties of filesystem objects
extern "btrfs property" [

	...args
]

# manage filesystem quota settings
extern "btrfs quota" [

	...args
]

# manage quota groups
extern "btrfs qgroup" [
	--rescan					# Schedule qutoa rescan if needed
	--no-rescan					# Dont schedule quota rescan
	--raw					# Show raw numbers in bytes
	--human-readable					# Show human friendly numbers, base 1024
	--iec					# Use 1024 as a base (KiB, MiB, GiB, TiB)
	--si					# Use 1000 as a base (kB, MB, GB, TB)
	--kbytes					# Show sizes in KiB, or kB with --si
	--mbytes					# Show sizes in MiB, or MB with --si
	--gbytes					# Show sizes in GiB, or GB with --si
	--tbytes					# Show sizes in TiB, or TB with --si
	--sort					# List qgroups sorted by specified items
	--sync					# Force sync of the filesystem before getting info
	...args
]

# replace a device in the filesystem
extern "btrfs replace" [

	...args
]

# Create a subvolume
extern "btrfs create" [

	...args
]

# Delete subvolume(s)
extern "btrfs delete" [
	--commit-after(-c)					# Wait for transaction commit at the end of the operation
	--commit-each(-C)					# Wait for transaction commit after deleting each subvolume
	--verbose(-v)					# Verbose output of operations
	...args
]

# List subvolumes and snapshots in the filesystem.
extern "btrfs list" [
	--sort					# List the subvolume in order
	...args
]

# Create a snapshot of the subvolume
extern "btrfs snapshot" [

	...args
]

# Get the default subvolume of a filesystem
extern "btrfs get-default" [

	...args
]

# Set the default subvolume of the filesystem mounted as default.
extern "btrfs set-default" [

	...args
]

# List the recently modified files in a filesystem
extern "btrfs find-new" [

	...args
]

# Show more information about the subvolume
extern "btrfs show" [
	--rootid(-r)					# Show rootid of the subvolume
	--uuid(-u)					# Show uuid of the subvolume
	--raw(-b)					# Show raw numbers in bytes
	--human-readable(-h)					# Show human friendly numbers, base 1024
	--iec					# Use 1024 as a base (KiB, MiB, GiB, TiB)
	--si					# Use 1000 as a base (kB, MB, GB, TB)
	--kbytes(-k)					# Show sizes in KiB, or kB with --si
	--mbytes(-m)					# Show sizes in MiB, or MB with --si
	--gbytes(-g)					# Show sizes in GiB, or GB with --si
	--tbytes(-t)					# Show sizes in TiB, or TB with --si
	--all-devices(-d)					# Show only disks under /dev containing btrfs filesystem
	--mounted(-m)					# Show only mounted btrfs
	--raw					# Show raw numbers in bytes
	--human-readable					# Show human friendly numbers, base 1024
	--iec					# Use 1024 as a base (KiB, MiB, GiB, TiB)
	--si					# Use 1000 as a base (kB, MB, GB, TB)
	--kbytes					# Show sizes in KiB, or kB with --si
	--mbytes					# Show sizes in MiB, or MB with --si
	--gbytes					# Show sizes in GiB, or GB with --si
	--tbytes					# Show sizes in TiB, or TB with --si
	--raw					# Show raw numbers in bytes
	--human-readable					# Show human friendly numbers, base 1024
	--iec					# Use 1024 as a base (KiB, MiB, GiB, TiB)
	--si					# Use 1000 as a base (kB, MB, GB, TB)
	--kbytes					# Show sizes in KiB, or kB with --si
	--mbytes					# Show sizes in MiB, or MB with --si
	--gbytes					# Show sizes in GiB, or GB with --si
	--tbytes					# Show sizes in TiB, or TB with --si
	--sort					# List qgroups sorted by specified items
	--sync					# Force sync of the filesystem before getting info
	...args
]

# Wait until given subvolume(s) are completely removed from the filesystem.
extern "btrfs sync" [

	...args
]

# List the subvolume in order
extern "btrfs {gen,ogen,rootid,path}" [

	...args
]

# Show space usage information for a mount point
extern "btrfs df" [
	--raw(-b)					# Show raw numbers in bytes
	--human-readable(-h)					# Show human friendly numbers, base 1024
	--iec					# Use 1024 as a base (KiB, MiB, GiB, TiB)
	--si					# Use 1000 as a base (kB, MB, GB, TB)
	--kbytes(-k)					# Show sizes in KiB, or kB with --si
	--mbytes(-m)					# Show sizes in MiB, or MB with --si
	--gbytes(-g)					# Show sizes in GiB, or GB with --si
	--tbytes(-t)					# Show sizes in TiB, or TB with --si
	...args
]

# Summarize disk usage of each file.
extern "btrfs du" [
	--summarize(-s)					# Display only a total for each argument
	--raw					# Show raw numbers in bytes
	--human-readable					# Show human friendly numbers, base 1024
	--iec					# Use 1024 as a base (KiB, MiB, GiB, TiB)
	--si					# Use 1000 as a base (kB, MB, GB, TB)
	--kbytes					# Show sizes in KiB, or kB with --si
	--mbytes					# Show sizes in MiB, or MB with --si
	--gbytes					# Show sizes in GiB, or GB with --si
	--tbytes					# Show sizes in TiB, or TB with --si
	--extents(-e)					# Print only extent info: extent and device trees
	--device(-d)					# Print only device info: tree root, chunk and device trees
	--roots(-r)					# Print only short root node info
	--backups(-R)					# Print short root node info and backup root info
	--uuid(-u)					# Print only the uuid tree
	--block(-b)					# Print info from the specified BLOCK only
	--tree(-t)					# Print only tree with the given ID
	--follow					# Use with -b, to show all children tree blocks of <block_num>
	--noscan					# Do not scan the devices from the filesystem
	--bfs					# Breadth-first traversal of the trees, print nodes, then leaves
	--dfs					# Depth-first traversal of the trees
	--full(-f)					# Print full superblock information, backup roots etc.
	--all(-a)					# Print information about all superblocks
	--super(-s)					# Specify which SUPER-BLOCK copy to print out
	--force(-F)					# Attempt to dump superblocks with bad magic
	--bytenr					# Specify alternate superblock OFFSET
	...args
]

# Defragment a file or a directory
extern "btrfs defragment" [

	...args
]

# Resize a filesystem
extern "btrfs resize" [

	...args
]

# Get or change the label of a filesystem
extern "btrfs label" [

	...args
]

# Show detailed information about internal filesystem usage.
extern "btrfs usage" [
	--raw(-b)					# Show raw numbers in bytes
	--human-readable(-h)					# Show human friendly numbers, base 1024
	--iec					# Use 1024 as a base (KiB, MiB, GiB, TiB)
	--si					# Use 1000 as a base (kB, MB, GB, TB)
	--kbytes(-k)					# Show sizes in KiB, or kB with --si
	--mbytes(-m)					# Show sizes in MiB, or MB with --si
	--gbytes(-g)					# Show sizes in GiB, or GB with --si
	--tbytes(-t)					# Show sizes in TiB, or TB with --si
	--raw(-b)					# Show raw numbers in bytes
	--human-readable(-h)					# Show human friendly numbers, base 1024
	--iec					# Use 1024 as a base (KiB, MiB, GiB, TiB)
	--si					# Use 1000 as a base (kB, MB, GB, TB)
	--kbytes(-k)					# Show sizes in KiB, or kB with --si
	--mbytes(-m)					# Show sizes in MiB, or MB with --si
	--gbytes(-g)					# Show sizes in GiB, or GB with --si
	--tbytes(-t)					# Show sizes in TiB, or TB with --si
	...args
]

# Balance chunks across the devices
extern "btrfs start" [
	--full-balance					# Do not print warning and do not delay start
	--bg					# Run the balance as a background process
	...args
]

# Pause running balance
extern "btrfs pause" [

	...args
]

# Cancel running or paused balance
extern "btrfs cancel" [

	...args
]

# Resume interrupted balance
extern "btrfs resume" [

	...args
]

# Show status of running or paused balance
extern "btrfs status" [

	...args
]

# Add one or more devices to a mounted filesystem.
extern "btrfs add" [
	--nodiscard(-K)					# Do not perform TRIM on DEVICES
	--force(-f)					# Force overwrite existing filesystem on the disk
	...args
]

# Remove a device from a filesystem
extern "btrfs remove" [

	...args
]

# Scan or forget (unregister) devices of btrfs filesystems
extern "btrfs scan" [
	--all-devices(-d)					# Enumerate and register all devices
	--forget(-u)					# Unregister a given device or all stale devices
	...args
]

# Check and wait until a group of devices of a filesystem is ready for mount
extern "btrfs ready" [

	...args
]

# Show device IO error statistics
extern "btrfs stats" [
	--check(-c)					# Return non-zero if any stat counter is not zero
	--reset(-z)					# Show current stats and reset values to zero
	...args
]

# Recover the chunk tree by scanning the devices one by one.
extern "btrfs chunk-recover" [

	...args
]

# Recover bad superblocks from good copies
extern "btrfs super-recover" [

	...args
]

# Clear the tree log. Usable if its corrupted and prevents mount.
extern "btrfs zero-log" [

	...args
]

# Re-align device and super block sizes. Usable if newer kernel refuse to mount it due to mismatch super size
extern "btrfs fix-device-size" [

	...args
]

# Get file system paths for the given inode
extern "btrfs inode-resolve" [

	...args
]

# Get file system paths for the given logical address
extern "btrfs logical-resolve" [

	...args
]

# Get file system paths for the given subvolume ID.
extern "btrfs subvolid-resolve" [

	...args
]

# Get tree ID of the containing subvolume of path.
extern "btrfs rootid" [

	...args
]

# Get the minimum size the device can be shrunk to. (Default: 1)
extern "btrfs min-dev-size" [
	--id					# Specify the DEVICE-ID to query
	...args
]

# Dump tree structures from a given device
extern "btrfs dump-tree" [
	--extents(-e)					# Print only extent info: extent and device trees
	--device(-d)					# Print only device info: tree root, chunk and device trees
	--roots(-r)					# Print only short root node info
	--backups(-R)					# Print short root node info and backup root info
	--uuid(-u)					# Print only the uuid tree
	--block(-b)					# Print info from the specified BLOCK only
	--tree(-t)					# Print only tree with the given ID
	--follow					# Use with -b, to show all children tree blocks of <block_num>
	--noscan					# Do not scan the devices from the filesystem
	--bfs					# Breadth-first traversal of the trees, print nodes, then leaves
	--dfs					# Depth-first traversal of the trees
	...args
]

# Dump superblock from a device in a textual form
extern "btrfs dump-super" [
	--full(-f)					# Print full superblock information, backup roots etc.
	--all(-a)					# Print information about all superblocks
	--super(-s)					# Specify which SUPER-BLOCK copy to print out
	--force(-F)					# Attempt to dump superblocks with bad magic
	--bytenr					# Specify alternate superblock OFFSET
	...args
]

# Print various stats for trees
extern "btrfs tree-stats" [

	...args
]

# Get a property value of a btrfs object
extern "btrfs get" [

	...args
]

# Set a property on a btrfs object
extern "btrfs set" [

	...args
]

# Enable subvolume quota support for a filesystem.
extern "btrfs enable" [

	...args
]

# Disable subvolume quota support for a filesystem.
extern "btrfs disable" [

	...args
]

# Trash all qgroup numbers and scan the metadata again with the current config.
extern "btrfs rescan" [

	...args
]

# Assign SRC as the child qgroup of DST
extern "btrfs assign" [
	--rescan					# Schedule qutoa rescan if needed
	--no-rescan					# Dont schedule quota rescan
	...args
]

# Destroy a quota group.
extern "btrfs destroy" [

	...args
]

# Set the limits a subvolume quota group.
extern "btrfs limit" [

	...args
]

# List qgroups sorted by specified items
extern "btrfs {qgroupid,rfer,excl,max_rfer,max_excl}" [

	...args
]