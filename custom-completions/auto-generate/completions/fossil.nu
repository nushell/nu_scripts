# Include dotfiles
extern "fossil" [

	...args
]

# Remove and add files to checkout
extern "fossil addremove" [
	--dotfiles					# Include dotfiles
	--dry-run(-n)					# Display actions without running
	...args
]

# Check all repositories
extern "fossil all" [

	...args
]

# List changes
extern "fossil changes" [
	--abs-paths					# Display absolute paths
	--rel-paths					# Display relative paths
	--sha1sum					# Verify file status using SHA1
	--header					# Identify the repository if there are changes
	--verbose(-v)					# Say (none) if there are no changes
	...args
]

# Ignore repository
extern "fossil ignore" [

	...args
]

# Display locations
extern "fossil list ls" [

	...args
]

# Pull repositories
extern "fossil pull" [

	...args
]

# Push repositories
extern "fossil push" [
	--private					# Pull private branches
	...args
]

# Rebuild repositories
extern "fossil rebuild" [
	--cluster					# Compute clusters
	--compress					# Compress database
	--force					# Force rebuild even with errors
	--noverify					# Skip BLOB table verification
	--randomize					# Scan in random order
	--vacuum					# Run VACUUM
	--deanalyze					# Remove ANALYZE tables
	--analyze					# Run ANALYZE
	--wal					# Set Write-Ahead-Log journalling
	--stats					# Show statistics
	...args
]

# Sync repositories
extern "fossil sync" [

	...args
]

# Shows file modifications
extern "fossil annotate" [
	--filevers					# Show file versions
	--log(-l)					# List all analyzed versions
	...args
]

# Find regressions
extern "fossil bisect" [
	--all(-a)					# Show all versions
	--all(-a)					# Show all versions
	--all(-a)					# Show all versions
	...args
]

# Show log of bisects in test order
extern "fossil log" [

	...args
]

# Show log of bisects in check-in order
extern "fossil chart" [

	...args
]

# Skip version
extern "fossil next" [

	...args
]

# Show bisect options
extern "fossil options" [

	...args
]

# Reinitialize bisect
extern "fossil reset" [

	...args
]

# List versions between bad and good
extern "fossil vlist ls status" [

	...args
]

# Undo latest bad/good command.
extern "fossil undo" [
	--dry-run(-n)					# Display actions without running
	...args
]

# Create a new branch
extern "fossil branch" [
	--private					# Make branch local
	--nosign					# Dont sign the branch with GPG
	--all(-a)					# Show all branches
	--all(-a)					# Show all branches
	--closed(-c)					# Show closed branches
	--closed(-c)					# Show closed branches
	...args
]

# Print a file
extern "fossil cat" [

	...args
]

# Checkout version
extern "fossil co checkout" [
	--force					# Ignore edited files
	--force-missing					# Ignore missing content
	--keep					# Only update the manifest
	--latest					# Update to latest version
	...args
]

# Delete all extra files
extern "fossil clean" [
	--dotfiles					# Include dotfiles
	--force(-f)					# Remove without prompting
	--dry-run(-n)					# Display actions without running
	--temp					# Only remove Fossil temporary files
	--verbose(-v)					# Show removed files
	...args
]

# Clone repository
extern "fossil clone" [
	--private					# Clone private branches
	...args
]

# Create new revision
extern "fossil ci commit" [
	--allow-conflict					# Allow unresolved merge conflicts
	--allow-empty					# Allow empty check-ins
	--allow-fork					# Allow forking
	--allow-older					# Allow commit older than ancestor
	--baseline					# Use a baseline manifest
	--close					# Close the branch
	--delta					# Use a delta manifest
	--dry-run(-n)					# Display actions without running
	--no-warnings					# Omit all warnings
	--nosign					# Dont sign the branch with GPG
	--private					# Dont sync the changes
	...args
]

# Show differences
extern "fossil diff gdiff" [
	--brief					# Show file names only
	--internal(-i)					# Use internal diff logic
	--side-by-side(-y)					# Side-by-side diff
	--tk					# Launch GUI
	--unified					# Unified diff
	--verbose(-v)					# Output complete text
	...args
]

# Export repository to git
extern "fossil export" [

	...args
]

# Show files that arent part of checkout
extern "fossil extras" [
	--abs-paths					# Display absolute paths
	--dotfiles					# Include dotfiles
	--rel-paths					# Display relative paths
	...args
]

# Print complete file history
extern "fossil finfo" [
	--brief(-b)					# Display one-line summary
	--log(-l)					# Select log mode (default)
	--print(-p)					# Select print mode
	--status(-s)					# Select status mode
	...args
]

# Display help
extern "fossil help" [
	--all(-a)					# Show main and auxiliary commands
	--test(-t)					# Show test commands only
	--aux(-x)					# Show auxiliary commands only
	--www(-w)					# Show list of web UI pages
	...args
]

# Import repository from git
extern "fossil import" [
	--incremental					# Allow importing into existing repository
	--verbose(-v)					# Show extra information
	...args
]

# Create a repository
extern "fossil init new" [

	...args
]

# Make JSON request
extern "fossil json" [

	...args
]

# List files
extern "fossil ls" [
	--all(-a)					# Show all versions
	--all(-a)					# Show all branches
	--closed(-c)					# Show closed branches
	--age					# Show commit time
	--verbose(-v)					# Provide extra information
	--verbose(-v)					# Show information about files
	...args
]

# Merge commits
extern "fossil merge" [
	--force(-f)					# Allow empty merge
	--integrate					# Close merged branch
	--dry-run(-n)					# Display actions without running
	--verbose(-v)					# Show extra information
	...args
]

# Move file
extern "fossil mv" [

	...args
]

# Open repository
extern "fossil open" [
	--keep					# Only modify manifest
	--nested					# Allow opening inside an opened repository
	...args
]

# Default server URL
extern "fossil remote-url" [

	...args
]

# Revert a commit
extern "fossil revert" [

	...args
]

# Remove a file from repository
extern "fossil rm delete" [
	--hard					# Remove files from this checkout
	--soft					# Skip removing files from this checkout
	--dry-run(-n)					# Display actions without runing
	...args
]

# Manage settings
extern "fossil settings" [
	--global					# Set globally
	...args
]

# Run SQL commands
extern "fossil sqlite3" [

	...args
]

# Manage stashes
extern "fossil stash" [
	--verbose(-v)					# Show information about files
	--verbose(-v)					# Show information about files
	--all(-a)					# Forget ALL stashes
	--all(-a)					# Forget ALL stashes
	...args
]

# Show status
extern "fossil status" [
	--all(-a)					# Show all versions
	--abs-paths					# Display absolute paths
	--rel-paths					# Display relative paths
	--sha1sum					# Verify file status using SHA1
	...args
]

# Manage tags
extern "fossil tag" [
	--raw					# Add raw tag
	--propagate					# Propagate tag
	--raw					# Remove raw tag
	--raw					# Find raw tag
	--raw					# List raw tags
	...args
]

# Show timeline
extern "fossil timeline" [
	--verbose(-v)					# Output list of files changed
	...args
]

# Open web UI
extern "fossil ui" [
	--cluster					# Compute clusters
	--compress					# Compress database
	--force					# Force rebuild even with errors
	--noverify					# Skip BLOB table verification
	--randomize					# Scan in random order
	--vacuum					# Run VACUUM
	--deanalyze					# Remove ANALYZE tables
	--analyze					# Run ANALYZE
	--wal					# Set Write-Ahead-Log journalling
	--stats					# Show statistics
	--localauth					# Enable automatic login for localhost
	--port(-P)					# Port to listen on
	--th-trace					# Trace TH1 execution
	--baseurl					# Use base URL
	--notfound					# Redirect
	--files					# Static files glob
	--scgi					# Use SCGI rather than HTTP
	...args
]

# Start web server
extern "fossil server" [
	--localauth					# Enable automatic login for localhost
	--localhost					# Only listen on localhost
	--port(-P)					# Port to listen on
	--th-trace					# Trace TH1 execution
	--baseurl					# Use base URL
	--notfound					# Redirect
	--files					# Static files glob
	--scgi					# Use SCGI rather than HTTP
	...args
]

# Update version
extern "fossil update" [
	--debug					# Print debug information
	--latest					# Update to latest version
	--dry-run(-n)					# Display actions without running
	--verbose(-v)					# Print information about all files
	...args
]

# Print fossil version
extern "fossil version" [
	--verbose(-v)					# Print version of optional features
	...args
]