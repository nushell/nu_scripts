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
  ^cargo --list | lines | skip 1 | str join "\n" | from ssv --noheaders | get column1
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

#*> Core <*#

# Disabled due to messing with undefined cargo-subcommands

# # Rust's package manager
# export extern "cargo"  [
#   --version(-V)      # Print version info and exit
#   --list             # List installed commands
#   --explain: number  # Run `rustc --explain CODE`
#   --verbose(-v)      # Use verbose output. May be specified twice for "very verbose" output
#   --quiet(-q)        # Do not print cargo log messages
#   --color: string@"nu-complete cargo color"  # Control when colored output is used
#   --frozen           # Require Cargo.lock and cache are up to date
#   --locked           # Require Cargo.lock is up to date
#   --offline          # Run without accessing the network
#   --config: string   # Override a configuration value
#   -Z: any            # Unstable (nightly-only) flags to Cargo, see 'cargo -Z help' for details
#   -h, --help         # Print help information
#   ...args: any
# ]

#*> Common Commands (Sorted by order shown by running the `cargo` command) <*#

# Compile the current package
export extern "cargo build" [
  --package(-p): string@"nu-complete cargo packages"  # Build only the specified packages
  --workspace         # Build all members in the workspace
  --exclude: string@"nu-complete cargo packages" # Exclude the specified packages
  --lib               # Build the package's library
  --bin: string@"nu-complete cargo bins" # Build the specified binary
  --bins              # Build all binary targets
  --example: string@"nu-complete cargo examples" # Build the specified example
  --examples          # Build all example targets
  --test: string      # Build the specified integration test
  --tests             # Build all targets in test mode that have the test = true manifest flag set
  --bench: string     # Build the specified benchmark
  --benches           # Build all targets in benchmark mode that have the bench = true manifest flag set
  --all-targets       # Build all targets
  --features(-F): string@"nu-complete cargo features" # Space or comma separated list of features to activate
  --all-features      # Activate all available features of all selected packages
  --no-default-features # Do not activate the default feature of the selected packages
  --target: string    # Build for the given architecture.
  --release(-r)       # Build optimized artifacts with the release profile
  --profile: string@"nu-complete cargo profiles" # Build with the given profile
  --ignore-rust-version # Ignore `rust-version` specification in packages
  --timings: string    # Output information how long each compilation takes
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

# Check the current package
export extern "cargo check" [
  --package(-p): string@"nu-complete cargo packages" #Check only the specified packages
  --workspace # Check all members in the workspace
  --all # Alias for --workspace (deprecated)
  --exclude: string@"nu-complete cargo packages" # Exclude the specified packages
  --lib # Check the package's library
  --bin: string@"nu-complete cargo bins" # Check the specified binary
  --example: string@"nu-complete cargo examples" # Check the specified example
  --examples # Check all example targets
  --test: string # Check the specified integration test
  --tests # Check all targets in test mode that have the test = true manifest flag set
  --bench: string # Check the specified benchmark
  --benches # Check all targets in benchmark mode that have the bench = true manifest flag set
  --all-targets # Check all targets
  --features(-F): string@"nu-complete cargo features" # Space or comma separated list of features to activate
  --all-features # Activate all available features
  --no-default-features # Do not activate the `default` feature
  --target: string # Check for the given architecture
  --release(-r) # Check optimized artifacts with the release profile
  --profile: string@"nu-complete cargo profiles" # Check with the given profile
  --ignore-rust-version # Ignore `rust-version` specification in packages
  --timings: string    # Output information how long each compilation takes
  --target-dir: path  # Directory for all generated artifacts and intermediate files
  --verbose(-v)      # Use verbose output. May be specified twice for "very verbose" output
  --quiet(-q)        # Do not print cargo log messages
  --color: string@"nu-complete cargo color"  # Control when colored output is used
  --message-format: string # The output format for diagnostic messages
  --manifest-path: path  # Path to the Cargo.toml file
  --frozen           # Require Cargo.lock and cache are up to date
  --locked           # Require Cargo.lock is up to date
  --offline          # Run without accessing the network
  -Z: any            # Unstable (nightly-only) flags to Cargo, see 'cargo -Z help' for details
  -h, --help         # Print help information
  --jobs(-j): number # Number of parallel jobs to run
  --keep-going # Build as many crates in the dependency graph as possible
  --future-incompat-report # Displays a future-incompat report for any future-incompatible warnings
]

# Remove the target directory
export extern "cargo clean" [
  --package(-p): string@"nu-complete cargo packages"    # Clean only the specified packages
  --doc                    # Remove only the doc directory in the target directory
  --release                # Remove all artifacts in the release directory
  --profile                # Remove all artifacts in the directory with the given profile name
  --target-dir: path       # Directory for all generated artifacts and intermediate files
  --target: string         # Clean for the given architecture
  --verbose(-v)            # Use verbose output. May be specified twice for "very verbose" output
  --quiet(-q)              # Do not print cargo log messages
  --color: string@"nu-complete cargo color" # Control when colored output is used
  --message-format: string # The output format for diagnostic messages
  --manifest-path: path    # Path to the Cargo.toml file
  --frozen                 # Require Cargo.lock and cache are up to date
  --locked                 # Require Cargo.lock is up to date
  --offline                # Run without accessing the network
  -Z: any                  # Unstable (nightly-only) flags to Cargo, see 'cargo -Z help' for details
  -h, --help               # Print help information
]

# Build a package's documentation
export extern "cargo doc" [
  --open                    # Open the docs in a browser after building them
  --no-deps                 # Do not build documentation for dependency
  --document-private-items  # Include non-public items in the documentation
  --package(-p): string@"nu-complete cargo packages" # Document only the specified packages
  --workspace               # Document all members in the workspace
  --exclude: string@"nu-complete cargo packages" # Exclude the specified packages
  --lib: string             # Document the package's library
  --bin: string@"nu-complete cargo bins" # Document the specified binary
  --bins                    # Document all binary targets
  --example: string@"nu-complete cargo examples" # Document the specified example
  --examples                # Document all example targets
  --features(-F): string@"nu-complete cargo features" # Space or comma separated list of features to activate
  --all-features            # Activate all available features of all selected packages
  --no-default-features     # Do not activate the default feature of the selected packages
  --target: string          # Document for the given architecture
  --release(-r)             # Document optimized artifacts with the release profile
  --profile: string@"nu-complete cargo profiles" # Document with the given profile
  --ignore-rust-version     # Ignore `rust-version` specification in packages
  --timings: string         # Output information how long each compilation takes
  --target-dir: path        # Directory for all generated artifacts and intermediate files
  --verbose(-v)             # Use verbose output. May be specified twice for "very verbose" output
  --quiet(-q)               # Do not print cargo log messages
  --color: string@"nu-complete cargo color" # Control when colored output is used
  --message-format: string  # The output format for diagnostic messages
  --manifest-path: path     # Path to the Cargo.toml file
  --frozen                  # Require Cargo.lock and cache are up to date
  --locked                  # Require Cargo.lock is up to date
  --offline                 # Run without accessing the network
  -Z: any                   # Unstable (nightly-only) flags to Cargo, see 'cargo -Z help' for details
  -h, --help                # Print help information
  --jobs(-j): number        # Number of parallel jobs to run
  --keep-going              # Build as many crates in the dependency graph as possible
]

# Create a new cargo package
export extern "cargo new" [
  path: path          # The directory that will contain the project
  --bin               # Create a package with a binary target (src/main.rs) (default)
  --lib               # Create a package with a library target (src/lib.rs)
  --edition: number   # Specify the Rust edition to use (default: 2021)
  --name: string      # Set the package name. Defaults to the directory name.
  --vcs: string@"nu-complete cargo vcs" # Initialize a new VCS repository for the given version control system
  --registry: string  # Name of the registry to use
  --verbose(-v)       # Use verbose output. May be specified twice for "very verbose" output
  --quiet(-q)         # Do not print cargo log messages
  --color: string@"nu-complete cargo color"  # Control when colored output is used
  -Z: any             # Unstable (nightly-only) flags to Cargo, see 'cargo -Z help' for details
  -h, --help          # Print help information
]

# Create a new cargo package in an existing directory
export extern "cargo init" [
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

# Run the current cargo package
export extern "cargo run" [
  ...args: any                              # Arguments to be passed to your program
  --bin: string@"nu-complete cargo bins"    # Name of the bin target to run
  --example: string@"nu-complete cargo examples" # Name of the example target to run
  --quiet(-q)                               # Do not print cargo log messages
  --package(-p): string@"nu-complete cargo packages" # Package with the target to run
  --jobs(-j): number                        # Number of parallel jobs, defaults to # of CPUs
  --release                                 # Build artifacts in release mode, with optimizations
  --profile: string@"nu-complete cargo profiles" # Build artifacts with the specified profile
  --features(-F): string@"nu-complete cargo features" # Space or comma separated list of features to activate
  --all-features                            # Activate all available features
  --no-default-features                     # Do not activate the `default` feature
  --target: string                          # Build for the target triple
  --target-dir: path                        # Directory for all generated artifacts
  --manifest-path: path                     # Path to Cargo.toml
  --message-format: string                  # Error format
  --unit-graph                              # Output build graph in JSON (unstable)
  --ignore-rust-version                     # Ignore `rust-version` specification in packages
  --verbose(-v)                             # Use verbose output (-vv very verbose/build.rs output)
  --color: string@"nu-complete cargo color" # Control when colored output is used
  --frozen                                  # Require Cargo.lock and cache are up to date
  --locked                                  # Require Cargo.lock is up to date
  --offline                                 # Run without accessing the network
  --config: string                          # Override a configuration value (unstable)
  -Z: string                                # Unstable (nightly-only) flags to Cargo, see 'cargo -Z help' for details
  --help(-h)                                # Prints help information
]

# Run the tests
export extern "cargo test" [
  test_arg_separator?: string
   ...args: any        # Arguments to be passed to the tests
  --no-run       # Compile, but don't run tests
  --no-fail-fast # Run all tests regardless of failure
  --package(-p): string@"nu-complete cargo packages" # Test only the specified packages
  --workspace # Test all members in the workspace
  --exclude: string@"nu-complete cargo packages" # Exclude the specified packages
  --lib # Test the package's library
  --bin: string@"nu-complete cargo bins" # Test only the specified binary
  --bins # Test all binaries
  --example: string@"nu-complete cargo examples" # Test only the specified example
  --examples # Test all examples
  --test: string # Test the specified integration test
  --tests # Test all targets in test mode that have the test = true manifest flag set
  --bench: string # Test the specified benchmark
  --benches # Test all targets in benchmark mode that have the bench = true manifest flag set
  --all-targets # Test all targets
  --doc # Test ONLY the library's documentation
  --features(-F): string@"nu-complete cargo features" # Space or comma separated list of features to activate
  --all-features # Activate all available features of all selected packages
  --no-default-features # Do not activate the default feature of the selected packages
  --target: string # Test for the given architecture
  --release(-r) # Test optimized artifacts with the release profile
  --profile: string@"nu-complete cargo profiles" # Test with the given profile
  --ignore-rust-version # Ignore `rust-version` specification in packages
  --timings: string # Output information how long each compilation takes
  --target-dir: path # Directory for all generated artifacts and intermediate files
  --verbose(-v) # Use verbose output. May be specified twice for "very verbose" output
  --quiet(-q) # Do not print cargo log messages
  --color: string@"nu-complete cargo color" # Control when colored output is used
  --message-format: string # The output format for diagnostic messages
  --manifest-path: path # Path to the Cargo.toml file
  --frozen # Require Cargo.lock and cache are up to date
  --locked  # Require Cargo.lock is up to date
  --offline # Run without accessing the network
  --help(-h) # Prints help information
  -Z: any # Unstable (nightly-only) flags to Cargo, see 'cargo -Z help' for details
  --jobs(-j): number # Number of parallel jobs to run
  --keep-going # Build as many crates in the dependency graph as possible
  --future-incompat-report # Displays a future-incompat report for any future-incompatible warnings
]

# Execute benchmarks of a package
export extern "cargo bench" [
  bench_option_separator?: string
  ...options: any # Options to be passed to the benchmarks
  --no-run # Compile, but don't run benchmarks
  --no-fail-fast # Run all benchmarks regardless of failure
  --package(-p): string@"nu-complete cargo packages" # Benchmark only the specified packages
  --workspace # Benchmark all members in the workspace
  --exclude: string@"nu-complete cargo packages" # Exclude the specified packages
  --lib # Benchmark the package's library
  --bin: string@"nu-complete cargo bins" # Benchmark only the specified binary
  --bins # Benchmark all binary targets
  --example: string@"nu-complete cargo examples" # Benchmark only the specified example
  --examples # Benchmark all example targets
  --test: string # Benchmark the specified integration test
  --tests # Benchmark all targets in test mode that have the test = true
  --bench: string # Benchmark the specified benchmark
  --benches # Benchmark all targets in benchmark mode that have the bench = true manifest flag set
  --all-targets # Benchmark all targets
  --features(-F): string@"nu-complete cargo features" # Space or comma separated list of features to activate
  --all-features # Activate all available features of all selected packages
  --no-default-features # Do not activate the default feature of the selected packages
  --target: string # Benchmark for the given architecture
  --profile: string@"nu-complete cargo profiles" # Build artifacts with the specified profile
  --ignore-rust-version # Ignore `rust-version` specification in packages
  --timings: string # Output information how long each compilation takes
  --target-dir: path # Directory for all generated artifacts and intermediate files
  --verbose(-v) # Use verbose output. May be specified twice for "very verbose" output
  --quiet(-q) # Do not print cargo log messages
  --color: string@"nu-complete cargo color"  # Control when colored output is used
  --message-format: string # The output format for diagnostic messages
  --build-plan # Outputs a series of JSON messages to stdout that indicate the commands to run the build
  --manifest-path: path  # Path to the Cargo.toml file
  --frozen # Require Cargo.lock and cache are up to date
  --locked # Require Cargo.lock is up to date
  --offline # Run without accessing the network
  -Z: any # Unstable (nightly-only) flags to Cargo, see 'cargo -Z help' for details
  -h, --help # Print help information
  --jobs(-j): number # Number of parallel jobs to run
  --keep-going # Build as many crates in the dependency graph as possible
]

# Update dependencies listed in Cargo.lock
export extern "cargo update" [
  --package(-p): string@"nu-complete cargo packages" # Update only the specified packages
  --aggressive # Dependencies of the specified packages are forced to update as well
  --precise: any # Allows you to specify a specific version number to set the package to
  --workspace(-w) # Attempt to update only packages defined in the workspace
  --dry-run # Displays what would be updated but doesn't write the lockfile
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

# Package and upload a package to the registry
export extern "cargo publish" [
  --dry-run # Perform all checks without uploading
  --token: any # API token to use when authenticating
  --no-verify # Don't verify the contents by building them
  --allow-dirty # Allow working directories with uncommitted VCS changes to be packaged
  --index: string # The URL of the registry index to use
  --registry: string # Name of the registry to publish to
  --package(-p): string@"nu-complete cargo packages" # The package to publish
  --target: string # Publish for the given architecture
  --target-dir: path # Directory for all generated artifacts and intermediate files
  --features(-F): string@"nu-complete cargo features" # Space or comma separated list of features to activate
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
  --jobs(-j): number # Number of parallel jobs to run
  --keep-going # Build as many crates in the dependency graph as possible
]

# Build and install a Rust binary
export extern "cargo install" [
  crate?: string # The crate to install
  --version: string # Specify a version to install
  --vers: string    # Specify a version to install
  --git: string # Git URL to install the specified crate from
  --branch: string # Branch to use when installing from git
  --tag: string # Tag to use when installing from git
  --rev: string # Specific commit to use when installing from git
  --path: path # Filesystem path to local crate to install
  --list # List all installed packages and their versions
  --force(-f) # Force overwriting existing crates or binaries
  --no-track # Don't keep track of this package
  --bin: string@"nu-complete cargo bins" # Install only the specified binary
  --bins # Install all binaries
  --example: string@"nu-complete cargo examples" # Install only the specified example
  --examples # Install all examples
  --root: path # Directory to install packages into
  --registry: string # Name of the registry to use
  --index: string # The URL of the registry index to use
  --features(-F): string@"nu-complete cargo features" # Space or comma separated list of features to activate
  --all-features # Activate all available features of all selected packages
  --no-default-features # Do not activate the default feature of the selected packages
  --target: string # Install for the given architecture
  --target-dir: path # Directory for all generated artifacts and intermediate files
  --debug # Build with the dev profile instead the release profile
  --profile: string@"nu-complete cargo profiles" # Build artifacts with the specified profile
  --timings: string # Output information how long each compilation takes
  --frozen # Require Cargo.lock and cache are up to date
  --locked  # Require Cargo.lock is up to date
  --offline # Run without accessing the network
  --jobs(-j): number # Number of parallel jobs to run
  --verbose(-v) # Use verbose output. May be specified twice for "very verbose" output
  --quiet(-q) # Do not print cargo log messages
  --color: string@"nu-complete cargo color" # Control when colored output is used
  --message-format: string # The output format for diagnostic messages
  -Z: any            # Unstable (nightly-only) flags to Cargo, see 'cargo -Z help' for details
  -h, --help         # Print help information
]

# Remove a Rust binary
export extern "cargo uninstall" [
  package?: string@"nu-complete cargo packages" # Package to uninstall
  --package(-p): string@"nu-complete cargo packages" # Package to uninstall
  --bin: string@"nu-complete cargo bins" # Only uninstall the binary name
  --root: path # Directory to uninstall packages from
  --verbose(-v) # Use verbose output. May be specified twice for "very verbose" output
  --quiet(-q) # Do not print cargo log messages
  --color: string@"nu-complete cargo color" # Control when colored output is used
  -Z: any            # Unstable (nightly-only) flags to Cargo, see 'cargo -Z help' for details
  -h, --help         # Print help information
]

#*> Other Commands <*#

# Output the resolved dependencies of a package in machine-readable format
export extern "cargo metadata"  [
  --no-deps # Output information only about the workspace members and don't fetch dependencies
  --format-version: number # Specify the version of the output format to use. Currently 1 is the only possible value
  --filter-platform: string  # This filters the resolve output to only include dependencies for the iven target triple
  --features(-F): string@"nu-complete cargo features" # Space or comma separated list of features to activate
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

# A bunch of lints to catch common mistakes and improve your Rust code
export extern "cargo clippy" [
  --no-deps      # Run Clippy only on the given crate, without linting the dependencies
  --fix          # Automatically apply lint suggestions. This flag implies `--no-deps
  --version(-V)  # Prints version information
  --help(-h)     # Prints help information
  --warn(-W)     # Set lint warnings
  --allow(-A)    # Set lint allowed
  --deny(-D)     # Set lint denied
  --forbid(-F)   # Set lint forbidden
  --package(-p): string@"nu-complete cargo packages" #Check only the specified packages
  --workspace # Check all members in the workspace
  --all # Alias for --workspace (deprecated)
  --exclude: string@"nu-complete cargo packages" # Exclude the specified packages
  --lib # Check the package's library
  --bin: string@"nu-complete cargo bins" # Check the specified binary
  --example: string@"nu-complete cargo examples" # Check the specified example
  --examples # Check all example targets
  --test: string # Check the specified integration test
  --tests # Check all targets in test mode that have the test = true manifest flag set
  --bench: string # Check the specified benchmark
  --benches # Check all targets in benchmark mode that have the bench = true manifest flag set
  --all-targets # Check all targets
  --features(-F): string@"nu-complete cargo features" # Space or comma separated list of features to activate
  --all-features # Activate all available features
  --no-default-features # Do not activate the `default` feature
  --target: string # Check for the given architecture
  --release(-r) # Check optimized artifacts with the release profile
  --profile: string@"nu-complete cargo profiles" # Check with the given profile
  --ignore-rust-version # Ignore `rust-version` specification in packages
  --timings: string    # Output information how long each compilation takes
  --target-dir: path  # Directory for all generated artifacts and intermediate files
  --verbose(-v)      # Use verbose output. May be specified twice for "very verbose" output
  --quiet(-q)        # Do not print cargo log messages
  --color: string@"nu-complete cargo color"  # Control when colored output is used
  --message-format: string # The output format for diagnostic messages
  --manifest-path: path  # Path to the Cargo.toml file
  --frozen           # Require Cargo.lock and cache are up to date
  --locked           # Require Cargo.lock is up to date
  --offline          # Run without accessing the network
  -Z: any            # Unstable (nightly-only) flags to Cargo, see 'cargo -Z help' for details
  -h, --help         # Print help information
  --jobs(-j): number # Number of parallel jobs to run
  --keep-going # Build as many crates in the dependency graph as possible
  --future-incompat-report # Displays a future-incompat report for any future-incompatible warnings
  -Z: any
]

# Parameters from cargo update
export extern "cargo install-update" [
  --all(-a)             # Update all packages
  --allow-no-update(-i) # Allow for fresh-installing packages
  --downdate(-d)        # Downdate packages to match latest unyanked registry version
  --force(-f)           # Update all packages regardless if they need updating
  --git(-g)             # Also update git packages
  --help(-h)            # Prints help information
  --list(-l)            # Don't update packages, only list and check if they need an update (all packages by default)
  --quiet(-q)           # No output printed to stdout
  --version(-V)         # Prints version information
  --cargo-dir(-c)       # The cargo home directory. Default: $CARGO_HOME or $HOME/.cargo
  --filter(-s)          # Specify a filter a package must match to be considered
  --install-cargo(-r)   # Specify an alternative cargo to run for installations
  --temp-dir(-t)        # The temporary directory. Default: $TEMP/cargo-update
]

# Parameters from cargo add
export extern "cargo add" [
  --no-default-features   # Disable the default features
  --default-features      # Re-enable the default features
  --features(-F)          # Space or comma separated list of features to activate
  --optional              # Mark the dependency as optional
  --verbose(-v)           # Use verbose output (-vv very verbose/build.rs output)
  --no-optional           # Mark the dependency as required
  --color: string@"nu-complete cargo color" # Coloring: auto, always, never
  --rename                # Rename the dependency
  --locked                # Require Cargo.lock is up to date
  --package(-p)           # Package to modify
  --offline               # Run without accessing the network
  --quiet(-q)             # Do not print cargo log messages
  --config                # Override a configuration value
  --dry-run               # Don't actually write the manifest
  --help(-h)              # Print help information
  --path                  # Filesystem path to local crate to add
  --git                   # Git repository location
  --branch                # Git branch to download the crate from
  --tag                   # Git tag to download the crate from
  --rev                   # Git reference to download the crate from
  --registry              # Package registry for this dependency
  --dev                   # Add as development dependency
  --build                 # Add as build dependency
  --target                # Add as dependency to the given target platform
  ...args
]
