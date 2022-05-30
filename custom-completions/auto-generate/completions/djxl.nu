# Print version number
extern "djxl" [
	--version(-V)					# Print version number
	--use_sjpeg					# Use sjpeg instead of libjpeg
	--allow_partial_files					# Allow decoding of truncated files
	--allow_more_progressive_steps					# Allow decoding more progressive steps
	--jpeg(-j)					# Decode directly to JPEG
	--print_read_bytes					# Print total number of decoded bytes
	--help(-h)					# Print help message
	...args
]