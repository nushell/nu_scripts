[# 
extern "string" [

	...args
]
# 
extern "string lower" [

	...args
]
# 
extern "string upper" [

	...args
]
# 
extern "string length" [
	--visible(-V)					# Use the visible width, excluding escape sequences
	...args
]
# 
extern "string sub" [

	...args
]
# 
extern "string split" [
	--right(-r)					# Split right-to-left
	--no-empty(-n)					# Empty results excluded
	...args
]
# 
extern "string split0" [
	--right(-r)					# Split right-to-left
	--no-empty(-n)					# Empty results excluded
	...args
]
# 
extern "string collect" [
	--quiet(-q)					# Do not print output
	--no-trim-newlines(-N)					# Don't trim trailing newlines
	--allow-empty(-a)					# Always print empty argument
	...args
]
# 
extern "string join" [
	--no-empty(-n)					# Empty strings excluded
	...args
]
# 
extern "string join0" [

	...args
]
# 
extern "string trim" [
	--left(-l)					# Trim only leading chars
	--right(-r)					# Trim only trailing chars
	...args
]
# 
extern "string escape" [
	--quiet(-q)					# Do not print output
	--no-quoted(-n)					# Escape with \\ instead of quotes
	...args
]
# 
extern "string unescape" [
	--no-quoted(-n)					# Escape with \\ instead of quotes
	...args
]
# 
extern "string match" [
	--right(-r)					# Split right-to-left
	--no-empty(-n)					# Empty results excluded
	--no-trim-newlines(-N)					# Don't trim trailing newlines
	--allow-empty(-a)					# Always print empty argument
	--index(-n)					# Report index, length of match
	--invert(-v)					# Report only non-matches
	--entire(-e)					# Show entire matching lines
	--groups-only(-g)					# Only report capturing groups
	--all(-a)					# Report every match
	--ignore-case(-i)					# Case insensitive
	--regex(-r)					# Use regex instead of globs
	...args
]
# 
extern "string replace" [
	--filter(-f)					# Report only actual replacements
	--all(-a)					# Report every match
	--ignore-case(-i)					# Case insensitive
	--regex(-r)					# Use regex instead of globs
	...args
]
# 
extern "string repeat" [
	--no-newline(-N)					# Remove newline
	...args
]
# 
extern "string pad" [
	--quiet(-q)					# Do not print output
	...args
]]

[# Character to use for padding
extern "-l" [

	...args
]]

[# Integer width of the result, default is maximum width of inputs
extern "" [

	...args
]]