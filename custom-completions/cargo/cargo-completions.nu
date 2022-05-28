## Written by lukexor, Improved by @Dan-Gamin

def "nu-complete cargo targets" [type: string] {
  ^cargo metadata --format-version=1 --offline --no-deps | from json | get packages.targets | flatten | where ($type in $it.kind) | get name
}
def "nu-complete cargo bins" [] { nu-complete cargo targets bin }
def "nu-complete cargo examples" [] { nu-complete cargo targets example }

def "nu-complete cargo packages" [] {
  let metadata = (^cargo metadata --format-version=1 --offline --no-deps)
  if $metadata == '' {
    []
  } else {
    $metadata | from json | get workspace_members | split column ' ' | get column1
  }
}

def "nu-complete cargo color" [] {
  ['auto', 'always', 'never']
}

def "nu-complete cargo profiles" [] {
  open Cargo.toml | get profile | transpose | get column0
}

def "nu-complete cargo features" [] {
  open Cargo.toml | get features | transpose | get column0
}

# `cargo --list` is slow, `open` is faster.
# TODO: Add caching.
def "nu-complete cargo subcommands" [] {
  ^cargo --list | lines | skip 1 | str collect "\n" | from ssv --noheaders | get column1
}
def "nu-complete cargo vcs" [] {
  [
    'git',
    'hg',
    'pijul',
    'fossil',
    'none'
  ]
}


# Rust's package manager
export extern "cargo"  [
  --version(-V)      # Print version info and exit
  --list             # List installed commands
  --explain: number  # Run `rustc --explain CODE`
  --verbose(-v)      # Use verbose output. May be specified twice for "very verbose" output
  --quiet(-q)        # Do not print cargo log messages
  --color: string@"nu-complete cargo color"  # Control when colored output is used
  --frozen           # Require Cargo.lock and cache are up to date
  --locked           # Require Cargo.lock is up to date
  --offline          # Run without accessing the network
  --config: string   # Override a configuration value
  -Z: any            # Unstable (nightly-only) flags to Cargo, see 'cargo -Z help' for details
  -h, --help         # Print help information
]

# Compile the current package
export extern "cargo build" [
  --package(-p): any  # Build only the specified packages
  --workspace         # Build all members in the workspace
  --exclude: any      # Exclude the specified packages
  --lib               # Build the package's library
  --bin: string       # Build the specified binary
  --bins              # Build all binary targets
  --example: string   # Build the specified example
  --examples          # Build all example targets
  --test: string      # Build the specified integration test
  --tests             # Build all targets in test mode that have the test = true manifest flag set
  --bench: string     # Build the specified benchmark
  --benches           # Build all targets in benchmark mode that have the bench = true manifest flag set
  --all-targets       # Build all targets
  --features: string  # pace or comma separated list of features to activate
  --all-features      # Activate all available features of all selected packages
  --no-default-features # Do not activate the default feature of the selected packages
  --target: string    # Build for the given architecture.
  --release(-r)       # Build optimized artifacts with the release profile
  --profile: string@"nu-complete cargo profiles" # Build with the given profile
  --ignore-rust-version # Ignore the required rust version as configured in the project
  --timing: string    # Output information how long each compilation takes
  --target-dir: path  # Directory for all generated artifacts and intermediate files
  --out-dir: path     # Copy final artifacts to this directory
  --verbose(-v)      # Use verbose output. May be specified twice for "very verbose" output
  --quiet(-q)        # Do not print cargo log messages
  --color: string@"nu-complete cargo color"  # Control when colored output is used
  --message-format: string # The output format for diagnostic messages
  --build-plan # Outputs a series of JSON messages to stdout that indicate the commands to run the build
  --manifest-path: path  # Path to the Cargo.toml file
  --frozen           # Require Cargo.lock and cache are up to date
  --locked           # Require Cargo.lock is up to date
  --offline          # Run without accessing the network
  -Z: any            # Unstable (nightly-only) flags to Cargo, see 'cargo -Z help' for details
  -h, --help         # Print help information
  --jobs(-j): number # Number of parallel jobs to run
  --future-incompat-report # Displays a future-incompat report for any future-incompatible warnings
]

# Create a new cargo package
export extern "cargo new" [
  path: path # The directory that will contain the project
  --bin # Create a package with a binary target (src/main.rs) (default)
  --lib # Create a package with a library target (src/lib.rs)
  --edition: number # Specify the Rust edition to use (default: 2021)
  --name: string # Set the package name. Defaults to the directory name.
  --vcs: string@"nu-complete cargo vcs" # Initialize a new VCS repository for the given version control system
  --registry: string # Name of the registry to use
  --verbose(-v)      # Use verbose output. May be specified twice for "very verbose" output
  --quiet(-q)        # Do not print cargo log messages
  --color: string@"nu-complete cargo color"  # Control when colored output is used
  -Z: any            # Unstable (nightly-only) flags to Cargo, see 'cargo -Z help' for details
  -h, --help         # Print help information
]

# Output the resolved dependencies of a package in machine-readable format
export extern "cargo metadata"  [
  --no-deps # Output information only about the workspace members and don't fetch dependencies
  --format-version: number # Specify the version of the output format to use. Currently 1 is the only possible value
  --filter-platform: string  # This filters the resolve output to only include dependencies for the iven target triple
  --features: string # Space or comma separated list of features to activate
  --all-features # Activate all available features of all selected packages
  --no-default-features # Do not activate the default feature of the selected packages
  --verbose(-v) # Use verbose output. May be specified twice for "very verbose" output
  --quiet(-q) # Do not print cargo log messages
  --color: string@"nu-complete cargo color" # Control when colored output is used
  --manifest-path: path # Path to the Cargo.toml file
  --frozen # Require Cargo.lock and cache are up to date
  --locked  # Require Cargo.lock is up to date
  --offline # Run without accessing the network
  --help(-h) # Prints help information
  -Z: any # Unstable (nightly-only) flags to Cargo, see 'cargo -Z help' for details
]

# Get the help of the given cargo subcommand
export extern "cargo help" [
  subcommand: string@"nu-complete cargo subcommands"
  --color: string@"nu-complete cargo color" # Control when colored output is used
  --config: string # Override a configuration value
  --frozen         # Require Cargo.lock and cache are up to date
  --locked         # Require Cargo.lock is up to date
  --offline        # Run without accessing the network
  --verbose(-v)    # Use verbose output. May be specified twice for "very verbose" output
  -Z: any          # Unstable (nightly-only) flags to Cargo, see 'cargo -Z help' for details
]

# Search packages in crates.io
export extern "cargo search" [
  query: string # The thing to search
  --limit: number # Limit the number of results. (default: 10, max: 100)
  --index: string # The URL of the registry index to use
  --registry: string # Name of the registry to use
  --verbose(-v) # Use verbose output. May be specified twice for "very verbose" output
  --quiet(-q) # Do not print cargo log messages
  --color: string@"nu-complete cargo color" # Control when colored output is used
  --help(-h) # Prints help information
  -Z: any          # Unstable (nightly-only) flags to Cargo, see 'cargo -Z help' for details
]

# Run the current cargo package
export extern "cargo run" [
  ...args: any                                      # Arguments to be passed to your program
  --bin: string@"nu-complete cargo bins"            # Name of the bin target to run
  --example: string@"nu-complete cargo examples"    # Name of the example target to run
  --quiet(-q)                                       # Do not print cargo log messages
  --package(-p): string@"nu-complete cargo packages"# Package with the target to run
  --jobs(-j): number                                # Number of parallel jobs, defaults to # of CPUs
  --release                                         # Build artifacts in release mode, with optimizations
  --profile: string@"nu-complete cargo profiles"    # Build artifacts with the specified profile
  --features: string@"nu-complete cargo features"   # Space or comma separated list of features to activate
  --all-features                                    # Activate all available features
  --no-default-features                             # Do not activate the `default` feature
  --target: string                                  # Build for the target triple
  --target-dir: path                                # Directory for all generated artifacts
  --manifest-path: path                             # Path to Cargo.toml
  --message-format: string                          # Error format
  --unit-graph                                      # Output build graph in JSON (unstable)
  --ignore-rust-version                             # Ignore `rust-version` specification in packages
  --verbose(-v)                                     # Use verbose output (-vv very verbose/build.rs output)
  --color: string@"nu-complete cargo color"         # Control when colored output is used
  --frozen                                          # Require Cargo.lock and cache are up to date
  --locked                                          # Require Cargo.lock is up to date
  --offline                                         # Run without accessing the network
  --config: string                                  # Override a configuration value (unstable)
  -Z: string                                        # Unstable (nightly-only) flags to Cargo, see 'cargo -Z help' for details
  --help(-h)                                        # Prints help information
]
