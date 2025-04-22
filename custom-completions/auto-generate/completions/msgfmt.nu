# Generate a Java ResourceBundle class
extern "msgfmt" [
	--java(-j)					# Generate a Java ResourceBundle class
	--java2					# Like --java, and assume Java2 (JDK 1.2 or higher)
	--csharp					# Generate a .NET .dll file
	--csharp-resources					# Generate a .NET .resources file
	--tcl					# Generate a tcl/msgcat .msg file
	--qt					# Generate a Qt .qm file
	--strict					# Enable strict Uniforum mode
	--resource(-r)					# Resource name
	--locale(-l)					# Locale name, either language or language_COUNTRY
	--properties-input(-P)					# Input files are in Java .properties syntax
	--stringtable-input					# Input files are in NeXTstep/GNUstep .strings syntax
	--check(-c)					# Perform all the checks implied by --check-format, --check-header, --check-domain
	--check-format					# Check language dependent format strings
	--chack-header					# Verify presence and contents of the header entry
	--check-domain					# Check for conflicts between domain directives and the --output-file option
	--check-compatibility(-C)					# Check that GNU msgfmt behaves like X/Open msgfmt
	--check-accelerators					# Check presence of keyboard accelerators for menu items
	--use-fuzzy(-f)					# Use fuzzy entries in output
	--no-hash					# Binary file will not include the hash table
	--help(-h)					# Display help and exit
	--version(-V)					# Display version and exit
	--statistics					# Print statistics about translations
	--verbose					# Increase verbosity level
	...args
]