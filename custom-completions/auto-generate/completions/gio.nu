# Print help
extern "gio help" [
	--no-target-directory(-T)					# No target directory
	--progress(-p)					# Show progress
	--interactive(-i)					# Prompt before overwrite
	--backup(-b)					# Backup existing destination files
	--nofollow-symlinks(-n)					# Don't follow symbolic links
	--hidden(-h)					# Show hidden files
	--force(-f)					# Ignore nonexistent files
	--preserve					# Preserve all attributes
	--no-dereference(-P)					# Never follow symbolic links
	--default-permissions					# Use default permissions
	--query-writable(-w)					# List writable attributes
	--filesystem(-f)					# Get file system info
	--long(-l)					# Use a long listing format
	--print-display-names(-d)					# Print display names
	--print-uris(-u)					# Print full URIs
	--parent(-p)					# Create parent directories
	--no-moves(-n)					# Don't report move events
	--mounts(-m)					# Watch for mount events
	--mountable(-m)					# Mount as mountable
	--unmount(-u)					# Unmount
	--eject(-e)					# Eject
	--force(-f)					# Ignore outstanding file operations
	--anonymous(-a)					# Use an anonymous user
	--list(-l)					# List
	--monitor(-o)					# Monitor events
	--detail(-i)					# Show extra information
	--tcrypt-hidden					# Mount a TCRYPT hidden volume
	--tcrypt-system					# Mount a TCRYPT system volume
	--no-copy-fallback(-C)					# Don't use copy and delete fallback
	--create(-c)					# Only create if not existing
	--append(-a)					# Append to end of file
	--private(-p)					# Restrict access to the current user
	--unlink(-u)					# Replace as if the destination didn't exist
	--print-etag(-v)					# Print new etag at end
	--empty					# Empty the trash
	--follow-symlinks(-l)					# Follow symbolic links
	...args
]

# Print version
extern "gio version" [
	--no-target-directory(-T)					# No target directory
	--progress(-p)					# Show progress
	--interactive(-i)					# Prompt before overwrite
	--backup(-b)					# Backup existing destination files
	--nofollow-symlinks(-n)					# Don't follow symbolic links
	--hidden(-h)					# Show hidden files
	--force(-f)					# Ignore nonexistent files
	--preserve					# Preserve all attributes
	--no-dereference(-P)					# Never follow symbolic links
	--default-permissions					# Use default permissions
	--query-writable(-w)					# List writable attributes
	--filesystem(-f)					# Get file system info
	--long(-l)					# Use a long listing format
	--print-display-names(-d)					# Print display names
	--print-uris(-u)					# Print full URIs
	--parent(-p)					# Create parent directories
	--no-moves(-n)					# Don't report move events
	--mounts(-m)					# Watch for mount events
	--mountable(-m)					# Mount as mountable
	--unmount(-u)					# Unmount
	--eject(-e)					# Eject
	--force(-f)					# Ignore outstanding file operations
	--anonymous(-a)					# Use an anonymous user
	--list(-l)					# List
	--monitor(-o)					# Monitor events
	--detail(-i)					# Show extra information
	--tcrypt-hidden					# Mount a TCRYPT hidden volume
	--tcrypt-system					# Mount a TCRYPT system volume
	--no-copy-fallback(-C)					# Don't use copy and delete fallback
	--create(-c)					# Only create if not existing
	--append(-a)					# Append to end of file
	--private(-p)					# Restrict access to the current user
	--unlink(-u)					# Replace as if the destination didn't exist
	--print-etag(-v)					# Print new etag at end
	--empty					# Empty the trash
	--follow-symlinks(-l)					# Follow symbolic links
	...args
]

# Concatenate files to stdout
extern "gio cat" [
	--no-target-directory(-T)					# No target directory
	--progress(-p)					# Show progress
	--interactive(-i)					# Prompt before overwrite
	--backup(-b)					# Backup existing destination files
	--nofollow-symlinks(-n)					# Don't follow symbolic links
	--hidden(-h)					# Show hidden files
	--force(-f)					# Ignore nonexistent files
	--preserve					# Preserve all attributes
	--no-dereference(-P)					# Never follow symbolic links
	--default-permissions					# Use default permissions
	--query-writable(-w)					# List writable attributes
	--filesystem(-f)					# Get file system info
	--long(-l)					# Use a long listing format
	--print-display-names(-d)					# Print display names
	--print-uris(-u)					# Print full URIs
	--parent(-p)					# Create parent directories
	--no-moves(-n)					# Don't report move events
	--mounts(-m)					# Watch for mount events
	--mountable(-m)					# Mount as mountable
	--unmount(-u)					# Unmount
	--eject(-e)					# Eject
	--force(-f)					# Ignore outstanding file operations
	--anonymous(-a)					# Use an anonymous user
	--list(-l)					# List
	--monitor(-o)					# Monitor events
	--detail(-i)					# Show extra information
	--tcrypt-hidden					# Mount a TCRYPT hidden volume
	--tcrypt-system					# Mount a TCRYPT system volume
	--no-copy-fallback(-C)					# Don't use copy and delete fallback
	--create(-c)					# Only create if not existing
	--append(-a)					# Append to end of file
	--private(-p)					# Restrict access to the current user
	--unlink(-u)					# Replace as if the destination didn't exist
	--print-etag(-v)					# Print new etag at end
	--empty					# Empty the trash
	--follow-symlinks(-l)					# Follow symbolic links
	...args
]

# Copy files
extern "gio copy" [
	--no-target-directory(-T)					# No target directory
	--progress(-p)					# Show progress
	--interactive(-i)					# Prompt before overwrite
	--backup(-b)					# Backup existing destination files
	--nofollow-symlinks(-n)					# Don't follow symbolic links
	--hidden(-h)					# Show hidden files
	--force(-f)					# Ignore nonexistent files
	--preserve					# Preserve all attributes
	--no-dereference(-P)					# Never follow symbolic links
	--default-permissions					# Use default permissions
	--query-writable(-w)					# List writable attributes
	--filesystem(-f)					# Get file system info
	--long(-l)					# Use a long listing format
	--print-display-names(-d)					# Print display names
	--print-uris(-u)					# Print full URIs
	--parent(-p)					# Create parent directories
	--no-moves(-n)					# Don't report move events
	--mounts(-m)					# Watch for mount events
	--mountable(-m)					# Mount as mountable
	--unmount(-u)					# Unmount
	--eject(-e)					# Eject
	--force(-f)					# Ignore outstanding file operations
	--anonymous(-a)					# Use an anonymous user
	--list(-l)					# List
	--monitor(-o)					# Monitor events
	--detail(-i)					# Show extra information
	--tcrypt-hidden					# Mount a TCRYPT hidden volume
	--tcrypt-system					# Mount a TCRYPT system volume
	--no-copy-fallback(-C)					# Don't use copy and delete fallback
	--create(-c)					# Only create if not existing
	--append(-a)					# Append to end of file
	--private(-p)					# Restrict access to the current user
	--unlink(-u)					# Replace as if the destination didn't exist
	--print-etag(-v)					# Print new etag at end
	--empty					# Empty the trash
	--follow-symlinks(-l)					# Follow symbolic links
	...args
]

# Show information about locations
extern "gio info" [
	--no-target-directory(-T)					# No target directory
	--progress(-p)					# Show progress
	--interactive(-i)					# Prompt before overwrite
	--backup(-b)					# Backup existing destination files
	--nofollow-symlinks(-n)					# Don't follow symbolic links
	--hidden(-h)					# Show hidden files
	--force(-f)					# Ignore nonexistent files
	--preserve					# Preserve all attributes
	--no-dereference(-P)					# Never follow symbolic links
	--default-permissions					# Use default permissions
	--query-writable(-w)					# List writable attributes
	--filesystem(-f)					# Get file system info
	--long(-l)					# Use a long listing format
	--print-display-names(-d)					# Print display names
	--print-uris(-u)					# Print full URIs
	--parent(-p)					# Create parent directories
	--no-moves(-n)					# Don't report move events
	--mounts(-m)					# Watch for mount events
	--mountable(-m)					# Mount as mountable
	--unmount(-u)					# Unmount
	--eject(-e)					# Eject
	--force(-f)					# Ignore outstanding file operations
	--anonymous(-a)					# Use an anonymous user
	--list(-l)					# List
	--monitor(-o)					# Monitor events
	--detail(-i)					# Show extra information
	--tcrypt-hidden					# Mount a TCRYPT hidden volume
	--tcrypt-system					# Mount a TCRYPT system volume
	--no-copy-fallback(-C)					# Don't use copy and delete fallback
	--create(-c)					# Only create if not existing
	--append(-a)					# Append to end of file
	--private(-p)					# Restrict access to the current user
	--unlink(-u)					# Replace as if the destination didn't exist
	--print-etag(-v)					# Print new etag at end
	--empty					# Empty the trash
	--follow-symlinks(-l)					# Follow symbolic links
	...args
]

# List the contents of locations
extern "gio list" [
	--no-target-directory(-T)					# No target directory
	--progress(-p)					# Show progress
	--interactive(-i)					# Prompt before overwrite
	--backup(-b)					# Backup existing destination files
	--nofollow-symlinks(-n)					# Don't follow symbolic links
	--hidden(-h)					# Show hidden files
	--force(-f)					# Ignore nonexistent files
	--preserve					# Preserve all attributes
	--no-dereference(-P)					# Never follow symbolic links
	--default-permissions					# Use default permissions
	--query-writable(-w)					# List writable attributes
	--filesystem(-f)					# Get file system info
	--long(-l)					# Use a long listing format
	--print-display-names(-d)					# Print display names
	--print-uris(-u)					# Print full URIs
	--parent(-p)					# Create parent directories
	--no-moves(-n)					# Don't report move events
	--mounts(-m)					# Watch for mount events
	--mountable(-m)					# Mount as mountable
	--unmount(-u)					# Unmount
	--eject(-e)					# Eject
	--force(-f)					# Ignore outstanding file operations
	--anonymous(-a)					# Use an anonymous user
	--list(-l)					# List
	--monitor(-o)					# Monitor events
	--detail(-i)					# Show extra information
	--tcrypt-hidden					# Mount a TCRYPT hidden volume
	--tcrypt-system					# Mount a TCRYPT system volume
	--no-copy-fallback(-C)					# Don't use copy and delete fallback
	--create(-c)					# Only create if not existing
	--append(-a)					# Append to end of file
	--private(-p)					# Restrict access to the current user
	--unlink(-u)					# Replace as if the destination didn't exist
	--print-etag(-v)					# Print new etag at end
	--empty					# Empty the trash
	--follow-symlinks(-l)					# Follow symbolic links
	...args
]

# Get or set the handler
extern "gio mime" [
	--no-target-directory(-T)					# No target directory
	--progress(-p)					# Show progress
	--interactive(-i)					# Prompt before overwrite
	--backup(-b)					# Backup existing destination files
	--nofollow-symlinks(-n)					# Don't follow symbolic links
	--hidden(-h)					# Show hidden files
	--force(-f)					# Ignore nonexistent files
	--preserve					# Preserve all attributes
	--no-dereference(-P)					# Never follow symbolic links
	--default-permissions					# Use default permissions
	--query-writable(-w)					# List writable attributes
	--filesystem(-f)					# Get file system info
	--long(-l)					# Use a long listing format
	--print-display-names(-d)					# Print display names
	--print-uris(-u)					# Print full URIs
	--parent(-p)					# Create parent directories
	--no-moves(-n)					# Don't report move events
	--mounts(-m)					# Watch for mount events
	--mountable(-m)					# Mount as mountable
	--unmount(-u)					# Unmount
	--eject(-e)					# Eject
	--force(-f)					# Ignore outstanding file operations
	--anonymous(-a)					# Use an anonymous user
	--list(-l)					# List
	--monitor(-o)					# Monitor events
	--detail(-i)					# Show extra information
	--tcrypt-hidden					# Mount a TCRYPT hidden volume
	--tcrypt-system					# Mount a TCRYPT system volume
	--no-copy-fallback(-C)					# Don't use copy and delete fallback
	--create(-c)					# Only create if not existing
	--append(-a)					# Append to end of file
	--private(-p)					# Restrict access to the current user
	--unlink(-u)					# Replace as if the destination didn't exist
	--print-etag(-v)					# Print new etag at end
	--empty					# Empty the trash
	--follow-symlinks(-l)					# Follow symbolic links
	...args
]

# Create directories
extern "gio mkdir" [
	--no-target-directory(-T)					# No target directory
	--progress(-p)					# Show progress
	--interactive(-i)					# Prompt before overwrite
	--backup(-b)					# Backup existing destination files
	--nofollow-symlinks(-n)					# Don't follow symbolic links
	--hidden(-h)					# Show hidden files
	--force(-f)					# Ignore nonexistent files
	--preserve					# Preserve all attributes
	--no-dereference(-P)					# Never follow symbolic links
	--default-permissions					# Use default permissions
	--query-writable(-w)					# List writable attributes
	--filesystem(-f)					# Get file system info
	--long(-l)					# Use a long listing format
	--print-display-names(-d)					# Print display names
	--print-uris(-u)					# Print full URIs
	--parent(-p)					# Create parent directories
	--no-moves(-n)					# Don't report move events
	--mounts(-m)					# Watch for mount events
	--mountable(-m)					# Mount as mountable
	--unmount(-u)					# Unmount
	--eject(-e)					# Eject
	--force(-f)					# Ignore outstanding file operations
	--anonymous(-a)					# Use an anonymous user
	--list(-l)					# List
	--monitor(-o)					# Monitor events
	--detail(-i)					# Show extra information
	--tcrypt-hidden					# Mount a TCRYPT hidden volume
	--tcrypt-system					# Mount a TCRYPT system volume
	--no-copy-fallback(-C)					# Don't use copy and delete fallback
	--create(-c)					# Only create if not existing
	--append(-a)					# Append to end of file
	--private(-p)					# Restrict access to the current user
	--unlink(-u)					# Replace as if the destination didn't exist
	--print-etag(-v)					# Print new etag at end
	--empty					# Empty the trash
	--follow-symlinks(-l)					# Follow symbolic links
	...args
]

# Monitor files
extern "gio monitor" [
	--no-target-directory(-T)					# No target directory
	--progress(-p)					# Show progress
	--interactive(-i)					# Prompt before overwrite
	--backup(-b)					# Backup existing destination files
	--nofollow-symlinks(-n)					# Don't follow symbolic links
	--hidden(-h)					# Show hidden files
	--force(-f)					# Ignore nonexistent files
	--preserve					# Preserve all attributes
	--no-dereference(-P)					# Never follow symbolic links
	--default-permissions					# Use default permissions
	--query-writable(-w)					# List writable attributes
	--filesystem(-f)					# Get file system info
	--long(-l)					# Use a long listing format
	--print-display-names(-d)					# Print display names
	--print-uris(-u)					# Print full URIs
	--parent(-p)					# Create parent directories
	--no-moves(-n)					# Don't report move events
	--mounts(-m)					# Watch for mount events
	--mountable(-m)					# Mount as mountable
	--unmount(-u)					# Unmount
	--eject(-e)					# Eject
	--force(-f)					# Ignore outstanding file operations
	--anonymous(-a)					# Use an anonymous user
	--list(-l)					# List
	--monitor(-o)					# Monitor events
	--detail(-i)					# Show extra information
	--tcrypt-hidden					# Mount a TCRYPT hidden volume
	--tcrypt-system					# Mount a TCRYPT system volume
	--no-copy-fallback(-C)					# Don't use copy and delete fallback
	--create(-c)					# Only create if not existing
	--append(-a)					# Append to end of file
	--private(-p)					# Restrict access to the current user
	--unlink(-u)					# Replace as if the destination didn't exist
	--print-etag(-v)					# Print new etag at end
	--empty					# Empty the trash
	--follow-symlinks(-l)					# Follow symbolic links
	...args
]

# Mount or unmount the locations
extern "gio mount" [
	--no-target-directory(-T)					# No target directory
	--progress(-p)					# Show progress
	--interactive(-i)					# Prompt before overwrite
	--backup(-b)					# Backup existing destination files
	--nofollow-symlinks(-n)					# Don't follow symbolic links
	--hidden(-h)					# Show hidden files
	--force(-f)					# Ignore nonexistent files
	--preserve					# Preserve all attributes
	--no-dereference(-P)					# Never follow symbolic links
	--default-permissions					# Use default permissions
	--query-writable(-w)					# List writable attributes
	--filesystem(-f)					# Get file system info
	--long(-l)					# Use a long listing format
	--print-display-names(-d)					# Print display names
	--print-uris(-u)					# Print full URIs
	--parent(-p)					# Create parent directories
	--no-moves(-n)					# Don't report move events
	--mounts(-m)					# Watch for mount events
	--mountable(-m)					# Mount as mountable
	--unmount(-u)					# Unmount
	--eject(-e)					# Eject
	--force(-f)					# Ignore outstanding file operations
	--anonymous(-a)					# Use an anonymous user
	--list(-l)					# List
	--monitor(-o)					# Monitor events
	--detail(-i)					# Show extra information
	--tcrypt-hidden					# Mount a TCRYPT hidden volume
	--tcrypt-system					# Mount a TCRYPT system volume
	--no-copy-fallback(-C)					# Don't use copy and delete fallback
	--create(-c)					# Only create if not existing
	--append(-a)					# Append to end of file
	--private(-p)					# Restrict access to the current user
	--unlink(-u)					# Replace as if the destination didn't exist
	--print-etag(-v)					# Print new etag at end
	--empty					# Empty the trash
	--follow-symlinks(-l)					# Follow symbolic links
	...args
]

# Move files
extern "gio move" [
	--no-target-directory(-T)					# No target directory
	--progress(-p)					# Show progress
	--interactive(-i)					# Prompt before overwrite
	--backup(-b)					# Backup existing destination files
	--nofollow-symlinks(-n)					# Don't follow symbolic links
	--hidden(-h)					# Show hidden files
	--force(-f)					# Ignore nonexistent files
	--preserve					# Preserve all attributes
	--no-dereference(-P)					# Never follow symbolic links
	--default-permissions					# Use default permissions
	--query-writable(-w)					# List writable attributes
	--filesystem(-f)					# Get file system info
	--long(-l)					# Use a long listing format
	--print-display-names(-d)					# Print display names
	--print-uris(-u)					# Print full URIs
	--parent(-p)					# Create parent directories
	--no-moves(-n)					# Don't report move events
	--mounts(-m)					# Watch for mount events
	--mountable(-m)					# Mount as mountable
	--unmount(-u)					# Unmount
	--eject(-e)					# Eject
	--force(-f)					# Ignore outstanding file operations
	--anonymous(-a)					# Use an anonymous user
	--list(-l)					# List
	--monitor(-o)					# Monitor events
	--detail(-i)					# Show extra information
	--tcrypt-hidden					# Mount a TCRYPT hidden volume
	--tcrypt-system					# Mount a TCRYPT system volume
	--no-copy-fallback(-C)					# Don't use copy and delete fallback
	--create(-c)					# Only create if not existing
	--append(-a)					# Append to end of file
	--private(-p)					# Restrict access to the current user
	--unlink(-u)					# Replace as if the destination didn't exist
	--print-etag(-v)					# Print new etag at end
	--empty					# Empty the trash
	--follow-symlinks(-l)					# Follow symbolic links
	...args
]

# Open files
extern "gio open" [
	--no-target-directory(-T)					# No target directory
	--progress(-p)					# Show progress
	--interactive(-i)					# Prompt before overwrite
	--backup(-b)					# Backup existing destination files
	--nofollow-symlinks(-n)					# Don't follow symbolic links
	--hidden(-h)					# Show hidden files
	--force(-f)					# Ignore nonexistent files
	--preserve					# Preserve all attributes
	--no-dereference(-P)					# Never follow symbolic links
	--default-permissions					# Use default permissions
	--query-writable(-w)					# List writable attributes
	--filesystem(-f)					# Get file system info
	--long(-l)					# Use a long listing format
	--print-display-names(-d)					# Print display names
	--print-uris(-u)					# Print full URIs
	--parent(-p)					# Create parent directories
	--no-moves(-n)					# Don't report move events
	--mounts(-m)					# Watch for mount events
	--mountable(-m)					# Mount as mountable
	--unmount(-u)					# Unmount
	--eject(-e)					# Eject
	--force(-f)					# Ignore outstanding file operations
	--anonymous(-a)					# Use an anonymous user
	--list(-l)					# List
	--monitor(-o)					# Monitor events
	--detail(-i)					# Show extra information
	--tcrypt-hidden					# Mount a TCRYPT hidden volume
	--tcrypt-system					# Mount a TCRYPT system volume
	--no-copy-fallback(-C)					# Don't use copy and delete fallback
	--create(-c)					# Only create if not existing
	--append(-a)					# Append to end of file
	--private(-p)					# Restrict access to the current user
	--unlink(-u)					# Replace as if the destination didn't exist
	--print-etag(-v)					# Print new etag at end
	--empty					# Empty the trash
	--follow-symlinks(-l)					# Follow symbolic links
	...args
]

# Rename a file
extern "gio rename" [
	--no-target-directory(-T)					# No target directory
	--progress(-p)					# Show progress
	--interactive(-i)					# Prompt before overwrite
	--backup(-b)					# Backup existing destination files
	--nofollow-symlinks(-n)					# Don't follow symbolic links
	--hidden(-h)					# Show hidden files
	--force(-f)					# Ignore nonexistent files
	--preserve					# Preserve all attributes
	--no-dereference(-P)					# Never follow symbolic links
	--default-permissions					# Use default permissions
	--query-writable(-w)					# List writable attributes
	--filesystem(-f)					# Get file system info
	--long(-l)					# Use a long listing format
	--print-display-names(-d)					# Print display names
	--print-uris(-u)					# Print full URIs
	--parent(-p)					# Create parent directories
	--no-moves(-n)					# Don't report move events
	--mounts(-m)					# Watch for mount events
	--mountable(-m)					# Mount as mountable
	--unmount(-u)					# Unmount
	--eject(-e)					# Eject
	--force(-f)					# Ignore outstanding file operations
	--anonymous(-a)					# Use an anonymous user
	--list(-l)					# List
	--monitor(-o)					# Monitor events
	--detail(-i)					# Show extra information
	--tcrypt-hidden					# Mount a TCRYPT hidden volume
	--tcrypt-system					# Mount a TCRYPT system volume
	--no-copy-fallback(-C)					# Don't use copy and delete fallback
	--create(-c)					# Only create if not existing
	--append(-a)					# Append to end of file
	--private(-p)					# Restrict access to the current user
	--unlink(-u)					# Replace as if the destination didn't exist
	--print-etag(-v)					# Print new etag at end
	--empty					# Empty the trash
	--follow-symlinks(-l)					# Follow symbolic links
	...args
]

# Delete files
extern "gio remove" [
	--no-target-directory(-T)					# No target directory
	--progress(-p)					# Show progress
	--interactive(-i)					# Prompt before overwrite
	--backup(-b)					# Backup existing destination files
	--nofollow-symlinks(-n)					# Don't follow symbolic links
	--hidden(-h)					# Show hidden files
	--force(-f)					# Ignore nonexistent files
	--preserve					# Preserve all attributes
	--no-dereference(-P)					# Never follow symbolic links
	--default-permissions					# Use default permissions
	--query-writable(-w)					# List writable attributes
	--filesystem(-f)					# Get file system info
	--long(-l)					# Use a long listing format
	--print-display-names(-d)					# Print display names
	--print-uris(-u)					# Print full URIs
	--parent(-p)					# Create parent directories
	--no-moves(-n)					# Don't report move events
	--mounts(-m)					# Watch for mount events
	--mountable(-m)					# Mount as mountable
	--unmount(-u)					# Unmount
	--eject(-e)					# Eject
	--force(-f)					# Ignore outstanding file operations
	--anonymous(-a)					# Use an anonymous user
	--list(-l)					# List
	--monitor(-o)					# Monitor events
	--detail(-i)					# Show extra information
	--tcrypt-hidden					# Mount a TCRYPT hidden volume
	--tcrypt-system					# Mount a TCRYPT system volume
	--no-copy-fallback(-C)					# Don't use copy and delete fallback
	--create(-c)					# Only create if not existing
	--append(-a)					# Append to end of file
	--private(-p)					# Restrict access to the current user
	--unlink(-u)					# Replace as if the destination didn't exist
	--print-etag(-v)					# Print new etag at end
	--empty					# Empty the trash
	--follow-symlinks(-l)					# Follow symbolic links
	...args
]

# Read from stdin and save
extern "gio save" [
	--no-target-directory(-T)					# No target directory
	--progress(-p)					# Show progress
	--interactive(-i)					# Prompt before overwrite
	--backup(-b)					# Backup existing destination files
	--nofollow-symlinks(-n)					# Don't follow symbolic links
	--hidden(-h)					# Show hidden files
	--force(-f)					# Ignore nonexistent files
	--preserve					# Preserve all attributes
	--no-dereference(-P)					# Never follow symbolic links
	--default-permissions					# Use default permissions
	--query-writable(-w)					# List writable attributes
	--filesystem(-f)					# Get file system info
	--long(-l)					# Use a long listing format
	--print-display-names(-d)					# Print display names
	--print-uris(-u)					# Print full URIs
	--parent(-p)					# Create parent directories
	--no-moves(-n)					# Don't report move events
	--mounts(-m)					# Watch for mount events
	--mountable(-m)					# Mount as mountable
	--unmount(-u)					# Unmount
	--eject(-e)					# Eject
	--force(-f)					# Ignore outstanding file operations
	--anonymous(-a)					# Use an anonymous user
	--list(-l)					# List
	--monitor(-o)					# Monitor events
	--detail(-i)					# Show extra information
	--tcrypt-hidden					# Mount a TCRYPT hidden volume
	--tcrypt-system					# Mount a TCRYPT system volume
	--no-copy-fallback(-C)					# Don't use copy and delete fallback
	--create(-c)					# Only create if not existing
	--append(-a)					# Append to end of file
	--private(-p)					# Restrict access to the current user
	--unlink(-u)					# Replace as if the destination didn't exist
	--print-etag(-v)					# Print new etag at end
	--empty					# Empty the trash
	--follow-symlinks(-l)					# Follow symbolic links
	...args
]

# Set a file attribute
extern "gio set" [
	--no-target-directory(-T)					# No target directory
	--progress(-p)					# Show progress
	--interactive(-i)					# Prompt before overwrite
	--backup(-b)					# Backup existing destination files
	--nofollow-symlinks(-n)					# Don't follow symbolic links
	--hidden(-h)					# Show hidden files
	--force(-f)					# Ignore nonexistent files
	--preserve					# Preserve all attributes
	--no-dereference(-P)					# Never follow symbolic links
	--default-permissions					# Use default permissions
	--query-writable(-w)					# List writable attributes
	--filesystem(-f)					# Get file system info
	--long(-l)					# Use a long listing format
	--print-display-names(-d)					# Print display names
	--print-uris(-u)					# Print full URIs
	--parent(-p)					# Create parent directories
	--no-moves(-n)					# Don't report move events
	--mounts(-m)					# Watch for mount events
	--mountable(-m)					# Mount as mountable
	--unmount(-u)					# Unmount
	--eject(-e)					# Eject
	--force(-f)					# Ignore outstanding file operations
	--anonymous(-a)					# Use an anonymous user
	--list(-l)					# List
	--monitor(-o)					# Monitor events
	--detail(-i)					# Show extra information
	--tcrypt-hidden					# Mount a TCRYPT hidden volume
	--tcrypt-system					# Mount a TCRYPT system volume
	--no-copy-fallback(-C)					# Don't use copy and delete fallback
	--create(-c)					# Only create if not existing
	--append(-a)					# Append to end of file
	--private(-p)					# Restrict access to the current user
	--unlink(-u)					# Replace as if the destination didn't exist
	--print-etag(-v)					# Print new etag at end
	--empty					# Empty the trash
	--follow-symlinks(-l)					# Follow symbolic links
	...args
]

# Move files to the trash
extern "gio trash" [
	--no-target-directory(-T)					# No target directory
	--progress(-p)					# Show progress
	--interactive(-i)					# Prompt before overwrite
	--backup(-b)					# Backup existing destination files
	--nofollow-symlinks(-n)					# Don't follow symbolic links
	--hidden(-h)					# Show hidden files
	--force(-f)					# Ignore nonexistent files
	--preserve					# Preserve all attributes
	--no-dereference(-P)					# Never follow symbolic links
	--default-permissions					# Use default permissions
	--query-writable(-w)					# List writable attributes
	--filesystem(-f)					# Get file system info
	--long(-l)					# Use a long listing format
	--print-display-names(-d)					# Print display names
	--print-uris(-u)					# Print full URIs
	--parent(-p)					# Create parent directories
	--no-moves(-n)					# Don't report move events
	--mounts(-m)					# Watch for mount events
	--mountable(-m)					# Mount as mountable
	--unmount(-u)					# Unmount
	--eject(-e)					# Eject
	--force(-f)					# Ignore outstanding file operations
	--anonymous(-a)					# Use an anonymous user
	--list(-l)					# List
	--monitor(-o)					# Monitor events
	--detail(-i)					# Show extra information
	--tcrypt-hidden					# Mount a TCRYPT hidden volume
	--tcrypt-system					# Mount a TCRYPT system volume
	--no-copy-fallback(-C)					# Don't use copy and delete fallback
	--create(-c)					# Only create if not existing
	--append(-a)					# Append to end of file
	--private(-p)					# Restrict access to the current user
	--unlink(-u)					# Replace as if the destination didn't exist
	--print-etag(-v)					# Print new etag at end
	--empty					# Empty the trash
	--follow-symlinks(-l)					# Follow symbolic links
	...args
]

# Lists the contents of locations in a tree
extern "gio tree" [
	--no-target-directory(-T)					# No target directory
	--progress(-p)					# Show progress
	--interactive(-i)					# Prompt before overwrite
	--backup(-b)					# Backup existing destination files
	--nofollow-symlinks(-n)					# Don't follow symbolic links
	--hidden(-h)					# Show hidden files
	--force(-f)					# Ignore nonexistent files
	--preserve					# Preserve all attributes
	--no-dereference(-P)					# Never follow symbolic links
	--default-permissions					# Use default permissions
	--query-writable(-w)					# List writable attributes
	--filesystem(-f)					# Get file system info
	--long(-l)					# Use a long listing format
	--print-display-names(-d)					# Print display names
	--print-uris(-u)					# Print full URIs
	--parent(-p)					# Create parent directories
	--no-moves(-n)					# Don't report move events
	--mounts(-m)					# Watch for mount events
	--mountable(-m)					# Mount as mountable
	--unmount(-u)					# Unmount
	--eject(-e)					# Eject
	--force(-f)					# Ignore outstanding file operations
	--anonymous(-a)					# Use an anonymous user
	--list(-l)					# List
	--monitor(-o)					# Monitor events
	--detail(-i)					# Show extra information
	--tcrypt-hidden					# Mount a TCRYPT hidden volume
	--tcrypt-system					# Mount a TCRYPT system volume
	--no-copy-fallback(-C)					# Don't use copy and delete fallback
	--create(-c)					# Only create if not existing
	--append(-a)					# Append to end of file
	--private(-p)					# Restrict access to the current user
	--unlink(-u)					# Replace as if the destination didn't exist
	--print-etag(-v)					# Print new etag at end
	--empty					# Empty the trash
	--follow-symlinks(-l)					# Follow symbolic links
	...args
]

# Command
extern "gio version cat copy info list mime mkdir monitor mount move open rename remove save set trash tree" [
	--no-target-directory(-T)					# No target directory
	--progress(-p)					# Show progress
	--interactive(-i)					# Prompt before overwrite
	--backup(-b)					# Backup existing destination files
	--nofollow-symlinks(-n)					# Don't follow symbolic links
	--hidden(-h)					# Show hidden files
	--force(-f)					# Ignore nonexistent files
	--preserve					# Preserve all attributes
	--no-dereference(-P)					# Never follow symbolic links
	--default-permissions					# Use default permissions
	--query-writable(-w)					# List writable attributes
	--filesystem(-f)					# Get file system info
	--long(-l)					# Use a long listing format
	--print-display-names(-d)					# Print display names
	--print-uris(-u)					# Print full URIs
	--parent(-p)					# Create parent directories
	--no-moves(-n)					# Don't report move events
	--mounts(-m)					# Watch for mount events
	--mountable(-m)					# Mount as mountable
	--unmount(-u)					# Unmount
	--eject(-e)					# Eject
	--force(-f)					# Ignore outstanding file operations
	--anonymous(-a)					# Use an anonymous user
	--list(-l)					# List
	--monitor(-o)					# Monitor events
	--detail(-i)					# Show extra information
	--tcrypt-hidden					# Mount a TCRYPT hidden volume
	--tcrypt-system					# Mount a TCRYPT system volume
	--no-copy-fallback(-C)					# Don't use copy and delete fallback
	--create(-c)					# Only create if not existing
	--append(-a)					# Append to end of file
	--private(-p)					# Restrict access to the current user
	--unlink(-u)					# Replace as if the destination didn't exist
	--print-etag(-v)					# Print new etag at end
	--empty					# Empty the trash
	--follow-symlinks(-l)					# Follow symbolic links
	...args
]

# No target directory
extern "gio" [
	--no-target-directory(-T)					# No target directory
	--progress(-p)					# Show progress
	--interactive(-i)					# Prompt before overwrite
	--backup(-b)					# Backup existing destination files
	--nofollow-symlinks(-n)					# Don't follow symbolic links
	--hidden(-h)					# Show hidden files
	--force(-f)					# Ignore nonexistent files
	--preserve					# Preserve all attributes
	--no-dereference(-P)					# Never follow symbolic links
	--default-permissions					# Use default permissions
	--query-writable(-w)					# List writable attributes
	--filesystem(-f)					# Get file system info
	--long(-l)					# Use a long listing format
	--print-display-names(-d)					# Print display names
	--print-uris(-u)					# Print full URIs
	--parent(-p)					# Create parent directories
	--no-moves(-n)					# Don't report move events
	--mounts(-m)					# Watch for mount events
	--mountable(-m)					# Mount as mountable
	--unmount(-u)					# Unmount
	--eject(-e)					# Eject
	--force(-f)					# Ignore outstanding file operations
	--anonymous(-a)					# Use an anonymous user
	--list(-l)					# List
	--monitor(-o)					# Monitor events
	--detail(-i)					# Show extra information
	--tcrypt-hidden					# Mount a TCRYPT hidden volume
	--tcrypt-system					# Mount a TCRYPT system volume
	--no-copy-fallback(-C)					# Don't use copy and delete fallback
	--create(-c)					# Only create if not existing
	--append(-a)					# Append to end of file
	--private(-p)					# Restrict access to the current user
	--unlink(-u)					# Replace as if the destination didn't exist
	--print-etag(-v)					# Print new etag at end
	--empty					# Empty the trash
	--follow-symlinks(-l)					# Follow symbolic links
	...args
]