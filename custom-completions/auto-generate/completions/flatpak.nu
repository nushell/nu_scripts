# Install an application or runtime from a remote
extern "flatpak install" [

	...args
]

# Update an installed application or runtime
extern "flatpak update" [

	...args
]

# Uninstall an installed application or runtime
extern "flatpak uninstall" [

	...args
]

# List installed apps and/or runtimes
extern "flatpak list" [

	...args
]

# Show info for installed app or runtime
extern "flatpak info" [

	...args
]

# Configure flatpak
extern "flatpak config" [

	...args
]

# Repair flatpak installation
extern "flatpak repair" [

	...args
]

# Put applications or runtimes onto removable media
extern "flatpak create-usb" [

	...args
]

# Search for remote apps/runtimes
extern "flatpak search" [

	...args
]

# Run an application
extern "flatpak run" [

	...args
]

# Override permissions for an application
extern "flatpak override" [

	...args
]

# Specify default version to run
extern "flatpak make-current" [

	...args
]

# Enter the namespace of a running application
extern "flatpak enter" [

	...args
]

# Enumerate running applications
extern "flatpak ps" [

	...args
]

# List exported files
extern "flatpak documents" [

	...args
]

# Grant an application access to a specific file
extern "flatpak document-export" [

	...args
]

# Revoke access to a specific file
extern "flatpak document-unexport" [

	...args
]

# Show information about a specific file
extern "flatpak document-info" [

	...args
]

# List permissions
extern "flatpak permissions" [

	...args
]

# Show app permissions
extern "flatpak permission-show" [

	...args
]

# Reset app permissions
extern "flatpak permission-reset" [

	...args
]

# List all configured remotes
extern "flatpak remotes" [

	...args
]

# Add a new remote repository (by URL)
extern "flatpak remote-add" [

	...args
]

# Modify properties of a configured remote
extern "flatpak remote-modify" [

	...args
]

# Delete a configured remote
extern "flatpak remote-delete" [

	...args
]

# List contents of a configured remote
extern "flatpak remote-ls" [

	...args
]

# Show information about a remote app or runtime
extern "flatpak remote-info" [

	...args
]

# Initialize a directory for building
extern "flatpak build-init" [

	...args
]

# Run a build command inside the build dir
extern "flatpak build" [

	...args
]

# Finish a build dir for export
extern "flatpak build-finish" [

	...args
]

# Export a build dir to a repository
extern "flatpak build-export" [

	...args
]

# Create a bundle file from a build directory
extern "flatpak build-bundle" [

	...args
]

# Import a bundle file
extern "flatpak build-import-bundle" [

	...args
]

# Sign an application or runtime
extern "flatpak build-sign" [

	...args
]

# Update the summary file in a repository
extern "flatpak build-update-repo" [

	...args
]

# Create new commit based on existing ref
extern "flatpak build-commit-from" [

	...args
]

# Show information about a repo
extern "flatpak repo" [

	...args
]

# 
extern "flatpak" [

	...args
]