# Supplementary groups
extern "useradd" [
	--groups(-G)					# Supplementary groups
	--help(-h)					# Display help message and exit
	--create-home(-m)					# The users home directory will be created if it does not exist
	--key(-K)					# Overrides default key/value pairs from /etc/login
	--non-unique(-o)					# Allow user account with a duplicate UID
	...args
]