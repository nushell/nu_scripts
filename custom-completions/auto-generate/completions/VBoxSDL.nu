# Run separate VM process or attach to a running VM
extern "VBoxSDL" [
	--seperate					# Run separate VM process or attach to a running VM
	--hda					# Set temporary first hard disk
	--fda					# Set temporary first floppy disk
	--fullscreen					# Start VM in fullscreen mode
	--fullscreenresize					# Resize guest on fullscreen
	--nofstoggle					# Forbid switching to/from fullscreen mode
	--noresize					# Make SDL frame non resizable
	--nohostkey					# Disable all hoskey combinations
	--nohostkeys					# Disable specific hostkey combinations
	--nograbonclick					# Disable mouse/keyboard grabbing on mouse click w/o additions
	--detecthostkey					# Get hostkey identifier and modifier state
	--termacpi					# Send APCI power button when closing window
	--vrdp					# Listen for VRDP connexions on if one of specified
	--discardstate					# Discard saved state (if present) and revert to last snapshot (if present)
	--settingspwfile					# Specify file containing setting password
	--rowr0					# Enable raw ring 3
	--rowr3					# Enable raw ring 0
	--patm					# Enable PATM
	--csam					# Enable CSAM
	--hwvirtex					# Permit usage of VT-x/AMD-V
	--norowr0					# Disable raw ring 3
	--norowr3					# Disable raw ring 0
	--nopatm					# Disable PATM
	--nocsam					# Disable CSAM
	--nohwvirtex					# Deny usage of VT-x/AMD-V
	...args
]