# Generate file with macro definitions for token type names
extern "bison" [
	--defines(-d)					# Generate file with macro definitions for token type names
	--graph(-g)					# Output a VCG definition of the LALR(1) grammar automaton
	--token-table(-k)					# This switch causes the name
	--no-lines(-l)					# Dont put any #line preprocessor commands in the parser file
	--no-parser(-n)					# Generate only declarations, not parser code
	--output(-o)					# Specify the name outfile for the parser file
	--name-prefix(-p)					# External symbols start with prefix instead of yy
	--debug(-t)					# Enable debugging facilities on compilation
	--verbose(-v)					# Generate file with descriptions of the parser states
	--version(-V)					# Print version number
	--help(-h)					# Print summary of the options
	--fixed-output-files(-y)					# Equivalent to -o y.tab.c
	...args
]