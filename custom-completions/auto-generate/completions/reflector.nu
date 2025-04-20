# Show help
extern "reflector" [
	--help(-h)					# Show help
	--connection-timeout					# The number of seconds to wait before a connection times out
	--download-timeout					# The number of seconds to wait before a download times out
	--list-countries					# Display a table of the distribution of servers by country
	--cache-timeout					# The cache timeout in seconds for the data retrieved from the Arch Linux Mirror Status API
	--url					# The URL from which to retrieve the mirror data in JSON format
	--save					# Save the mirrorlist to the given path
	--sort					# Sort the mirrorlist
	--threads					# The number of threads to use for downloading
	--verbose					# Print extra information
	--info					# Print mirror information instead of a mirror list
	--age(-a)					# Only return mirrors that have synchronized in the last n hours
	--delay					# Only return mirrors with a reported sync delay of n hours or less, where n is a float
	--country(-c)					# Restrict mirrors to selected countries
	--fastest(-f)					# Return the n fastest mirrors that meet the other criteria
	--include(-i)					# Include servers that match <regex>
	--exclude(-x)					# Exclude servers that match <regex>
	--latest(-l)					# Limit the list to the n most recently synchronized servers
	--score					# Limit the list to the n servers with the highest score
	--number(-n)					# Return at most n mirrors
	--protocol(-p)					# Match one of the given protocols
	--completion-percent					# Set the minimum completion percent for the returned mirrors
	--isos					# Only return mirrors that host ISOs
	--ipv4					# Only return mirrors that support IPv4
	--ipv6					# Only return mirrors that support IPv6
	...args
]