# Use this XBPS configuration directory
extern "$progname" [
	--repository					# Append the specified repository to the top of the list
	--regex					# Use Extended Regular Expressions
	--fulldeptree					# Print a full dependency tree in the show dependencies mode
	...args
]