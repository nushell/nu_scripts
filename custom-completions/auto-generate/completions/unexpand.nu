# convert all blanks, instead of just initial blanks
extern "unexpand" [
	--all(-a)					# convert all blanks, instead of just initial blanks
	--first-only					# convert only leading sequences of blanks (overrides -a)
	--help					# display this help and exit
	--version					# output version information and exit
	...args
]