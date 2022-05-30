# Display help and exit
extern "read" [
	--help(-h)					# Display help and exit
	--export(-x)					# Export variable to subprocess
	--global(-g)					# Make variable scope global
	--local(-l)					# Make variable scope local
	--universal(-U)					# Share variable with all the users fish processes on the computer
	--unexport(-u)					# Do not export variable to subprocess
	--shell(-S)					# Read like the shell would
	--silent(-s)					# Mask input with ●
	--array(-a)					# Store the results as an array
	--null(-z)					# Use NUL character as line terminator
	--line(-L)					# Read each line into its own variable
	--tokenize(-t)					# Use shell tokenization rules when splitting
	...args
]