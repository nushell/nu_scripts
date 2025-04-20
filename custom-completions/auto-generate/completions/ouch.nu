# 
extern "ouch" [
	--yes(-y)					# Skip [Y/n] questions positively
	--no(-n)					# Skip [Y/n] questions negatively
	--accessible(-A)					# Activate accessibility mode, reducing visual noise [env: ACCESSIBLE=]
	--hidden(-H)					# Ignores hidden files
	--gitignore(-g)					# Ignores files matched by git's ignore files
	--help(-h)					# Print help information (use `--help` for more detail)
	--version(-V)					# Print version information
	...args
]