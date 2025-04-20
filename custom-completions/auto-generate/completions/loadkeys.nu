# Force conversion to ASCII
extern "loadkeys" [
	--ascii(-a)					# Force conversion to ASCII
	--bkeymap(-b)					# Output binary keymap
	--clearcompose(-c)					# Clear kernel compose table
	--default(-d)					# Load default keymap
	--mktable(-m)					# Output a 'defkeymap.c'
	--parse(-p)					# Only search and parse keymap
	--clearstrings(-s)					# Clear kernel string table
	--unicode(-u)					# Force conversion to Unicode
	--quiet(-q)					# Suppress all normal output
	--verbose(-v)					# Be more verbose
	--version(-V)					# Print version number
	--help(-h)					# Print help
	...args
]