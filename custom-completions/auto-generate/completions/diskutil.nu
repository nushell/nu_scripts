# List disks
extern "diskutil list" [

	...args
]

# Return a property list
extern "diskutil" [

	...args
]

# Get detailed information about a specific whole disk or partition
extern "diskutil info" [

	...args
]

# Continuously display system-wide disk manipulation activity
extern "diskutil activity" [

	...args
]

# Show the file system personalities available
extern "diskutil listFilesystems" [

	...args
]

# Unmount a single volume
extern "diskutil umount" [

	...args
]

# Unmount an entire disk (all volumes)
extern "diskutil umountDisk" [

	...args
]

# Eject a disk
extern "diskutil eject" [

	...args
]

# Mount a single volume
extern "diskutil mount" [

	...args
]

# Mount an entire disk (all mountable volumes)
extern "diskutil mountDisk" [

	...args
]

# Rename a volume
extern "diskutil rename" [

	...args
]

# Enable journaling on an HFS+ volume
extern "diskutil enableJournal" [

	...args
]

# Disable journaling on an HFS+ volume
extern "diskutil disableJournal" [

	...args
]

# Create a 512MB Apple_Journal partition
extern "diskutil moveJournal" [

	...args
]

# Enable ownership of a volume
extern "diskutil enableOwnership" [

	...args
]

# Disable ownership of a volume
extern "diskutil disableOwnership" [

	...args
]

# Verify the file system data structures of a volume
extern "diskutil verifyVolume" [

	...args
]

# Repair the file system data structures of a volume
extern "diskutil repairVolume" [

	...args
]

# Verify the partition map layout of a whole disk
extern "diskutil verifyDisk" [

	...args
]

# Repair the partition map layout of a whole disk
extern "diskutil repairDisk" [

	...args
]

# Erase an existing disk
extern "diskutil eraseDisk" [

	...args
]

# Erase an existing volume by writing out a new empty file system
extern "diskutil reformat" [

	...args
]

# Erase optical media (CD/RW, DVD/RW, etc.)
extern "diskutil eraseOptical" [

	...args
]

# Erase a device, writing zeros to the media
extern "diskutil zeroDisk" [

	...args
]

# Erase a whole disk, writing random data to the media
extern "diskutil randomDisk" [

	...args
]

# Erase, using a secure method
extern "diskutil secureErase" [

	...args
]

# (re)Partition a disk, removing all volumes
extern "diskutil partitionDisk" [

	...args
]

# Non-destructively resize a volume (partition)
extern "diskutil resizeVolume" [

	...args
]

# Destructively split a volume into multiple partitions
extern "diskutil splitPartition" [

	...args
]

# Merge two or more partitions on a disk
extern "diskutil mergePartitions" [

	...args
]

# Merge two or more partitions on a disk
extern "diskutil apfs" [

	...args
]

# Nondestructively convert from HFS to APFS
extern "diskutil convert" [

	...args
]

# Create a new APFS Container with one APFS Volume
extern "diskutil create" [

	...args
]

# Create a new empty APFS Container
extern "diskutil createContainer" [

	...args
]

# Delete an APFS Container and reformat disks to HFS
extern "diskutil deleteContainer" [

	...args
]

# Resize an APFS Container and its disk space usage
extern "diskutil resizeContainer" [

	...args
]

# Export a new APFS Volume from an APFS Container
extern "diskutil addVolume" [

	...args
]

# Remove an APFS Volume from its APFS Container
extern "diskutil deleteVolume" [

	...args
]

# Erase contents of, but keep, an APFS Volume
extern "diskutil eraseVolume" [

	...args
]

# Change the Role metadata bits of an APFS Volume
extern "diskutil changeVolumeRole" [

	...args
]

# Unlock an encrypted APFS Volume which is locked
extern "diskutil unlockVolume" [

	...args
]

# Lock an encrypted APFS Volume (diskutil unmount)
extern "diskutil lockVolume" [

	...args
]

# List cryptographic users of encrypted APFS Volume
extern "diskutil listCryptoUsers" [

	...args
]

# Change the passphrase of a cryptographic user
extern "diskutil changePassphrase" [

	...args
]

# Set or clear passphrase hint of a cryptographic user
extern "diskutil setPassphraseHint" [

	...args
]

# Start async encryption of an unencrypted APFS Volume
extern "diskutil encryptVolume" [

	...args
]

# Start async decryption of an encrypted APFS Volume
extern "diskutil decryptVolume" [

	...args
]

# Update the APFS Volumes related APFS Preboot Volume
extern "diskutil updatePreboot" [

	...args
]

# Create, manipulate and destroy AppleRAID volumes
extern "diskutil appleRAID" [

	...args
]

# Delete an existing RAID set
extern "diskutil delete" [

	...args
]

# Repair a damaged RAID mirror set
extern "diskutil repairMirror" [

	...args
]

# Add a spare or member disk to an existing RAID
extern "diskutil add" [

	...args
]

# Remove a spare or member disk from an existing RAID
extern "diskutil remove" [

	...args
]

# Convert a volume into a single disk RAID set
extern "diskutil enable" [

	...args
]

# Update the settings of an existing RAID
extern "diskutil update" [

	...args
]

# Create, manipulate and destroy CoreStorage volumes
extern "diskutil coreStorage" [

	...args
]

# Revert a CoreStorage volume to its native type
extern "diskutil revert" [

	...args
]

# Create a new CoreStorage logical volume
extern "diskutil createVolume" [

	...args
]

# Change a CoreStorage logical volumes passphrase
extern "diskutil changeVolumePassphrase" [

	...args
]

# Resize a CoreStorage physical volume disk
extern "diskutil resizeDisk" [

	...args
]

# Resize a CoreStorage logical/physical volume set
extern "diskutil resizeStack" [

	...args
]