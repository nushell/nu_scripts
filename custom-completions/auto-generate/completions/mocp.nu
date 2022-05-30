# Print program version
extern "mocp" [
	--version(-V)					# Print program version
	--help(-h)					# Print usage
	--debug(-D)					# Turn on logging to a file
	--server(-S)					# Run only the server
	--foreground(-F)					# Run server in foreground, log to stdout
	--sound-driver(-R)					# Use the specified sound driver
	--clear(-c)					# Clear the playlist
	--stop(-s)					# Stop playing
	--next(-f)					# Play next song
	--previous(-r)					# Play previous song
	--exit(-x)					# Shutdown the server
	--pause(-P)					# Pause
	--unpause(-U)					# Unpause
	--toggle-pause(-G)					# Toggle between play/pause
	--volume(-v)					# (+/-)LEVEL Adjust PCM volume
	--sync(-y)					# Synchronize the playlist with other clients
	--nosync(-n)					# Don't synchronize the playlist with other clients
	--ascii(-A)					# Use ASCII characters to draw lines
	--info(-i)					# Print information about the currently played file
	--recursively(-e)					# Alias for -a
	--on(-o)					# Turn on a control
	--off(-u)					# Turn off a control
	--toggle(-t)					# Toggle a control
	...args
]