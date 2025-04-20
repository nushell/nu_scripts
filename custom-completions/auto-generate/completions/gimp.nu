# show help
extern "gimp" [
	--help(-h)					# show help
	--help-all					# show help with advanced options
	--help-gtk					# show help with GTK+ options
	--help-gegl					# show help with GEGL options
	--version(-v)					# show version
	--license					# show license
	--verbose					# show verbosely
	--new-instance(-n)					# open new instance
	--as-new(-a)					# open with new images
	--no-interface(-i)					# hide UI
	--no-data(-d)					# do not load patterns, gradients, palettes, and brushes
	--no-fonts(-f)					# do not load fonts
	--no-splash(-s)					# hide splash screen
	--no-shm					# do not use shared memory
	--no-cpu-accel					# do not use CPU acceleration
	--dump-gimprc					# show gimprc
	--console-messages					# show messages on the console
	--debug-handlers					# enable debug handlers
	...args
]