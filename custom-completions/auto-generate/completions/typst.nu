# Set when to use color
extern "typst auto always never" [
	--color					# Set when to use color
	--version(-v)					# Print version
	--help(-h)					# Print help
	--open					# Open output file after compilation
	--timings					# Produce performance timings
	--one					# Retrieve exactly one element
	--variants					# List style variants of each family
	--force					# Force a downgrade to an older version
	--revert					# Revert to the version from before the last update
	...args
]

# Print version
extern "typst" [
	--color					# Set when to use color
	--version(-v)					# Print version
	--help(-h)					# Print help
	--open					# Open output file after compilation
	--timings					# Produce performance timings
	--one					# Retrieve exactly one element
	--variants					# List style variants of each family
	--force					# Force a downgrade to an older version
	--revert					# Revert to the version from before the last update
	...args
]

# Print help for the given subcommand(s)
extern "typst help" [
	--color					# Set when to use color
	--version(-v)					# Print version
	--help(-h)					# Print help
	--open					# Open output file after compilation
	--timings					# Produce performance timings
	--one					# Retrieve exactly one element
	--variants					# List style variants of each family
	--force					# Force a downgrade to an older version
	--revert					# Revert to the version from before the last update
	...args
]

# Compile an input file
extern "typst compile" [
	--color					# Set when to use color
	--version(-v)					# Print version
	--help(-h)					# Print help
	--open					# Open output file after compilation
	--timings					# Produce performance timings
	--one					# Retrieve exactly one element
	--variants					# List style variants of each family
	--force					# Force a downgrade to an older version
	--revert					# Revert to the version from before the last update
	...args
]

# Watch an input file and recompile on changes
extern "typst watch" [
	--color					# Set when to use color
	--version(-v)					# Print version
	--help(-h)					# Print help
	--open					# Open output file after compilation
	--timings					# Produce performance timings
	--one					# Retrieve exactly one element
	--variants					# List style variants of each family
	--force					# Force a downgrade to an older version
	--revert					# Revert to the version from before the last update
	...args
]

# Initialize a new project
extern "typst init" [
	--color					# Set when to use color
	--version(-v)					# Print version
	--help(-h)					# Print help
	--open					# Open output file after compilation
	--timings					# Produce performance timings
	--one					# Retrieve exactly one element
	--variants					# List style variants of each family
	--force					# Force a downgrade to an older version
	--revert					# Revert to the version from before the last update
	...args
]

# Process an input file to extract metadata
extern "typst query" [
	--color					# Set when to use color
	--version(-v)					# Print version
	--help(-h)					# Print help
	--open					# Open output file after compilation
	--timings					# Produce performance timings
	--one					# Retrieve exactly one element
	--variants					# List style variants of each family
	--force					# Force a downgrade to an older version
	--revert					# Revert to the version from before the last update
	...args
]

# List all discovered fonts
extern "typst fonts" [
	--color					# Set when to use color
	--version(-v)					# Print version
	--help(-h)					# Print help
	--open					# Open output file after compilation
	--timings					# Produce performance timings
	--one					# Retrieve exactly one element
	--variants					# List style variants of each family
	--force					# Force a downgrade to an older version
	--revert					# Revert to the version from before the last update
	...args
]

# Self update the Typst CLI
extern "typst update" [
	--color					# Set when to use color
	--version(-v)					# Print version
	--help(-h)					# Print help
	--open					# Open output file after compilation
	--timings					# Produce performance timings
	--one					# Retrieve exactly one element
	--variants					# List style variants of each family
	--force					# Force a downgrade to an older version
	--revert					# Revert to the version from before the last update
	...args
]