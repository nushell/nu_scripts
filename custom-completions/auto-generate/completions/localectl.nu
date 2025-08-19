# Don't ask for password
extern "localectl" [
	--no-ask-password					# Don't ask for password
	--no-convert					# Don't convert keymap from console to X11 and vice-versa
	--host(-H)					# Execute the operation on a remote host
	--help(-h)					# Print a short help text and exit
	--version					# Print a short version string and exit
	--no-pager					# Do not pipe output into a pager
	...args
]