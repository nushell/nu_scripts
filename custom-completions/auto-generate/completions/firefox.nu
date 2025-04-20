# Make X calls synchronous
extern "firefox" [
	--sync					# Make X calls synchronous
	--g-fatal-warnings					# Make all warnings fatal
	--help(-h)					# Print this message
	--version(-v)					# Print Firefox version
	--full-version					# Print Firefox version, build and platform build ids
	--migration					# Start with migration wizard
	--ProfileManager					# Start with ProfileManager
	--no-remote					# Do not accept or send remote commands implies --new-instance
	--new-instance					# Open new instance, not a new window in running instance
	--safe-mode					# Disables extensions and themes for this session
	--allow-downgrade					# Allows downgrading a profile
	--headless					# Run without a GUI
	--jsdebugger					# Open the Browser Toolbox
	--wait-for-jsdebugger					# Spin event loop until JS debugger connects
	--start-debugger-server					# Start the devtools server on a TCP port or Unix domain socket path
	--browser					# Open a browser window
	--preferences					# Open Preferences dialog
	--screenshot					# Save screenshot to <path> or in working directory
	--setDefaultBrowser					# Set this app as the default browser
	--first-startup					# Run post-install actions before opening a new window
	--kiosk					# Start the browser in kiosk mode
	--disable-pinch					# Disable touch-screen and touch-pad pinch gestures
	--jsconsole					# Open the Browser Console
	--devtools					# Open DevTools on initial load
	--marionette					# Enable remote control server
	--remote-debugging-port					# Start the Firefox Remote Agent
	...args
]