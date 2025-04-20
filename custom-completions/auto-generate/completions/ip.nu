# 
extern "ip" [
	--human(-h)					# Output statistics with human readable values
	--batch(-b)					# Read commands from file or stdin
	--force					# Don't terminate on errors in batch mode
	--Version(-V)					# Print the version
	--stats(-s)					# Output more information
	--details(-d)					# Output more detailed information
	--loops(-l)					# Specify maximum number of loops for 'ip addr flush'
	--family(-f)					# The protocol family to use
	--oneline(-o)					# Output on one line
	--resolve(-r)					# Resolve names and print them instead of addresses
	--netns(-n)					# Use specified network namespace
	--all(-a)					# Execute command for all objects
	--color(-c)					# Configure color output
	--timestamp(-t)					# Display current time when using monitor
	--tshort					# Like -timestamp, but shorter format
	--rcvbuf					# Set the netlink socket receive buffer size
	--brief					# Print only basic information in a tabular format
	--json(-j)					# Output results in JSON
	--pretty(-p)					# Output results in pretty JSON
	...args
]

# The protocol family to use
extern "ip inet inet6 bridge ipx dnet link any" [
	--human(-h)					# Output statistics with human readable values
	--batch(-b)					# Read commands from file or stdin
	--force					# Don't terminate on errors in batch mode
	--Version(-V)					# Print the version
	--stats(-s)					# Output more information
	--details(-d)					# Output more detailed information
	--loops(-l)					# Specify maximum number of loops for 'ip addr flush'
	--family(-f)					# The protocol family to use
	--oneline(-o)					# Output on one line
	--resolve(-r)					# Resolve names and print them instead of addresses
	--netns(-n)					# Use specified network namespace
	--all(-a)					# Execute command for all objects
	--color(-c)					# Configure color output
	--timestamp(-t)					# Display current time when using monitor
	--tshort					# Like -timestamp, but shorter format
	--rcvbuf					# Set the netlink socket receive buffer size
	--brief					# Print only basic information in a tabular format
	--json(-j)					# Output results in JSON
	--pretty(-p)					# Output results in pretty JSON
	...args
]