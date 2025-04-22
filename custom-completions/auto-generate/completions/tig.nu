# 
extern "tig" [
	--stdin					# Read git commit IDs from stdin
	--pretty=raw					# Read git log output from stdin
	--version(-v)					# Show version and exit
	--help(-h)					# Show help message and exit
	...args
]