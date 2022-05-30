# Run evince in fullscreen mode
extern "evince" [
	--fullscreen(-f)					# Run evince in fullscreen mode
	--presentation(-s)					# Run evince in presentation mode
	--preview(-w)					# Run evince as a previewer
	--display					# X display to use
	...args
]