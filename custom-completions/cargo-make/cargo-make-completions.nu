alias makers = cargo make
alias "carg-make make" = cargo make

export extern "cargo make" [
    task?: string@"nu-complete tasks"    # task to run
    --help(-h)                           # Print help information
    --version(-V)                        # Print version information
    --makefile: path                     # The optional toml file containing the tasks definitions
    --task(-t): string@"nu-complete tasks" # The task name to execute (can omit the flag if the task name is the last argument) [default: default]
    --profile(-p): string                # The profile name (will be converted to lower case) [default: development]
    # --profile(-p): string@"nu-complete profiles"                # The profile name (will be converted to lower case) [default: development]
    --cwd: path                          # Will set the current working directory. The search for the makefile will be from this directory if defined.
    --no-workspace                       # Disable workspace support (tasks are triggered on workspace and not on members)
    --no-on-error                        # Disable on error flow even if defined in config sections
    --allow-private                      # Allow invocation of private tasks
    --skip-init-end-tasks                # If set, init and end tasks are skipped
    --skip-tasks: string                 # Skip all tasks that match the provided regex (example: pre.*|post.*)
    --env-file: path                     # Set environment variables from provided file
    --env(-e): string                    # Set environment variables
    --loglevel(-l): string@"nu-complete loglevels"  # The log level (verbose, info, error, off) [default: info]
    --verbose(-v)                        # Sets the log level to verbose (shorthand for --loglevel verbose)
    --quiet                              # Sets the log level to error (shorthand for --loglevel error)
    --silent                             # Sets the log level to off (shorthand for --loglevel off)
    --no-color                           # Disables colorful output
    --time-summary                       # Print task level time summary at end of flow
    --experimental                       # Allows access unsupported experimental predefined tasks.
    --disable-check-for-updates          # Disables the update check during startup
    --output-format: string@"nu-complete output-format"  # The print/list steps format (some operations do not support all formats) (default, short-description, markdown, markdown-single-page, markdown-sub-section, autocomplete)
    --output-file: path                  # The list steps output file name
    --hide-uninteresting                 # Hide any minor tasks such as pre/post hooks.
    --print-steps                        # Only prints the steps of the build in the order they will be invoked but without invoking them
    --list-all-steps                     # Lists all known steps
    --list-category-steps: string        # List steps for a given category
    --diff-steps                         # Runs diff between custom flow and prebuilt flow (requires git)
]

def "nu-complete tasks" [] {
    open Makefile.toml | get tasks | columns
}

def "nu-complete profiles" [] {
    # TODO
}

def "nu-complete loglevels" [] {
    ['verbose', 'info', 'error', 'off']
}

def "nu-complete output-format" [] {
    ['default', 'short-description', 'markdown', 'markdown-single-page', 'markdown-sub-section', 'autocomplete']
}