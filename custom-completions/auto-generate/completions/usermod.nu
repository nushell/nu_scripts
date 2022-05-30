# 
extern "usermod" [
	--append(-a)					# Append groups (use with -G)
	--inactive(-f)					# Number of days after a password expires until the account is locked
	--gid(-g)					# Group name or number of the user's new initial login group
	--groups(-G)					# List of groups which the user is also a member of
	...args
]