# Show help
extern "$command" [
	--help(-h)					# Show help
	--version(-V)					# Show version
	--country					# Specify the country code
	--gui					# Show gui diagnostics
	--isolate					# Use the separate bottles for applications
	--self-update					# Update to the latest version
	--update-rollback					# Rollback the latest self-update
	--keep_isos(-k)					# Cache ISOs
	--no-clean					# Don't delete temporary directories
	--unattended(-q)					# Don't show any prompts
	--torify(-t)					# Run downloads through torify
	--virefy					# Test verbs automaitally
	--verbose(-v)					# Show commands
	...args
]