# Show status of EFI variables
extern "bootctl status" [

	...args
]

# Install systemd-boot
extern "bootctl install" [

	...args
]

# Update systemd-boot
extern "bootctl update" [

	...args
]

# Remove systemd-boot
extern "bootctl remove" [

	...args
]

# Test whether systemd-boot is installed
extern "bootctl is-installed" [

	...args
]

# Initialize random seed
extern "bootctl random-seed" [

	...args
]

# Query or set system options string
extern "bootctl systemd-efi-options" [

	...args
]

# Query or set reboot-to-firmware EFI flag
extern "bootctl reboot-to-firmware" [

	...args
]

# 
extern "bootctl true false" [

	...args
]

# List boot loader entries
extern "bootctl list" [

	...args
]

# Set default boot loader entry
extern "bootctl set-default" [

	...args
]

# Set default boot loader entry (Once)
extern "bootctl set-oneshot" [

	...args
]

# Show this help
extern "bootctl" [

	...args
]