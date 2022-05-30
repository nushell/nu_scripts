# Print out statistics for individual files
extern "tokei" [
	--files(-f)					# Print out statistics for individual files
	--help(-h)					# Print help information
	--hidden					# Count hidden files, too
	--languages(-l)					# Print out supported languages
	--no-ignore					# Don’t respect ignore files
	--no-ignore-parent					# Don’t respect ignore files in parent directories
	--no-ignore-vcs					# Don’t respect version-control ignore files
	--version(-V)					# Print version information
	--verbose(-v)					# Increase log output level
	...args
]