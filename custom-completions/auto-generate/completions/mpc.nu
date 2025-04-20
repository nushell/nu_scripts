# 
extern "" [

	...args
]

# Configure the format used to display songs
extern "mpc" [
	--format(-f)					# Configure the format used to display songs
	--wait					# Wait for operation to finish (e. g.  database update)
	--range					# Operate on a range
	--no-status(-q)					# Prevents the current song status from being printed
	--verbose					# Verbose output
	--host
	--port(-p)
	--move					# Change position of song in queue
	...args
]

# Toggle consume mode if state is not specified
extern "mpc consume" [
	--format(-f)					# Configure the format used to display songs
	--wait					# Wait for operation to finish (e. g.  database update)
	--range					# Operate on a range
	--no-status(-q)					# Prevents the current song status from being printed
	--verbose					# Verbose output
	--host
	--port(-p)
	--move					# Change position of song in queue
	...args
]

# Get and set current amount of crossfading
extern "mpc crossfade" [
	--format(-f)					# Configure the format used to display songs
	--wait					# Wait for operation to finish (e. g.  database update)
	--range					# Operate on a range
	--no-status(-q)					# Prevents the current song status from being printed
	--verbose					# Verbose output
	--host
	--port(-p)
	--move					# Change position of song in queue
	...args
]

# Show currently queued (next) song
extern "mpc queued" [
	--format(-f)					# Configure the format used to display songs
	--wait					# Wait for operation to finish (e. g.  database update)
	--range					# Operate on a range
	--no-status(-q)					# Prevents the current song status from being printed
	--verbose					# Verbose output
	--host
	--port(-p)
	--move					# Change position of song in queue
	...args
]

# Get/set volume level at which songs with MixRamp tags will be overlapped
extern "mpc mixrampdb" [
	--format(-f)					# Configure the format used to display songs
	--wait					# Wait for operation to finish (e. g.  database update)
	--range					# Operate on a range
	--no-status(-q)					# Prevents the current song status from being printed
	--verbose					# Verbose output
	--host
	--port(-p)
	--move					# Change position of song in queue
	...args
]

# Get/set extra delay added computed from MixRamp tags
extern "mpc mixrampdelay" [
	--format(-f)					# Configure the format used to display songs
	--wait					# Wait for operation to finish (e. g.  database update)
	--range					# Operate on a range
	--no-status(-q)					# Prevents the current song status from being printed
	--verbose					# Verbose output
	--host
	--port(-p)
	--move					# Change position of song in queue
	...args
]

# Start playing next song on queue
extern "mpc next" [
	--format(-f)					# Configure the format used to display songs
	--wait					# Wait for operation to finish (e. g.  database update)
	--range					# Operate on a range
	--no-status(-q)					# Prevents the current song status from being printed
	--verbose					# Verbose output
	--host
	--port(-p)
	--move					# Change position of song in queue
	...args
]

# Pause playing
extern "mpc pause" [
	--format(-f)					# Configure the format used to display songs
	--wait					# Wait for operation to finish (e. g.  database update)
	--range					# Operate on a range
	--no-status(-q)					# Prevents the current song status from being printed
	--verbose					# Verbose output
	--host
	--port(-p)
	--move					# Change position of song in queue
	...args
]

# Start playing song-number specified
extern "mpc play" [
	--format(-f)					# Configure the format used to display songs
	--wait					# Wait for operation to finish (e. g.  database update)
	--range					# Operate on a range
	--no-status(-q)					# Prevents the current song status from being printed
	--verbose					# Verbose output
	--host
	--port(-p)
	--move					# Change position of song in queue
	...args
]

# Start playing previous song
extern "mpc prev" [
	--format(-f)					# Configure the format used to display songs
	--wait					# Wait for operation to finish (e. g.  database update)
	--range					# Operate on a range
	--no-status(-q)					# Prevents the current song status from being printed
	--verbose					# Verbose output
	--host
	--port(-p)
	--move					# Change position of song in queue
	...args
]

# Toggle random mode if state (on or off) is not specified
extern "mpc random" [
	--format(-f)					# Configure the format used to display songs
	--wait					# Wait for operation to finish (e. g.  database update)
	--range					# Operate on a range
	--no-status(-q)					# Prevents the current song status from being printed
	--verbose					# Verbose output
	--host
	--port(-p)
	--move					# Change position of song in queue
	...args
]

# Toggle repeat mode if state (on or off) is not specified
extern "mpc repeat" [
	--format(-f)					# Configure the format used to display songs
	--wait					# Wait for operation to finish (e. g.  database update)
	--range					# Operate on a range
	--no-status(-q)					# Prevents the current song status from being printed
	--verbose					# Verbose output
	--host
	--port(-p)
	--move					# Change position of song in queue
	...args
]

# Set replay gain mode
extern "mpc replaygain" [
	--format(-f)					# Configure the format used to display songs
	--wait					# Wait for operation to finish (e. g.  database update)
	--range					# Operate on a range
	--no-status(-q)					# Prevents the current song status from being printed
	--verbose					# Verbose output
	--host
	--port(-p)
	--move					# Change position of song in queue
	...args
]

# Toggle single mode if state (on or off) is not specified
extern "mpc single" [
	--format(-f)					# Configure the format used to display songs
	--wait					# Wait for operation to finish (e. g.  database update)
	--range					# Operate on a range
	--no-status(-q)					# Prevents the current song status from being printed
	--verbose					# Verbose output
	--host
	--port(-p)
	--move					# Change position of song in queue
	...args
]

# Seek by hour, minute or seconds
extern "mpc seek" [
	--format(-f)					# Configure the format used to display songs
	--wait					# Wait for operation to finish (e. g.  database update)
	--range					# Operate on a range
	--no-status(-q)					# Prevents the current song status from being printed
	--verbose					# Verbose output
	--host
	--port(-p)
	--move					# Change position of song in queue
	...args
]

# Seek relative to current position
extern "mpc seekthrough" [
	--format(-f)					# Configure the format used to display songs
	--wait					# Wait for operation to finish (e. g.  database update)
	--range					# Operate on a range
	--no-status(-q)					# Prevents the current song status from being printed
	--verbose					# Verbose output
	--host
	--port(-p)
	--move					# Change position of song in queue
	...args
]

# Stop playing
extern "mpc stop" [
	--format(-f)					# Configure the format used to display songs
	--wait					# Wait for operation to finish (e. g.  database update)
	--range					# Operate on a range
	--no-status(-q)					# Prevents the current song status from being printed
	--verbose					# Verbose output
	--host
	--port(-p)
	--move					# Change position of song in queue
	...args
]

# Toggle between play and pause
extern "mpc toggle" [
	--format(-f)					# Configure the format used to display songs
	--wait					# Wait for operation to finish (e. g.  database update)
	--range					# Operate on a range
	--no-status(-q)					# Prevents the current song status from being printed
	--verbose					# Verbose output
	--host
	--port(-p)
	--move					# Change position of song in queue
	...args
]

# Add a song from music database to queue
extern "mpc add" [
	--format(-f)					# Configure the format used to display songs
	--wait					# Wait for operation to finish (e. g.  database update)
	--range					# Operate on a range
	--no-status(-q)					# Prevents the current song status from being printed
	--verbose					# Verbose output
	--host
	--port(-p)
	--move					# Change position of song in queue
	...args
]

# Add a song from music database to queue after current song
extern "mpc insert" [
	--format(-f)					# Configure the format used to display songs
	--wait					# Wait for operation to finish (e. g.  database update)
	--range					# Operate on a range
	--no-status(-q)					# Prevents the current song status from being printed
	--verbose					# Verbose output
	--host
	--port(-p)
	--move					# Change position of song in queue
	...args
]

# Empty queue
extern "mpc clear" [
	--format(-f)					# Configure the format used to display songs
	--wait					# Wait for operation to finish (e. g.  database update)
	--range					# Operate on a range
	--no-status(-q)					# Prevents the current song status from being printed
	--verbose					# Verbose output
	--host
	--port(-p)
	--move					# Change position of song in queue
	...args
]

# Remove all songs except for currently playing song
extern "mpc crop" [
	--format(-f)					# Configure the format used to display songs
	--wait					# Wait for operation to finish (e. g.  database update)
	--range					# Operate on a range
	--no-status(-q)					# Prevents the current song status from being printed
	--verbose					# Verbose output
	--host
	--port(-p)
	--move					# Change position of song in queue
	...args
]

# Remove a queue number from queue
extern "mpc del" [
	--format(-f)					# Configure the format used to display songs
	--wait					# Wait for operation to finish (e. g.  database update)
	--range					# Operate on a range
	--no-status(-q)					# Prevents the current song status from being printed
	--verbose					# Verbose output
	--host
	--port(-p)
	--move					# Change position of song in queue
	...args
]

# Change position of song in queue
extern "mpc mv" [
	--format(-f)					# Configure the format used to display songs
	--wait					# Wait for operation to finish (e. g.  database update)
	--range					# Operate on a range
	--no-status(-q)					# Prevents the current song status from being printed
	--verbose					# Verbose output
	--host
	--port(-p)
	--move					# Change position of song in queue
	...args
]

# Search queue for a matching song and play it
extern "mpc searchplay" [
	--format(-f)					# Configure the format used to display songs
	--wait					# Wait for operation to finish (e. g.  database update)
	--range					# Operate on a range
	--no-status(-q)					# Prevents the current song status from being printed
	--verbose					# Verbose output
	--host
	--port(-p)
	--move					# Change position of song in queue
	...args
]

# Shuffle all songs on queue
extern "mpc shuffle" [
	--format(-f)					# Configure the format used to display songs
	--wait					# Wait for operation to finish (e. g.  database update)
	--range					# Operate on a range
	--no-status(-q)					# Prevents the current song status from being printed
	--verbose					# Verbose output
	--host
	--port(-p)
	--move					# Change position of song in queue
	...args
]

# Load a file as queue
extern "mpc load" [
	--format(-f)					# Configure the format used to display songs
	--wait					# Wait for operation to finish (e. g.  database update)
	--range					# Operate on a range
	--no-status(-q)					# Prevents the current song status from being printed
	--verbose					# Verbose output
	--host
	--port(-p)
	--move					# Change position of song in queue
	...args
]

# List available playlists
extern "mpc lsplaylists" [
	--format(-f)					# Configure the format used to display songs
	--wait					# Wait for operation to finish (e. g.  database update)
	--range					# Operate on a range
	--no-status(-q)					# Prevents the current song status from being printed
	--verbose					# Verbose output
	--host
	--port(-p)
	--move					# Change position of song in queue
	...args
]

# List all songs in playlist
extern "mpc playlist" [
	--format(-f)					# Configure the format used to display songs
	--wait					# Wait for operation to finish (e. g.  database update)
	--range					# Operate on a range
	--no-status(-q)					# Prevents the current song status from being printed
	--verbose					# Verbose output
	--host
	--port(-p)
	--move					# Change position of song in queue
	...args
]

# Delete a specific playlist
extern "mpc rm" [
	--format(-f)					# Configure the format used to display songs
	--wait					# Wait for operation to finish (e. g.  database update)
	--range					# Operate on a range
	--no-status(-q)					# Prevents the current song status from being printed
	--verbose					# Verbose output
	--host
	--port(-p)
	--move					# Change position of song in queue
	...args
]

# Save playlist as file
extern "mpc save" [
	--format(-f)					# Configure the format used to display songs
	--wait					# Wait for operation to finish (e. g.  database update)
	--range					# Operate on a range
	--no-status(-q)					# Prevents the current song status from being printed
	--verbose					# Verbose output
	--host
	--port(-p)
	--move					# Change position of song in queue
	...args
]

# List file from database
extern "mpc listall" [
	--format(-f)					# Configure the format used to display songs
	--wait					# Wait for operation to finish (e. g.  database update)
	--range					# Operate on a range
	--no-status(-q)					# Prevents the current song status from being printed
	--verbose					# Verbose output
	--host
	--port(-p)
	--move					# Change position of song in queue
	...args
]

# List all files/folders in directory
extern "mpc ls" [
	--format(-f)					# Configure the format used to display songs
	--wait					# Wait for operation to finish (e. g.  database update)
	--range					# Operate on a range
	--no-status(-q)					# Prevents the current song status from being printed
	--verbose					# Verbose output
	--host
	--port(-p)
	--move					# Change position of song in queue
	...args
]

# Search for substrings in song tags
extern "mpc search" [
	--format(-f)					# Configure the format used to display songs
	--wait					# Wait for operation to finish (e. g.  database update)
	--range					# Operate on a range
	--no-status(-q)					# Prevents the current song status from being printed
	--verbose					# Verbose output
	--host
	--port(-p)
	--move					# Change position of song in queue
	...args
]

# Exact search with a filter expression
extern "mpc find" [
	--format(-f)					# Configure the format used to display songs
	--wait					# Wait for operation to finish (e. g.  database update)
	--range					# Operate on a range
	--no-status(-q)					# Prevents the current song status from being printed
	--verbose					# Verbose output
	--host
	--port(-p)
	--move					# Change position of song in queue
	...args
]

# Find and add results to current queue
extern "mpc findadd" [
	--format(-f)					# Configure the format used to display songs
	--wait					# Wait for operation to finish (e. g.  database update)
	--range					# Operate on a range
	--no-status(-q)					# Prevents the current song status from being printed
	--verbose					# Verbose output
	--host
	--port(-p)
	--move					# Change position of song in queue
	...args
]

# Return a list of all tags of given tag type
extern "mpc list" [
	--format(-f)					# Configure the format used to display songs
	--wait					# Wait for operation to finish (e. g.  database update)
	--range					# Operate on a range
	--no-status(-q)					# Prevents the current song status from being printed
	--verbose					# Verbose output
	--host
	--port(-p)
	--move					# Change position of song in queue
	...args
]

# Display statistics about MPD
extern "mpc stats" [
	--format(-f)					# Configure the format used to display songs
	--wait					# Wait for operation to finish (e. g.  database update)
	--range					# Operate on a range
	--no-status(-q)					# Prevents the current song status from being printed
	--verbose					# Verbose output
	--host
	--port(-p)
	--move					# Change position of song in queue
	...args
]

# List all mounts
extern "mpc mount" [
	--format(-f)					# Configure the format used to display songs
	--wait					# Wait for operation to finish (e. g.  database update)
	--range					# Operate on a range
	--no-status(-q)					# Prevents the current song status from being printed
	--verbose					# Verbose output
	--host
	--port(-p)
	--move					# Change position of song in queue
	...args
]

# Remove a mount
extern "mpc unmount" [
	--format(-f)					# Configure the format used to display songs
	--wait					# Wait for operation to finish (e. g.  database update)
	--range					# Operate on a range
	--no-status(-q)					# Prevents the current song status from being printed
	--verbose					# Verbose output
	--host
	--port(-p)
	--move					# Change position of song in queue
	...args
]

# List all available outputs
extern "mpc outputs" [
	--format(-f)					# Configure the format used to display songs
	--wait					# Wait for operation to finish (e. g.  database update)
	--range					# Operate on a range
	--no-status(-q)					# Prevents the current song status from being printed
	--verbose					# Verbose output
	--host
	--port(-p)
	--move					# Change position of song in queue
	...args
]

# Disable output(s)
extern "mpc disable" [
	--format(-f)					# Configure the format used to display songs
	--wait					# Wait for operation to finish (e. g.  database update)
	--range					# Operate on a range
	--no-status(-q)					# Prevents the current song status from being printed
	--verbose					# Verbose output
	--host
	--port(-p)
	--move					# Change position of song in queue
	...args
]

# Enable output(s)
extern "mpc enable" [
	--format(-f)					# Configure the format used to display songs
	--wait					# Wait for operation to finish (e. g.  database update)
	--range					# Operate on a range
	--no-status(-q)					# Prevents the current song status from being printed
	--verbose					# Verbose output
	--host
	--port(-p)
	--move					# Change position of song in queue
	...args
]

# Change status for given output(s)
extern "mpc toggleoutput" [
	--format(-f)					# Configure the format used to display songs
	--wait					# Wait for operation to finish (e. g.  database update)
	--range					# Operate on a range
	--no-status(-q)					# Prevents the current song status from being printed
	--verbose					# Verbose output
	--host
	--port(-p)
	--move					# Change position of song in queue
	...args
]

# List channels that other clients have subscribed to
extern "mpc channels" [
	--format(-f)					# Configure the format used to display songs
	--wait					# Wait for operation to finish (e. g.  database update)
	--range					# Operate on a range
	--no-status(-q)					# Prevents the current song status from being printed
	--verbose					# Verbose output
	--host
	--port(-p)
	--move					# Change position of song in queue
	...args
]

# Send a message to specified channel
extern "mpc sendmessage" [
	--format(-f)					# Configure the format used to display songs
	--wait					# Wait for operation to finish (e. g.  database update)
	--range					# Operate on a range
	--no-status(-q)					# Prevents the current song status from being printed
	--verbose					# Verbose output
	--host
	--port(-p)
	--move					# Change position of song in queue
	...args
]

# Wait for at least one message on specified channel
extern "mpc waitmessage" [
	--format(-f)					# Configure the format used to display songs
	--wait					# Wait for operation to finish (e. g.  database update)
	--range					# Operate on a range
	--no-status(-q)					# Prevents the current song status from being printed
	--verbose					# Verbose output
	--host
	--port(-p)
	--move					# Change position of song in queue
	...args
]

# Subscribe to specified channel and continuously receive messages
extern "mpc subscribe" [
	--format(-f)					# Configure the format used to display songs
	--wait					# Wait for operation to finish (e. g.  database update)
	--range					# Operate on a range
	--no-status(-q)					# Prevents the current song status from being printed
	--verbose					# Verbose output
	--host
	--port(-p)
	--move					# Change position of song in queue
	...args
]

# Wait until an event occurs
extern "mpc idle" [
	--format(-f)					# Configure the format used to display songs
	--wait					# Wait for operation to finish (e. g.  database update)
	--range					# Operate on a range
	--no-status(-q)					# Prevents the current song status from being printed
	--verbose					# Verbose output
	--host
	--port(-p)
	--move					# Change position of song in queue
	...args
]

# Keep waiting and printing events as they occur
extern "mpc idleloop" [
	--format(-f)					# Configure the format used to display songs
	--wait					# Wait for operation to finish (e. g.  database update)
	--range					# Operate on a range
	--no-status(-q)					# Prevents the current song status from being printed
	--verbose					# Verbose output
	--host
	--port(-p)
	--move					# Change position of song in queue
	...args
]

# Report version of MPD
extern "mpc version" [
	--format(-f)					# Configure the format used to display songs
	--wait					# Wait for operation to finish (e. g.  database update)
	--range					# Operate on a range
	--no-status(-q)					# Prevents the current song status from being printed
	--verbose					# Verbose output
	--host
	--port(-p)
	--move					# Change position of song in queue
	...args
]

# Set volume
extern "mpc volume" [
	--format(-f)					# Configure the format used to display songs
	--wait					# Wait for operation to finish (e. g.  database update)
	--range					# Operate on a range
	--no-status(-q)					# Prevents the current song status from being printed
	--verbose					# Verbose output
	--host
	--port(-p)
	--move					# Change position of song in queue
	...args
]

# Scan for updated files in music directory
extern "mpc update" [
	--format(-f)					# Configure the format used to display songs
	--wait					# Wait for operation to finish (e. g.  database update)
	--range					# Operate on a range
	--no-status(-q)					# Prevents the current song status from being printed
	--verbose					# Verbose output
	--host
	--port(-p)
	--move					# Change position of song in queue
	...args
]

# Like update, but also rescans unmodified files
extern "mpc rescan" [
	--format(-f)					# Configure the format used to display songs
	--wait					# Wait for operation to finish (e. g.  database update)
	--range					# Operate on a range
	--no-status(-q)					# Prevents the current song status from being printed
	--verbose					# Verbose output
	--host
	--port(-p)
	--move					# Change position of song in queue
	...args
]

# Show currently playing song
extern "mpc current" [
	--format(-f)					# Configure the format used to display songs
	--wait					# Wait for operation to finish (e. g.  database update)
	--range					# Operate on a range
	--no-status(-q)					# Prevents the current song status from being printed
	--verbose					# Verbose output
	--host
	--port(-p)
	--move					# Change position of song in queue
	...args
]

# 
extern "mpc on off" [
	--format(-f)					# Configure the format used to display songs
	--wait					# Wait for operation to finish (e. g.  database update)
	--range					# Operate on a range
	--no-status(-q)					# Prevents the current song status from being printed
	--verbose					# Verbose output
	--host
	--port(-p)
	--move					# Change position of song in queue
	...args
]

# 
extern "mpc off track album" [
	--format(-f)					# Configure the format used to display songs
	--wait					# Wait for operation to finish (e. g.  database update)
	--range					# Operate on a range
	--no-status(-q)					# Prevents the current song status from being printed
	--verbose					# Verbose output
	--host
	--port(-p)
	--move					# Change position of song in queue
	...args
]