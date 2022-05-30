# Display this help and exit
extern "m4" [
	--help					# Display this help and exit
	--version					# Output version information and exit
	--fatal-warnings(-E)					# Once: warnings become errors, twice: stop execution at first error
	--interactive(-i)					# Unbuffer output, ignore interrupts
	--prefix-builtins(-P)					# Force a m4_ prefix to all builtins
	--silent(-Q)					# Suppress some warnings for builtins
	--warn-macro-sequence					# Warn if macro definition matches REGEXP, default \$\({[^}]*}\|[0-9][0-9]+\)
	--define(-D)					# Define NAME as having VALUE, or empty
	--include(-I)					# Append DIRECTORY to include path
	--synclines(-s)					# Generate #line NUM "FILE" lines
	--undefine(-U)					# Undefine NAME
	--traditional(-G)					# Suppress all GNU extensions
	--hashsize(-H)					# Set symbol lookup hash table size [509]
	--nesting-limit(-L)					# Change artificial nesting limit [1024]
	--freeze-state(-F)					# Produce a frozen state on FILE at end
	--reload-state(-R)					# Reload a frozen state from FILE at start
	--debug(-d)					# Set debug level (no FLAGS implies aeq)
	--debugfile					# Redirect debug and trace output
	--arglength(-l)					# Restrict macro tracing size
	--trace(-t)					# Trace NAME when it is defined
	...args
]