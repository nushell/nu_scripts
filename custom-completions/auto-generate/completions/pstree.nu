# Show command line arguments
extern "pstree" [
	--arguments(-a)					# Show command line arguments
	--ascii(-A)					# use ASCII line drawing characters
	--highlight-all(-h)					# highlight current process and its ancestors
	--show-pgids(-g)					# show process group ids; implies -c
	--vt100(-G)					# use VT100 line drawing characters
	--numeric-sort(-n)					# sort output by PID
	--ns-sort(-N)					# sort by namespace type
	--show-pids(-p)					# show PIDs; implies -c
	--show-parents(-s)					# show parents of the selected process
	--ns-changes(-S)					# show namespace transitions
	--thread-names(-t)					# show full thread names
	--hide-threads(-T)					# hide threads, show only processes
	--uid-changes(-u)					# show uid transitions
	--unicode(-U)					# use UTF-8 line drawing characters
	--version(-V)					# display version information
	--security-context(-Z)					# show SELinux security contexts
	...args
]