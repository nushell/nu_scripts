[# 
extern "" [

	...args
]]

[# Configure the format used to display songs
extern "mpc" [

	...args
]
# Toggle consume mode if state is not specified
extern "mpc consume" [

	...args
]
# Get and set current amount of crossfading
extern "mpc crossfade" [

	...args
]
# Show currently queued (next) song
extern "mpc queued" [

	...args
]
# Get/set volume level at which songs with MixRamp tags will be overlapped
extern "mpc mixrampdb" [

	...args
]
# Get/set extra delay added computed from MixRamp tags
extern "mpc mixrampdelay" [

	...args
]
# Start playing next song on queue
extern "mpc next" [

	...args
]
# Pause playing
extern "mpc pause" [

	...args
]
# Start playing song-number specified
extern "mpc play" [

	...args
]
# Start playing previous song
extern "mpc prev" [

	...args
]
# Toggle random mode if state (on or off) is not specified
extern "mpc random" [

	...args
]
# Toggle repeat mode if state (on or off) is not specified
extern "mpc repeat" [

	...args
]
# Set replay gain mode
extern "mpc replaygain" [

	...args
]
# Toggle single mode if state (on or off) is not specified
extern "mpc single" [

	...args
]
# Seek by hour, minute or seconds
extern "mpc seek" [

	...args
]
# Seek relative to current position
extern "mpc seekthrough" [

	...args
]
# Stop playing
extern "mpc stop" [

	...args
]
# Toggle between play and pause
extern "mpc toggle" [

	...args
]
# Add a song from music database to queue
extern "mpc add" [

	...args
]
# Add a song from music database to queue after current song
extern "mpc insert" [

	...args
]
# Empty queue
extern "mpc clear" [

	...args
]
# Remove all songs except for currently playing song
extern "mpc crop" [

	...args
]
# Remove a queue number from queue
extern "mpc del" [

	...args
]
# Change position of song in queue
extern "mpc mv" [

	...args
]
# Search queue for a matching song and play it
extern "mpc searchplay" [

	...args
]
# Shuffle all songs on queue
extern "mpc shuffle" [

	...args
]
# Load a file as queue
extern "mpc load" [

	...args
]
# List available playlists
extern "mpc lsplaylists" [

	...args
]
# List all songs in playlist
extern "mpc playlist" [

	...args
]
# Delete a specific playlist
extern "mpc rm" [

	...args
]
# Save playlist as file
extern "mpc save" [

	...args
]
# List file from database
extern "mpc listall" [

	...args
]
# List all files/folders in directory
extern "mpc ls" [

	...args
]
# Search for substrings in song tags
extern "mpc search" [

	...args
]
# Exact search with a filter expression
extern "mpc find" [

	...args
]
# Find and add results to current queue
extern "mpc findadd" [

	...args
]
# Return a list of all tags of given tag type
extern "mpc list" [

	...args
]
# Display statistics about MPD
extern "mpc stats" [

	...args
]
# List all mounts
extern "mpc mount" [

	...args
]
# Remove a mount
extern "mpc unmount" [

	...args
]
# List all available outputs
extern "mpc outputs" [

	...args
]
# Disable output(s)
extern "mpc disable" [

	...args
]
# Enable output(s)
extern "mpc enable" [

	...args
]
# Change status for given output(s)
extern "mpc toggleoutput" [

	...args
]
# List channels that other clients have subscribed to
extern "mpc channels" [

	...args
]
# Send a message to specified channel
extern "mpc sendmessage" [

	...args
]
# Wait for at least one message on specified channel
extern "mpc waitmessage" [

	...args
]
# Subscribe to specified channel and continuously receive messages
extern "mpc subscribe" [

	...args
]
# Wait until an event occurs
extern "mpc idle" [

	...args
]
# Keep waiting and printing events as they occur
extern "mpc idleloop" [

	...args
]
# Report version of MPD
extern "mpc version" [

	...args
]
# Set volume
extern "mpc volume" [

	...args
]
# Scan for updated files in music directory
extern "mpc update" [

	...args
]
# Like update, but also rescans unmodified files
extern "mpc rescan" [

	...args
]
# Show currently playing song
extern "mpc current" [

	...args
]
# 
extern "mpc on off" [

	...args
]
# 
extern "mpc off track album" [

	...args
]]