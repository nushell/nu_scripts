# Scan: List Scan
extern "nmap" [
	--disable-arp-ping					# No ARP or ND Ping
	--traceroute					# Trace path to host
	--system-dns					# Use system DNS resolver
	--scanflags					# Custom TCP scan flags
	--exclude-ports					# Exclude the specified ports from scanning
	--allports					# Don't exclude any ports from version detection
	--version-light					# Enable light mode
	--version-all					# Try every single probe
	--version-trace					# Trace version scan activity
	--osscan-limit					# Limit OS detection to promising targets
	--osscan-guess					# Guess OS detection results
	--fuzzy					# Guess OS detection results
	--max-os-tries					# Set the maximum number of OS detection tries against a target
	--script-args					# provide arguments to NSE scripts
	--script-trace
	--script-updatedb
	--host-timeout					# to skip slow hosts
	--defeat-rst-ratelimit					# ignore ICMP-RST rate limits
	--defeat-icmp-ratelimit					# ignore ICMP unreachable in UDP
	--mtu					# use specified mtu
	--randomize-hosts					# Randomize target host order
	--badsum					# Send packets with bogus TCP/UDP checksums
	--adler32					# Use deprecated Adler32 instead of CRC32C for SCTP checksums
	--reason					# Host and port state reasons
	--packet-trace					# Trace packets and data sent and received
	--open					# Show only open (or possibly open) ports
	--iflist					# List interfaces and routes
	--append-output					# Append to rather than clobber output files
	--webxml					# Load stylesheet from Nmap.Org
	--no-stylesheet					# Omit XSL stylesheet declaration from XML
	--send-eth					# Use raw ethernet sending
	--send-ip					# Send at raw IP level
	--privileged					# Assume that the user is fully privileged
	--unprivileged					# Assume that the user lacks raw socket privileges
	--release-memory					# Release memory before quitting
	--version(-V)					# Print version number
	--help(-h)					# Print help summary page
	...args
]

# Increase/Set debugging level
extern "nmap 0 1 2 3 4 5 6 7 8 9" [
	--disable-arp-ping					# No ARP or ND Ping
	--traceroute					# Trace path to host
	--system-dns					# Use system DNS resolver
	--scanflags					# Custom TCP scan flags
	--exclude-ports					# Exclude the specified ports from scanning
	--allports					# Don't exclude any ports from version detection
	--version-light					# Enable light mode
	--version-all					# Try every single probe
	--version-trace					# Trace version scan activity
	--osscan-limit					# Limit OS detection to promising targets
	--osscan-guess					# Guess OS detection results
	--fuzzy					# Guess OS detection results
	--max-os-tries					# Set the maximum number of OS detection tries against a target
	--script-args					# provide arguments to NSE scripts
	--script-trace
	--script-updatedb
	--host-timeout					# to skip slow hosts
	--defeat-rst-ratelimit					# ignore ICMP-RST rate limits
	--defeat-icmp-ratelimit					# ignore ICMP unreachable in UDP
	--mtu					# use specified mtu
	--randomize-hosts					# Randomize target host order
	--badsum					# Send packets with bogus TCP/UDP checksums
	--adler32					# Use deprecated Adler32 instead of CRC32C for SCTP checksums
	--reason					# Host and port state reasons
	--packet-trace					# Trace packets and data sent and received
	--open					# Show only open (or possibly open) ports
	--iflist					# List interfaces and routes
	--append-output					# Append to rather than clobber output files
	--webxml					# Load stylesheet from Nmap.Org
	--no-stylesheet					# Omit XSL stylesheet declaration from XML
	--send-eth					# Use raw ethernet sending
	--send-ip					# Send at raw IP level
	--privileged					# Assume that the user is fully privileged
	--unprivileged					# Assume that the user lacks raw socket privileges
	--release-memory					# Release memory before quitting
	--version(-V)					# Print version number
	--help(-h)					# Print help summary page
	...args
]