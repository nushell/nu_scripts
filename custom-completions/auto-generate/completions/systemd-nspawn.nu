# Run container with a temporary btrfs snapshot (Only on btrfs)
extern "systemd-nspawn" [
	--ephemeral(-x)					# Run container with a temporary btrfs snapshot (Only on btrfs)
	--boot(-b)					# Invoke init in the container
	--uuid					# Set the specified UUID for the container.
	--slice					# Make the container part of the specified slice
	--property					# Set a unit property on the scope unit
	--private-users					# Enables user namespacing
	--private-network					# Disconnect networking of the container from the host
	--selinux-context(-Z)					# Sets the SELinux security context
	--selinux-apifs-context(-L)					# Sets the SELinux security context for files in the API filesystems
	--capability					# Grant additional capabilities to the container
	--drop-capability					# Drop capabilities from the container
	--kill-signal					# Signal to send to the container's PID1 when nspawn receives SIGTERM
	--read-only					# Mount the root file system read-only for the container
	--setenv					# Pass environment variables to init in the container
	--share-system					# Share the system with the host [See Man Page]
	--keep-unit					# Only register the unit with systemd-machined
	--personality					# The architecture reported by uname in the container
	--quiet(-q)					# Turns off any status output by the tool itself
	--volatile					# Boots the container in volatile mode
	--help(-h)					# Print a short help text and exit
	--version					# Print a short version string and exit
	...args
]