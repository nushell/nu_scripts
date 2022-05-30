# Ignore leading blanks
extern "sort" [
	--ignore-leading-blanks(-b)					# Ignore leading blanks
	--dictionary-order(-d)					# Consider only blanks and alphanumerics
	--ignore-case(-f)					# Ignore case
	--general-numeric-sort(-g)					# Compare general numeric value
	--ignore-nonprinting(-i)					# Consider only printable
	--human-numeric-sort(-h)					# Compare human readable numbers [2K 1G]
	--month-sort(-M)					# Compare month names
	--numeric-sort(-n)					# Compare string numerical value
	--random-sort(-R)					# Sort by random hash of keys
	--random-source					# Get random bytes from FILE
	--reverse(-r)					# Reverse results
	--check(-c)					# Only check if sorted
	--key(-k)					# Define key
	--merge(-m)					# Merge sorted files
	--output(-o)					# Write to file
	--stable(-s)					# Stabilize sort
	--field-separator(-t)					# Field separator
	--unique(-u)					# Output only first of equal lines
	--zero-terminated(-z)					# Lines end with 0 byte
	--help					# Display help and exit
	--version					# Display version and exit
	...args
]