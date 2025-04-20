# 
extern "lazygit" [
	--help(-h)					# Display help
	--version(-v)					# Print version
	--path(-p)					# Path of git repo
	--config(-c)					# Print the default config
	--print-config-dir					# Print the config directory
	--work-tree(-w)					# Equivalent of the --work-tree git argument
	--debug(-d)					# Run in debug mode with logging
	--logs(-l)					# Tail lazygit logs; used with --debug
	--profile					# Start the profiler and serve it on http port 6060
	...args
]