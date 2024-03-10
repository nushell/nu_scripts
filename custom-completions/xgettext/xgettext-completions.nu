# Get list of input files from FILE
extern "xgettext" [
	--files-from(-f)					# Get list of input files from FILE
	--directory(-D)					# Add DIRECTORY to list for input files search
	--default-domain(-d)					# Use NAME
	--output(-o)					# Write output to specified file
	--output-dir(-p)					# Output files will be placed in directory DIR
	--language(-L)					# Recognise the specified programming language
	--from-code					# Encoding of input files (except for Python, Tcl, Glade)
	--join-existing(-j)					# Join messages with existing file
	--exclude-file(-x)					# Entries from FILE
	--add-comments(-c)					# Place comment block with TAG (or those preceding keyword lines) in output file
	--extract-all(-a)					# Extract all strings (only some languages)
	--keyword(-k)					# Look for this as an additional keyword
	--flag					# Additional flag for strings inside the argument number ARG of keyword WORD
	--trigraphs(-T)					# Understand ANSI C trigraphs for input (only languages C, C++, ObjectiveC)
	--qt					# Recognize Qt format strings (only language C++)
	--boost					# Recognize Boost format strings (only language C++)
	--debug					# More detailed formatstring recognition result
	--no-escape(-e)					# Do not use C escapes in output (default)
	--escape(-E)					# Use C escapes in output, no extended chars
	--force-po					# Write PO file even if empty
	--indent(-i)					# Write the
	--no-location					# Do not write #: filename:line lines
	--add-location(-n)					# Generate #: filename:line lines (default)
	--strict					# Write out strict Uniforum conforming
	--properties-output					# Write out a Java
	--stringtable-output					# Write out a NeXTstep/GNUstep
	--width(-w)					# Set output page width
	--no-wrap					# Do not break long message lines into several lines
	--sort-output(-s)					# Generate sorted output
	--sort-by-file(-F)					# Sort output by file location
	--omit-header					# Dont write header with msgid "" entry
	--copyright-holder					# Set copyright holder in output
	--foreign-user					# Omit FSF copyright in output for foreign user
	--msgid-bugs-address					# Set report address for msgid bugs
	--msgstr-prefix(-m)					# Use STRING or "" as prefix for msgstr entries
	--msgstr-suffix(-M)					# Use STRING or "" as suffix for msgstr entries
	--help(-h)					# Display this help and exit
	--version(-V)					# Output version information and exit
	...args
]

export alias "xgettext --c++" = ^xgettext --language=C++
export alias "xgettext -C" = ^xgettext --language=C++
