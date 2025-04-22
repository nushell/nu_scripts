# Show this help message and exit
extern "emaint" [
	--help(-h)					# Show this help message and exit
	--check(-c)					# Check for problems
	--version					# Show program's version number and exit
	--fix(-f)					# Attempt to fix problems
	--purge(-P)					# Remove the list of failed merges
	--pretend(-p)					# Output logs that would be deleted
	--clean(-C)					# Cleans out logs more than 7 days old
	--auto(-a)					# Sync auto-sync enabled repos only
	--allrepos(-A)					# Sync all repos that have a sync-url defined
	...args
]