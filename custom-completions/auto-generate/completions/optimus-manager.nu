# Set the GPU mode to MODE. You need to log out then log in to apply the change
extern "optimus-manager" [
	--switch					# Set the GPU mode to MODE. You need to log out then log in to apply the change
	--help(-h)					# show this help message and exit
	--version(-v)					# Print version and exit
	--status					# Print current status of optimus-manager
	--print-mode					# Print the GPU mode that your current desktop session is running on
	--print-next-mode					# Print the GPU mode that will be used the next time you log into your session
	--print-startup					# Print the GPU mode that will be used on startup
	--unset-temp-config					# Undo --temp-config (unset temp config path)
	--no-confirm					# Do not ask for confirmation and skip all warnings when switching GPUs
	--cleanup					# Remove auto-generated configuration files left over by the daemon
	...args
]