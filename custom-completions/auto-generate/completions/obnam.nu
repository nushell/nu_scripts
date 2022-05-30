# Write output to FILE instead of STDOUT
extern "obnam" [
	--output					# Write output to FILE instead of STDOUT
	--repository(-r)					# Name of backup repository
	--to					# Where to restore / mount to
	--warn-age					# For nagios-last-backup-age: maximum age
	--exclude					# REGEXP for pathnames to exclude
	--exclude-from					# Read exclude patterns from FILE
	--root					# What to backup
	--config					# Add FILE to config files
	--trace					# FILENAME pattern for trace debugging
	--gnupghome					# Home directory for GPG
	--log					# Write log to FILE or syslog
	--ssh-command					# Executable to be used instead of "ssh
	--ssh-key					# Use FILENAME as the ssh RSA key
	--ssh-known-hosts					# FILENAME of the known_hosts file
	...args
]

# Write log to FILE or syslog
extern "obnam syslog" [
	--output					# Write output to FILE instead of STDOUT
	--repository(-r)					# Name of backup repository
	--to					# Where to restore / mount to
	--warn-age					# For nagios-last-backup-age: maximum age
	--exclude					# REGEXP for pathnames to exclude
	--exclude-from					# Read exclude patterns from FILE
	--root					# What to backup
	--config					# Add FILE to config files
	--trace					# FILENAME pattern for trace debugging
	--gnupghome					# Home directory for GPG
	--log					# Write log to FILE or syslog
	--ssh-command					# Executable to be used instead of "ssh
	--ssh-key					# Use FILENAME as the ssh RSA key
	--ssh-known-hosts					# FILENAME of the known_hosts file
	...args
]

# FILENAME of the known_hosts file
extern "obnam \\~/.ssh/known_hosts" [
	--output					# Write output to FILE instead of STDOUT
	--repository(-r)					# Name of backup repository
	--to					# Where to restore / mount to
	--warn-age					# For nagios-last-backup-age: maximum age
	--exclude					# REGEXP for pathnames to exclude
	--exclude-from					# Read exclude patterns from FILE
	--root					# What to backup
	--config					# Add FILE to config files
	--trace					# FILENAME pattern for trace debugging
	--gnupghome					# Home directory for GPG
	--log					# Write log to FILE or syslog
	--ssh-command					# Executable to be used instead of "ssh
	--ssh-key					# Use FILENAME as the ssh RSA key
	--ssh-known-hosts					# FILENAME of the known_hosts file
	...args
]