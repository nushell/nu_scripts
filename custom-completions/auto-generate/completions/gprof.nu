[# Print annotated source
extern "gprof" [
	--annoted-source(-A)					# Print annotated source
	--brief(-b)					# Do not print explanations
	--exec-counts(-C)					# Print tally
	--file-info(-i)					# Display summary
	--directory-path(-I)					# Search directories for source
	--no-annotated-source(-J)					# No annotated source
	--print-path(-L)					# Print full path of source
	--flat-profile(-p)					# Print flat profile
	--no-flat-profile(-P)					# No flat profile
	--graph(-q)					# Print call graph
	--no-graph(-Q)					# No call graph
	--separate-files(-y)					# Annotate to file
	--no-exec-counts(-Z)					# No tally
	--function-ordering					# Suggest function ordering
	--traditional(-T)					# Traditional mode
	--all-lines(-x)					# Annotate every line
	--no-demangle					# Turn of demangling
	...args
]]

[# Suggest file ordering
extern "" [
	--file-ordering					# Suggest file ordering
	--width(-w)					# Set width of output
	--demangle					# Set demangling style
	--no-static(-a)					# Suppress static functions
	--static-call-graph(-c)
	--ignore-non-functions(-D)					# Ignore symbols not known to be functions
	--line(-l)					# Line by line profiling
	--time(-n)					# Only propagate times for matching symbols
	--no-time(-N)					# Do not propagate times for matching symbols
	--display-unused-functions(-z)					# Mention unused functions in flat profile
	--debug(-d)					# Specify debugging options
	--help(-h)					# Display help and exit
	--version(-v)					# Display version and exit
	--sum(-s)					# Print summary
	...args
]]