# Show help message
extern "patool" [

	...args
]

# Extract archive(s)
extern "patool extract" [
	--outdir					# Specify output directory
	...args
]

# List files in archive(s)
extern "patool list" [

	...args
]

# Create archive
extern "patool create" [

	...args
]

# Test archive(s)
extern "patool test" [

	...args
]

# Repackage archive to different format
extern "patool repack" [

	...args
]

# Recompress archive to smaller
extern "patool recompress" [

	...args
]

# Differences between two archives
extern "patool diff" [

	...args
]

# Search contents of archive
extern "patool search" [

	...args
]

# Show supported formats
extern "patool formats" [

	...args
]