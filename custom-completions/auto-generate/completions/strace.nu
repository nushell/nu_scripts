# 
extern "strace" [
	--attach(-p)
	--user(-u)
	--detach-on(-b)					# Detach when the specified syscall is reached
	--columns(-a)					# Align output in columns
	--summary-only(-c)					# Suppress output and report summary on exit
	--summary(-C)					# Display output and report summary on exit
	--summary-sort-by(-S)					# Sort summary by the specified criterion
	--debug(-d)					# Debug output
	--help(-h)					# Print help and exit
	--version(-V)					# Print version and exit
	...args
]