# 
extern "gvim" [
	--nofork(-f)					# Dont fork when starting GUI
	--echo-wid					# Echo the Window ID on stdout
	...args
]