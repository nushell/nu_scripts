# Compute classpath and echo to stdout only
extern "clj" [
	--report					# Report uncaught exception to \"file\" (default), \"stderr\", or \"none\
	--version					# Print the version to stdout and exit
	--main(-m)					# Call the -main function from namespace w/args
	--repl(-r)					# Run a repl
	...args
]