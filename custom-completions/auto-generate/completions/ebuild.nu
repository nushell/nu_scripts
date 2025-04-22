# Run bash with the -x option
extern "ebuild" [
	--debug					# Run bash with the -x option
	--force					# Force regeneration of digests
	--ignore-default-opts					# Ignore EBUILD_DEFAULT_OPTS
	--skip-manifest					# Skip all manifest checks
	...args
]