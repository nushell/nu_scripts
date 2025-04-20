# Get device info
extern "brightnessctl info" [
	--help(-h)					# Print help and exit
	--list(-l)					# List devices with available brightness controls
	--quiet(-q)					# Suppress output
	--pretend(-p)					# Do not perform write operations
	--machine-readable(-m)					# Produce machine-readable output
	--save(-s)					# Save state in a temporary file
	--restore(-r)					# Restore previously-saved state
	--device(-d)					# Device Name
	--class(-c)					# Specify device class
	...args
]

# Get current brightness of device
extern "brightnessctl get" [
	--help(-h)					# Print help and exit
	--list(-l)					# List devices with available brightness controls
	--quiet(-q)					# Suppress output
	--pretend(-p)					# Do not perform write operations
	--machine-readable(-m)					# Produce machine-readable output
	--save(-s)					# Save state in a temporary file
	--restore(-r)					# Restore previously-saved state
	--device(-d)					# Device Name
	--class(-c)					# Specify device class
	...args
]

# Get maximum brightness of device
extern "brightnessctl set" [
	--help(-h)					# Print help and exit
	--list(-l)					# List devices with available brightness controls
	--quiet(-q)					# Suppress output
	--pretend(-p)					# Do not perform write operations
	--machine-readable(-m)					# Produce machine-readable output
	--save(-s)					# Save state in a temporary file
	--restore(-r)					# Restore previously-saved state
	--device(-d)					# Device Name
	--class(-c)					# Specify device class
	...args
]

# Set brightness of device
extern "brightnessctl max" [
	--help(-h)					# Print help and exit
	--list(-l)					# List devices with available brightness controls
	--quiet(-q)					# Suppress output
	--pretend(-p)					# Do not perform write operations
	--machine-readable(-m)					# Produce machine-readable output
	--save(-s)					# Save state in a temporary file
	--restore(-r)					# Restore previously-saved state
	--device(-d)					# Device Name
	--class(-c)					# Specify device class
	...args
]

# Print help and exit
extern "brightnessctl" [
	--help(-h)					# Print help and exit
	--list(-l)					# List devices with available brightness controls
	--quiet(-q)					# Suppress output
	--pretend(-p)					# Do not perform write operations
	--machine-readable(-m)					# Produce machine-readable output
	--save(-s)					# Save state in a temporary file
	--restore(-r)					# Restore previously-saved state
	--device(-d)					# Device Name
	--class(-c)					# Specify device class
	...args
]