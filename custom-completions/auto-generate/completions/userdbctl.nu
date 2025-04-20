# Inspect user
extern "userdbctl user" [
	--help(-h)					# Show help
	--version					# Show version
	--no-pager					# Do not pipe output into a pager
	--no-legend					# Do not show the headers and footers
	--output					# Select output mode
	--service(-s)					# Query the specified service
	--with-nss					# Control whether to include glibc NSS data
	--synthesize					# Synthesize root/nobody user
	...args
]

# Inspect group
extern "userdbctl group" [
	--help(-h)					# Show help
	--version					# Show version
	--no-pager					# Do not pipe output into a pager
	--no-legend					# Do not show the headers and footers
	--output					# Select output mode
	--service(-s)					# Query the specified service
	--with-nss					# Control whether to include glibc NSS data
	--synthesize					# Synthesize root/nobody user
	...args
]

# Show users that are members of specified group(s)
extern "userdbctl users-in-group" [
	--help(-h)					# Show help
	--version					# Show version
	--no-pager					# Do not pipe output into a pager
	--no-legend					# Do not show the headers and footers
	--output					# Select output mode
	--service(-s)					# Query the specified service
	--with-nss					# Control whether to include glibc NSS data
	--synthesize					# Synthesize root/nobody user
	...args
]

# Show groups the specified user(s) is a member of
extern "userdbctl groups-of-user" [
	--help(-h)					# Show help
	--version					# Show version
	--no-pager					# Do not pipe output into a pager
	--no-legend					# Do not show the headers and footers
	--output					# Select output mode
	--service(-s)					# Query the specified service
	--with-nss					# Control whether to include glibc NSS data
	--synthesize					# Synthesize root/nobody user
	...args
]

# Show enabled database services
extern "userdbctl services" [
	--help(-h)					# Show help
	--version					# Show version
	--no-pager					# Do not pipe output into a pager
	--no-legend					# Do not show the headers and footers
	--output					# Select output mode
	--service(-s)					# Query the specified service
	--with-nss					# Control whether to include glibc NSS data
	--synthesize					# Synthesize root/nobody user
	...args
]

# Show help
extern "userdbctl" [
	--help(-h)					# Show help
	--version					# Show version
	--no-pager					# Do not pipe output into a pager
	--no-legend					# Do not show the headers and footers
	--output					# Select output mode
	--service(-s)					# Query the specified service
	--with-nss					# Control whether to include glibc NSS data
	--synthesize					# Synthesize root/nobody user
	...args
]