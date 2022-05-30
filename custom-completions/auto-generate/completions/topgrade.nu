# Cleanup temporary or old files
extern "topgrade" [
	--cleanup(-c)					# Cleanup temporary or old files
	--disable-predefined-git-repos					# Don't pull the predefined git repos
	--dry-run(-n)					# Print what would be done
	--edit-config					# Edit the configuration file
	--help(-h)					# Prints help information
	--keep(-k)					# Prompt for a key before exiting
	--no-retry					# Do not ask to retry failed steps
	--tmux(-t)					# Run inside tmux
	--config-reference					# Show config reference
	--show-skipped					# Show the reason for skipped steps
	--version(-V)					# Prints version information
	--verbose(-v)					# Output logs
	--yes(-y)					# Say yes to package manager's prompt
	...args
]