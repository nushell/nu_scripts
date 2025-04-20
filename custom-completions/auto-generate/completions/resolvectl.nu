# 
extern "resolvectl" [
	--interface(-i)					# Interface to execute the query on
	--protocol(-p)					# Network protocol for the query
	--type(-t)					# DNS RR type for query
	--class(-c)					# DNS class for query
	--service-address					# Resolve address for SRV record
	--service-txt					# Resolve TXT records for services
	--cname					# Follow CNAME redirects
	--validate					# Allow DNSSEC validation
	--synthesize					# Allow synthetic response
	--cache					# Allow response from cache
	--stale-data					# Allow response from cache with stale data
	--relax-single-label					# Allow single label lookups to go upstream
	--zone					# Allow response from locally registered mDNS/LLMNR records
	--trust-anchor					# Use local trust anchors
	--network					# Allow response from network
	--search					# Use search domains for single-label names
	--raw					# Dump answer as binary data
	--legend					# Print headers and meta info
	--json					# Output as JSON in specified mode
	--help(-h)					# Show help
	--version					# Show version
	--no-pager					# Do not pipe output into a pager
	...args
]