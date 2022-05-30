# Ask for vault password
extern "ansible-playbook" [
	--ask-vault-pass					# Ask for vault password
	--check(-C)					# Just check, don't make any changes
	--diff(-D)					# Show the differences in files and templates
	--flush-cache					# Clear the fact cache
	--force-handlers					# Run handlers even if a task fails
	--help(-h)					# Shows a help message
	--list-hosts					# List all matching hosts
	--list-tags					# List all available tags
	--list-tasks					# List all tasks that would be executed
	--new-vault-password-file					# New vault password file for rekey
	--output					# Output file name for encrypt or decrypt; use - for stdout
	--step					# Confirm each task before running
	--syntax-check					# Perform a syntax check on the playbook
	--vault-password-file					# Vault password file
	--verbose(-v)					# Verbose mode (-vv/-vvv/-vvvv for more)
	--version					# Display version and exit
	--ask-pass(-k)					# Ask for connection password
	--connection(-c)					# Connection type to use (default=smart)
	--timeout(-T)					# Set the connection timeout in seconds (default=10)
	--ssh-common-args					# Specify common arguments to pass to sftp/scp/ssh
	--sftp-extra-args					# Specify extra arguments to pass to sftp only
	--scp-extra-args					# Specify extra arguments to pass to scp only
	--ssh-extra-args					# Specify extra arguments to pass to ssh only
	--become(-b)					# Run operations with become
	--ask-become-pass(-K)					# Ask for privilege escalation password
	...args
]