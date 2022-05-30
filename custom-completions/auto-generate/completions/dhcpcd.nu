# Background immediately
extern "dhcpcd" [
	--background(-b)					# Background immediately
	--script(-c)					# Use given script
	--duid(-D)					# Generate an RFC 4361 compliant clientid
	--debug(-d)					# Echo debug messages to stderr & syslog
	--lastlease(-E)					# Use last acquired lease if cannot obtain one
	--lastleaseextend					# Use last acquired lease if cannot obtain one even if expired
	--reconfigure(-g)					# Reapply configuration for each interface
	--fqdn(-F)					# Request DHCP server to update DNS using FQDN instead of hostname
	--master(-M)					# Start dhcpcd in Master mode
	--persistent(-p)					# Keep configuration even when dhcpcd exits
	--inform(-s)					# Request given address in DHCP INFORM message
	--inform6					# Perform DHCPv6 Information Request
	--version					# Show version and exit
	...args
]