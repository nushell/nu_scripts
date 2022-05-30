# show this help message and exit
extern "fab" [
	--help(-h)					# show this help message and exit
	--initial-password-prompt(-I)					# Force password prompt up-front
	--initial-sudo-password-prompt					# Force sudo password prompt up-front
	--list(-l)					# print list of possible commands and exit
	--shortlist					# alias for -F short --list
	--version(-V)					# show program's version number and exit
	--no_agent(-a)					# don't user the running SSH agent
	--forward-agent(-A)					# forward local agent to remote end
	--abort-on-prompts					# abort instead of prompting (for password, host, etc)
	--colorize-errors					# Color error output
	--disable-known-host(-D)					# do not load user known_hosts file
	--eagerly-disconnect(-e)					# disconnect from hosts as soon as possible
	--gss-auth					# Use GSS-API authentication
	--gss-deleg					# Delegate GSS-API client credentials or not
	--gss-kex					# Perform GSS-API Key Exchange and user authentication
	--no-keys(-k)					# don't load private key files from ~/.ssh/
	--linewise					# print line-by-line instead of byte-by-byte
	--no-pty					# do not use pseudo-terminal in run/sudo
	--password(-p)					# password for use with authentication and/or sudo
	--parallel(-P)					# default to parallel execution method
	--reject-unknown-host(-r)					# reject unknown hosts
	--skip-bad-hosts					# skip over hosts that can't be reached
	--skip-unknown-tasks					# skip over unknown tasks
	--warn-only(-w)					# warn, instead of abort, when commands fail
	...args
]