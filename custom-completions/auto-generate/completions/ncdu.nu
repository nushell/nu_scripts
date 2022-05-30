# Print help
extern "ncdu" [
	--help(-h)					# Print help
	--version(-V)					# Print version
	--si					# Use base 10 prefixes instead of base 2
	--follow-symlinks(-L)					# Follow symlinks (excluding dirs)
	--exclude-caches					# Exclude dirs containing CACHEDIR.TAG
	--confirm-quit					# Prompt before exiting ncdu
	...args
]