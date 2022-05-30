# Debugging command
extern "arc" [

	...args
]

# Implements shell completion
extern "arc shell-complete" [
	--current					# Current term in the argument list being completed
	...args
]

# Reads an arc configuration option
extern "arc get-config" [
	--verbose					# Show detailed information about options
	...args
]

# Download a file to local disk
extern "arc download" [
	--as					# Save the file with a specific name rather than the default
	--show					# Write file to stdout instead of to disk
	...args
]

# List your open Differential revisions
extern "arc list" [

	...args
]

# Run static analysis on changes to check for mistakes
extern "arc lint" [
	--engine					# Override configured lint engine for this project
	--apply-patches					# Apply patches suggested by lint to the working copy
	--severity					# Set minimum message severity
	--never-apply-patches					# Never apply patches suggested by lint
	--rev					# Lint changes since a specific revision
	--outfile					# Output the linter results to a file
	--lintall					# Show all lint warnings, not just those on changed lines
	--amend-all					# When linting git repositories, amend HEAD with all patches
	--everything					# Lint all files in the project
	--output					# Specify how results will be displayed
	--only-new					# Display only messages not present in the original code
	--only-changed					# Show lint warnings just on changed lines
	--amend-autofixes					# When linting git repositories, amend HEAD with autofix
	--search					# Search for linters
	--verbose					# Show detailed information, including options
	...args
]

# In the first form, list objects youve flagged
extern "arc flag" [
	--edit					# Edit the flag on an object
	--color					# Set the color of a flag
	--clear					# Delete the flag on an object
	--note					# Set the note on a flag
	...args
]

# Export the local changeset to a file
extern "arc export" [
	--unified					# Export change as a unified patch
	--git					# Export change as a git patch
	--encoding					# Attempt to convert non UTF-8 patch into specified encoding
	--arcbundle					# Export change as an arc bundle
	--diff					# Export from Differential diff
	--revision					# Export from a Differential revision
	...args
]

# Open a file or object in your web browser
extern "arc browse" [
	--force					# Open arguments as paths, even if they do not exist in the working copy
	--branch					# Default branch name to view on server
	...args
]

# Quickly create a task for yourself
extern "arc todo" [
	--cc					# Other users to CC on the new task
	--project					# Projects to assign to the task
	--browse					# After creating the task, open it in a web browser
	...args
]

# what they do and which versions are installed
extern "arc linters" [
	--search					# Search for linters
	--verbose					# Show detailed information, including options
	...args
]

# Show what youre currently tracking in Phrequent
extern "arc time" [

	...args
]

# Stop tracking work in Phrequent
extern "arc stop" [
	--note					# A note to attach to the tracked time
	...args
]

# Create an alias
extern "arc alias" [

	...args
]

# Sets an arc configuration option
extern "arc set-config" [
	--local					# Set a local config value instead of a user one
	...args
]

# Start tracking work in Phrequent
extern "arc start" [

	...args
]

# Close a task or otherwise update its status
extern "arc close" [
	--message					# Provide a comment with your status change
	--list-statuses					# Show available status options and exit
	--quiet					# Do not print a success message
	--finalize					# Close only if the repository is untracked and the revision is accepted
	...args
]

# Publish an accepted revision after review
extern "arc land" [
	--preview					# Prints the commits that would be landed
	--remote					# Push to a remote other than the default
	--delete-remote					# Delete the feature branch in the remote after landing it
	--update-with-rebase					# When updating the feature branch, use rebase instead of merge
	--squash					# Use squash strategy
	--keep-branch					# Keep the feature branch
	--merge					# Use merge strategy
	--update-with-merge					# When updating the feature branch, use merge instead of rebase
	--hold					# Prepare the change to be pushed, but do not actually push it
	--onto					# Land feature branch onto a branch other than the default
	--revision					# Use the message from a specific revision
	...args
]

# Show which commits will be selected
extern "arc which" [
	--show-base					# Print base commit only and exit
	--base					# Additional rules for determining base revision
	--head					# Specify the end of the commit range to select
	--any-status					# Show committed and abandoned revisions
	...args
]

# Alias for arc feature
extern "arc bookmark" [

	...args
]

# Amend the working copy
extern "arc amend" [
	--revision					# Use the message from a specific revision
	--show					# Show the amended commit message
	...args
]

# Upgrade arcanist and libphutil to the latest versions
extern "arc upgrade" [

	...args
]

# Shows the help
extern "arc help" [
	--full					# Print detailed information about each command
	...args
]

# Share and grab text using the Paste application
extern "arc paste" [
	--lang					# Language for syntax highlighting
	--json					# Output in JSON format
	--title					# Title for the paste
	...args
]

# Commit a revision which has been accepted by a reviewer
extern "arc commit" [
	--revision					# Commit a specific revision
	--show					# Show the command which would be issued
	...args
]

# Apply changes to the working copy
extern "arc patch" [
	--force					# Do not run any sanity checks
	--encoding					# Attempt to convert non UTF-8 patch into specified encoding
	--nocommit					# Do not commit the changes
	--update					# Update the local working copy before applying the patch
	--patch					# Apply changes from a git patch file or unified patch file
	--arcbundle					# Apply changes from an arc bundlej
	--skip-dependencies					# Do not apply dependencies
	--diff					# Apply changes from a Differential diff
	--nobranch					# Do not create a branch
	--revision					# Apply changes from a Differential revision
	...args
]

# Installs Conduit credentials into your ~/.arcc
extern "arc install-certificate" [

	...args
]

# Please use backout instead
extern "arc revert" [

	...args
]

# Upload a file from local disk
extern "arc upload" [
	--json					# Output upload information in JSON format
	--temporary					# Mark the file as temporary
	...args
]

# Alias for arc feature
extern "arc branch" [

	...args
]

# Theres only one way to find out
extern "arc anoid" [

	...args
]

# Show blame for the lines you changed
extern "arc cover" [
	--rev					# Cover changes since a specific revision
	...args
]

# Close a revision
extern "arc close-revision" [
	--quiet					# Do not print a success message
	--finalize					# Close only if the repository is untracked and the revision is accepted
	...args
]

# View all assigned tasks
extern "arc tasks" [
	--status					# Show tasks that are open or closed, default is open
	--owner					# Only show tasks assigned to the given username,
	--unassigned					# Only show tasks that are not assigned
	--limit					# Limit the amount of tasks outputted, default is all
	--order					# Arrange tasks based on priority, created, or modified,
	...args
]

# A wrapper on git branch or hg bookmark
extern "arc feature" [
	--output					# Specify the output format
	--view-all					# Include closed and abandoned revisions
	--by-status					# Sort branches by status instead of time
	...args
]

# Run unit tests that cover specified paths
extern "arc unit" [
	--engine					# Override configured unit engine for this project
	--detailed-coverage					# Show a detailed coverage report on the CLI
	--target					# Record a copy of the test results on the specified build target
	--ugly					# Use uglier formatting
	--rev					# Run unit tests covering changes since a specific revision
	--everything					# Run every test
	--json					# Report results in JSON format
	--coverage					# Always enable coverage information
	--output					# Specify the output format
	--no-coverage					# Always disable coverage information
	...args
]

# Backouts on a previous commit
extern "arc backout" [

	...args
]

# Make a raw Conduit method call
extern "arc call-conduit" [

	...args
]

# Generate a Differential diff or revision from local changes
extern "arc diff" [
	--raw-command					# Generate diff by executing a specified command
	--encoding					# Attempt to convert non UTF-8 hunks into specified encoding
	--cc					# When creating a revision, add CCs
	--reviewers					# When creating a revision, add reviewers
	--skip-staging					# Do not copy changes to the staging area
	--raw					# Read diff from stdin
	--uncommitted					# Suppress warning about uncommitted changes
	--message-file					# Read revision information from file
	--nolint					# Do not run lint
	--message					# Use the specified message when updating a revision
	--plan-changes					# Create or update a revision without requesting a code review
	--browse					# After creating a diff or revision, open it in a web browser
	--create					# Always create a new revision
	--cache					# Disable lint cache
	--use-commit-message					# Read revision information from a specific commit
	--only					# Only generate a diff, without running lint, unit tests, or other
	--skip-binaries					# Do not upload binaries
	--preview					# only create a diff
	--amend-autofixes					# When linting git repositories, amend HEAD with autofix
	--apply-patches					# Apply patches suggested by lint
	--head					# Specify the end of the commit range
	--verbatim					# When creating a revision, try to use the working copy commit
	--less-context					# Create a diff with a few lines of context.
	--advice					# Require excuse for lint advice in addition to lint warnings and errors
	--json					# Emit machine-readable JSON
	--update					# Always update a specific revision
	--ignore-unsound-tests					# Ignore unsound test failures without prompting
	--excuse					# Provide a prepared in advance excuse for any lints/tests
	--base					# Additional rules for determining base revision
	--no-amend					# Never amend commits in the working copy with lint patches
	--add-all					# Automatically add all unstaged and uncommitted
	--never-apply-patches					# Never apply patches suggested by lint
	--edit					# Edit revision information
	--nounit					# Do not run unit tests
	--lintall					# Raise all lint warnings
	--amend-all					# When linting git repositories, amend HEAD with all patches
	--no-diff					# Only run lint and unit tests
	--allow-untracked					# Skip checks for untracked files in the working copy
	--only-new					# Display only new lint messages
	--no-coverage					# Always disable coverage information
	...args
]

# Create or update a libphutil library
extern "arc liberate" [
	--remap					# Run the remap step of liberation
	--upgrade					# Upgrade library to v2
	--verify					# Run the verify step of liberation
	--all					# Drop the module cache before liberating
	--force-update					# Force the library map to be updated
	--library-name					# Set the library name
	...args
]

# Shows the current version of arcanist
extern "arc version" [

	...args
]