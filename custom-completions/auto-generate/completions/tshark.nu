# Perform a two-pass analysis
extern "tshark" [
	--print(-P)					# Decode and display packet summary or details
	--color					# Enable coloring of packets according to standard Wireshark color filters
	--no-duplicate-keys					# Merge duplicate keys in json output
	...args
]