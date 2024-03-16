# Print each packet in ASCII
extern "tcpdump" [
	--list-interfaces(-D)					# Print the list of the network interfaces
	--help(-h)					# Print version strings and a usage message
	--version					# Print the tcpdump and libpcap version strings
	--monitor-mode(-I)					# Put the interface in monitor mode
	--immediate-mode					# Capture in immediate mode
	--list-time-stamp-types(-J)					# List the supported time stamp types for the interface
	--dont-verify-checksums(-K)					# Dont attempt to verify IP, TCP, or UDP checksums
	--list-data-link-types(-L)					# List the known data link types for the interface
	--number							# Print an optional packet number
	# breaks the parser
	# --number(-\#)					# Print an optional packet number
	--no-optimize(-O)					# Do not run the packet-matching code optimizer
	--no-promiscuous-mode(-p)					# Dont put the interface into promiscuous mode
	--absolute-tcp-sequence-numbers(-S)					# Print absolute TCP sequence numbers
	--packet-buffered(-U)					# Make the packet output packet-buffered
	...args
]