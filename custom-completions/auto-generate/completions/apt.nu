# 
extern "apt" [
	--no-install-recommends					# Do not install recommended packages
	--no-install-suggests					# Do not install suggested packages
	--download-only(-d)					# Download Only
	--fix-broken(-f)					# Correct broken dependencies
	--fix-missing(-m)					# Ignore missing packages
	--no-download					# Disable downloading packages
	--quiet(-q)					# Quiet mode
	--no-act(-s)					# Perform a simulation
	--assume-yes(-y)					# Automatic yes to prompts
	--assume-no					# Automatic no to prompts
	--install-recommends					# Install recommended packages
	--install-suggests					# Install suggested packages
	--with-new-pkgs
	--help(-h)					# Display help
	--version(-v)					# Display version and exit
	...args
]