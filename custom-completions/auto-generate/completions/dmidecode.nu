# Be less verbose
extern "dmidecode" [
	--quiet(-q)					# Be less verbose
	--no-quirks					# Decode everything exactly as it is
	--string(-s)					# Only display specified value
	--type(-t)					# Only display entries of specified type
	--dump(-u)					# Do not decode the entries
	--no-sysfs					# Do not attempt to read DMI data from sysfs files
	--help(-h)					# Display usage information and exit
	--version(-V)					# Display the version and exit
	...args
]