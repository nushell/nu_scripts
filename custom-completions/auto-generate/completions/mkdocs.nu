# Show help and exit
extern "mkdocs" [
	--help(-h)					# Show help and exit
	--verbose(-v)					# Enable verbose output
	--quiet(-q)					# Silence warnings
	--version(-V)					# Show the version and exit
	--clean(-c)					# Remove old site_dir before building (the default)
	--strict(-s)					# Enable strict mode. This will cause MkDocs to abort the build on any warnings
	--theme(-t)					# The theme to use when building your documentation
	--clean(-c)					# Remove old site_dir before building (the default)
	--force					# Force the push to the repository
	--strict(-s)					# Enable strict mode. This will cause MkDocs to abort the build on any warnings
	--theme(-t)					# The theme to use when building your documentation
	--livereload					# Enable the live reloading in the development server (this is the default)
	--no-livereload					# Disable the live reloading in the development server
	--dirtyreload					# Enable the live reloading in the development server, but only re-build files that have changed
	...args
]

# Build the MkDocs documentation
extern "mkdocs build" [
	--help(-h)					# Show help and exit
	--verbose(-v)					# Enable verbose output
	--quiet(-q)					# Silence warnings
	--version(-V)					# Show the version and exit
	--clean(-c)					# Remove old site_dir before building (the default)
	--strict(-s)					# Enable strict mode. This will cause MkDocs to abort the build on any warnings
	--theme(-t)					# The theme to use when building your documentation
	--clean(-c)					# Remove old site_dir before building (the default)
	--force					# Force the push to the repository
	--strict(-s)					# Enable strict mode. This will cause MkDocs to abort the build on any warnings
	--theme(-t)					# The theme to use when building your documentation
	--livereload					# Enable the live reloading in the development server (this is the default)
	--no-livereload					# Disable the live reloading in the development server
	--dirtyreload					# Enable the live reloading in the development server, but only re-build files that have changed
	...args
]

# Deploy your documentation to GitHub Pages
extern "mkdocs gh-deploy" [
	--help(-h)					# Show help and exit
	--verbose(-v)					# Enable verbose output
	--quiet(-q)					# Silence warnings
	--version(-V)					# Show the version and exit
	--clean(-c)					# Remove old site_dir before building (the default)
	--strict(-s)					# Enable strict mode. This will cause MkDocs to abort the build on any warnings
	--theme(-t)					# The theme to use when building your documentation
	--clean(-c)					# Remove old site_dir before building (the default)
	--force					# Force the push to the repository
	--strict(-s)					# Enable strict mode. This will cause MkDocs to abort the build on any warnings
	--theme(-t)					# The theme to use when building your documentation
	--livereload					# Enable the live reloading in the development server (this is the default)
	--no-livereload					# Disable the live reloading in the development server
	--dirtyreload					# Enable the live reloading in the development server, but only re-build files that have changed
	...args
]

# Run the builtin development server
extern "mkdocs serve" [
	--help(-h)					# Show help and exit
	--verbose(-v)					# Enable verbose output
	--quiet(-q)					# Silence warnings
	--version(-V)					# Show the version and exit
	--clean(-c)					# Remove old site_dir before building (the default)
	--strict(-s)					# Enable strict mode. This will cause MkDocs to abort the build on any warnings
	--theme(-t)					# The theme to use when building your documentation
	--clean(-c)					# Remove old site_dir before building (the default)
	--force					# Force the push to the repository
	--strict(-s)					# Enable strict mode. This will cause MkDocs to abort the build on any warnings
	--theme(-t)					# The theme to use when building your documentation
	--livereload					# Enable the live reloading in the development server (this is the default)
	--no-livereload					# Disable the live reloading in the development server
	--dirtyreload					# Enable the live reloading in the development server, but only re-build files that have changed
	...args
]