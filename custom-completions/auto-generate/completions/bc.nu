# Force interactive mode
extern "bc" [
	--interactive(-i)					# Force interactive mode
	--mathlib(-l)					# Define math library
	--warn(-w)					# Give warnings for extensions to POSIX bc
	--standard(-s)					# Process exactly POSIX bc
	--quiet(-q)					# Do not print the GNU welcome
	--version(-v)					# Display version and exit
	--help(-h)					# Display help and exit
	...args
]