# Produce no output to stderr
extern "oggenc" [
	--quiet(-Q)					# Produce no output to stderr
	--help(-h)					# Print this help text
	--version(-v)					# Print the version number
	--raw(-r)					# Raw mode. Input files are read directly as PCM data
	--raw-endianness					# 1 for bigendian, 0 for little (default 0)
	--managed					# Enable the bitrate management engine
	--downmix					# Downmix stereo to mono
	--discard-comments					# Don't copy comments to the output file
	...args
]