# Do not run passwd to set the password
extern "adduser" [
	--disabled-login					# Do not run passwd to set the password
	--disabled-password					# Do not set password, but allow non-password logins (e.g. SSH RSA)
	--force-badname					# Apply only a weak check for validity of the user/group name
	--group					# Create a group
	--help					# Display brief instructions
	--no-create-home					# Do not create the home directory
	--quiet					# Suppress informational messages, only show warnings and errors
	--debug					# Be verbose, most useful if you want to nail down a problem with adduser
	--system					# Create a system user or group
	--add_extra_groups					# Add new user to extra groups defined in the configuration file
	--version					# Display version and copyright information
	...args
]