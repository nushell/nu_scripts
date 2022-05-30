# Show help
extern "yast2" [
	--help(-h)					# Show help
	--list(-l)					# List all available modules
	--qt					# Use the QT graphical user interface
	--gtk					# Use the GTK graphical user interface
	--ncurses					# Use the NCURSES text-mode user interface
	--geometry(-g)					# Default window size (qt only)
	--noborder					# No window manager border for main window
	--fullscreen					# Use full screen
	...args
]