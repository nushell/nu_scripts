# 
extern "gpasswd" [
	--add(-a)					# Add user to group
	--delete(-d)					# Remove user from group
	--help(-h)					# Print help
	--restrict(-R)					# Restrict access to GROUP to its members
	--members(-M)					# Set the list of members of GROUP
	--administrators(-A)					# set the list of administrators for GROUP
	...args
]