# Show help
extern "octave" [
	--help(-h)					# Show help
	--version(-v)					# Show version
	--debug(-d)					# Enter parser debugging mode
	--debug-jit					# Enable JIT compiler debugging/tracing
	--echo-commands(-x)					# Echo commands as they are executed
	--gui					# Start the graphical user interface
	--interactive(-i)					# Force interactive behavior
	--jit-compiler					# Enable the JIT compiler
	--line-editing					# Force readline use for command-line editing
	--no-gui					# Disable the graphical user interface
	--no-history(-H)					# Don\'t
	--no-init-file					# Don\'t
	--no-init-path					# Don\'t
	--no-window-system(-W)					# Disable window system, including graphics
	--norc(-f)					# Don\'t
	--persist					# Go interactive after --eval or reading
	--quiet(-q)					# Don\'t
	--traditional					# Set variables for closer MATLAB compatibility
	--verbose(-V)					# Enable verbose output in some cases
	...args
]