# Show help message
extern "patool" [
	--help(-h)					# Show help message
	--verbose(-v)					# Be verbose
	--non-interactive					# Run in batch mode
	--outdir					# Specify output directory
	...args
]

# Extract archive(s)
extern "patool extract" [
	--help(-h)					# Show help message
	--verbose(-v)					# Be verbose
	--non-interactive					# Run in batch mode
	--outdir					# Specify output directory
	...args
]

# List files in archive(s)
extern "patool list" [
	--help(-h)					# Show help message
	--verbose(-v)					# Be verbose
	--non-interactive					# Run in batch mode
	--outdir					# Specify output directory
	...args
]

# Create archive
extern "patool create" [
	--help(-h)					# Show help message
	--verbose(-v)					# Be verbose
	--non-interactive					# Run in batch mode
	--outdir					# Specify output directory
	...args
]

# Test archive(s)
extern "patool test" [
	--help(-h)					# Show help message
	--verbose(-v)					# Be verbose
	--non-interactive					# Run in batch mode
	--outdir					# Specify output directory
	...args
]

# Repackage archive to different format
extern "patool repack" [
	--help(-h)					# Show help message
	--verbose(-v)					# Be verbose
	--non-interactive					# Run in batch mode
	--outdir					# Specify output directory
	...args
]

# Recompress archive to smaller
extern "patool recompress" [
	--help(-h)					# Show help message
	--verbose(-v)					# Be verbose
	--non-interactive					# Run in batch mode
	--outdir					# Specify output directory
	...args
]

# Differences between two archives
extern "patool diff" [
	--help(-h)					# Show help message
	--verbose(-v)					# Be verbose
	--non-interactive					# Run in batch mode
	--outdir					# Specify output directory
	...args
]

# Search contents of archive
extern "patool search" [
	--help(-h)					# Show help message
	--verbose(-v)					# Be verbose
	--non-interactive					# Run in batch mode
	--outdir					# Specify output directory
	...args
]

# Show supported formats
extern "patool formats" [
	--help(-h)					# Show help message
	--verbose(-v)					# Be verbose
	--non-interactive					# Run in batch mode
	--outdir					# Specify output directory
	...args
]