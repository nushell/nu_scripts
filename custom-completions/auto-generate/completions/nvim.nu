# 
extern "" [

	...args
]

# Open horizontally split windows for each file
extern "nvim" [
	--help(-h)					# Print help message and exit
	--noplugin					# Skip loading plugins
	--version(-v)					# Print version information and exit
	--clean					# Factory defaults: skip vimrc, plugins, shada
	--api-info					# Write msgpack-encoded API metadata to stdout
	--embed					# Use stdin/stdout as a msgpack-rpc channel
	--headless					# Don't start a user interface
	--remote					# Edit files on nvim server specified with --server
	--remote-expr					# Evaluate expr on nvim server specified with --server
	--remote-send					# Send keys to nvim server specified with --server
	--remote-silent					# Edit files on nvim server specified with --server
	...args
]