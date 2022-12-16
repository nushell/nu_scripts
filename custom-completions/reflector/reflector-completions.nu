def "nu-complete sort" [] {
	["age" "rate" "country" "score" "delay"]
}
def "nu-complete protocol" [] {
	["http", "https", "ftp"]
}
export extern "reflector" [
	--help(-h)								# show this help message and exit
	--connection-timeout: int 				# The number of seconds to wait before a connection times out. Default: 5
	--download-timeout: int 				# The number of seconds to wait before a download times out. Default: 5
	--list-countries 						# Display a table of the distribution of servers by country.
	--cache-timeout: int 					# The cache timeout in seconds for the data retrieved from the Arch Linux Mirror Status API. The default is 300.
	--url: string 							# The URL from which to retrieve the mirror data in JSON format. If different from the default, it must follow the same format. Default: https://archlinux.org/mirrors/status/json/
	--save: string 							# Save the mirrorlist to the given path.
	--sort: string@"nu-complete sort" 		# Sort the mirrorlist. "age": last server synchronization; "rate": download rate; "country": country name, either alphabetically or in the order given by the --country option; "score": MirrorStatus score; "delay": MirrorStatus delay.
	--threads: int 							# Use n threads for rating mirrors. This option will speed up the rating step but the results will be inaccurate if the local bandwidth is saturated at any point during the operation. If rating takes too long without this option then you should probably apply more filters to reduce the number of rated servers before using this option.
	--verbose 								# Print extra information to STDERR. Only works with some options.
	--info 									# Print mirror information instead of a mirror list. Filter options apply.
	--exclude(-x) 					# Exclude servers that match <regex>, where <regex> is a Python regular express.
	--include(-i) 					# Include servers that match <regex>, where <regex> is a Python regular express.
	--age(-a) 							# Only return mirrors that have synchronized in the last n hours. n may be an integer or a decimal number.
	--delay: int 							# Only return mirrors with a reported sync delay of n hours or less, where n is a float. For example. to limit the results to mirrors with  a reported delay of 15 minutes or less, pass 0.25.
	--country(-c): string 					# Restrict mirrors to selected countries. Countries may be given by name or country code, or a mix of both. The case is ignored. Multiple countries may be selected using commas (e.g. --country France,Germany) or by passing this option multiple times (e.g. -c fr -c de). Use "-- list-countries" to display a table of available countries along with their country codes. When sorting by country, this option may also be used to sort by a preferred order instead of alphabetically. For example, to select mirrors from Sweden, Norway, Denmark and Finland, in that order, use the options "--country se,no,dk,fi --sort country". To set a preferred country sort order without filtering any countries. this option also recognizes the glob pattern "*", which will match any country. For example, to ensure that any mirrors from Sweden are at the top of the list and any mirrors from Denmark are at the bottom, with any other countries in between, use "--country 'se,*,dk' --sort country". It is however important to note that when "*" is given along with other filter criteria, there is no guarantee that certain countries will be included in the results. For example, with the options "--country 'se,*,dk' --sort country --latest 10", the latest 10 mirrors may all be from the United States. When the glob pattern is present, it only ensures that if certain countries are included in the results, they will be sorted in the requested order.
	--fastest(-f): int 						# Return the n fastest mirrors that meet the other criteria. Do not use this option without other filtering options.
	--latest(-l): int 						# Limit the list to the n most recently synchronized servers.
	--score: int 							# Limit the list to the n servers with the highest score.
	--number(-n): int 						# Return at most n mirrors.
	--protocol(-p): string@"nu-complete protocol" 					# Match one of the given protocols, e.g. "https" or "ftp". Multiple protocols may be selected using commas (e.g. "https,http") or by passing this option multiple times.
	--complection-percent: int 				# Set the minimum completion percent for the returned mirrors. Check the mirrorstatus webpage for the meaning of this parameter. Default value: 100.0.
	--isos	 								# Only return mirrors that host ISOs.
	--ipv4 									# Only return mirrors that support IPv4.
	--ipv6 									# Only return mirrors that support IPv6.
]
