# Wait for all of the given paths to be opened/closed before exiting
extern "zed" [
	--wait(-w)					# Wait for all of the given paths to be opened/closed before exiting
	--add(-a)					# Add files to the currently open workspace
	--new(-n)					# Create a new workspace
	--version(-v)					# Print Zed's version and the app path
	--foreground					# Run zed in the foreground (useful for debugging)
	--uninstall					# Uninstall Zed from user system
	--help(-h)					# Print help (see a summary with '-h')
	...args
]