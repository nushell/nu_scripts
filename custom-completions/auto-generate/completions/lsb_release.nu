# Show all information
extern "lsb_release" [
	--all(-a)					# Show all information
	--short(-i)					# Show distributor ID
	--description(-d)					# Show description of distribution
	--release(-r)					# Show release number
	--codename(-c)					# Show code name
	--help(-h)					# Show help message
	--version(-v)					# Show LSB modules supported
	--short(-s)					# Show in short format
	...args
]