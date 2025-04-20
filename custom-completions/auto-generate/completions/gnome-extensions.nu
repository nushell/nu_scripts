# 
extern "gnome-extensions" [
	--user					# Show user-installed extensions
	--system					# Show system-installed extensions
	--enabled					# Show enabled extensions
	--disabled					# Show disabled extensions
	--prefs					# Show extensions with preferences
	--updates					# Show extensions with updates
	--details(-d)					# Print extension details
	--interactive(-i)					# Enter extension information interactively
	--force(-f)					# Overwrite an existing pack
	--out-dir(-o)					# The directory where the pack should be created
	--force(-f)					# Overwrite an existing extension
	--quiet(-q)					# Do not print error messages
	...args
]

# Print help
extern "gnome-extensions help" [
	--user					# Show user-installed extensions
	--system					# Show system-installed extensions
	--enabled					# Show enabled extensions
	--disabled					# Show disabled extensions
	--prefs					# Show extensions with preferences
	--updates					# Show extensions with updates
	--details(-d)					# Print extension details
	--interactive(-i)					# Enter extension information interactively
	--force(-f)					# Overwrite an existing pack
	--out-dir(-o)					# The directory where the pack should be created
	--force(-f)					# Overwrite an existing extension
	--quiet(-q)					# Do not print error messages
	...args
]

# Print version
extern "gnome-extensions version" [
	--user					# Show user-installed extensions
	--system					# Show system-installed extensions
	--enabled					# Show enabled extensions
	--disabled					# Show disabled extensions
	--prefs					# Show extensions with preferences
	--updates					# Show extensions with updates
	--details(-d)					# Print extension details
	--interactive(-i)					# Enter extension information interactively
	--force(-f)					# Overwrite an existing pack
	--out-dir(-o)					# The directory where the pack should be created
	--force(-f)					# Overwrite an existing extension
	--quiet(-q)					# Do not print error messages
	...args
]

# Enable extension
extern "gnome-extensions enable" [
	--user					# Show user-installed extensions
	--system					# Show system-installed extensions
	--enabled					# Show enabled extensions
	--disabled					# Show disabled extensions
	--prefs					# Show extensions with preferences
	--updates					# Show extensions with updates
	--details(-d)					# Print extension details
	--interactive(-i)					# Enter extension information interactively
	--force(-f)					# Overwrite an existing pack
	--out-dir(-o)					# The directory where the pack should be created
	--force(-f)					# Overwrite an existing extension
	--quiet(-q)					# Do not print error messages
	...args
]

# Disable extension
extern "gnome-extensions disable" [
	--user					# Show user-installed extensions
	--system					# Show system-installed extensions
	--enabled					# Show enabled extensions
	--disabled					# Show disabled extensions
	--prefs					# Show extensions with preferences
	--updates					# Show extensions with updates
	--details(-d)					# Print extension details
	--interactive(-i)					# Enter extension information interactively
	--force(-f)					# Overwrite an existing pack
	--out-dir(-o)					# The directory where the pack should be created
	--force(-f)					# Overwrite an existing extension
	--quiet(-q)					# Do not print error messages
	...args
]

# Reset extension
extern "gnome-extensions reset" [
	--user					# Show user-installed extensions
	--system					# Show system-installed extensions
	--enabled					# Show enabled extensions
	--disabled					# Show disabled extensions
	--prefs					# Show extensions with preferences
	--updates					# Show extensions with updates
	--details(-d)					# Print extension details
	--interactive(-i)					# Enter extension information interactively
	--force(-f)					# Overwrite an existing pack
	--out-dir(-o)					# The directory where the pack should be created
	--force(-f)					# Overwrite an existing extension
	--quiet(-q)					# Do not print error messages
	...args
]

# Uninstall extension
extern "gnome-extensions uninstall" [
	--user					# Show user-installed extensions
	--system					# Show system-installed extensions
	--enabled					# Show enabled extensions
	--disabled					# Show disabled extensions
	--prefs					# Show extensions with preferences
	--updates					# Show extensions with updates
	--details(-d)					# Print extension details
	--interactive(-i)					# Enter extension information interactively
	--force(-f)					# Overwrite an existing pack
	--out-dir(-o)					# The directory where the pack should be created
	--force(-f)					# Overwrite an existing extension
	--quiet(-q)					# Do not print error messages
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
	--interactive(-i)					# Enter extension information interactively
	--force(-f)					# Overwrite an existing pack
	--out-dir(-o)					# The directory where the pack should be created
	--force(-f)					# Overwrite an existing extension
	--quiet(-q)					# Do not print error messages
	...args
]

# Show extension info
extern "gnome-extensions info show" [
	--user					# Show user-installed extensions
	--system					# Show system-installed extensions
	--enabled					# Show enabled extensions
	--disabled					# Show disabled extensions
	--prefs					# Show extensions with preferences
	--updates					# Show extensions with updates
	--details(-d)					# Print extension details
	--interactive(-i)					# Enter extension information interactively
	--force(-f)					# Overwrite an existing pack
	--out-dir(-o)					# The directory where the pack should be created
	--force(-f)					# Overwrite an existing extension
	--quiet(-q)					# Do not print error messages
	...args
]

# Open extension preferences
extern "gnome-extensions prefs" [
	--user					# Show user-installed extensions
	--system					# Show system-installed extensions
	--enabled					# Show enabled extensions
	--disabled					# Show disabled extensions
	--prefs					# Show extensions with preferences
	--updates					# Show extensions with updates
	--details(-d)					# Print extension details
	--interactive(-i)					# Enter extension information interactively
	--force(-f)					# Overwrite an existing pack
	--out-dir(-o)					# The directory where the pack should be created
	--force(-f)					# Overwrite an existing extension
	--quiet(-q)					# Do not print error messages
	...args
]

# Create extension
extern "gnome-extensions create" [
	--user					# Show user-installed extensions
	--system					# Show system-installed extensions
	--enabled					# Show enabled extensions
	--disabled					# Show disabled extensions
	--prefs					# Show extensions with preferences
	--updates					# Show extensions with updates
	--details(-d)					# Print extension details
	--interactive(-i)					# Enter extension information interactively
	--force(-f)					# Overwrite an existing pack
	--out-dir(-o)					# The directory where the pack should be created
	--force(-f)					# Overwrite an existing extension
	--quiet(-q)					# Do not print error messages
	...args
]

# Package extension
extern "gnome-extensions pack" [
	--user					# Show user-installed extensions
	--system					# Show system-installed extensions
	--enabled					# Show enabled extensions
	--disabled					# Show disabled extensions
	--prefs					# Show extensions with preferences
	--updates					# Show extensions with updates
	--details(-d)					# Print extension details
	--interactive(-i)					# Enter extension information interactively
	--force(-f)					# Overwrite an existing pack
	--out-dir(-o)					# The directory where the pack should be created
	--force(-f)					# Overwrite an existing extension
	--quiet(-q)					# Do not print error messages
	...args
]

# Install extension bundle
extern "gnome-extensions install" [
	--user					# Show user-installed extensions
	--system					# Show system-installed extensions
	--enabled					# Show enabled extensions
	--disabled					# Show disabled extensions
	--prefs					# Show extensions with preferences
	--updates					# Show extensions with updates
	--details(-d)					# Print extension details
	--interactive(-i)					# Enter extension information interactively
	--force(-f)					# Overwrite an existing pack
	--out-dir(-o)					# The directory where the pack should be created
	--force(-f)					# Overwrite an existing extension
	--quiet(-q)					# Do not print error messages
	...args
]