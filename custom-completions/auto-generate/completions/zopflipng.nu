# Compress more
extern "zopflipng" [
	--prefix					# Add prefix
	--lossy_transparent					# Remove colors behind alpha channel 0
	--lossy_8bit					# Convert PNG16 to PNG8
	--always_zopflify					# For benchmarking the algorithm
	--iterations					# Number of iterations
	--splitting					# Left for backwards compatibility
	--keepchunks					# Keep metadata chunks
	--help(-h)					# Show help
	...args
]