# Open a new window
extern "smerge" [
	--new-window(-n)					# Open a new window
	--launch-or-new-window					# Open new window only if app is running
	--background(-b)					# Don't activate the application
	--safe-mode					# Launch in a sandboxed environment
	--help(-h)					# Show help (this message) and exit
	--version(-v)					# Show version and exit
	--no-wait					# Don't wait for the application to close
	...args
]