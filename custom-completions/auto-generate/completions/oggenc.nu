# Produce no output to stderr
extern "oggenc" [
	--quiet(-Q)					# Produce no output to stderr
	--help(-h)					# Print this help text
	--version(-v)					# Print the version number
	--raw(-r)					# Raw mode. Input files are read directly as PCM data
	--raw-endianness					# 1 for bigendian, 0 for little (defaults to 0)
	--managed					# Enable the bitrate management engine
	--downmix					# Downmix stereo to mono
	--discard-comments					# Prevents comments in FLAC and Ogg FLAC files from being copied to the output Ogg Vorbis file
	...args
]