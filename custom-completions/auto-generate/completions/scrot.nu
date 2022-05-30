# Display help and exit
extern "scrot" [
	--help(-h)					# Display help and exit
	--version(-v)					# Display version information and exit
	--border(-b)					# When selecting a window, grab wm border too
	--count(-c)					# Display a countdown when used with delay
	--delay(-d)					# Wait NUMBER of seconds before taking a shot
	--exec(-e)					# Execute APPLICATION on the saved image
	--quality(-q)					# Image quality [1-100]
	--multidisp(-m)					# Grab shot from multiple heads
	--select(-s)					# Select a window or rectangle with the mouse
	--thumb(-t)					# Generate thumbnail PERCENT of original
	...args
]