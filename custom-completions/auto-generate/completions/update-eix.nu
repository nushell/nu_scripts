# Show a short help screen
extern "update-eix" [
	--help(-h)					# Show a short help screen
	--version(-V)					# Show version string
	--dump					# Show eixrc-variables
	--dump-defaults					# Show default eixrc-variables
	--quiet(-q)					# Produce no output
	--output(-o)					# Output to the given file
	--exclude-overlay(-x)					# Exclude the given overlay from the update-process
	--add-overlay(-a)					# Add the given overlay to the update-process
	--override-method(-m)					# Override cache method for a specified overlay
	...args
]