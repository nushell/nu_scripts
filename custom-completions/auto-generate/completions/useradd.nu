# Supplementary groups
extern "useradd" [
	--groups(-G)					# Supplementary groups
	--help(-h)					# Display help message and exit
	--create-home(-m)					# The user\'s
	--key(-K)					# Overrides default key/value pairs from /etc/login
	--non-unique(-o)					# Allow user account with a duplicate UID
	--base-dir(-b)					# The initial path prefix for a new user\'s
	--gid(-g)					# The group name or ID for a new user\'s
	--shell(-s)					# Name of the new user\'s
	...args
]