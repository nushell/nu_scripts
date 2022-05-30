# Enable Compass imports and load project configuration
extern "sass" [
	--compass					# Enable Compass imports and load project configuration
	--help(-h)					# Show help message
	--version(-v)					# Print the version
	--watch					# Watch files or directories for changes
	--poll					# Check for file changes manually, don't rely on OS
	--update					# Compile files or directories to CSS
	--force(-f)					# Recompile every Sass file, even if the CSS file is newer
	--stop-on-error					# If a file fails to compile, exit immediately
	--scss					# Use the CSS-superset SCSS syntax.
	--stdin(-s)					# Read input from standard input instead of an input file
	--unix-newlines					# Use Unix-style newlines in written files
	--debug-info(-g)					# Emit output that can be used by the FireSass Firebug plugin
	--line-comments(-l)					# Indicate corresponding source line with comments
	--interactive(-i)					# Run an interactive SassScript shell
	--check(-c)					# Just check syntax, don't evaluate
	--no-cache(-C)					# Don't cache parsed Sass files
	--trace					# Show a full Ruby stack trace on error
	--quiet(-q)					# Silence warnings and status messages during compilation
	...args
]