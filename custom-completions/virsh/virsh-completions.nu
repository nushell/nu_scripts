# Specify hypervisor connection URI
extern "virsh" [

	...args
]

# Attach device from an XML file
extern "virsh attach-device" [
	--persistent					# Make live change persistent
	--config					# Affect next boot
	--live					# Affect running domain
	--current					# Affect current domain
	...args
]

# Attach disk device
extern "virsh attach-disk" [
	--targetbus					# Target bus of disk device
	--driver					# Driver of disk device
	--subdriver					# Subdriver of disk device
	--iothread					# IOThread to be used by supported device
	--cache					# Cache mode of disk device
	--io					# IO policy of disk device
	--type					# Target device type
	--mode					# Mode of device reading and writing
	--serial					# Serial of disk device
	--wwn					# Wwn of disk device
	--rawio					# Needs rawio capability
	--address					# Address of disk device
	--multifunction					# Use multifunction pci under specified address
	--print-xml					# Print XML document rather than attach the disk
	--persistent					# Make live change persistent
	--config					# Affect next boot
	--live					# Affect running domain
	--current					# Affect current domain
	...args
]

# Attach network interface
extern "virsh attach-interface" [
	--target					# Target network name
	--mac					# MAC address
	--script					# Script used to bridge network interface
	--model					# Model type
	--inbound					# Control domain's incoming traffics
	--outbound					# Control domain's outgoing traffics
	--persistent					# Make live change persistent
	--config					# Affect next boot
	--live					# Affect running domain
	--current					# Affect current domain
	--print-xml					# Print XML document rather than attach the interface
	--managed					# Libvirt will automatically detach/attach the device from/to host
	...args
]

# Autostart a domain
extern "virsh autostart" [
	--disable					# Disable autostarting
	--disable					# Disable autostarting
	--disable					# Disable autostarting
	...args
]

# Set or query a block device I/O tuning parameters
extern "virsh blkdeviotune" [
	--total-bytes-sec					# Total throughput limit, as scaled integer (default bytes)
	--read-bytes-sec					# Read throughput limit, as scaled integer (default bytes)
	--write-bytes-sec					# Write throughput limit, as scaled integer (default bytes)
	--total-iops-sec					# Total I/O operations limit per second
	--read-iops-sec					# Read I/O operations limit per second
	--write-iops-sec					# Write I/O operations limit per second
	--total-bytes-sec-max					# Total max, as scaled integer (default bytes)
	--read-bytes-sec-max					# Read max, as scaled integer (default bytes)
	--write-bytes-sec-max					# Write max, as scaled integer (default bytes)
	--total-iops-sec-max					# Total I/O operations max
	--read-iops-sec-max					# Read I/O operations max
	--write-iops-sec-max					# Write I/O operations max
	--size-iops-sec					# I/O size in bytes
	--group-name					# Group name to share I/O quota between multiple drives
	--total-bytes-sec-max-length					# Duration in seconds to allow total max bytes
	--read-bytes-sec-max-length					# Duration in seconds to allow read max bytes
	--write-bytes-sec-max-length					# Duration in seconds to allow write max bytes
	--total-iops-sec-max-length					# Duration in seconds to allow total I/O operations max
	--read-iops-sec-max-length					# Duration in seconds to allow read I/O operations max
	--write-iops-sec-max-length					# Duration in seconds to allow write I/O operations max
	--config					# Affect next boot
	--live					# Affect running domain
	--current					# Affect current domain
	...args
]

# Get or set blkio parameters
extern "virsh blkiotune" [
	--weight					# IO Weight
	--device-weights					# Per-device IO Weights, in the form of /path/to/device,weight,...
	--device-read-iops-sec					# Per-device read I/O limit per second, in the form of /path/to/device,read_iops_sec,...
	--device-write-iops-sec					# Per-device write I/O limit per second, in the form of /path/to/device,write_iops_sec,...
	--device-read-bytes-sec					# Per-device bytes read per second, in the form of /path/to/device,read_bytes_sec,...
	--device-write-bytes-sec					# Per-device bytes wrote per second, in the form of /path/to/device,write_bytes_sec,...
	--config					# Affect next boot
	--live					# Affect running domain
	--current					# Affect current domain
	...args
]

# Start a block commit operation
extern "virsh blockcommit" [
	--bandwidth					# Bandwidth limit in MiB/s
	--base					# Path of base file to commit into (default bottom of chain)
	--shallow					# Use backing file of top as base
	--top					# Path of top file to commit from (default top of chain)
	--active					# Trigger two-stage active commit of top file
	--delete					# Delete files that were successfully committed
	--wait					# Wait for job to complete (with --active, wait for job to sync)
	--verbose					# With --wait, display the progress
	--timeout					# Implies --wait, abort if copy exceeds timeout (in seconds)
	--pivot					# Implies --active --wait, pivot when commit is synced
	--keep-overlay					# Implies --active --wait, quit when commit is synced
	--async					# With --wait, don't wait for cancel to finish
	--keep-relative					# Keep the backing chain relatively referenced
	--bytes					# The bandwidth limit is in bytes/s rather than MiB/s
	...args
]

# Start a block copy operation
extern "virsh blockcopy" [
	--dest					# Path of the copy to create
	--bandwidth					# Bandwidth limit in MiB/s
	--shallow					# Make the copy share a backing chain
	--reuse-external					# Reuse existing destination
	--blockdev					# Copy destination is block device instead of regular file
	--wait					# Wait for job to reach mirroring phase
	--verbose					# With --wait, display the progress
	--timeout					# Implies --wait, abort if copy exceeds timeout (in seconds)
	--pivot					# Implies --wait, pivot when mirroring starts
	--finish					# Implies --wait, quit when mirroring starts
	--async					# With --wait, don't wait for cancel to finish
	--xml					# Filename containing XML description of the copy destination
	--format					# Format of the destination file
	--granularity					# Power-of-two granularity to use during the copy
	--buf-size					# Maximum amount of in-flight data during the copy
	--bytes					# The bandwidth limit is in bytes/s rather than MiB/s
	--transient-job					# The copy job is not persisted if VM is turned off
	...args
]

# Manage active block operations
extern "virsh blockjob" [
	--abort					# Abort the active job on the specified disk
	--async					# Implies --abort; request but don't wait for job end
	--pivot					# Implies --abort; conclude and pivot a copy or commit job
	--info					# Get active job information for the specified disk
	--bytes					# Get/set bandwidth in bytes rather than MiB/s
	--raw					# Implies --info; output details rather than human summary
	--bandwidth					# Set the bandwidth limit in MiB/s
	...args
]

# Populate a disk from its backing image
extern "virsh blockpull" [
	--bandwidth					# Bandwidth limit in MiB/s
	--base					# Path of backing file in chain for a partial pull
	--wait					# Wait for job to finish
	--verbose					# With --wait, display the progress
	--timeout					# With --wait, abort if pull exceeds timeout (in seconds)
	--async					# With --wait, don't wait for cancel to finish
	--keep-relative					# Keep the backing chain relatively referenced
	--bytes					# The bandwidth limit is in bytes/s rather than MiB/s
	...args
]

# Resize block device of domain
extern "virsh blockresize" [

	...args
]

# Change media of CD or floppy drive
extern "virsh change-media" [
	--source					# Source of the media
	--eject					# Eject the media
	--insert					# Insert the media
	--update					# Update the media
	--current					# Alter live or persistent configuration of domain depending on hypervisor driver
	--live					# Alter live configuration of running domain
	--config					# Alter persistent configuration, effect observed on next boot
	--force					# Force media changing
	--print-xml					# Print XML document rather than change media
	--block					# Source media is a block device
	...args
]

# Connect to the guest console
extern "virsh console" [
	--devname					# Character device name
	--force					# Force console connection (disconnect already connected sessions)
	--safe					# Only connect if safe console handling is supported
	...args
]

# Compute baseline CPU
extern "virsh cpu-baseline" [
	--features					# Show features that are part of the CPU model type
	--migratable					# Do not include features that block migration
	...args
]

# Compare host CPU with a CPU described by an XML file
extern "virsh cpu-compare" [
	--error					# Report error if CPUs are incompatible
	...args
]

# Show domain cpu statistics
extern "virsh cpu-stats" [
	--total					# Show total statistics only
	--start					# Show statistics from this CPU
	--count					# Number of shown CPUs at most
	...args
]

# Create a domain from an XML file
extern "virsh create" [
	--console					# Attach to console after creation
	--paused					# Leave the guest paused after creation
	--autodestroy					# Automatically destroy the guest when virsh disconnects
	--pass-fds					# Pass file descriptors N,M,... to the guest
	--validate					# Validate the XML against the schema
	--xmlfile					# Domain snapshot XML
	--redefine					# Redefine metadata for existing snapshot
	--current					# With redefine, set current snapshot
	--no-metadata					# Take snapshot but create no metadata
	--halt					# Halt domain after snapshot is created
	--disk-only					# Capture disk state but not vm state
	--reuse-external					# Reuse any existing external files
	--quiesce					# Quiesce guest's file systems
	--atomic					# Require atomic operation
	--live					# Take a live snapshot
	--name					# Name of snapshot
	--description					# Description of snapshot
	--print-xml					# Print XML document rather than create
	--no-metadata					# Take snapshot but create no metadata
	--halt					# Halt domain after snapshot is created
	--disk-only					# Capture disk state but not vm state
	--reuse-external					# Reuse any existing external files
	--quiesce					# Quiesce guest's file systems
	--atomic					# Require atomic operation
	--live					# Take a live snapshot
	--memspec					# Memory attributes: [file=]name[,snapshot=type]
	--print-xml					# Print XML document, but don't define/create
	--source-host					# Source-host for underlying storage
	--source-path					# Source path for underlying storage
	--source-dev					# Source device for underlying storage
	--source-name					# Source name for underlying storage
	--target					# Target for underlying storage
	--source-format					# Format for underlying storage
	--auth-type					# Auth type to be used for underlying storage
	--auth-username					# Auth username to be used for underlying storage
	--secret-usage					# Auth secret usage to be used for underlying storage
	--secret-uuid					# Auth secret UUID to be used for underlying storage
	--adapter-name					# Adapter name to be used for underlying storage
	--adapter-wwnn					# Adapter wwnn to be used for underlying storage
	--adapter-wwpn					# Adapter wwpn to be used for underlying storage
	--adapter-parent					# Adapter parent to be used for underlying storage
	--build					# Build the pool as normal
	--no-overwrite					# Do not overwrite any existing data
	--overwrite					# Overwrite any existing data
	--build					# Build the pool as normal
	--no-overwrite					# Do not overwrite any existing data
	--overwrite					# Overwrite any existing data
	--allocation					# Initial allocation size, as scaled integer (default bytes)
	--format					# File format type raw,bochs,qcow,qcow2,qed,vmdk
	--backing-vol					# The backing volume if taking a snapshot
	--backing-vol-format					# Format of backing volume if taking a snapshot
	--prealloc-metadata					# Preallocate metadata (for qcow2 instead of full allocation)
	--print-xml					# Print XML document, but don't define/create
	--prealloc-metadata					# Preallocate metadata (for qcow2 instead of full allocation)
	--inputpool					# Pool name or UUID of the input volume's pool
	--prealloc-metadata					# Preallocate metadata (for qcow2 instead of full allocation)
	--reflink					# Use btrfs COW lightweight copy
	...args
]

# Define (but don't start) a domain
extern "virsh define" [
	--validate					# Validate the XML against the schema
	--running					# Set domain to be running on start
	--paused					# Set domain to be paused on start
	--running					# Set domain to be running on restore
	--paused					# Set domain to be paused on restore
	--managed-save					# Remove domain managed state file
	--storage					# Remove associated storage volumes
	--remove-all-storage					# Remove all associated storage volumes
	--delete-snapshots					# Delete snapshots associated with volume(s)
	--wipe-storage					# Wipe data on the removed volumes
	--snapshots-metadata					# Remove all domain snapshot metadata, if inactive
	--nvram					# Remove nvram file, if inactive
	--keep-nvram					# Keep nvram file, if inactive
	--print-xml					# Print XML document, but don't define/create
	--source-host					# Source-host for underlying storage
	--source-path					# Source path for underlying storage
	--source-dev					# Source device for underlying storage
	--source-name					# Source name for underlying storage
	--target					# Target for underlying storage
	--source-format					# Format for underlying storage
	--auth-type					# Auth type to be used for underlying storage
	--auth-username					# Auth username to be used for underlying storage
	--secret-usage					# Auth secret usage to be used for underlying storage
	--secret-uuid					# Auth secret UUID to be used for underlying storage
	--adapter-name					# Adapter name to be used for underlying storage
	--adapter-wwnn					# Adapter wwnn to be used for underlying storage
	--adapter-wwpn					# Adapter wwpn to be used for underlying storage
	--adapter-parent					# Adapter parent to be used for underlying storage
	...args
]

# Show or set domain's description or title
extern "virsh desc" [
	--live					# Modify/get running state
	--config					# Modify/get persistent configuration
	--current					# Modify/get current state configuration
	--title					# Modify/get the title instead of description
	--edit					# Open an editor to modify the description
	...args
]

# Destroy (stop) a domain
extern "virsh destroy" [
	--graceful					# Terminate gracefully
	...args
]

# Detach device from an XML file
extern "virsh detach-device" [
	--persistent					# Make live change persistent
	--config					# Affect next boot
	--live					# Affect running domain
	--current					# Affect current domain
	...args
]

# Detach disk device
extern "virsh detach-disk" [
	--persistent					# Make live change persistent
	--config					# Affect next boot
	--live					# Affect running domain
	--current					# Affect current domain
	...args
]

# Detach network interface
extern "virsh detach-interface" [
	--mac					# MAC address
	--persistent					# Make live change persistent
	--config					# Affect next boot
	--live					# Affect running domain
	--current					# Affect current domain
	...args
]

# Domain display connection URI
extern "virsh domdisplay" [
	--include-password					# Includes the password into the connection URI if available
	--type					# Select particular graphical display (e.g. "vnc", "spice", "rdp")
	--all					# Show all possible graphical displays
	...args
]

# Freeze domain's mounted filesystems
extern "virsh domfsfreeze" [

	...args
]

# Thaw domain's mounted filesystems
extern "virsh domfsthaw" [

	...args
]

# Get information of domain's mounted filesystems
extern "virsh domfsinfo" [

	...args
]

# Invoke fstrim on domain's mounted filesystems
extern "virsh domfstrim" [
	--minimum					# Just a hint to ignore contiguous free ranges smaller than this (Bytes)
	--mountpoint					# Which mount point to trim
	...args
]

# Print the domain's hostname
extern "virsh domhostname" [

	...args
]

# Convert a domain name or UUID to domain id
extern "virsh domid" [

	...args
]

# Set link state of a virtual interface
extern "virsh domif-setlink" [
	--config					# Affect next boot
	...args
]

# Get/set parameters of a virtual interface
extern "virsh domiftune" [
	--inbound					# Control domain's incoming traffics
	--outbound					# Control domain's outgoing traffics
	--config					# Affect next boot
	--live					# Affect running domain
	--current					# Affect current domain
	...args
]

# Abort active domain job
extern "virsh domjobabort" [

	...args
]

# Domain job information
extern "virsh domjobinfo" [
	--completed					# Return statistics of a recently completed job
	...args
]

# Convert a domain id or UUID to domain name
extern "virsh domname" [

	...args
]

# Rename a domain
extern "virsh domrename" [

	...args
]

# Suspend a domain gracefully using power management functions
extern "virsh dompmsuspend" [
	--duration					# Duration in seconds
	...args
]

# Wakeup a domain from pmsuspended state
extern "virsh dompmwakeup" [

	...args
]

# Convert a domain name or id to domain UUID
extern "virsh domuuid" [

	...args
]

# Convert native config to domain XML
extern "virsh domxml-from-native" [

	...args
]

# Convert domain XML to native config
extern "virsh domxml-to-native" [
	--domain					# Domain name, id or UUID
	--xml					# Xml data file to export from
	...args
]

# Dump the core of a domain to a file for analysis
extern "virsh dump" [
	--live					# Perform a live core dump if supported
	--crash					# Crash the domain after core dump
	--bypass-cache					# Avoid file system cache when dumping
	--reset					# Reset the domain after core dump
	--verbose					# Display the progress of dump
	--memory-only					# Dump domain's memory only
	--format					# Specify the format of memory-only dump
	--inactive					# Show inactive defined XML
	--security-info					# Include security sensitive information in XML dump
	--update-cpu					# Update guest CPU according to host CPU
	--migratable					# Provide XML suitable for migrations
	--security-info					# Include security sensitive information in XML dump
	--security-info					# Include security sensitive information in XML dump
	--inactive					# Show inactive defined XML
	--inactive					# Show inactive defined XML
	--security-info					# Include security sensitive information in XML dump
	--inactive					# Show inactive defined XML
	--pool					# Pool name or UUID
	...args
]

# Domain information in XML
extern "virsh dumpxml" [
	--inactive					# Show inactive defined XML
	--security-info					# Include security sensitive information in XML dump
	--update-cpu					# Update guest CPU according to host CPU
	--migratable					# Provide XML suitable for migrations
	--security-info					# Include security sensitive information in XML dump
	--security-info					# Include security sensitive information in XML dump
	--inactive					# Show inactive defined XML
	--inactive					# Show inactive defined XML
	--security-info					# Include security sensitive information in XML dump
	--inactive					# Show inactive defined XML
	--pool					# Pool name or UUID
	...args
]

# Edit XML configuration for a domain
extern "virsh edit" [
	--skip-validate					# Skip validation of the XML against the schema
	--running					# Set domain to be running on start
	--paused					# Set domain to be paused on start
	--running					# Set domain to be running on restore
	--paused					# Set domain to be paused on restore
	--snapshotname					# Snapshot name
	--current					# Also set edited snapshot as current
	--rename					# Allow renaming an existing snapshot
	--clone					# Allow cloning to new name
	...args
]

# Domain Events
extern "virsh event" [
	--domain					# Filter by domain name, id, or UUID
	--event					# Which event type to wait for
	--all					# Wait for all events instead of just one type
	--loop					# Loop until timeout or interrupt, rather than one-shot
	--timeout					# Timeout seconds
	--list					# List valid event types
	--timestamp					# Show timestamp for each printed event
	--domain					# Filter by domain name, id or UUID
	--event					# Filter by event name
	--pretty					# Pretty-print any JSON output
	--loop					# Loop until timeout or interrupt, rather than one-shot
	--timeout					# Timeout seconds
	--regex					# Treat event as a regex rather than literal filter
	--no-case					# Treat event case-insensitively
	--timestamp					# Show timestamp for each printed event
	--event					# Which event type to wait for
	--loop					# Loop until timeout or interrupt, rather than one-shot
	--timeout					# Timeout seconds
	--list					# List valid event types
	--timestamp					# Show timestamp for each printed event
	--device					# Filter by node device name
	--event					# Which event type to wait for
	--loop					# Loop until timeout or interrupt, rather than one-shot
	--timeout					# Timeout seconds
	--list					# List valid event types
	--timestamp					# Show timestamp for each printed event
	--secret					# Filter by secret name or UUID
	--event					# Which event type to wait for
	--loop					# Loop until timeout or interrupt, rather than one-shot
	--timeout					# Timeout seconds
	--list					# List valid event types
	--timestamp					# Show timestamp for each printed event
	--pool					# Filter by storage pool name or UUID
	--event					# Which event type to wait for
	--loop					# Loop until timeout or interrupt, rather than one-shot
	--timeout					# Timeout seconds
	--list					# List valid event types
	--timestamp					# Show timestamp for each printed event
	...args
]

# Inject NMI to the guest
extern "virsh inject-nmi" [

	...args
]

# View domain IOThreads
extern "virsh iothreadinfo" [
	--config					# Affect next boot
	--live					# Affect running domain
	--current					# Affect current domain
	...args
]

# Control domain IOThread affinity
extern "virsh iothreadpin" [
	--config					# Affect next boot
	--live					# Affect running domain
	--current					# Affect current domain
	...args
]

# Add an IOThread to the guest domain
extern "virsh iothreadadd" [
	--config					# Affect next boot
	--live					# Affect running domain
	--current					# Affect current domain
	...args
]

# Delete an IOThread from the guest domain
extern "virsh iothreaddel" [
	--config					# Affect next boot
	--live					# Affect running domain
	--current					# Affect current domain
	...args
]

# Send keycodes to the guest
extern "virsh send-key" [
	--codeset					# The codeset of keycodes, default:linux
	--holdtime					# The time (in milliseconds) how long the keys will be held
	...args
]

# Send signals to processes
extern "virsh send-process-signal" [

	...args
]

# LXC Guest Enter Namespace
extern "virsh lxc-enter-namespace" [
	--noseclabel					# Do not change process security label
	...args
]

# Managed save of a domain state
extern "virsh managedsave" [
	--bypass-cache					# Avoid file system cache when saving
	--running					# Set domain to be running on next start
	--paused					# Set domain to be paused on next start
	--verbose					# Display the progress of save
	--running					# Set domain to be running on start
	--paused					# Set domain to be paused on start
	--security-info					# Include security sensitive information in XML dump
	--running					# Set domain to be running on start
	--paused					# Set domain to be paused on start
	...args
]

# Remove managed save of a domain
extern "virsh managedsave-remove" [

	...args
]

# Edit XML for a domain's managed save state file
extern "virsh managedsave-edit" [
	--running					# Set domain to be running on start
	--paused					# Set domain to be paused on start
	...args
]

# Domain information of managed save state file in XML
extern "virsh managedsave-dumpxml" [
	--security-info					# Include security sensitive information in XML dump
	...args
]

# Redefine the XML for a domain's managed save state file
extern "virsh managedsave-define" [
	--running					# Set domain to be running on start
	--paused					# Set domain to be paused on start
	...args
]

# Get or set memory parameters
extern "virsh memtune" [
	--hard-limit					# Max memory, as scaled integer (default KiB)
	--soft-limit					# Memory during contention, as scaled integer (default KiB)
	--swap-hard-limit					# Max memory plus swap, as scaled integer (default KiB)
	--min-guarantee					# Min guaranteed memory, as scaled integer (default KiB)
	--config					# Affect next boot
	--live					# Affect running domain
	--current					# Affect current domain
	...args
]

# Get or set perf event
extern "virsh perf" [
	--enable					# Perf events which will be enabled
	--disable					# Perf events which will be disabled
	--config					# Affect next boot
	--live					# Affect running domain
	--current					# Affect current domain
	...args
]

# Show or set domain's custom XML metadata
extern "virsh metadata" [
	--live					# Modify/get running state
	--config					# Modify/get persistent configuration
	--current					# Modify/get current state configuration
	--edit					# Use an editor to change the metadata
	--key					# Key to be used as a namespace identifier
	--set					# New metadata to set
	--remove					# Remove the metadata corresponding to an uri
	...args
]

# Migrate domain to another host
extern "virsh migrate" [
	--live					# Live migration
	--offline					# Offline migration
	--p2p					# Peer-2-peer migration
	--direct					# Direct migration
	--tunnelled					# Tunnelled migration
	--persistent					# Persist VM on destination
	--undefinesource					# Undefine VM on source
	--suspend					# Do not restart the domain on the destination host
	--copy-storage-all					# Migration with non-shared storage with full disk copy
	--copy-storage-inc					# Migration with non-shared storage with incremental copy
	--change-protection					# Prevent any configuration changes to domain until migration ends
	--unsafe					# Force migration even if it may be unsafe
	--verbose					# Display the progress of migration
	--compressed					# Compress repeated pages during live migration
	--auto-converge					# Force convergence during live migration
	--rdma-pin-all					# Pin all memory before starting RDMA live migration
	--abort-on-error					# Abort on soft errors during migration
	--postcopy					# Enable post-copy migration; switch to it using migrate-postcopy command
	--postcopy-after-precopy					# Automatically switch to post-copy migration after one pass of pre-copy
	--migrateuri					# Migration URI, usually can be omitted
	--graphicsuri					# Graphics URI to be used for seamless graphics migration
	--listen-address					# Listen address that destination should bind to for incoming migration
	--dname					# Rename to new name during migration
	--timeout					# Run action specified by --timeout-* if live migration exceeds timeout
	--timeout-suspend					# Suspend the guest after timeout
	--timeout-postcopy					# Switch to post-copy after timeout
	--xml					# Filename containing updated XML for the target
	--migrate-disks					# Comma separated list of disks to be migrated
	--disks-port					# Port to use by target server for incoming disks migration
	--comp-methods					# Comma separated list of compression methods to be used
	--comp-mt-level					# Compress level for multithread compression
	--comp-mt-threads					# Number of compression threads for multithread compression
	--comp-mt-dthreads					# Number of decompression threads for multithread compression
	--comp-xbzrle-cache					# Page cache size for xbzrle compression
	--auto-converge-initial					# Initial CPU throttling rate for auto-convergence
	--auto-converge-increment					# CPU throttling rate increment for auto-convergence
	--persistent-xml					# Filename containing updated persistent XML for the target
	--tls					# Use TLS for migration
	--size					# Requested size of the cache (in bytes) used for compression
	...args
]

# Set maximum tolerable downtime
extern "virsh migrate-setmaxdowntime" [

	...args
]

# Get maximum tolerable downtime
extern "virsh migrate-getmaxdowntime" [

	...args
]

# Get/set compression cache size
extern "virsh migrate-compcache" [
	--size					# Requested size of the cache (in bytes) used for compression
	...args
]

# Set the maximum migration bandwidth
extern "virsh migrate-setspeed" [

	...args
]

# Get the maximum migration bandwidth
extern "virsh migrate-getspeed" [

	...args
]

# Switch running migration from pre-copy to post-copy
extern "virsh migrate-postcopy" [

	...args
]

# Get or set numa parameters
extern "virsh numatune" [
	--mode					# NUMA mode, one of strict, preferred and interleave
	--nodeset					# NUMA node selections to set
	--config					# Affect next boot
	--live					# Affect running domain
	--current					# Affect current domain
	...args
]

# QEMU Attach
extern "virsh qemu-attach" [

	...args
]

# QEMU Monitor Command
extern "virsh qemu-monitor-command" [
	--hmp					# Command is in human monitor protocol
	--pretty					# Pretty-print any qemu monitor protocol output
	...args
]

# QEMU Monitor Events
extern "virsh qemu-monitor-event" [
	--domain					# Filter by domain name, id or UUID
	--event					# Filter by event name
	--pretty					# Pretty-print any JSON output
	--loop					# Loop until timeout or interrupt, rather than one-shot
	--timeout					# Timeout seconds
	--regex					# Treat event as a regex rather than literal filter
	--no-case					# Treat event case-insensitively
	--timestamp					# Show timestamp for each printed event
	...args
]

# QEMU Guest Agent Command
extern "virsh qemu-agent-command" [
	--timeout					# Timeout seconds. must be positive
	--async					# Execute command without waiting for timeout
	--block					# Execute command without timeout
	--pretty					# Pretty-print the output
	...args
]

# Reboot a domain
extern "virsh reboot" [

	...args
]

# Reset a domain
extern "virsh reset" [

	...args
]

# Restore a domain from a saved state in a file
extern "virsh restore" [
	--bypass-cache					# Avoid file system cache when restoring
	--xml					# Filename containing updated XML for the target
	--running					# Restore domain into running state
	--paused					# Restore domain into paused state
	...args
]

# Resume a domain
extern "virsh resume" [

	...args
]

# Save a domain state to a file
extern "virsh save" [
	--bypass-cache					# Avoid file system cache when saving
	--running					# Set domain to be running on next start
	--paused					# Set domain to be paused on next start
	--verbose					# Display the progress of save
	--running					# Set domain to be running on start
	--paused					# Set domain to be paused on start
	--security-info					# Include security sensitive information in XML dump
	--running					# Set domain to be running on start
	--paused					# Set domain to be paused on start
	--bypass-cache					# Avoid file system cache when saving
	--xml					# Filename containing updated XML for the target
	--running					# Set domain to be running on restore
	--paused					# Set domain to be paused on restore
	--verbose					# Display the progress of save
	--running					# Set domain to be running on restore
	--paused					# Set domain to be paused on restore
	--security-info					# Include security sensitive information in XML dump
	--running					# Set domain to be running on restore
	--paused					# Set domain to be paused on restore
	...args
]

# Redefine the XML for a domain's saved state file
extern "virsh save-image-define" [
	--running					# Set domain to be running on restore
	--paused					# Set domain to be paused on restore
	...args
]

# Saved state domain information in XML
extern "virsh save-image-dumpxml" [
	--security-info					# Include security sensitive information in XML dump
	...args
]

# Edit XML for a domain's saved state file
extern "virsh save-image-edit" [
	--running					# Set domain to be running on restore
	--paused					# Set domain to be paused on restore
	...args
]

# Show/set scheduler parameters
extern "virsh schedinfo" [
	--weight					# Weight for XEN_CREDIT
	--cap					# Cap for XEN_CREDIT
	--current					# Get/set current scheduler info
	--config					# Get/set value to be used on next boot
	--live					# Get/set value from running domain
	...args
]

# Take a screenshot of a current domain console and store it into a file
extern "virsh screenshot" [
	--file					# Where to store the screenshot
	--screen					# ID of a screen to take screenshot of
	...args
]

# Change lifecycle actions
extern "virsh set-lifecycle-action" [
	--config					# Affect next boot
	--live					# Affect running domain
	--current					# Affect current domain
	...args
]

# Set the user password inside the domain
extern "virsh set-user-password" [
	--encrypted					# The password is already encrypted
	...args
]

# Change maximum memory limit
extern "virsh setmaxmem" [
	--config					# Affect next boot
	--live					# Affect running domain
	--current					# Affect current domain
	...args
]

# Change memory allocation
extern "virsh setmem" [
	--config					# Affect next boot
	--live					# Affect running domain
	--current					# Affect current domain
	...args
]

# Change number of virtual CPUs
extern "virsh setvcpus" [
	--maximum					# Set maximum limit on next boot
	--config					# Affect next boot
	--live					# Affect running domain
	--current					# Affect current domain
	--guest					# Modify cpu state in the guest
	--hotpluggable					# Make added vcpus hot(un)pluggable
	...args
]

# Gracefully shutdown a domain
extern "virsh shutdown" [

	...args
]

# Start a (previously defined) inactive domain
extern "virsh start" [
	--disable					# Disable autostarting
	--console					# Attach to console after creation
	--paused					# Leave the guest paused after creation
	--autodestroy					# Automatically destroy the guest when virsh disconnects
	--bypass-cache					# Avoid file system cache when loading
	--force-boot					# Force fresh boot by discarding any managed save
	--pass-fds					# Pass file descriptors N,M,... to the guest
	--disable					# Disable autostarting
	--disable					# Disable autostarting
	--build					# Build the pool as normal
	--no-overwrite					# Do not overwrite any existing data
	--overwrite					# Overwrite any existing data
	...args
]

# Suspend a domain
extern "virsh suspend" [
	--duration					# Duration in seconds
	...args
]

# TTY console
extern "virsh ttyconsole" [

	...args
]

# Undefine a domain
extern "virsh undefine" [
	--managed-save					# Remove domain managed state file
	--storage					# Remove associated storage volumes
	--remove-all-storage					# Remove all associated storage volumes
	--delete-snapshots					# Delete snapshots associated with volume(s)
	--wipe-storage					# Wipe data on the removed volumes
	--snapshots-metadata					# Remove all domain snapshot metadata, if inactive
	--nvram					# Remove nvram file, if inactive
	--keep-nvram					# Keep nvram file, if inactive
	...args
]

# Update device from an XML file
extern "virsh update-device" [
	--persistent					# Make live change persistent
	--config					# Affect next boot
	--live					# Affect running domain
	--current					# Affect current domain
	--force					# Force device update
	...args
]

# Domain vcpu counts
extern "virsh vcpucount" [
	--maximum					# Get maximum count of vcpus
	--active					# Get number of currently active vcpus
	--live					# Get value from running domain
	--config					# Get value to be used on next boot
	--current					# Get value according to current domain state
	--guest					# Retrieve vcpu count from the guest instead of the hypervisor
	...args
]

# Detailed domain vcpu information
extern "virsh vcpuinfo" [
	--pretty					# Return human readable output
	...args
]

# Control or query domain vcpu affinity
extern "virsh vcpupin" [
	--vcpu					# Vcpu number
	--cpulist					# Host cpu number(s) to set, or omit option to query
	--config					# Affect next boot
	--live					# Affect running domain
	--current					# Affect current domain
	...args
]

# Control or query domain emulator affinity
extern "virsh emulatorpin" [
	--cpulist					# Host cpu number(s) to set, or omit option to query
	--config					# Affect next boot
	--live					# Affect running domain
	--current					# Affect current domain
	...args
]

# Vnc display
extern "virsh vncdisplay" [

	...args
]

# Query or modify state of vcpu in the guest (via agent)
extern "virsh guestvcpus" [
	--cpulist					# List of cpus to enable or disable
	--enable					# Enable cpus specified by cpulist
	--disable					# Disable cpus specified by cpulist
	...args
]

# Attach/detach vcpu or groups of threads
extern "virsh setvcpu" [
	--maximum					# Set maximum limit on next boot
	--config					# Affect next boot
	--live					# Affect running domain
	--current					# Affect current domain
	--guest					# Modify cpu state in the guest
	--hotpluggable					# Make added vcpus hot(un)pluggable
	--enable					# Enable cpus specified by cpumap
	--disable					# Disable cpus specified by cpumap
	--config					# Affect next boot
	--live					# Affect running domain
	--current					# Affect current domain
	...args
]

# Set the threshold for block-threshold event
extern "virsh domblkthreshold" [

	...args
]

# Show errors on block devices
extern "virsh domblkerror" [

	...args
]

# Domain block device size information
extern "virsh domblkinfo" [
	--human					# Human readable output
	...args
]

# List all domain blocks
extern "virsh domblklist" [
	--inactive					# Get inactive rather than running configuration
	--details					# Additionally display the type and device value
	...args
]

# Get device block stats for a domain
extern "virsh domblkstat" [
	--device					# Block device
	--human					# Print a more human readable output
	...args
]

# Domain control interface state
extern "virsh domcontrol" [

	...args
]

# Get link state of a virtual interface
extern "virsh domif-getlink" [
	--config					# Get persistent interface state
	...args
]

# Get network interfaces' addresses for a running domain
extern "virsh domifaddr" [
	--interface					# Network interface name
	--full					# Always display names and MACs of interfaces
	--source					# Address source: 'lease' or 'agent'
	...args
]

# List all domain virtual interfaces
extern "virsh domiflist" [
	--inactive					# Get inactive rather than running configuration
	...args
]

# Get network interface stats for a domain
extern "virsh domifstat" [

	...args
]

# Domain information
extern "virsh dominfo" [

	...args
]

# Get memory statistics for a domain
extern "virsh dommemstat" [
	--period					# Period in seconds to set collection
	--config					# Affect next boot
	--live					# Affect running domain
	--current					# Affect current domain
	...args
]

# Domain state
extern "virsh domstate" [
	--reason					# Also print reason for the state
	...args
]

# Get statistics about one or multiple domains
extern "virsh domstats" [
	--state					# Report domain state
	--cpu-total					# Report domain physical cpu usage
	--balloon					# Report domain balloon statistics
	--vcpu					# Report domain virtual cpu information
	--interface					# Report domain network interface information
	--block					# Report domain block device statistics
	--perf					# Report domain perf event statistics
	--list-active					# List only active domains
	--list-inactive					# List only inactive domains
	--list-persistent					# List only persistent domains
	--list-transient					# List only transient domains
	--list-running					# List only running domains
	--list-paused					# List only paused domains
	--list-shutoff					# List only shutoff domains
	--list-other					# List only domains in other states
	--raw					# Do not pretty-print the fields
	--enforce					# Enforce requested stats parameters
	--backing					# Add backing chain information to block stats
	...args
]

# Domain time
extern "virsh domtime" [
	--now					# Set to the time of the host running virsh
	--pretty					# Print domain's time in human readable form
	--sync					# Instead of setting given time, synchronize from domain's RTC
	--time					# Time to set
	...args
]

# List domains
extern "virsh list" [
	--inactive					# Get inactive rather than running configuration
	--details					# Additionally display the type and device value
	--inactive					# Get inactive rather than running configuration
	--inactive					# List inactive domains
	--all					# List inactive & active domains
	--transient					# List transient domains
	--persistent					# List persistent domains
	--with-snapshot					# List domains with existing snapshot
	--without-snapshot					# List domains without a snapshot
	--state-running					# List domains in running state
	--state-paused					# List domains in paused state
	--state-shutoff					# List domains in shutoff state
	--state-other					# List domains in other states
	--autostart					# List domains with autostart enabled
	--no-autostart					# List domains with autostart disabled
	--with-managed-save					# List domains with managed save state
	--without-managed-save					# List domains without managed save
	--uuid					# List UUID's only
	--name					# List domain names only
	--table					# List table (default)
	--managed-save					# Mark inactive domains with managed save state
	--title					# Show domain title
	--inactive					# List inactive interfaces
	--all					# List inactive & active interfaces
	--inactive					# List inactive networks
	--all					# List inactive & active networks
	--persistent					# List persistent networks
	--transient					# List transient networks
	--autostart					# List networks with autostart enabled
	--no-autostart					# List networks with autostart disabled
	--uuid					# List UUID's only
	--name					# List network names only
	--table					# List table (default)
	--tree					# List devices in a tree
	--cap					# Capability names, separated by comma
	--ephemeral					# List ephemeral secrets
	--no-ephemeral					# List non-ephemeral secrets
	--private					# List private secrets
	--no-private					# List non-private secrets
	--parent					# Add a column showing parent snapshot
	--roots					# List only snapshots without parents
	--leaves					# List only snapshots without children
	--no-leaves					# List only snapshots that are not leaves (with children)
	--metadata					# List only snapshots that have metadata that would prevent undefine
	--no-metadata					# List only snapshots that have no metadata managed by libvirt
	--inactive					# Filter by snapshots taken while inactive
	--active					# Filter by snapshots taken while active (system checkpoints)
	--disk-only					# Filter by disk-only snapshots
	--internal					# Filter by internal snapshots
	--external					# Filter by external snapshots
	--tree					# List snapshots in a tree
	--from					# Limit list to children of given snapshot
	--current					# Limit list to children of current snapshot
	--descendants					# With --from, list all descendants
	--name					# List snapshot names only
	--inactive					# List inactive pools
	--all					# List inactive & active pools
	--transient					# List transient pools
	--persistent					# List persistent pools
	--autostart					# List pools with autostart enabled
	--no-autostart					# List pools with autostart disabled
	--type					# Only list pool of specified type(s) (if supported)
	--details					# Display extended details for pools
	--uuid					# List UUID of active pools only
	--name					# List name of active pools only
	--details					# Display extended details for volumes
	...args
]

# Manipulate pages pool size
extern "virsh allocpages" [
	--cellno					# NUMA cell number
	--add					# Instead of setting new pool size add pages to it
	--all					# Set on all NUMA cells
	...args
]

# Capabilities
extern "virsh capabilities" [
	--virttype					# Virtualization type (/domain/@type)
	--emulatorbin					# Path to emulator binary (/domain/devices/emulator)
	--arch					# Domain architecture (/domain/os/type/@arch)
	--machine					# Machine type (/domain/os/type/@machine)
	...args
]

# CPU models
extern "virsh cpu-models" [

	...args
]

# Domain capabilities
extern "virsh domcapabilities" [
	--virttype					# Virtualization type (/domain/@type)
	--emulatorbin					# Path to emulator binary (/domain/devices/emulator)
	--arch					# Domain architecture (/domain/os/type/@arch)
	--machine					# Machine type (/domain/os/type/@machine)
	...args
]

# NUMA free memory
extern "virsh freecell" [
	--cellno					# NUMA cell number
	--all					# Show free memory for all NUMA cells
	...args
]

# NUMA free pages
extern "virsh freepages" [
	--cellno					# NUMA cell number
	--pagesize					# Page size (in kibibytes)
	--all					# Show free pages for all NUMA cells
	...args
]

# Print the hypervisor hostname
extern "virsh hostname" [

	...args
]

# Connection vcpu maximum
extern "virsh maxvcpus" [
	--type					# Domain type
	...args
]

# Get or set node memory parameters
extern "virsh node-memory-tune" [
	--shm-pages-to-scan					# Number of pages to scan before the shared memory service goes to sleep
	--shm-sleep-millisecs					# Number of millisecs the shared memory service should sleep before next scan
	--shm-merge-across-nodes					# Specifies if pages from different numa nodes can be merged
	...args
]

# Node cpu map
extern "virsh nodecpumap" [
	--pretty					# Return human readable output
	...args
]

# Prints cpu stats of the node
extern "virsh nodecpustats" [
	--cpu					# Prints specified cpu statistics only
	--percent					# Prints by percentage during 1 second
	...args
]

# Node information
extern "virsh nodeinfo" [

	...args
]

# Prints memory stats of the node
extern "virsh nodememstats" [
	--cell					# Prints specified cell statistics only
	...args
]

# Suspend the host node for a given time duration
extern "virsh nodesuspend" [

	...args
]

# Print the hypervisor sysinfo
extern "virsh sysinfo" [

	...args
]

# Print the hypervisor canonical URI
extern "virsh uri" [

	...args
]

# Show version
extern "virsh version" [
	--daemon					# Report daemon version too
	...args
]

# Create a snapshot of current interfaces settings
extern "virsh iface-begin" [

	...args
]

# Create a bridge device and attach an existing network device to it
extern "virsh iface-bridge" [
	--no-stp					# Do not enable STP for this bridge
	--delay					# Number of seconds to squelch traffic on newly connected ports
	--no-start					# Don't start the bridge immediately
	...args
]

# Commit changes made since iface-begin and free restore point
extern "virsh iface-commit" [

	...args
]

# Define or modify an inactive persistent physical host interface
extern "virsh iface-define" [

	...args
]

# Destroy a physical host interface
extern "virsh iface-destroy" [

	...args
]

# Interface information in XML
extern "virsh iface-dumpxml" [
	--inactive					# Show inactive defined XML
	...args
]

# Edit XML configuration for a physical host interface
extern "virsh iface-edit" [

	...args
]

# List physical host interfaces
extern "virsh iface-list" [
	--inactive					# List inactive interfaces
	--all					# List inactive & active interfaces
	...args
]

# Convert an interface name to interface MAC address
extern "virsh iface-mac" [

	...args
]

# Convert an interface MAC address to interface name
extern "virsh iface-name" [

	...args
]

# Rollback to previous saved configuration created via iface-begin
extern "virsh iface-rollback" [

	...args
]

# Start a physical host interface
extern "virsh iface-start" [

	...args
]

# Undefine a bridge device after detaching its slave device
extern "virsh iface-unbridge" [
	--no-start					# Don't start the un-slaved interface immediately
	...args
]

# Undefine a physical host interface
extern "virsh iface-undefine" [

	...args
]

# Define or update a network filter
extern "virsh nwfilter-define" [

	...args
]

# Network filter information in XML
extern "virsh nwfilter-dumpxml" [

	...args
]

# Edit XML configuration for a network filter
extern "virsh nwfilter-edit" [

	...args
]

# List network filters
extern "virsh nwfilter-list" [

	...args
]

# Undefine a network filter
extern "virsh nwfilter-undefine" [

	...args
]

# Autostart a network
extern "virsh net-autostart" [
	--disable					# Disable autostarting
	...args
]

# Create a network from an XML file
extern "virsh net-create" [

	...args
]

# Define or modify an inactive persistent virtual network
extern "virsh net-define" [

	...args
]

# Destroy (stop) a network
extern "virsh net-destroy" [

	...args
]

# Print lease info for a given network
extern "virsh net-dhcp-leases" [
	--mac					# MAC address
	...args
]

# Network information in XML
extern "virsh net-dumpxml" [
	--inactive					# Show inactive defined XML
	...args
]

# Edit XML configuration for a network
extern "virsh net-edit" [

	...args
]

# Network Events
extern "virsh net-event" [
	--event					# Which event type to wait for
	--loop					# Loop until timeout or interrupt, rather than one-shot
	--timeout					# Timeout seconds
	--list					# List valid event types
	--timestamp					# Show timestamp for each printed event
	...args
]

# Network information
extern "virsh net-info" [

	...args
]

# List networks
extern "virsh net-list" [
	--inactive					# List inactive networks
	--all					# List inactive & active networks
	--persistent					# List persistent networks
	--transient					# List transient networks
	--autostart					# List networks with autostart enabled
	--no-autostart					# List networks with autostart disabled
	--uuid					# List UUID's only
	--name					# List network names only
	--table					# List table (default)
	...args
]

# Convert a network UUID to network name
extern "virsh net-name" [

	...args
]

# Start a (previously defined) inactive network
extern "virsh net-start" [

	...args
]

# Undefine a persistent network
extern "virsh net-undefine" [

	...args
]

# Update parts of an existing network's configuration
extern "virsh net-update" [
	--parent-index					# Which parent object to search through
	--config					# Affect next network startup
	--live					# Affect running network
	--current					# Affect current state of network
	...args
]

# Convert a network name to network UUID
extern "virsh net-uuid" [

	...args
]

# Create a device defined by an XML file on the node
extern "virsh nodedev-create" [

	...args
]

# Destroy (stop) a device on the node
extern "virsh nodedev-destroy" [

	...args
]

# Detach node device from its device driver
extern "virsh nodedev-detach" [
	--driver					# Pci device assignment backend driver (e.g. 'vfio' or 'kvm')
	...args
]

# Node device details in XML
extern "virsh nodedev-dumpxml" [

	...args
]

# Enumerate devices on this host
extern "virsh nodedev-list" [
	--tree					# List devices in a tree
	--cap					# Capability names, separated by comma
	...args
]

# Reattach node device to its device driver
extern "virsh nodedev-reattach" [

	...args
]

# Reset node device
extern "virsh nodedev-reset" [

	...args
]

# Node Device Events
extern "virsh nodedev-event" [
	--device					# Filter by node device name
	--event					# Which event type to wait for
	--loop					# Loop until timeout or interrupt, rather than one-shot
	--timeout					# Timeout seconds
	--list					# List valid event types
	--timestamp					# Show timestamp for each printed event
	...args
]

# Define or modify a secret
extern "virsh secret-define" [

	...args
]

# Secret attributes in XML
extern "virsh secret-dumpxml" [

	...args
]

# Secret Events
extern "virsh secret-event" [
	--secret					# Filter by secret name or UUID
	--event					# Which event type to wait for
	--loop					# Loop until timeout or interrupt, rather than one-shot
	--timeout					# Timeout seconds
	--list					# List valid event types
	--timestamp					# Show timestamp for each printed event
	...args
]

# Output a secret value
extern "virsh secret-get-value" [

	...args
]

# List secrets
extern "virsh secret-list" [
	--ephemeral					# List ephemeral secrets
	--no-ephemeral					# List non-ephemeral secrets
	--private					# List private secrets
	--no-private					# List non-private secrets
	...args
]

# Set a secret value
extern "virsh secret-set-value" [

	...args
]

# Undefine a secret
extern "virsh secret-undefine" [

	...args
]

# Create a snapshot from XML
extern "virsh snapshot-create" [
	--xmlfile					# Domain snapshot XML
	--redefine					# Redefine metadata for existing snapshot
	--current					# With redefine, set current snapshot
	--no-metadata					# Take snapshot but create no metadata
	--halt					# Halt domain after snapshot is created
	--disk-only					# Capture disk state but not vm state
	--reuse-external					# Reuse any existing external files
	--quiesce					# Quiesce guest's file systems
	--atomic					# Require atomic operation
	--live					# Take a live snapshot
	--name					# Name of snapshot
	--description					# Description of snapshot
	--print-xml					# Print XML document rather than create
	--no-metadata					# Take snapshot but create no metadata
	--halt					# Halt domain after snapshot is created
	--disk-only					# Capture disk state but not vm state
	--reuse-external					# Reuse any existing external files
	--quiesce					# Quiesce guest's file systems
	--atomic					# Require atomic operation
	--live					# Take a live snapshot
	--memspec					# Memory attributes: [file=]name[,snapshot=type]
	...args
]

# Create a snapshot from a set of args
extern "virsh snapshot-create-as" [
	--name					# Name of snapshot
	--description					# Description of snapshot
	--print-xml					# Print XML document rather than create
	--no-metadata					# Take snapshot but create no metadata
	--halt					# Halt domain after snapshot is created
	--disk-only					# Capture disk state but not vm state
	--reuse-external					# Reuse any existing external files
	--quiesce					# Quiesce guest's file systems
	--atomic					# Require atomic operation
	--live					# Take a live snapshot
	--memspec					# Memory attributes: [file=]name[,snapshot=type]
	...args
]

# Get or set the current snapshot
extern "virsh snapshot-current" [
	--name					# List the name, rather than the full xml
	--security-info					# Include security sensitive information in XML dump
	--snapshotname					# Name of existing snapshot to make current
	...args
]

# Delete a domain snapshot
extern "virsh snapshot-delete" [
	--snapshotname					# Snapshot name
	--current					# Delete current snapshot
	--children					# Delete snapshot and all children
	--children-only					# Delete children but not snapshot
	--metadata					# Delete only libvirt metadata, leaving snapshot contents behind
	...args
]

# Dump XML for a domain snapshot
extern "virsh snapshot-dumpxml" [
	--security-info					# Include security sensitive information in XML dump
	...args
]

# Edit XML for a snapshot
extern "virsh snapshot-edit" [
	--snapshotname					# Snapshot name
	--current					# Also set edited snapshot as current
	--rename					# Allow renaming an existing snapshot
	--clone					# Allow cloning to new name
	...args
]

# Snapshot information
extern "virsh snapshot-info" [
	--snapshotname					# Snapshot name
	--current					# Info on current snapshot
	...args
]

# List snapshots for a domain
extern "virsh snapshot-list" [
	--parent					# Add a column showing parent snapshot
	--roots					# List only snapshots without parents
	--leaves					# List only snapshots without children
	--no-leaves					# List only snapshots that are not leaves (with children)
	--metadata					# List only snapshots that have metadata that would prevent undefine
	--no-metadata					# List only snapshots that have no metadata managed by libvirt
	--inactive					# Filter by snapshots taken while inactive
	--active					# Filter by snapshots taken while active (system checkpoints)
	--disk-only					# Filter by disk-only snapshots
	--internal					# Filter by internal snapshots
	--external					# Filter by external snapshots
	--tree					# List snapshots in a tree
	--from					# Limit list to children of given snapshot
	--current					# Limit list to children of current snapshot
	--descendants					# With --from, list all descendants
	--name					# List snapshot names only
	...args
]

# Get the name of the parent of a snapshot
extern "virsh snapshot-parent" [
	--snapshotname					# Find parent of snapshot name
	--current					# Find parent of current snapshot
	...args
]

# Revert a domain to a snapshot
extern "virsh snapshot-revert" [
	--snapshotname					# Snapshot name
	--current					# Revert to current snapshot
	--running					# After reverting, change state to running
	--paused					# After reverting, change state to paused
	--force					# Try harder on risky reverts
	...args
]

# Find potential storage pool sources
extern "virsh find-storage-pool-sources-as" [
	--host					# Optional host to query
	--port					# Optional port to query
	--initiator					# Optional initiator IQN to use for query
	...args
]

# Discover potential storage pool sources
extern "virsh find-storage-pool-sources" [
	--host					# Optional host to query
	--port					# Optional port to query
	--initiator					# Optional initiator IQN to use for query
	--srcSpec					# Optional file of source xml to query for pools
	...args
]

# Autostart a pool
extern "virsh pool-autostart" [
	--disable					# Disable autostarting
	...args
]

# Build a pool
extern "virsh pool-build" [
	--no-overwrite					# Do not overwrite any existing data
	--overwrite					# Overwrite any existing data
	...args
]

# Create a pool from a set of args
extern "virsh pool-create-as" [
	--print-xml					# Print XML document, but don't define/create
	--source-host					# Source-host for underlying storage
	--source-path					# Source path for underlying storage
	--source-dev					# Source device for underlying storage
	--source-name					# Source name for underlying storage
	--target					# Target for underlying storage
	--source-format					# Format for underlying storage
	--auth-type					# Auth type to be used for underlying storage
	--auth-username					# Auth username to be used for underlying storage
	--secret-usage					# Auth secret usage to be used for underlying storage
	--secret-uuid					# Auth secret UUID to be used for underlying storage
	--adapter-name					# Adapter name to be used for underlying storage
	--adapter-wwnn					# Adapter wwnn to be used for underlying storage
	--adapter-wwpn					# Adapter wwpn to be used for underlying storage
	--adapter-parent					# Adapter parent to be used for underlying storage
	--build					# Build the pool as normal
	--no-overwrite					# Do not overwrite any existing data
	--overwrite					# Overwrite any existing data
	...args
]

# Create a pool from an XML file
extern "virsh pool-create" [
	--print-xml					# Print XML document, but don't define/create
	--source-host					# Source-host for underlying storage
	--source-path					# Source path for underlying storage
	--source-dev					# Source device for underlying storage
	--source-name					# Source name for underlying storage
	--target					# Target for underlying storage
	--source-format					# Format for underlying storage
	--auth-type					# Auth type to be used for underlying storage
	--auth-username					# Auth username to be used for underlying storage
	--secret-usage					# Auth secret usage to be used for underlying storage
	--secret-uuid					# Auth secret UUID to be used for underlying storage
	--adapter-name					# Adapter name to be used for underlying storage
	--adapter-wwnn					# Adapter wwnn to be used for underlying storage
	--adapter-wwpn					# Adapter wwpn to be used for underlying storage
	--adapter-parent					# Adapter parent to be used for underlying storage
	--build					# Build the pool as normal
	--no-overwrite					# Do not overwrite any existing data
	--overwrite					# Overwrite any existing data
	--build					# Build the pool as normal
	--no-overwrite					# Do not overwrite any existing data
	--overwrite					# Overwrite any existing data
	...args
]

# Define a pool from a set of args
extern "virsh pool-define-as" [
	--print-xml					# Print XML document, but don't define/create
	--source-host					# Source-host for underlying storage
	--source-path					# Source path for underlying storage
	--source-dev					# Source device for underlying storage
	--source-name					# Source name for underlying storage
	--target					# Target for underlying storage
	--source-format					# Format for underlying storage
	--auth-type					# Auth type to be used for underlying storage
	--auth-username					# Auth username to be used for underlying storage
	--secret-usage					# Auth secret usage to be used for underlying storage
	--secret-uuid					# Auth secret UUID to be used for underlying storage
	--adapter-name					# Adapter name to be used for underlying storage
	--adapter-wwnn					# Adapter wwnn to be used for underlying storage
	--adapter-wwpn					# Adapter wwpn to be used for underlying storage
	--adapter-parent					# Adapter parent to be used for underlying storage
	...args
]

# Define or modify an inactive persistent storage pool
extern "virsh pool-define" [
	--print-xml					# Print XML document, but don't define/create
	--source-host					# Source-host for underlying storage
	--source-path					# Source path for underlying storage
	--source-dev					# Source device for underlying storage
	--source-name					# Source name for underlying storage
	--target					# Target for underlying storage
	--source-format					# Format for underlying storage
	--auth-type					# Auth type to be used for underlying storage
	--auth-username					# Auth username to be used for underlying storage
	--secret-usage					# Auth secret usage to be used for underlying storage
	--secret-uuid					# Auth secret UUID to be used for underlying storage
	--adapter-name					# Adapter name to be used for underlying storage
	--adapter-wwnn					# Adapter wwnn to be used for underlying storage
	--adapter-wwpn					# Adapter wwpn to be used for underlying storage
	--adapter-parent					# Adapter parent to be used for underlying storage
	...args
]

# Delete a pool
extern "virsh pool-delete" [

	...args
]

# Destroy (stop) a pool
extern "virsh pool-destroy" [

	...args
]

# Pool information in XML
extern "virsh pool-dumpxml" [
	--inactive					# Show inactive defined XML
	...args
]

# Edit XML configuration for a storage pool
extern "virsh pool-edit" [

	...args
]

# Storage pool information
extern "virsh pool-info" [
	--bytes					# Return pool info in bytes
	...args
]

# List pools
extern "virsh pool-list" [
	--inactive					# List inactive pools
	--all					# List inactive & active pools
	--transient					# List transient pools
	--persistent					# List persistent pools
	--autostart					# List pools with autostart enabled
	--no-autostart					# List pools with autostart disabled
	--type					# Only list pool of specified type(s) (if supported)
	--details					# Display extended details for pools
	--uuid					# List UUID of active pools only
	--name					# List name of active pools only
	...args
]

# Convert a pool UUID to pool name
extern "virsh pool-name" [

	...args
]

# Refresh a pool
extern "virsh pool-refresh" [

	...args
]

# Start a (previously defined) inactive pool
extern "virsh pool-start" [
	--build					# Build the pool as normal
	--no-overwrite					# Do not overwrite any existing data
	--overwrite					# Overwrite any existing data
	...args
]

# Undefine an inactive pool
extern "virsh pool-undefine" [

	...args
]

# Convert a pool name to pool UUID
extern "virsh pool-uuid" [

	...args
]

# Storage Pool Events
extern "virsh pool-event" [
	--pool					# Filter by storage pool name or UUID
	--event					# Which event type to wait for
	--loop					# Loop until timeout or interrupt, rather than one-shot
	--timeout					# Timeout seconds
	--list					# List valid event types
	--timestamp					# Show timestamp for each printed event
	...args
]

# Clone a volume
extern "virsh vol-clone" [
	--pool					# Pool name or UUID
	--prealloc-metadata					# Preallocate metadata (for qcow2 instead of full allocation)
	--reflink					# Use btrfs COW lightweight copy
	...args
]

# Create a volume from a set of args
extern "virsh vol-create-as" [
	--allocation					# Initial allocation size, as scaled integer (default bytes)
	--format					# File format type raw,bochs,qcow,qcow2,qed,vmdk
	--backing-vol					# The backing volume if taking a snapshot
	--backing-vol-format					# Format of backing volume if taking a snapshot
	--prealloc-metadata					# Preallocate metadata (for qcow2 instead of full allocation)
	--print-xml					# Print XML document, but don't define/create
	...args
]

# Create a vol from an XML file
extern "virsh vol-create" [
	--allocation					# Initial allocation size, as scaled integer (default bytes)
	--format					# File format type raw,bochs,qcow,qcow2,qed,vmdk
	--backing-vol					# The backing volume if taking a snapshot
	--backing-vol-format					# Format of backing volume if taking a snapshot
	--prealloc-metadata					# Preallocate metadata (for qcow2 instead of full allocation)
	--print-xml					# Print XML document, but don't define/create
	--prealloc-metadata					# Preallocate metadata (for qcow2 instead of full allocation)
	--inputpool					# Pool name or UUID of the input volume's pool
	--prealloc-metadata					# Preallocate metadata (for qcow2 instead of full allocation)
	--reflink					# Use btrfs COW lightweight copy
	...args
]

# Create a vol, using another volume as input
extern "virsh vol-create-from" [
	--inputpool					# Pool name or UUID of the input volume's pool
	--prealloc-metadata					# Preallocate metadata (for qcow2 instead of full allocation)
	--reflink					# Use btrfs COW lightweight copy
	...args
]

# Delete a vol
extern "virsh vol-delete" [
	--pool					# Pool name or UUID
	--delete-snapshots					# Delete snapshots associated with volume (must be supported by storage driver)
	...args
]

# Download volume contents to a file
extern "virsh vol-download" [
	--pool					# Pool name or UUID
	--offset					# Volume offset to download from
	--length					# Amount of data to download
	--sparse					# Preserve sparseness of volume
	...args
]

# Vol information in XML
extern "virsh vol-dumpxml" [
	--pool					# Pool name or UUID
	...args
]

# Storage vol information
extern "virsh vol-info" [
	--pool					# Pool name or UUID
	--bytes					# Sizes are represented in bytes rather than pretty units
	--physical					# Return the physical size of the volume in allocation field
	...args
]

# Returns the volume key for a given volume name or path
extern "virsh vol-key" [
	--pool					# Pool name or UUID
	...args
]

# List vols
extern "virsh vol-list" [
	--details					# Display extended details for volumes
	...args
]

# Returns the volume name for a given volume key or path
extern "virsh vol-name" [

	...args
]

# Returns the volume path for a given volume name or key
extern "virsh vol-path" [
	--pool					# Pool name or UUID
	...args
]

# Returns the storage pool for a given volume key or path
extern "virsh vol-pool" [
	--uuid					# Return the pool UUID rather than pool name
	...args
]

# Resize a vol
extern "virsh vol-resize" [
	--pool					# Pool name or UUID
	--allocate					# Allocate the new capacity, rather than leaving it sparse
	--delta					# Use capacity as a delta to current size, rather than the new size
	--shrink					# Allow the resize to shrink the volume
	...args
]

# Upload file contents to a volume
extern "virsh vol-upload" [
	--pool					# Pool name or UUID
	--offset					# Volume offset to upload to
	--length					# Amount of data to upload
	--sparse					# Preserve sparseness of volume
	...args
]

# Wipe a vol
extern "virsh vol-wipe" [
	--pool					# Pool name or UUID
	--algorithm					# Perform selected wiping algorithm
	...args
]