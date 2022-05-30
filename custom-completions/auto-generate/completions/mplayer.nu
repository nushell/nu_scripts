# Skip frames to maintain A/V sync
extern "mplayer" [
	--help					# Display help and exit
	--version					# Display version and exit
	...args
]

# 
extern "mplayer 0 1 2 3 4 5 6 7 8 9" [
	--help					# Display help and exit
	--version					# Display version and exit
	...args
]