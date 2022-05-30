# Make login shell
extern "su" [
	--login(-l)					# Make login shell
	--command(-c)					# Pass command to shell
	--fast(-f)					# Pass to the shell
	--preserve_environment(-p)					# Preserve environment
	--pty(-P)					# Create pseudo-terminal for the session
	--help(-h)					# Display help and exit
	--version(-V)					# Display version and exit
	...args
]