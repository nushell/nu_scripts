# Verbose mode
extern "grub-install" [
	--verbose(-v)					# Verbose mode
	--allow-floppy					# Make drive also bootable as floppy
	--force					# Install even if problems are detected
	--force-file-id					# Use identifier file even if UUID is available
	--no-bootsector					# Do not install bootsector
	--no-nvram					# Dont update the boot-device/Boot* NVRAM variables
	--no-rs-codes					# Dont apply any reed-solomon codes when embedding core.img
	--recheck					# Delete device map if it already exists
	--removable					# The installation is removable
	--skip-fs-probe(-s)					# Do not probe for filesystems
	--help(-?)					# Show help
	--usage					# Show usage
	--version					# Show version
	...args
]