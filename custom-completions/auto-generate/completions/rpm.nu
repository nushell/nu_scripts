[# Display help and exit
extern "rpm" [
	--help(-?)					# Display help and exit
	--version					# Display version and exit
	--quiet					# Quiet mode
	--dbpath					# Specify directory for rpm database
	--root					# Specify root directory for rpm operations
	...args
]]

[# Replace OLDPATH prefixes for relocatable packages with NEWPATH
extern "" [

	...args
]]