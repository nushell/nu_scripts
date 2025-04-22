# Erase variable
extern "set" [
	--erase(-e)					# Erase variable
	--export(-x)					# Export variable to subprocess
	--unexport(-u)					# Do not export variable to subprocess
	--function(-f)					# Make variable function-scoped
	--global(-g)					# Make variable scope global
	--local(-l)					# Make variable scope local
	--long(-L)					# Do not truncate long lines
	--universal(-U)					# Share variable persistently across sessions
	--query(-q)					# Test if variable is defined
	--help(-h)					# Display help and exit
	--names(-n)					# List the names of the variables, but not their value
	--append(-a)					# Append value to a list
	--prepend(-p)					# Prepend value to a list
	--show(-S)					# Show variable
	--path					# Make variable as a path variable
	--unpath					# Make variable not as a path variable
	--no-event					# Don't emit an event
	...args
]