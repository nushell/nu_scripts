# Starts the keylogging daemon
extern "logkeys" [
	--start(-s)					# Starts the keylogging daemon
	--kill(-k)					# Terminates the logkeys daemon
	--output(-o)					# Set output LOGFILE
	--keymap(-m)					# Use file as input KEYMAP
	--device(-d)					# Use DEVICE as keyboard input
	--us-keymap(-u)					# Treat keyboard as standard US keyboard
	--export-keymap					# Export dynamic KEYMAP to file
	--no-func-keys					# Log only character key presses
	--no-timestamps					# No timestamp to each line of log
	--post-size					# On SIZE, rotate current logfile
	--post-http					# POST the log file to URL
	...args
]