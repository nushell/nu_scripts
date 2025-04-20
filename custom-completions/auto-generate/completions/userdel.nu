# 
extern "userdel" [
	--force(-f)					# force the removal
	--help(-h)					# display help message
	--remove(-r)					# remove user's home and mail directories
	--root(-R)					# apply changes in a chroot directory
	--prefix(-P)					# apply changes in a prefix directory
	--selinux-user(-Z)					# remove SELinux user mappings
	...args
]