# Shows help
extern "udisksctl" [

	...args
]

# Shows help
extern "udisksctl help" [

	...args
]

# Shows information about an object
extern "udisksctl info" [
	--object-path(-p)					# Object to get information about
	--drive(-d)					# Drive to get information about
	...args
]

# Shows information about all objects
extern "udisksctl dump" [

	...args
]

# Shows high-level status
extern "udisksctl status" [

	...args
]

# Monitor changes to objects
extern "udisksctl monitor" [

	...args
]

# Mount a filesystem
extern "udisksctl mount" [
	--force(-f)					# Force/layzy unmount
	--no-user-interaction					# Do not authenticate the user if needed
	...args
]

# Unmount a filesystem
extern "udisksctl unmount" [
	--force(-f)					# Force/layzy unmount
	--no-user-interaction					# Do not authenticate the user if needed
	...args
]

# Unlock an encrypted device
extern "udisksctl unlock" [
	--no-user-interaction					# Do not authenticate the user if needed
	...args
]

# Lock an encrypted device
extern "udisksctl lock" [
	--no-user-interaction					# Do not authenticate the user if needed
	...args
]

# Set-up a loop device
extern "udisksctl loop-setup" [
	--file(-f)					# File to set-up a loop device for
	--read-only(-r)					# Setup read-only device
	--no-user-interaction					# Do not authenticate the user if needed
	...args
]

# Delete a loop device
extern "udisksctl loop-delete" [
	--object-path(-p)					# Object for loop device to delete
	--block-device(-b)					# Loop device to delete
	--no-user-interaction					# Do not authenticate the user if needed
	...args
]

# Safely power off a drive
extern "udisksctl power-off" [
	--no-user-interaction					# Do not authenticate the user if needed
	...args
]

# Set SMART data for a drive
extern "udisksctl smart-simulate" [
	--file(-f)					# File with libatasmart blob
	--no-user-interaction					# Do not authenticate the user if needed
	...args
]