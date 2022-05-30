# Start in Arabic mode
extern "vim" [
	--no-fork					# Start in foreground mode
	--echo-wid					# Echo the Window ID on stdout (GTK GUI only)
	--help					# Print help message and exit
	--literal					# Do not expand wildcards
	--noplugin					# Skip loading plugins
	--remote					# Edit files on Vim server
	--remote-expr					# Evaluate expr on Vim server
	--remote-send					# Send keys to Vim server
	--remote-silent					# Edit files on Vim server
	--remote-wait					# Edit files on Vim server
	--remote-wait-silent					# Edit files on Vim server
	--serverlist					# List all Vim servers that can be found
	--servername					# Set server name
	--version					# Print version information and exit
	...args
]