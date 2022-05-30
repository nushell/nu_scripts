# Display help and exit
extern "status" [

	...args
]

# Test if this is a login shell
extern "status is-login" [

	...args
]

# Test if this is an interactive shell
extern "status is-interactive" [

	...args
]

# Test if a command substitution is currently evaluated
extern "status is-command-substitution" [

	...args
]

# Test if a code block is currently evaluated
extern "status is-block" [

	...args
]

# Test if a breakpoint is currently in effect
extern "status is-breakpoint" [

	...args
]

# Test if new jobs are never put under job control
extern "status is-no-job-control" [

	...args
]

# Test if only interactive new jobs are put under job control
extern "status is-interactive-job-control" [

	...args
]

# Test if all new jobs are put under job control
extern "status is-full-job-control" [

	...args
]

# Print the name of the currently running command or function
extern "status current-command" [

	...args
]

# Print the filename of the currently running script
extern "status current-filename" [

	...args
]

# Print the filename of the currently running script
extern "status filename" [

	...args
]

# Print the name of the current function
extern "status current-function" [

	...args
]

# Print the name of the current function
extern "status function" [

	...args
]

# Print the line number of the currently running script
extern "status current-line-number" [

	...args
]

# Print the line number of the currently running script
extern "status line-number" [

	...args
]

# Print a list of all function calls leading up to running the current command
extern "status print-stack-trace" [

	...args
]

# Print a list of all function calls leading up to running the current command
extern "status stack-trace" [

	...args
]

# List all feature flags
extern "status features" [

	...args
]

# Test if a feature flag is enabled
extern "status test-feature" [

	...args
]

# Print the path to the current instance of fish
extern "status fish-path" [

	...args
]

# Set which jobs are under job control
extern "status job-control" [

	...args
]

# Set all jobs under job control
extern "status full" [

	...args
]

# Set only interactive jobs under job control
extern "status interactive" [

	...args
]

# Set no jobs under job control
extern "status none" [

	...args
]