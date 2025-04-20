# Show help and exit
extern "xviewer" [
	--help(-h)					# Show help and exit
	--version					# Show version and exit
	--usage					# Show help and exit
	--disable-sound					# Do not use sound server
	--enable-sound					# Use sound server
	--espeaker					# Host:port on which sound
	--gdk-debug					# Enabled Gdk flags
	--gdk-no-debug					# Disabled Gdk flags
	--display					# X display
	--sync					# Synchronize X calls
	--no-xshm					# Do not use X shared memory extension
	--name					# Program name
	--class					# Program class
	--gxid_host
	--gxid_port
	--xim-preedit
	--xim-status
	--gtk-debug					# Enabled Gtk+ flags
	--gtk-no-debug					# Disabled Gtk+ flags
	--g-fatal					# Treat warnings as fatal errors
	--gtk-module					# Additional Gtk module
	--disable-crash-dialog
	--sm-client-id					# Session management ID
	--sm-config-prefix					# Prefix of saved configuration
	--sm-disable					# Disable connection to session manager
	...args
]