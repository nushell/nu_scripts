# Print help info and exit
extern "traceroute" [
	--help					# Print help info and exit
	--icmp(-I)					# Use ICMP ECHO for probes
	--tcp(-T)					# Use TCP SYN for probes
	--debug(-d)					# Enable socket level debugging
	--dont-fragment(-F)					# Do not fragment probe packets
	--extensions(-e)					# Show ICMP extensions
	--as-path-lookups(-A)					# Perform AS path lookups
	--version(-V)					# Print the version and exit
	--udp(-U)					# Use UDP to particular destination port
	--dccp(-D)					# Use DCCP requests for probes
	--mtu					# Discover MTU along the path
	--back					# Print the number of backward hops
	...args
]