# Start htop in monochrome mode
extern "htop" [
	--no-color(-C)					# Start htop in monochrome mode
	--no-colour					# Start htop in monochrome mode
	--help(-h)					# Show help and exit
	--pid(-p)					# Show only given PIDs
	--sort-key(-s)					# Sort column
	--user(-u)					# Monitor given user
	--no-unicode(-U)					# Do not use unicode but ASCII characters for graph meters
	--no-mouse(-M)					# Disable support of mouse control
	--readonly					# Disable all system and process changing features
	--version(-V)					# Show version and exit
	--tree(-t)					# Show processes in tree view
	--drop-capabilities					# Drop unneeded Linux capabilities (Requires libpcap support)
	...args
]