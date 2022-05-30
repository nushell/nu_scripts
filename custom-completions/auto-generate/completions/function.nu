# Function
extern "function" [
	--on-signal(-s)					# Make the function a signal event handler
	--on-variable(-v)					# Make the function a variable update event handler
	--on-event(-e)					# Make the function a generic event handler
	--no-scope-shadowing(-S)					# Do not shadow variable scope of calling function
	--wraps(-w)					# Inherit completions from the given command
	--inherit-variable(-V)					# Snapshot and define local variable
	...args
]