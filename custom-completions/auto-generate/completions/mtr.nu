# Display help and exit
extern "mtr" [
	--help(-h)					# Display help and exit
	--version(-v)					# Output version information and exit
	--report(-r)					# Output a statistic report
	--report-wide(-w)					# Output report with full hostnames
	--xml(-x)					# Output xml format
	--curses(-t)					# Use curses terminal interface
	--gtk(-g)					# Use the GTK+ interface (if available)
	--raw(-l)					# Output raw format
	--csv(-C)					# Output csv format
	--json(-j)					# Output json format
	--split(-p)					# Split output
	--no-dns(-n)					# Do not resolve host names
	--show-ips(-b)					# Show IP numbers and host names
	--aslookup(-z)					# Display AS number
	--mpls(-e)					# Display information from ICMP extensions
	--udp(-u)					# use UDP instead of ICMP echo
	--tcp(-T)					# use TCP instead of ICMP echo
	--sctp(-S)					# Use Stream Control Transmission instead of ICMP echo
	...args
]