# Remove all extended ACL entries
extern "setfacl" [
	--remove-all(-b)					# Remove all extended ACL entries
	--remove-default(-k)					# Remove the Default ACL
	--no-mask(-n)					# Do not recalculate the effective rights mask
	--mask					# Do recalculate the effective rights mask
	--default(-d)					# All operations apply to the Default ACL
	--restore					# Restore a permission backup created by `getfacl -R\
	--test					# Test mode
	--recursive(-R)					# Apply operations to all files and directories recursively
	--logical(-L)					# Logical walk, follow symbolic links to directories
	--physical(-P)					# Physical walk, do not follow symbolic links to directories
	--version(-v)					# Print the version of setfacl and exit
	--help(-h)					# Print help explaining the command line options
	--modify(-m)					# Modify the current ACL(s) of file(s)
	--remove(-x)					# Remove entries from the ACL(s) of file(s)
	--modify-file(-M)					# Read ACL entries to modify from file
	--remove-file(-X)					# Read ACL entries to remove from file
	--set-file					# Read ACL entries to set from file
	--set					# Set the ACL of file(s), replacing the current ACL
	...args
]