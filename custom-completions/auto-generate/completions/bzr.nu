# Show help
extern "bzr help" [

	...args
]

# List all help topics
extern "bzr topics" [

	...args
]

# List all commands
extern "bzr commands" [

	...args
]

# Help about supported formats
extern "bzr formats" [

	...args
]

# Help about current supported formats
extern "bzr current-formats" [

	...args
]

# How to specify revisions in bzr
extern "bzr revisionspec" [

	...args
]

# Show bug tracker settings in bzr
extern "bzr bugs" [

	...args
]

# Makes this directory a versioned branch
extern "bzr init" [
	--create-prefix					# Create the path leading up to the branch if it does not already exists
	--no-tree					# Create a branch without a working tree
	--append-revisions-only					# Never change revnos or the existing log. Append revisions to it only
	...args
]

# Create the path leading up to the branch if it does not already exists
extern "bzr" [

	...args
]

# Make a copy of another branch
extern "bzr branch" [
	--use-existing-dir					# Proceed even if directory exits
	--stacked					# Create a stacked branch referring to the source branch
	--standalone					# Do not use a shared repository, even if available
	--switch					# Switch the checkout in the current directory to the new branch
	--hardlink					# Hard-link working tree files where possible
	--bind					# Bind new branch to from location
	--no-tree					# Create a branch without a working-tree
	...args
]

# Make files or directories versioned
extern "bzr add" [
	--no-recurse(-N)					# Dont recursively add the contents of directories
	--dry-run					# Show what would be done
	...args
]

# Ignore a file or pattern
extern "bzr ignore" [
	--default-rules					# Display the default ignore rules that bzr uses
	...args
]

# Move or rename a versioned file
extern "bzr mv" [
	--auto					# Automatically guess renames
	--after					# Move only the bzr identifier of the file, because the file has already been moved
	--dry-run					# Show what would be done
	...args
]

# Summarize changes in working copy
extern "bzr status" [
	--short(-S)					# Use short status indicators
	--versioned(-V)					# Only show versioned files
	--no-pending					# Dont show pending merges
	--no-classify					# Do not mark object type using indicator
	--show-ids					# Show internal object ids
	...args
]

# Show detailed diffs
extern "bzr diff" [

	...args
]

# Pull in changes from another branch
extern "bzr merge" [
	--pull					# If the destination is already completely merged into the source, pull from the source rather than merging
	--remember					# Remember the specified location as a default
	--force					# Merge even if the destination tree has uncommitted changes
	--reprocess					# Reprocess to reduce spurious conflicts
	--uncommited					# Apply uncommitted changes from a working copy, instead of branch changes
	--show-base					# Show base revision text in conflicts
	--preview					# Instead of merging, show a diff of the merge
	--interactive(-i)					# Select changes interactively
	--directory(-d)					# Branch to merge into, rather than the one containing the working directory
	--change(-c)					# Select changes introduced by the specified revision
	--revision(-r)					# Select changes introduced by the specified revision
	...args
]

# Save some or all changes
extern "bzr commit" [
	--show-diff(-p)					# When no message is supplied, show the diff along with the status summary in the message editor
	--file(-F)					# Take commit message from this file
	--exclude(-x)					# Do not consider changes made to a given path
	--message(-m)					# Description of the new revision
	--author					# Set the authors name, if its different from the commiter
	--commit-time					# Manually set a commit time using commit date format
	--unchanged					# Commit even if nothing has changed
	--fixes					# Mark a bug as being fixed by this revision
	--strict					# Refuse to commit if there are unknown files in the working tree
	--lossy					# When committing to a foreign version control system do not push data that can not be natively represented
	--local					# Perform a local commit in a bound branch.  Local commits are not pushed to the master branch until a normal commit is performed
	...args
]

# Send changes via email
extern "bzr send" [
	--body					# Body for the email
	--remember					# Remember submit and public branch
	--mail-to					# Mail the request to this address
	--format					# Use the specified output format
	--no-bundle					# Do not include a bundle in the merge directive
	--strict					# Refuse to send if there are uncommitted changes in the working tree, --no-strict disables the check
	--no-patch					# Do not include a preview patch in the merge directive
	...args
]

# Show history of changes
extern "bzr log" [

	...args
]

# Validate storage
extern "bzr check" [
	--tree					# Check the working tree related to the current directory
	--repo					# Check the repository related to the current directory
	--branch					# Check the branch related to the current directory
	...args
]