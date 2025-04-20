# list the names of the addons available in the system
extern "vim-addons list" [
	--help(-h)					# show this usage message and exit
	--query(-q)					# be quiet and make the output more parseable
	--registry-dir(-r)					# set the registry directory
	--source-dir(-s)					# set the addons source directory
	--target-dir(-t)					# set the addons target directory
	--verbose(-v)					# increase verbosity
	--system-dir(-y)					# set the system-wide target directory
	--system-wide(-w)					# set target directory to the system-wide one
	...args
]

# show the status of the addons available in the system
extern "vim-addons status" [
	--help(-h)					# show this usage message and exit
	--query(-q)					# be quiet and make the output more parseable
	--registry-dir(-r)					# set the registry directory
	--source-dir(-s)					# set the addons source directory
	--target-dir(-t)					# set the addons target directory
	--verbose(-v)					# increase verbosity
	--system-dir(-y)					# set the system-wide target directory
	--system-wide(-w)					# set target directory to the system-wide one
	...args
]

# show this usage message and exit
extern "vim-addons" [
	--help(-h)					# show this usage message and exit
	--query(-q)					# be quiet and make the output more parseable
	--registry-dir(-r)					# set the registry directory
	--source-dir(-s)					# set the addons source directory
	--target-dir(-t)					# set the addons target directory
	--verbose(-v)					# increase verbosity
	--system-dir(-y)					# set the system-wide target directory
	--system-wide(-w)					# set target directory to the system-wide one
	...args
]