# Build a Slackware package
extern "checkinstall" [
	--default					# Accept default answers to all questions
	--rpmi					# Use the -i flag for rpm when installing a .rpm
	--rpmu					# Use the -U flag for rpm when installing a .rpm
	--nodoc					# Do not include documentation files
	--include					# Include file/directories in this file in the package
	--inspect					# Inspect the package's file list
	--review-spec					# Review the dpec file before creating a .rpm
	--review-control					# Review the control file before creating a .deb
	--newslack					# Use the new (8.1+) Slackware description format
	--bk					# Backup any overwritten files
	--help					# Show help
	--copyright					# Show Copyright information
	--version					# Show version information
	...args
]