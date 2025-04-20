# Print each packet in ASCII
extern "tcpdump" [
	--count					# Print only packet count when reading capture files
	--list-interfaces(-D)					# Print the list of the network interfaces
	--help(-h)					# Print version strings and a usage message
	--version					# Print the tcpdump and libpcap version strings
	--monitor-mode(-I)					# Put the interface in monitor mode
	--immediate-mode					# Capture in immediate mode
	--list-time-stamp-types(-J)					# List the supported time stamp types for the interface
	--micro					# Set time stamp precision to microseconds
	--nano					# Set time stamp precision to nanoseconds
	--dont-verify-checksums(-K)					# Don\'t
	--list-data-link-types(-L)					# List the known data link types for the interface
	--number(-\#)					# Print an optional packet number
	--no-optimize(-O)					# Do not run the packet-matching code optimizer
	--no-promiscuous-mode(-p)					# Don\'t
	--print					# Print parsed packet output
	--absolute-tcp-sequence-numbers(-S)					# Print absolute TCP sequence numbers
	--packet-buffered(-U)					# Make the packet output packet-buffered
	...args
]