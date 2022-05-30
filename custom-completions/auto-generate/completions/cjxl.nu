# Print version number
extern "cjxl" [
	--version(-V)					# Print version number
	--quiet					# Be more silent
	--container					# Encode using container format
	--progressive(-p)					# Enable progressive decoding
	--middleout					# Put center groups first in the file
	--progressive_ac					# Use the progressive mode for AC
	--qprogressive_ac					# Use the progressive mode for AC
	--modular(-m)					# Use the modular mode
	--use_new_heuristics					# Use new encoder heuristics
	--jpeg_transcode(-j)					# Do lossy transcode of input JPEG file
	--lossy-palette					# Quantize to a lossy palette
	--verbose(-v)					# Verbose output
	--help(-h)					# Print help message
	...args
]