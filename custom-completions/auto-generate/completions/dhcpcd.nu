# Background immediately
extern "dhcpcd" [
	--background(-b)					# Background immediately
	--script(-c)					# Use given script instead of default hook
	--duid(-D)					# Use a DHCP Unique Identifier
	--debug(-d)					# Echo debug messages to stderr & syslog
	--lastlease(-E)					# Use last acquired lease if cannot obtain one
	--lastleaseextend					# Use last acquired lease if cannot obtain one even if expired
	--reconfigure(-g)					# Reapply configuration for each interface
	--fqdn(-F)					# Request DHCP server to update DNS using FQDN instead of hostname
	--config(-f)					# Specify config to load instead of /etc/dhcpcd.conf
	--logfile(-j)					# Write to specified log file
	--release(-k)					# Release lease and de-configure interface
	--manager(-M)					# Start dhcpcd in Manager mode
	--rebind(-n)					# Reload config and rebind specified interface
	--renew(-N)					# Renew existing addresses on specified interface
	--persistent(-p)					# Keep configuration even when dhcpcd exits
	--inform6					# Perform DHCPv6 Information Request
	--version					# Show version and exit
	--exit(-x)					# Exit dhcpcd process linked to given interface
	--oneshot(-1)					# Exit after configuring an interface
	--ipv4only(-4)					# Configure IPv4 only
	--ipv6only(-6)					# Configure IPv6 only
	--nobackground(-B)					# Don\'t
	--nohook(-C)					# Don\'t
	--nogateway(-G)					# Don\'t
	--xidhwaddr(-H)					# Use last four bytes of the MAC as the DHCP xid
	--broadcast(-J)					# Instructs DHCP server to broadcast replies back to the client
	--nolink(-K)					# Don\'t
	--noipv4ll(-L)					# Don\'t
	--printpidfile(-P)					# Print the pidfile dhcpcd will use to stdout
	--quiet(-q)					# Only warnings and errors will be displayed
	--test(-T)					# Call hooks with TEST reason to print DHCP variables
	--dumplease(-U)					# Dump current lease for the interface to stdout
	--variables(-V)					# Display hook variables
	--blacklist(-X)					# Ignore all packets from given address
	--configure					# Allows dhcpcd to configure the system
	--noconfigure					# dhcpcd will not configure the system at all
	...args
]