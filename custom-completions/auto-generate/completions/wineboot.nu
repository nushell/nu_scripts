# Show help and exit
extern "wineboot" [
	--help(-h)					# Show help and exit
	--end-session(-e)					# End current session cleanly
	--force(-f)					# Force exit processes dont exit cleanly
	--init(-i)					# Perform initialization for first Wine instance
	--kill(-k)					# Kill processes without cleanup
	--restart(-r)					# Restart
	--shutdown(-s)					# Shutdown
	--update(-u)					# Update wineprefix directory
	...args
]