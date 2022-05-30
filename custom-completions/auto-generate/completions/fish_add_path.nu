# Add path to the end
extern "fish_add_path" [
	--append(-a)					# Add path to the end
	--prepend(-p)					# Add path to the front (default)
	--global(-g)					# Use a global $fish_user_paths
	--universal(-U)					# Use a universal $fish_user_paths (default)
	--path(-P)					# Update $PATH directly
	--move(-m)					# Move path to the front or back
	--verbose(-v)					# Print the set command used
	--dry-run(-n)					# Print the set command without executing it
	--help(-h)					# Display help and exit
	...args
]