# Convert file to mp4 during playback
extern "castnow" [
	--tomp4					# Convert file to mp4 during playback
	--quiet					# No output
	--bypass-srt-encoding					# Disable automatic UTF-8 encoding of SRT subtitles
	--loop					# Loop over playlist, or file
	--shuffle					# Play in random order
	--recursive					# List all files in directories recursively
	--exit					# Exit when playback begins or --command completes
	--help					# Display help
	...args
]