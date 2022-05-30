# Display usage summary
extern "sphinx-apidoc" [
	--help(-h)					# Display usage summary
	--version					# Display Sphinx version
	--force(-f)					# Overwrite existing files
	--follow-links(-l)					# Follow symbolic links
	--dry-run(-n)					# Run the script without creating files
	--tocfile					# Filename of table of contents
	--no-toc(-T)					# Do not create a table of contents file
	--full(-F)					# Generate a full Sphinx project
	--separate(-e)					# Put doc for each module on its own page
	--no-headings(-E)					# Do not create headings
	--private(-P)					# Include _private modules
	--implicit-namespaces					# Interpret module paths according to PEP-0420
	--module-first(-M)					# Put module doc before submodule doc
	--templatedir(-t)					# Template directory for template files
	...args
]