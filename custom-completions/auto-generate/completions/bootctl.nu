# Show status of EFI variables
extern "bootctl status" [
	--help(-h)					# Show this help
	--version					# Print version
	--print-esp-path(-p)					# Print path to the EFI System Partition
	--print-boot-path(-x)					# Print path to the $BOOT partition
	--no-variables					# Do not touch EFI variables
	--no-pager					# Do not pipe output into a pager
	--graceful					# Do not print fail
	...args
]

# Install systemd-boot
extern "bootctl install" [
	--help(-h)					# Show this help
	--version					# Print version
	--print-esp-path(-p)					# Print path to the EFI System Partition
	--print-boot-path(-x)					# Print path to the $BOOT partition
	--no-variables					# Do not touch EFI variables
	--no-pager					# Do not pipe output into a pager
	--graceful					# Do not print fail
	...args
]

# Update systemd-boot
extern "bootctl update" [
	--help(-h)					# Show this help
	--version					# Print version
	--print-esp-path(-p)					# Print path to the EFI System Partition
	--print-boot-path(-x)					# Print path to the $BOOT partition
	--no-variables					# Do not touch EFI variables
	--no-pager					# Do not pipe output into a pager
	--graceful					# Do not print fail
	...args
]

# Remove systemd-boot
extern "bootctl remove" [
	--help(-h)					# Show this help
	--version					# Print version
	--print-esp-path(-p)					# Print path to the EFI System Partition
	--print-boot-path(-x)					# Print path to the $BOOT partition
	--no-variables					# Do not touch EFI variables
	--no-pager					# Do not pipe output into a pager
	--graceful					# Do not print fail
	...args
]

# Test whether systemd-boot is installed
extern "bootctl is-installed" [
	--help(-h)					# Show this help
	--version					# Print version
	--print-esp-path(-p)					# Print path to the EFI System Partition
	--print-boot-path(-x)					# Print path to the $BOOT partition
	--no-variables					# Do not touch EFI variables
	--no-pager					# Do not pipe output into a pager
	--graceful					# Do not print fail
	...args
]

# Initialize random seed
extern "bootctl random-seed" [
	--help(-h)					# Show this help
	--version					# Print version
	--print-esp-path(-p)					# Print path to the EFI System Partition
	--print-boot-path(-x)					# Print path to the $BOOT partition
	--no-variables					# Do not touch EFI variables
	--no-pager					# Do not pipe output into a pager
	--graceful					# Do not print fail
	...args
]

# Query or set system options string
extern "bootctl systemd-efi-options" [
	--help(-h)					# Show this help
	--version					# Print version
	--print-esp-path(-p)					# Print path to the EFI System Partition
	--print-boot-path(-x)					# Print path to the $BOOT partition
	--no-variables					# Do not touch EFI variables
	--no-pager					# Do not pipe output into a pager
	--graceful					# Do not print fail
	...args
]

# Query or set reboot-to-firmware EFI flag
extern "bootctl reboot-to-firmware" [
	--help(-h)					# Show this help
	--version					# Print version
	--print-esp-path(-p)					# Print path to the EFI System Partition
	--print-boot-path(-x)					# Print path to the $BOOT partition
	--no-variables					# Do not touch EFI variables
	--no-pager					# Do not pipe output into a pager
	--graceful					# Do not print fail
	...args
]

# 
extern "bootctl true false" [
	--help(-h)					# Show this help
	--version					# Print version
	--print-esp-path(-p)					# Print path to the EFI System Partition
	--print-boot-path(-x)					# Print path to the $BOOT partition
	--no-variables					# Do not touch EFI variables
	--no-pager					# Do not pipe output into a pager
	--graceful					# Do not print fail
	...args
]

# List boot loader entries
extern "bootctl list" [
	--help(-h)					# Show this help
	--version					# Print version
	--print-esp-path(-p)					# Print path to the EFI System Partition
	--print-boot-path(-x)					# Print path to the $BOOT partition
	--no-variables					# Do not touch EFI variables
	--no-pager					# Do not pipe output into a pager
	--graceful					# Do not print fail
	...args
]

# Set default boot loader entry
extern "bootctl set-default" [
	--help(-h)					# Show this help
	--version					# Print version
	--print-esp-path(-p)					# Print path to the EFI System Partition
	--print-boot-path(-x)					# Print path to the $BOOT partition
	--no-variables					# Do not touch EFI variables
	--no-pager					# Do not pipe output into a pager
	--graceful					# Do not print fail
	...args
]

# Set default boot loader entry (Once)
extern "bootctl set-oneshot" [
	--help(-h)					# Show this help
	--version					# Print version
	--print-esp-path(-p)					# Print path to the EFI System Partition
	--print-boot-path(-x)					# Print path to the $BOOT partition
	--no-variables					# Do not touch EFI variables
	--no-pager					# Do not pipe output into a pager
	--graceful					# Do not print fail
	...args
]

# Set default boot loader timeout
extern "bootctl set-timeout" [
	--help(-h)					# Show this help
	--version					# Print version
	--print-esp-path(-p)					# Print path to the EFI System Partition
	--print-boot-path(-x)					# Print path to the $BOOT partition
	--no-variables					# Do not touch EFI variables
	--no-pager					# Do not pipe output into a pager
	--graceful					# Do not print fail
	...args
]

# Set default boot loader timeout (Once)
extern "bootctl set-timeout-oneshot" [
	--help(-h)					# Show this help
	--version					# Print version
	--print-esp-path(-p)					# Print path to the EFI System Partition
	--print-boot-path(-x)					# Print path to the $BOOT partition
	--no-variables					# Do not touch EFI variables
	--no-pager					# Do not pipe output into a pager
	--graceful					# Do not print fail
	...args
]

# Show this help
extern "bootctl" [
	--help(-h)					# Show this help
	--version					# Print version
	--print-esp-path(-p)					# Print path to the EFI System Partition
	--print-boot-path(-x)					# Print path to the $BOOT partition
	--no-variables					# Do not touch EFI variables
	--no-pager					# Do not pipe output into a pager
	--graceful					# Do not print fail
	...args
]