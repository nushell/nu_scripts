# Install with pkgadd after build
extern "pkgmk" [
	--install					# Install with pkgadd after build
	--upgrade					# Upgrade with pkgadd after build
	--recursive					# Search and build packages recursively
	--download					# Download the sources
	--download-only					# Only download the sources
	--up-to-date					# Check if the package is uptodate
	--update-footprint					# Update footprint
	--ignore-footprint					# Ignore footprint
	--update-md5sum					# Update md5sum
	--ignore-md5sum					# Ignore md5sum
	--no-strip					# Do not strip executables
	--force					# Force rebuild
	--clean					# Remove package and sources
	--keep-work					# Keep working dir
	--version					# Print version
	--help					# Print help
	...args
]