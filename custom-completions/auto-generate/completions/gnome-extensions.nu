# 
extern "gnome-extensions" [

	...args
]

# Print help
extern "gnome-extensions help" [

	...args
]

# Print version
extern "gnome-extensions version" [

	...args
]

# Enable extension
extern "gnome-extensions enable" [

	...args
]

# Disable extension
extern "gnome-extensions disable" [

	...args
]

# Reset extension
extern "gnome-extensions reset" [

	...args
]

# Uninstall extension
extern "gnome-extensions uninstall" [

	...args
]

# List extensions
extern "gnome-extensions list" [
	--user					# Show user-installed extensions
	--system					# Show system-installed extensions
	--enabled					# Show enabled extensions
	--disabled					# Show disabled extensions
	--prefs					# Show extensions with preferences
	--updates					# Show extensions with updates
	--details(-d)					# Print extension details
	...args
]

# Show extension info
extern "gnome-extensions info show" [

	...args
]

# Open extension preferences
extern "gnome-extensions prefs" [

	...args
]

# Create extension
extern "gnome-extensions create" [
	--interactive(-i)					# Enter extension information interactively
	...args
]

# Package extension
extern "gnome-extensions pack" [
	--force(-f)					# Overwrite an existing pack
	--out-dir(-o)					# The directory where the pack should be created
	...args
]

# Install extension bundle
extern "gnome-extensions install" [
	--force(-f)					# Overwrite an existing extension
	...args
]