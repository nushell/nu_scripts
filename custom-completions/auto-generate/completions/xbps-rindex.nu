# Enable extra debugging shown to stderr
extern "$progname" [
	--compression					# Set the repodata compression format (default: zstd)
	--signedby					# Name and email of person signing the repository
	...args
]