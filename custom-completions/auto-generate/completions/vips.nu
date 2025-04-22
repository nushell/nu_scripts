# List objects
extern "vips" [
	--list(-l)					# List objects
	--plugin(-p)					# Load PLUGIN
	--version(-v)					# Print version
	--vips-concurrency					# Evaluate with N threads
	--vips-progress					# Show progress feedback
	--vips-leak					# Leak-check on exit
	--vips-profile					# Profile and dump timing on exit
	--vips-disc-threshold					# Decompress images larger than N
	--vips-novector					# Disable vectorised operations
	--vips-cache-max					# Cache at most N operations
	--vips-cache-max-memory					# Cache at most N bytes in memory
	--vips-cache-max-files					# Allow at most N open files
	--vips-cache-trace					# Trace operation cache
	--vips-cache-dump					# Dump operation cache on exit
	--vips-version					# Print libvips version
	--vips-config					# Print libvips config
	--vips-pipe-read-limit					# Pipe read limit (bytes)
	...args
]