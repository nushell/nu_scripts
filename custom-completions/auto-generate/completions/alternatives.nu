# Generate more comments about what alternatives is doing
extern "alternatives" [
	--verbose					# Generate more comments about what alternatives is doing
	--help					# Give some usage information
	--version					# Tell which version of alternatives this is
	--keep-missing					# If new variant doesn't provide some files, keep previous links
	--altdir					# Specifies the alternatives directory
	--admindir					# Specifies the administrative directory
	--remove					# Remove an alternative and all of its associated slave links
	--set					# Set link group to given path
	--config					# Open menu to configure link group
	--auto					# Switch the master symlink name to automatic mode
	--display					# Display information about the link group
	--list					# Display information about all link groups
	--remove-all					# Remove the whole link group name
	--add-slave					# Add a slave link to an existing alternative
	--remove-slave					# Remove slave from an existing alternative
	...args
]