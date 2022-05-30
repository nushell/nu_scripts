# Run in development mode
extern "atom" [
	--dev(-d)					# Run in development mode
	--foreground(-f)					# Keep main process in foreground
	--help(-h)					# Print usage message
	--new-window(-n)					# Open a new window
	--profile-startup					# Profile startup execution time
	--safe					# Run in safe mode
	--benchmark					# Run the specified benchmarks in a new window
	--benchmark-test					# Run a faster version of the benchmarks in headless mode
	--test(-t)					# Run the specified specs and exit with error code on failures
	--main-process(-m)					# Run the specified specs in the main process
	--version(-v)					# Print the version information
	--wait(-w)					# Wait for editor to be closed before returning
	--clear-window-state					# Delete all Atom environment state
	--enable-electron-logging					# Enable low-level logging messages from Electron
	--add(-a)					# Open path as a new project in last used window
	...args
]