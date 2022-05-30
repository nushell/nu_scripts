# 
extern "pactree" [
	--dbpath(-b)					# Set an alternate database location
	--color(-c)					# Colorize output
	--graph(-g)					# Generate output for graphvizs dot
	--help(-h)					# Display this help message
	--linear(-l)					# Enable linear output
	--reverse(-r)					# Show reverse dependencies
	--sync(-s)					# Search sync DBs instead of local
	--unique(-u)					# Show dependencies with no duplicates (implies -l)
	...args
]