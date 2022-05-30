# Display help and exit
extern "apt-ftparchive" [
	--help(-h)					# Display help and exit
	--md5					# Generate MD5 sums
	--db(-d)					# Use a binary db
	--quiet(-q)					# Quiet mode
	--delink					# Perform delinking
	--contents					# Perform contents generation
	--source-override(-s)					# Use source override
	--readonly					# Make caching db readonly
	--version(-v)					# Display version and exit
	...args
]

# Generate package from source
extern "apt-ftparchive packages" [
	--help(-h)					# Display help and exit
	--md5					# Generate MD5 sums
	--db(-d)					# Use a binary db
	--quiet(-q)					# Quiet mode
	--delink					# Perform delinking
	--contents					# Perform contents generation
	--source-override(-s)					# Use source override
	--readonly					# Make caching db readonly
	--version(-v)					# Display version and exit
	...args
]

# Generate source index file
extern "apt-ftparchive sources" [
	--help(-h)					# Display help and exit
	--md5					# Generate MD5 sums
	--db(-d)					# Use a binary db
	--quiet(-q)					# Quiet mode
	--delink					# Perform delinking
	--contents					# Perform contents generation
	--source-override(-s)					# Use source override
	--readonly					# Make caching db readonly
	--version(-v)					# Display version and exit
	...args
]

# Generate contents file
extern "apt-ftparchive contents" [
	--help(-h)					# Display help and exit
	--md5					# Generate MD5 sums
	--db(-d)					# Use a binary db
	--quiet(-q)					# Quiet mode
	--delink					# Perform delinking
	--contents					# Perform contents generation
	--source-override(-s)					# Use source override
	--readonly					# Make caching db readonly
	--version(-v)					# Display version and exit
	...args
]

# Generate release file
extern "apt-ftparchive release" [
	--help(-h)					# Display help and exit
	--md5					# Generate MD5 sums
	--db(-d)					# Use a binary db
	--quiet(-q)					# Quiet mode
	--delink					# Perform delinking
	--contents					# Perform contents generation
	--source-override(-s)					# Use source override
	--readonly					# Make caching db readonly
	--version(-v)					# Display version and exit
	...args
]

# Remove records
extern "apt-ftparchive clean" [
	--help(-h)					# Display help and exit
	--md5					# Generate MD5 sums
	--db(-d)					# Use a binary db
	--quiet(-q)					# Quiet mode
	--delink					# Perform delinking
	--contents					# Perform contents generation
	--source-override(-s)					# Use source override
	--readonly					# Make caching db readonly
	--version(-v)					# Display version and exit
	...args
]