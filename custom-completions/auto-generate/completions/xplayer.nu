# Show help and exit
extern "xplayer" [
	--help(-?)					# Show help and exit
	--version					# Show version and exit
	--play-pause					# Toggle between play
	--play					# Play
	--pause					# Pause
	--next					# Skip to the next movie or chapter in the playlist
	--previous					# Return to the previous movie or chapter in the playlist
	--seek-fwd					# Seek forwards 15 seconds
	--seek-bwd					# Seek backwards 15 seconds
	--volume-up					# Raise the volume by 8%
	--volume-down					# Lower the volume by 8%
	--mute					# Toggle between muted and unmuted audio
	--fullscreen					# Toggle fullscreen mode
	--toggle-controls					# Toggle showing the controls
	--quit					# Quit
	--enqueue					# Add a new stream to the playlist
	--replace					# Play from the playlist
	...args
]