# Append input to selection
extern "xsel" [
	--append(-a)					# Append input to selection
	--follow(-f)					# Append to selection as input grows
	--input(-i)					# Read into selection
	--output(-o)					# Write selection
	--clear(-c)					# Clear selection
	--delete(-d)					# Delete selection
	--primary(-p)					# Use primary selection
	--secondary(-s)					# Use secondary selection
	--clipboard(-b)					# Use clipboard selection
	--keep(-k)					# Make current selections persistent after program exit
	--exchange(-x)					# Exchange primary and secondary selections
	--selectionTimeout(-t)					# Timeout for retrieving selection
	--logfile(-l)					# Error log
	--nodetach(-n)					# Do not detach from the controlling terminal
	--help(-h)					# Display help and exit
	--verbose(-v)					# Print informative messages
	--version					# Display version and exit
	...args
]