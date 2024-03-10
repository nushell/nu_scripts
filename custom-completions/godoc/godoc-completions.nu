# Show examples in command line mode
extern "godoc" [
	--ex					# Show examples in command line mode
	--html					# Print HTML in command-line mode
	# --httptest.serve					# (this command breaks nu parser) httptest.NewServer serves on this address and blocks
	--index					# Enable search index
	--index_files					# Glob pattern specifying index files
	--links					# Link identifiers to their declarations
	--play					# Enable playground in web interface
	--server					# Webserver address for command line searches
	--src					# Print (exported) source in command-line mode
	--timestamps					# Show timestamps with directory listings
	--help(-h)					# Show help
	...args
]