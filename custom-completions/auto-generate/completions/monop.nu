# Specifies the assembly to use for looking up the type
extern "monop" [
	--search(-k)					# Searches through all known assemblies for types containing \'class\
	--refs					# Print a list of the referenced assemblies for an assembly.
	--filter-obsolete(-f)					# Do not show obsolete types and members
	--declared-only(-d)					# Only show members declared in the type
	--private(-p)					# Show private members
	--runtime-version					# Print runtime version
	...args
]