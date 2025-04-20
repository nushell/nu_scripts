# Display help and exit
extern "status" [
	--help(-h)					# Display help and exit
	...args
]

# Test if this is a login shell
extern "status is-login" [
	--help(-h)					# Display help and exit
	...args
]

# Test if this is an interactive shell
extern "status is-interactive" [
	--help(-h)					# Display help and exit
	...args
]

# Test if inside an interactive read builtin
extern "status is-interactive-read" [
	--help(-h)					# Display help and exit
	...args
]

# Test if a command substitution is currently evaluated
extern "status is-command-substitution" [
	--help(-h)					# Display help and exit
	...args
]

# Test if a code block is currently evaluated
extern "status is-block" [
	--help(-h)					# Display help and exit
	...args
]

# Test if a breakpoint is currently in effect
extern "status is-breakpoint" [
	--help(-h)					# Display help and exit
	...args
]

# Test if new jobs are never put under job control
extern "status is-no-job-control" [
	--help(-h)					# Display help and exit
	...args
]

# Test if only interactive new jobs are put under job control
extern "status is-interactive-job-control" [
	--help(-h)					# Display help and exit
	...args
]

# Test if all new jobs are put under job control
extern "status is-full-job-control" [
	--help(-h)					# Display help and exit
	...args
]

# Print information on how this version fish was built
extern "status buildinfo" [
	--help(-h)					# Display help and exit
	...args
]

# Print the name of the currently running command or function
extern "status current-command" [
	--help(-h)					# Display help and exit
	...args
]

# Print the currently running command with its arguments
extern "status current-commandline" [
	--help(-h)					# Display help and exit
	...args
]

# Print the filename of the currently running script
extern "status current-filename" [
	--help(-h)					# Display help and exit
	...args
]

# Print the filename of the currently running script
extern "status filename" [
	--help(-h)					# Display help and exit
	...args
]

# Print the file name (without the path) of the currently running script
extern "status basename" [
	--help(-h)					# Display help and exit
	...args
]

# Print the path (without the file name) of the currently running script
extern "status dirname" [
	--help(-h)					# Display help and exit
	...args
]

# Print the name of the current function
extern "status current-function" [
	--help(-h)					# Display help and exit
	...args
]

# Print the name of the current function
extern "status function" [
	--help(-h)					# Display help and exit
	...args
]

# Print the line number of the currently running script
extern "status current-line-number" [
	--help(-h)					# Display help and exit
	...args
]

# Print the line number of the currently running script
extern "status line-number" [
	--help(-h)					# Display help and exit
	...args
]

# Print a list of all function calls leading up to running the current command
extern "status print-stack-trace" [
	--help(-h)					# Display help and exit
	...args
]

# Print a list of all function calls leading up to running the current command
extern "status stack-trace" [
	--help(-h)					# Display help and exit
	...args
]

# List all feature flags
extern "status features" [
	--help(-h)					# Display help and exit
	...args
]

# Test if a feature flag is enabled
extern "status test-feature" [
	--help(-h)					# Display help and exit
	...args
]

# Print the path to the current instance of fish
extern "status fish-path" [
	--help(-h)					# Display help and exit
	...args
]

# Print an embedded file from the fish binary
extern "status get-file" [
	--help(-h)					# Display help and exit
	...args
]

# List embedded files contained in the fish binary
extern "status list-files" [
	--help(-h)					# Display help and exit
	...args
]

# Set which jobs are under job control
extern "status job-control" [
	--help(-h)					# Display help and exit
	...args
]

# Set all jobs under job control
extern "status full" [
	--help(-h)					# Display help and exit
	...args
]

# Set only interactive jobs under job control
extern "status interactive" [
	--help(-h)					# Display help and exit
	...args
]

# Set no jobs under job control
extern "status none" [
	--help(-h)					# Display help and exit
	...args
]