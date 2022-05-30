# Configure package
extern "dpkg" [
	--configure					# Configure package
	--remove(-r)					# Remove package
	--purge(-P)					# Purge package
	--verify(-V)					# Verify contents of package
	--force-all					# Continue on all problems
	--build(-b)					# Build package from directory
	--list(-l)					# List packages matching pattern
	--listfiles(-L)					# List contents of packages
	--status(-s)					# Print status of package
	--search(-S)					# Search for packages containing file
	...args
]