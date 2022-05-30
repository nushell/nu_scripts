[# Process binary file as text
extern "grep" [
	--text(-a)					# Process binary file as text
	--byte-offset(-b)					# Print byte offset of matches
	--colour					# Colour output
	--color					# Color output
	--count(-c)					# Only print number of matches
	--extended-regexp(-E)					# Pattern is extended regexp
	--fixed-strings(-F)					# Pattern is a fixed string
	--basic-regexp(-G)					# Pattern is basic regex
	--with-filename(-H)					# Print filename
	--no-filename(-h)					# Suppress printing filename
	--help					# Display help and exit
	--ignore-case(-i)					# Ignore case
	--files-without-match(-L)					# Print name of files without matches
	--files-with-matches(-l)					# Print name of files with matches
	--max-count(-m)					# Stop reading after NUM matches
	--mmap					# Use the mmap system call to read input
	--line-number(-n)					# Print line number
	--only-matching(-o)					# Show only matching part
	--line-buffered					# Use line buffering
	--perl-regexp(-P)					# Pattern is a Perl regexp (PCRE) string
	--quiet(-q)					# Do not write anything
	--silent					# Do not write anything
	--dereference-recursive(-R)					# Recursively read files under each directory, following symlinks
	--recursive(-r)					# Recursively read files under each directory
	--no-messages(-s)					# Suppress error messages
	--initial-tab(-T)					# Ensure first character of actual line content lies on a tab stop
	--binary(-U)					# Treat files as binary
	--unix-byte-offsets(-u)					# Report Unix-style byte offsets
	--version(-V)					# Display version and exit
	--invert-match(-v)					# Invert the sense of matching
	--word-regexp(-w)					# Only whole matching words
	--line-regexp(-x)					# Only whole matching lines
	--null-data(-z)					# Treat input as a set of zero-terminated lines
	--null(-Z)					# Output a zero byte after filename
	--no-group-separator					# Use empty string as a group separator
	...args
]
# Colour output
extern "grep never always auto" [
	--text(-a)					# Process binary file as text
	--byte-offset(-b)					# Print byte offset of matches
	--colour					# Colour output
	--color					# Color output
	--count(-c)					# Only print number of matches
	--extended-regexp(-E)					# Pattern is extended regexp
	--fixed-strings(-F)					# Pattern is a fixed string
	--basic-regexp(-G)					# Pattern is basic regex
	--with-filename(-H)					# Print filename
	--no-filename(-h)					# Suppress printing filename
	--help					# Display help and exit
	--ignore-case(-i)					# Ignore case
	--files-without-match(-L)					# Print name of files without matches
	--files-with-matches(-l)					# Print name of files with matches
	--max-count(-m)					# Stop reading after NUM matches
	--mmap					# Use the mmap system call to read input
	--line-number(-n)					# Print line number
	--only-matching(-o)					# Show only matching part
	--line-buffered					# Use line buffering
	--perl-regexp(-P)					# Pattern is a Perl regexp (PCRE) string
	--quiet(-q)					# Do not write anything
	--silent					# Do not write anything
	--dereference-recursive(-R)					# Recursively read files under each directory, following symlinks
	--recursive(-r)					# Recursively read files under each directory
	--no-messages(-s)					# Suppress error messages
	--initial-tab(-T)					# Ensure first character of actual line content lies on a tab stop
	--binary(-U)					# Treat files as binary
	--unix-byte-offsets(-u)					# Report Unix-style byte offsets
	--version(-V)					# Display version and exit
	--invert-match(-v)					# Invert the sense of matching
	--word-regexp(-w)					# Only whole matching words
	--line-regexp(-x)					# Only whole matching lines
	--null-data(-z)					# Treat input as a set of zero-terminated lines
	--null(-Z)					# Output a zero byte after filename
	--no-group-separator					# Use empty string as a group separator
	...args
]]

[# Specify a pattern
extern "" [
	--regexp(-e)					# Specify a pattern
	--exclude-from					# Read pattern list from file. Skip files whose base name matches list
	--exclude-dir					# Exclude matching directories from recursive searches
	--file(-f)					# Use patterns from a file
	...args
]]