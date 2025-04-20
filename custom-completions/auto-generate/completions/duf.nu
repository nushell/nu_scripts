# include pseudo, duplicate, inaccessible file systems
extern "duf" [
	--all					# include pseudo, duplicate, inaccessible file systems
	--inodes					# list inode information instead of block usage
	--json					# output all devices in JSON format
	--only					# show only specific devices, separated with commas
	--output					# output fields, separated with commas
	--sort					# sort output (default 'mountpoint')
	--style					# style (default 'unicode')
	--theme					# color themes (default 'light')
	--version					# display version
	--warnings					# output all warnings to STDERR
	...args
]