# Print versions of the specified libraries
extern "pkg-config" [
	--modversion					# Print versions of the specified libraries
	--version					# Display the version of pkg-config and quit
	--help					# Displays a help message and quit
	--print-errors					# Print message when errors occur
	--silence-errors					# Stay quiet when errors occur
	--errors-to-stdout					# Print errors to stdout instead of stderr
	--debug					# Print debugging information
	--cflags					# Print pre-processor and compile flags for the specified libraries
	--cflags-only-I					# This prints the -I part of "--cflags".
	--libs					# Print link flags
	--libs-only-L					# This prints the -L/-R part of "--libs".
	--libs-only-l					# This prints the -l part of "--libs
	--variable					# This returns the value of a variable defined in a packages .pc file
	--define-variable					# This sets a global value for a variable
	--print-variables					# Returns a list of all variables defined in the package
	--uninstalled					# Return success if any -uninstalled packages are used
	--max-version					# Test if a package has at most the specified version
	--atleast-version					# Test if a package has at least this version
	--exact-version					# Test if a package has exactly this version
	--exists					# Test if a package exists
	--static					# Output libraries suitable for static linking
	--list-all					# List all modules found in the pkg-config path
	--print-provides					# List all modules the given packages provides
	--print-requires					# List all modules the given packages requires
	--print-requires-private					# List all modules the given packages requires for static linking
	...args
]