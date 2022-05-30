# Display debugger-only symbols
extern "nm" [
	--debug-syms(-a)					# Display debugger-only symbols
	--print-file-name(-A)					# Print name of the input file before every symbol
	--no-demangle					# Do not demangle low-level symbol names
	--dynamic(-D)					# Display dynamic symbols instead of normal symbols
	--defined-only					# Display only defined symbols
	--format(-f)					# Use the output format FORMAT. The default is "bsd
	--extern-only(-g)					# Display only external symbols
	--line-numbers(-l)					# Use debugging information to find a filename and line number for each symbol
	--numeric-sort(-n)					# Sort symbols numerically by address
	--no-sort(-p)					# Do not sort the symbols
	--portability(-P)					# Same as --format=posix
	--reverse-sort(-r)					# Reverse the sense of the sort
	--plugin					# Load the specified plugin
	--print-size(-S)					# Print size of defined symbols
	--print-armap(-s)					# Include index for symbols from archive members
	--size-sort					# Sort symbols by size
	--special-syms					# Include special symbols in the output
	--synthetic					# Display synthetic symbols as well
	--radix(-t)					# Use RADIX for printing symbol values
	--target					# Specify the target object format as BFDNAME
	--undefined-only(-u)					# Display only undefined symbols
	--help(-h)					# Display this information
	--version(-V)					# Display this program's version number
	...args
]

# Use the output format FORMAT. The default is "bsd
extern "nm bsd sysv posix" [
	--debug-syms(-a)					# Display debugger-only symbols
	--print-file-name(-A)					# Print name of the input file before every symbol
	--no-demangle					# Do not demangle low-level symbol names
	--dynamic(-D)					# Display dynamic symbols instead of normal symbols
	--defined-only					# Display only defined symbols
	--format(-f)					# Use the output format FORMAT. The default is "bsd
	--extern-only(-g)					# Display only external symbols
	--line-numbers(-l)					# Use debugging information to find a filename and line number for each symbol
	--numeric-sort(-n)					# Sort symbols numerically by address
	--no-sort(-p)					# Do not sort the symbols
	--portability(-P)					# Same as --format=posix
	--reverse-sort(-r)					# Reverse the sense of the sort
	--plugin					# Load the specified plugin
	--print-size(-S)					# Print size of defined symbols
	--print-armap(-s)					# Include index for symbols from archive members
	--size-sort					# Sort symbols by size
	--special-syms					# Include special symbols in the output
	--synthetic					# Display synthetic symbols as well
	--radix(-t)					# Use RADIX for printing symbol values
	--target					# Specify the target object format as BFDNAME
	--undefined-only(-u)					# Display only undefined symbols
	--help(-h)					# Display this information
	--version(-V)					# Display this program's version number
	...args
]