# Print only 'author'
extern "modinfo" [
	--author(-a)					# Print only 'author'
	--description(-d)					# Print only 'description'
	--license(-l)					# Print only 'license'
	--parameters(-p)					# Print only 'parm'
	--filename(-n)					# Print only 'filename'
	--null(-0)					# Use \\0 instead of \\n
	--version(-V)					# Show version
	--help(-h)					# Show help
	...args
]