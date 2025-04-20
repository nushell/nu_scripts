# Shows help
extern "udisksctl" [
	--help					# Shows help
	--object-path(-p)					# Object to get information about
	--drive(-d)					# Drive to get information about
	--force(-f)					# Force/layzy unmount
	--file(-f)					# File to set-up a loop device for
	--read-only(-r)					# Setup read-only device
	--object-path(-p)					# Object for loop device to delete
	--block-device(-b)					# Loop device to delete
	--file(-f)					# File with libatasmart blob
	--no-user-interaction					# Do not authenticate the user if needed
	...args
]

# Shows help
extern "udisksctl help" [
	--help					# Shows help
	--object-path(-p)					# Object to get information about
	--drive(-d)					# Drive to get information about
	--force(-f)					# Force/layzy unmount
	--file(-f)					# File to set-up a loop device for
	--read-only(-r)					# Setup read-only device
	--object-path(-p)					# Object for loop device to delete
	--block-device(-b)					# Loop device to delete
	--file(-f)					# File with libatasmart blob
	--no-user-interaction					# Do not authenticate the user if needed
	...args
]

# Shows information about an object
extern "udisksctl info" [
	--help					# Shows help
	--object-path(-p)					# Object to get information about
	--drive(-d)					# Drive to get information about
	--force(-f)					# Force/layzy unmount
	--file(-f)					# File to set-up a loop device for
	--read-only(-r)					# Setup read-only device
	--object-path(-p)					# Object for loop device to delete
	--block-device(-b)					# Loop device to delete
	--file(-f)					# File with libatasmart blob
	--no-user-interaction					# Do not authenticate the user if needed
	...args
]

# Shows information about all objects
extern "udisksctl dump" [
	--help					# Shows help
	--object-path(-p)					# Object to get information about
	--drive(-d)					# Drive to get information about
	--force(-f)					# Force/layzy unmount
	--file(-f)					# File to set-up a loop device for
	--read-only(-r)					# Setup read-only device
	--object-path(-p)					# Object for loop device to delete
	--block-device(-b)					# Loop device to delete
	--file(-f)					# File with libatasmart blob
	--no-user-interaction					# Do not authenticate the user if needed
	...args
]

# Shows high-level status
extern "udisksctl status" [
	--help					# Shows help
	--object-path(-p)					# Object to get information about
	--drive(-d)					# Drive to get information about
	--force(-f)					# Force/layzy unmount
	--file(-f)					# File to set-up a loop device for
	--read-only(-r)					# Setup read-only device
	--object-path(-p)					# Object for loop device to delete
	--block-device(-b)					# Loop device to delete
	--file(-f)					# File with libatasmart blob
	--no-user-interaction					# Do not authenticate the user if needed
	...args
]

# Monitor changes to objects
extern "udisksctl monitor" [
	--help					# Shows help
	--object-path(-p)					# Object to get information about
	--drive(-d)					# Drive to get information about
	--force(-f)					# Force/layzy unmount
	--file(-f)					# File to set-up a loop device for
	--read-only(-r)					# Setup read-only device
	--object-path(-p)					# Object for loop device to delete
	--block-device(-b)					# Loop device to delete
	--file(-f)					# File with libatasmart blob
	--no-user-interaction					# Do not authenticate the user if needed
	...args
]

# Mount a filesystem
extern "udisksctl mount" [
	--help					# Shows help
	--object-path(-p)					# Object to get information about
	--drive(-d)					# Drive to get information about
	--force(-f)					# Force/layzy unmount
	--file(-f)					# File to set-up a loop device for
	--read-only(-r)					# Setup read-only device
	--object-path(-p)					# Object for loop device to delete
	--block-device(-b)					# Loop device to delete
	--file(-f)					# File with libatasmart blob
	--no-user-interaction					# Do not authenticate the user if needed
	...args
]

# Unmount a filesystem
extern "udisksctl unmount" [
	--help					# Shows help
	--object-path(-p)					# Object to get information about
	--drive(-d)					# Drive to get information about
	--force(-f)					# Force/layzy unmount
	--file(-f)					# File to set-up a loop device for
	--read-only(-r)					# Setup read-only device
	--object-path(-p)					# Object for loop device to delete
	--block-device(-b)					# Loop device to delete
	--file(-f)					# File with libatasmart blob
	--no-user-interaction					# Do not authenticate the user if needed
	...args
]

# Unlock an encrypted device
extern "udisksctl unlock" [
	--help					# Shows help
	--object-path(-p)					# Object to get information about
	--drive(-d)					# Drive to get information about
	--force(-f)					# Force/layzy unmount
	--file(-f)					# File to set-up a loop device for
	--read-only(-r)					# Setup read-only device
	--object-path(-p)					# Object for loop device to delete
	--block-device(-b)					# Loop device to delete
	--file(-f)					# File with libatasmart blob
	--no-user-interaction					# Do not authenticate the user if needed
	...args
]

# Lock an encrypted device
extern "udisksctl lock" [
	--help					# Shows help
	--object-path(-p)					# Object to get information about
	--drive(-d)					# Drive to get information about
	--force(-f)					# Force/layzy unmount
	--file(-f)					# File to set-up a loop device for
	--read-only(-r)					# Setup read-only device
	--object-path(-p)					# Object for loop device to delete
	--block-device(-b)					# Loop device to delete
	--file(-f)					# File with libatasmart blob
	--no-user-interaction					# Do not authenticate the user if needed
	...args
]

# Set-up a loop device
extern "udisksctl loop-setup" [
	--help					# Shows help
	--object-path(-p)					# Object to get information about
	--drive(-d)					# Drive to get information about
	--force(-f)					# Force/layzy unmount
	--file(-f)					# File to set-up a loop device for
	--read-only(-r)					# Setup read-only device
	--object-path(-p)					# Object for loop device to delete
	--block-device(-b)					# Loop device to delete
	--file(-f)					# File with libatasmart blob
	--no-user-interaction					# Do not authenticate the user if needed
	...args
]

# Delete a loop device
extern "udisksctl loop-delete" [
	--help					# Shows help
	--object-path(-p)					# Object to get information about
	--drive(-d)					# Drive to get information about
	--force(-f)					# Force/layzy unmount
	--file(-f)					# File to set-up a loop device for
	--read-only(-r)					# Setup read-only device
	--object-path(-p)					# Object for loop device to delete
	--block-device(-b)					# Loop device to delete
	--file(-f)					# File with libatasmart blob
	--no-user-interaction					# Do not authenticate the user if needed
	...args
]

# Safely power off a drive
extern "udisksctl power-off" [
	--help					# Shows help
	--object-path(-p)					# Object to get information about
	--drive(-d)					# Drive to get information about
	--force(-f)					# Force/layzy unmount
	--file(-f)					# File to set-up a loop device for
	--read-only(-r)					# Setup read-only device
	--object-path(-p)					# Object for loop device to delete
	--block-device(-b)					# Loop device to delete
	--file(-f)					# File with libatasmart blob
	--no-user-interaction					# Do not authenticate the user if needed
	...args
]

# Set SMART data for a drive
extern "udisksctl smart-simulate" [
	--help					# Shows help
	--object-path(-p)					# Object to get information about
	--drive(-d)					# Drive to get information about
	--force(-f)					# Force/layzy unmount
	--file(-f)					# File to set-up a loop device for
	--read-only(-r)					# Setup read-only device
	--object-path(-p)					# Object for loop device to delete
	--block-device(-b)					# Loop device to delete
	--file(-f)					# File with libatasmart blob
	--no-user-interaction					# Do not authenticate the user if needed
	...args
]