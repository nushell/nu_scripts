# Ignore case
extern "ack" [
	--ignore-case(-i)					# Ignore case
	--smart-case					# Ignore case when pattern contains no uppercase
	--no-smart-case					# Dont ignore case
	--invert-match(-v)					# Invert match
	--word-regexp(-w)					# Match only whole words
	--literal(-Q)					# Quote all metacharacters
	--lines					# Only print line(s) NUM of each file
	--files-with-matches(-l)					# Only print filenames containing matches
	--files-without-matches(-L)					# Only print filenames with no matches
	--output					# Output the evaluation of Perl expression for each line
	--passthru					# Print all lines
	--match					# Specify pattern explicitly
	--max-count(-m)					# Stop searching in each file after NUM matches
	--with-filename(-H)					# Print the filename for each match
	--no-filename(-h)					# Suppress the prefixing filename on output
	--count(-c)					# Show number of lines matching per file
	--column					# Show column number of first match
	--no-column					# Dont show column number of first match
	--print0					# Print null byte as separator between filenames
	--pager					# Pipes all ack output through command
	--no-pager					# Do not send output through a pager
	--heading					# Prints a filename heading above files results
	--no-heading					# Dont print a filename heading above files results
	--break					# Print a break between results
	--no-break					# Dont print a break between results
	--group					# Filename heading and line break between results
	--no-group					# No filename heading and no line breaks between results
	--color					# Highlight the matching text
	--no-colour					# Dont highlight the matching text
	--color-filename					# Set the color for filenames
	--color-match					# Set the color for matches
	--color-lineno					# Set the color for line numbers
	--flush					# Flush output immediately
	--sort-files					# Sort the found files lexically
	--show-types					# Show which types each file has
	--files-from					# Read the list of files to search from file
	--ignore-directory					# Ignore directory
	--no-ignore-directory					# Dont ignore directory
	--ignore-file					# Add filter for ignoring files
	--recurse(-R)					# Recurse into subdirectories
	--no-recurse(-n)					# No descending into subdirectories
	--follow					# Follow symlinks
	--no-follow					# Dont follow symlinks
	--known-types(-k)					# Include only recognized files
	--type					# Include only X files
	--type-set					# Replaces definition of type
	--type-add					# Specify definition of type
	--type-del					# Removes all filters associated with type
	--no-env					# Ignores environment variables and ackrc files
	--ackrc					# Specifies location of ackrc file
	--ignore-ack-defaults					# Ignore default definitions ack includes
	--create-ackrc					# Outputs default ackrc
	--help(-\?)					# Shows help
	--help-types					# Shows all known types
	--dump					# Dump information on which options are loaded
	--filter					# Forces ack to treat input as a pipe
	--no-filter					# Forces ack to treat input as tty
	--man					# Shows man page
	--version					# Displays version and copyright
	--thpppt					# Bill the Cat
	--bar					# The warning admiral
	...args
]