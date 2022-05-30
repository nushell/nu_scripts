# Configuration file
extern "hugo" [

	...args
]

# Benchmark Hugo by building the site a number of times
extern "hugo benchmark" [
	--count(-n)					# Number of times to build the site
	--help(-h)					# Help for benchmark
	--renderToMemory					# Render to memory
	--stepAnalysis					# Display memory and timing of different steps of the program
	--templateMetrics					# Display metrics about template executions
	--templateMetricsHints					# Calculate some improvement hints when combined with --templateMetrics
	...args
]

# Perform some verification checks
extern "hugo check" [
	--help(-h)					# Help for check
	--help(-h)					# Help for ulimit
	...args
]

# Check system ulimit settings
extern "hugo ulimit" [
	--help(-h)					# Help for ulimit
	...args
]

# Print the site configuration
extern "hugo config" [
	--help(-h)					# Help for config
	...args
]

# Convert the content to different formats
extern "hugo convert" [
	--help(-h)					# Help for convert
	--unsafe					# Enable less safe operations
	--help(-h)					# Help for toJSON
	--help(-h)					# Help for toTOML
	--help(-h)					# Help for toYAML
	...args
]

# Convert front matter to JSON
extern "hugo toJSON" [
	--help(-h)					# Help for toJSON
	...args
]

# Convert front matter to TOML
extern "hugo toTOML" [
	--help(-h)					# Help for toTOML
	...args
]

# Convert front matter to YAML
extern "hugo toYAML" [
	--help(-h)					# Help for toYAML
	...args
]

# Print Hugo version and environment info
extern "hugo env" [
	--help(-h)					# Help for env
	...args
]

# Collection of several useful generators
extern "hugo gen" [
	--help(-h)					# Help for gen
	--help(-h)					# Help for autocomplete
	--type					# Autocompletion type
	--help(-h)					# Help for chromastyles
	--help(-h)					# Help for doc
	--help(-h)					# Help for man
	...args
]

# Generate shell autocompletion script for Hugo
extern "hugo autocomplete" [
	--help(-h)					# Help for autocomplete
	--type					# Autocompletion type
	...args
]

# Autocompletion type
extern "hugo bash" [

	...args
]

# Generate CSS stylesheet for the Chroma code highlighter
extern "hugo chromastyles" [
	--help(-h)					# Help for chromastyles
	...args
]

# Generate Markdown documentation for the Hugo CLI
extern "hugo doc" [
	--help(-h)					# Help for doc
	...args
]

# Generate man pages for the Hugo CLI
extern "hugo man" [
	--buildDrafts(-B)					# Include content marked as draft
	--buildExpired(-E)					# Include expired content
	--buildFuture(-F)					# Include content with publishdate in the future
	--canonifyURLs					# Canonicalize all relative URLs using baseurl
	--cleanDestinationDir					# Remove files from destination not found in static directories
	--disable404					# Do not build 404 page
	--disableRSS					# Do not build RSS files
	--disableSitemap					# Do not build sitemap files
	--enableGitInfo					# Add Git revision, date and author info to the pages
	--forceSyncStatic					# Copy all files when static is changed
	--help(-h)					# Help for hugo
	--i18n-warnings					# Print missing translations
	--ignoreCache					# Ignore the cache directory
	--noChmod					# Do not sync permission mode of files
	--noTimes					# Do not sync modification time of files
	--pluralizeListTitles					# Pluralize titles in lists using inflect
	--preserveTaxonomyNames					# Preserve taxonomy names as written
	--renderToMemory					# Render to memory
	--stepAnalysis					# Display memory and timing of different steps of the program
	--templateMetrics					# Display metrics about template executions
	--templateMetricsHints					# Calculate some improvement hints when combined with --templateMetrics
	--uglyURLs					# Use /filename.html instead of /filename/
	--watch(-w)					# Watch filesystem for changes and recreate as needed
	--count(-n)					# Number of times to build the site
	--help(-h)					# Help for benchmark
	--renderToMemory					# Render to memory
	--stepAnalysis					# Display memory and timing of different steps of the program
	--templateMetrics					# Display metrics about template executions
	--templateMetricsHints					# Calculate some improvement hints when combined with --templateMetrics
	--help(-h)					# Help for check
	--help(-h)					# Help for ulimit
	--help(-h)					# Help for config
	--help(-h)					# Help for convert
	--unsafe					# Enable less safe operations
	--help(-h)					# Help for toJSON
	--help(-h)					# Help for toTOML
	--help(-h)					# Help for toYAML
	--help(-h)					# Help for env
	--help(-h)					# Help for gen
	--help(-h)					# Help for autocomplete
	--type					# Autocompletion type
	--help(-h)					# Help for chromastyles
	--help(-h)					# Help for doc
	--help(-h)					# Help for man
	--help(-h)					# Help for import
	--force					# Allow import into non-empty target directory
	--help(-h)					# Help for jekyll
	--help(-h)					# Help for list
	--help(-h)					# Help for drafts
	--help(-h)					# Help for expired
	--help(-h)					# Help for future
	--help(-h)					# Help for new
	--force					# Create site inside non-empty directory
	--help(-h)					# Help for site
	--help(-h)					# Help for theme
	--appendPort					# Append port to baseurl
	--disableFastRender					# Enable full re-renders on changes
	--disableLiveReload					# Watch without enabling live browser reload on rebuild
	--help(-h)					# Help for server
	--meminterval					# Interval to poll memory usage
	--memstats					# Memory usage log file
	--navigateToChanged					# Navigate to changed content file on live browser reload
	--noHTTPCache					# Prevent HTTP caching
	--help(-h)					# Help for undraft
	--help(-h)					# Help for version
	...args
]

# Import your site from others
extern "hugo import" [
	--help(-h)					# Help for import
	--force					# Allow import into non-empty target directory
	--help(-h)					# Help for jekyll
	...args
]

# Import from Jekyll
extern "hugo jekyll" [
	--force					# Allow import into non-empty target directory
	--help(-h)					# Help for jekyll
	...args
]

# List various types of content
extern "hugo list" [
	--help(-h)					# Help for list
	--help(-h)					# Help for drafts
	--help(-h)					# Help for expired
	--help(-h)					# Help for future
	...args
]

# List all drafts
extern "hugo drafts" [
	--help(-h)					# Help for drafts
	...args
]

# List all expired posts
extern "hugo expired" [
	--help(-h)					# Help for expired
	...args
]

# List all posts dated in the future
extern "hugo future" [
	--help(-h)					# Help for future
	...args
]

# Create new content
extern "hugo new" [
	--help(-h)					# Help for new
	--force					# Create site inside non-empty directory
	--help(-h)					# Help for site
	--help(-h)					# Help for theme
	...args
]

# Create a new site
extern "hugo site" [
	--force					# Create site inside non-empty directory
	--help(-h)					# Help for site
	...args
]

# Create a new theme
extern "hugo theme" [
	--help(-h)					# Help for theme
	...args
]

# Start high performance web server
extern "hugo server" [
	--appendPort					# Append port to baseurl
	--disableFastRender					# Enable full re-renders on changes
	--disableLiveReload					# Watch without enabling live browser reload on rebuild
	--help(-h)					# Help for server
	--meminterval					# Interval to poll memory usage
	--memstats					# Memory usage log file
	--navigateToChanged					# Navigate to changed content file on live browser reload
	--noHTTPCache					# Prevent HTTP caching
	...args
]

# Reset the content draft status
extern "hugo undraft" [
	--help(-h)					# Help for undraft
	...args
]

# Print the version number of Hugo
extern "hugo version" [
	--help(-h)					# Help for version
	...args
]