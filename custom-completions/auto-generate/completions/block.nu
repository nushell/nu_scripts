# Display help and exit
extern "block" [
	--help(-h)					# Display help and exit
	--erase(-e)					# Remove the topmost global event block
	--local(-l)					# Create a local (automatically erased) event block
	--global(-g)					# Create a global (manually erased) event block
	...args
]