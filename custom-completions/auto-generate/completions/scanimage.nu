# Controls the "hue" (blue-level) of the acquired image [0..255]: 128
extern "scanimage" [
	--hue					# Controls the "hue" (blue-level) of the acquired image [0..255]: 128
	--color					# Sets the pictures color [0..255]: 133
	--contrast					# Controls the contrast of the acquired image [0..255]: 128
	--white-level					# Selects what radiance level should be considered "white" [0..255]: 124
	--custom-gamma					# Use custom gamma gable
	--mode					# Scan mode
	--device-name(-d)					# Device name to use
	--list-devices(-L)					# List devices
	--filename					# The filename of the image to be loaded
	--format					# Output image format
	--batch(-b)					# Working in batch mode, FORMAT is out%d.pnm or out%d.tif by default depending on --format
	--batch-double					# Increment page number by two
	--batch-prompt					# Ask for pressing a key before scanning a page
	--accept-md5-only					# Only accept authorization requests using md5
	--progress(-p)					# Print progress messages
	--dont-scan(-n)					# Only set options, dont actually scan
	--test(-T)					# Test backend thoroughly
	--all-options(-A)					# List all available backend options
	--help(-h)					# Display this help message and exit
	--verbose(-v)					# Give even more status messages
	--version(-V)					# Print version information
	...args
]