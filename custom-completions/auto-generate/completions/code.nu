# Compare two files with each other
extern "code" [
	--diff(-d)					# Compare two files with each other
	--merge(-m)					# Perform a three-way merge
	--add(-a)					# Add folder(s) to the last active window
	--new-window(-n)					# Force to open a new window
	--reuse-window(-r)					# Force to open a file or folder in an already opened window
	--wait(-w)					# Wait for the files to be closed before returning
	--user-data-dir					# Specifies the directory that user data is kept in
	--profile					# Opens the provided folder or workspace with the given profile
	--version(-v)					# Print version
	--help(-h)					# Print usage
	--list-extensions					# List the installed extensions
	--show-versions					# Show versions of installed extensions
	--install-extension					# Installs or updates the extension
	--force					# Updates to the latest version
	--pre-release					# Installs the pre-release version
	--update-extensions					# Update the installed extensions
	--enable-proposed-api					# Enables proposed API features for extensions
	--uninstall-extension					# Uninstall extension
	--disable-extension					# Disable extension(s)
	--disable-extensions					# Disable all installed extensions
	--verbose					# Print verbose output (implies --wait)
	--log					# Log level to use (default: info)
	--status(-s)					# Print process usage and diagnostics information
	--prof-startup					# Run CPU profiler during startup
	--sync					# Turn sync on or off
	--disable-lcd-text					# Disable LCD font rendering
	--disable-gpu					# Disable GPU hardware acceleration
	--disable-chromium-sandbox					# Disable the Chromium sandbox environment
	--telemetry					# Shows all telemetry events which VS code collects
	...args
]