# No graphic chars for line drawing
extern "mc" [
	--stickchars(-a)					# No graphic chars for line drawing
	--nocolor(-b)					# Force black and white display
	--color(-c)					# Force color mode
	--colors(-C)					# Specify a different color set
	--nomouse(-d)					# Disable mouse support
	--edit(-e)					# Start the internal editor with FILE
	--datadir(-f)					# Display the compiled-in search paths
	--datadir-info(-F)					# Display extended info about compiled-in paths
	--configure-options					# Display configure options
	--resetsoft(-k)					# Reset softkeys to their default
	--nokeymap					# Use default hardcoded keys
	--ftplog(-l)					# Save the ftpfs dialog with the server in FILE
	--printwd(-P)					# Print the last working directory to FILE
	--termcap(-t)					# Use the TERMCAP variable for terminal info
	--nosubshell(-u)					# Disable use of the concurrent shell
	--subshell(-U)					# Enable use of the concurrent shell
	--view(-v)					# Start the internal viewer with FILE
	--version(-V)					# Display the version of the program
	--xterm(-x)					# Force xterm mode
	--oldmouse(-g)					# Force a "normal tracking" mouse mode
	...args
]