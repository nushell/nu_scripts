# Flash all partitions from $ANDROID_PRODUCT_OUT. On A/B devices, flashed slot is set as active. Secondary images may be flashed to inactive slot.
export extern "fastboot flashall" []


# Flash given partition, using the image from $ANDROID_PRODUCT_OUT if no filename is given.
export extern "fastboot flash" [
    partation: string 
    filename?: string # [Default: $ANDROID_PRODUCT_OUT]
]


# Flash all partitions from an update.zip package.
export extern "fastboot update" [
    ZIP: string
]


# List devices in bootloader
export extern "fastboot devices" [
    -l # with device paths
]

# ===================Basics========================================== # 


#  Lock partitions for flashing
export extern "fastboot flashing lock" []

# Unlock partitions for flashing
export extern "fastboot flashing unlock" []

# Lock 'critical' bootloader partitions.
export extern "fastboot flashing lock_critical" []

# Unlock 'critical' bootloader partitions.
export extern "fastboot flashing unlock_critical" []

# Check whether unlocking is allowed (1) or not(0).
export extern "fastboot flashing get_unlock_ability" []



# =========================advanced=================================== #

# Erase a flash partition.
export extern "fastboot erase" [
    paration: string
]

# Format a flash partition.
export extern "fastboot format" [
    partation: string
]

# Set the active slot.
export extern "fastboot set_active" [
    slot_name: string
]

# Execute OEM-specific command.
export extern "fastboot oem" [
    command: string
]

# Wipe a GSI installation (fastbootd only).
export extern "fastboot gsi wipe" []

# Disable  a GSI installation (fastbootd only).
export extern "fastboot gsi disable" []

# Show status of a GSI installation (fastbootd only).
export extern "fastboot gsi status" []

# Wipe the super partition. This will reset it to contain an empty set of default dynamic partitions.
export extern "fastboot wipe-super" [
    super_empty: string
]


# Create a logical partition with the given name and size, in the super partition.
export extern "fastboot create-logical-partition" [
    name: string
    size: string
]

# Change the size of the named logical partition.
export extern "fastboot resize-logical-partition" [
    name: string
    size: string
]

# Delete a logical partition with the given name.
export extern "fastboot delete-logical-partition" [
    name: string
]

# On devices that support snapshot-based updates, cancel an in-progress update. This may make the device unbootable until it is reflashed.
export extern "fastboot snapshot-update cancel" []

# On devices that support snapshot-based updates, finish an in-progress update if it is in the "merging" phase.
export extern "fastboot snapshot-update merge" []

# Fetch a partition image from the device.
export extern "fastboot fetch" [
    PARTITION: string
    OUT_FILE: string
]

# Download and boot kernel from RAM.
export extern "fastboot boot" [
    kernel: string
    ramdisk?: string
    second_ramdisk?: string
]

# Create boot image and flash it.
export extern "fastboot flash:raw" [
    partation: string
    kernel: string
    ramdisk?: string
    second_ramdisk?: string
    --dtb:string                  # Specify path to DTB for boot image header version 2.
    --cmdline:string             # Override kernel command line.
    --kernel-offset:string            # Set kernel offset (default: 0x00008000).
    --ramdisk-offset:string            # Set ramdisk offset (default: 0x01000000).
    --tags-offset:string              # Set tags offset (default: 0x00000100).
    --dtb-offset:string                # Set dtb offset (default: 0x01100000).
    --page-size:string           # Set flash page size (default: 2048).
    --header-version:string    # Set boot image header version.
    --os-version:string  # Set boot image OS version (default: 0.0.0). MAJOR[.MINOR[.PATCH]]
    --os-patch-level: string  # Set boot image OS security patch level. YYYY-MM-DD
]

# Sends given file to stage for the next command.
export extern "fastboot stage" [
    IN_FILE: string
]


#  Writes data staged by the last command to a file.
export extern "fastboot get_staged" [
    OUT_FILE:string
]

export extern "fastboot" [
    -w              # Wipe userdata.
    -s: string  # Specify a USB/Network device. [ SERIAL |  tcp|udp:HOST[:PORT] ]
    -S:string   # Break into sparse files no larger than SIZE. SIZE[K|M|G]
    --force  #  Force a flash operation that may be unsafe.
    --slot: string # Use SLOT; 'all' for both slots, 'other' for non-current slot (default: current active slot).
    --set-active:string #  Sets the active slot before rebooting.
    --skip-secondary # Don't flash secondary slots in flashall/update.
    --skip-reboot #  Don't reboot device after flashing.
    --disable-verity # Sets disable-verity when flashing vbmeta.
    --disable-verification # Sets disable-verification when flashing vbmeta.
    --disable-super-optimization # Disables optimizations on flashing super partition.
    --disable-fastboot-info # Will collects tasks from image list rather than $OUT/fastboot-info.txt
    --fs-options # Enable filesystem features. OPTION supports casefold, projid, compress
    --unbuffered #  Don't buffer input or output.
    --verbose(-v) #  Verbose output.
    --version # Display version.
    --help(-h) # Show help message.

]