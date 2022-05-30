# Specify the number of times you wish to attempt network commands
extern "bundle" [

	...args
]

# Install the gems specified by the Gemfile or Gemfile.lock
extern "bundle install" [
	--gemfile					# The location of the Gemfile bundler should use
	--path					# The location to install the gems in the bundle to
	--system					# Installs the gems in the bundle to the system location
	--without					# A space-separated list of groups to skip installing
	--local					# Use cached gems instead of connecting to rubygems.org
	--deployment					# Switches bundler's defaults into deployment mode.
	--binstubs					# Create a directory containing executabes that run in the context of the bundle
	--shebang					# Specify a ruby executable to use with generated binstubs
	--standalone					# Make a bundle that can work without RubyGems or Bundler at run-time
	--trust-policy(-P)					# Apply a RubyGems security policy: {High,Medium,Low,No}Security
	--jobs(-j)					# Install gems parallelly by starting size number of parallel workers
	--no-cache					# Do not update the cache in vendor/cache with the newly bundled gems
	--quiet					# Do not print progress information to stdout
	--clean					# Run bundle clean automatically after install
	--full-index					# Use the rubygems modern index instead of the API endpoint
	--no-prune					# Do not remove stale gems from the cache
	--frozen					# Do not allow the Gemfile.lock to be updated after this install
	...args
]

# Update dependencies to their latest versions
extern "bundle update" [
	--source					# The name of a :git or :path source used in the Gemfile
	--local					# Do not attempt to fetch gems remotely and use the gem cache instead
	--quiet					# Only output warnings and errors
	--full-index					# Use the rubygems modern index instead of the API endpoint
	--jobs(-j)					# Specify the number of jobs to run in parallel
	--group(-g)					# Update a specific group
	...args
]

# Package the .gem files into vendor/cache directory
extern "bundle package" [

	...args
]

# Install the binstubs of the listed gem
extern "bundle binstubs" [
	--path					# Binstub destination directory (default bin)
	--force					# Overwrite existing binstubs if they exist
	...args
]

# Execute a script in the context of the current bundle
extern "bundle exec" [
	--keep-file-descriptors					# Exec runs a command, providing it access to the gems in the bundle
	...args
]

# Describe available tasks or one specific task
extern "bundle help" [

	...args
]

# Specify and read configuration options for bundler
extern "bundle config" [

	...args
]

# Check bundler requirements for your application
extern "bundle check" [
	--gemfile					# The location of the Gemfile bundler should use
	--path					# Specify a path other than the system default (BUNDLE_PATH or GEM_HOME)
	--dry-run					# Lock the Gemfile
	...args
]

# Show all of the gems in the current bundle
extern "bundle list" [
	--paths					# List the paths of all gems required by your Gemfile
	...args
]

# Show the source location of a particular gem in the bundle
extern "bundle show" [
	--paths					# List the paths of all gems required by your Gemfile
	...args
]

# Show all of the outdated gems in the current bundle
extern "bundle outdated" [
	--pre					# Check for newer pre-release gems
	--source					# Check against a specific source
	--local					# Use cached gems instead of attempting to fetch gems remotely
	--strict					# Only list newer versions allowed by your Gemfile requirements
	...args
]

# Start an IRB session in the context of the current bundle
extern "bundle console" [

	...args
]

# Open an installed gem in your $EDITOR
extern "bundle open" [

	...args
]

# Generate a visual representation of your dependencies
extern "bundle viz" [
	--file(-f)					# The name to use for the generated file (see format option)
	--version(-v)					# Show each gem version
	--requirements(-r)					# Show the version of each required dependency
	--format(-F)					# Output a specific format (png, jpg, svg, dot, …)
	...args
]

# Generate a simple Gemfile
extern "bundle init" [
	--gemspec					# Use a specified .gemspec to create the Gemfile
	...args
]

# Create a simple gem, suitable for development with bundler
extern "bundle gem" [
	--bin(-b)					# Generate a binary for your library
	--test(-t)					# Generate a test directory for your library (rspec or minitest)
	--edit(-e)					# Path to your editor
	--ext					# Generate the boilerplate for C extension code
	...args
]

# Displays platform compatibility information
extern "bundle platform" [
	--ruby					# Only display Ruby directive information
	...args
]

# Cleans up unused gems in your bundler directory
extern "bundle cleanup" [

	...args
]

# Cleans up unused gems in your bundler directory
extern "bundle clean" [
	--dry-run					# Only print out changes, do not actually clean gems
	--force					# Forces clean even if --path is not set
	...args
]

# Cache all the gems to vendor/cache
extern "bundle cache" [
	--no-prune					# Do not remove stale gems from the cache
	--all					# Include all sources (including path and git)
	...args
]

# Prints the license of all gems in the bundle
extern "bundle licenses" [

	...args
]

# Print information about the environment Bundler is running under
extern "bundle env" [

	...args
]