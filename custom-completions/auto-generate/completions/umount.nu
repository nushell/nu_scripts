# Display version
extern "umount" [
	--version(-V)					# Display version
	--help(-h)					# Display help
	--verbose(-v)					# Say what is being done
	--no-mtab(-n)					# Don't write to /etc/mtab
	--read-only(-r)					# In case unmounting fails, try to remount read-only
	--detach-loop(-d)					# In case the unmounted device was a loop device, also free this loop device
	--internal-only(-i)					# Don't call the umount.<type> helpers
	--all(-a)					# Unmount all of the file systems described in /etc/mtab
	--types(-t)					# Actions should only be taken on file systems of the specified type
	--test-opts(-O)					# Actions should only be taken on file systems with the specified options in /etc/fstab
	--force(-f)					# Force unmount (in case of an unreachable NFS system)
	--lazy(-l)					# Lazy unmount (unmount a 'busy' filesystem)
	--recursive(-R)					# Recursively unmount a target with all its children
	--all-targets(-A)					# Unmount all mountpoints for the given device in the current namespaces
	--no-canonicalize(-c)					# Don't canonicalize paths
	--fake					# dry run; skip the umount(2) syscall
	...args
]