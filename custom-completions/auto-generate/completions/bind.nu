# Show unavailable key bindings/erase all bindings
extern "bind" [
	--all(-a)					# Show unavailable key bindings/erase all bindings
	--erase(-e)					# Erase mode
	--function-names(-f)					# Print names of available functions
	--help(-h)					# Display help and exit
	--key(-k)					# Specify key name, not sequence
	--key-names(-K)					# Print names of available keys
	--mode(-M)					# Specify the bind mode that the bind is used in
	--sets-mode(-m)					# Change current mode after bind is executed
	--list-modes(-L)					# Display a list of defined bind modes
	--silent(-s)					# Operate silently
	--preset					# Operate on preset bindings
	--user					# Operate on user bindings
	...args
]