# Run `rustc --explain CODE`
extern "cargo" [
	--explain					# Run `rustc --explain CODE`
	--color					# Coloring: auto, always, never
	--config					# Override a configuration value (unstable)
	--version(-V)					# Print version info and exit
	--list					# List installed commands
	--verbose(-v)					# Use verbose output (-vv very verbose/build.rs output)
	--quiet(-q)					# No output printed to stdout
	--frozen					# Require Cargo.lock and cache are up to date
	--locked					# Require Cargo.lock is up to date
	--offline					# Run without accessing the network
	--help(-h)					# Prints help information
	...args
]

# Execute all benchmarks of a local package
extern "cargo bench" [
	--bin					# Benchmark only the specified binary
	--example					# Benchmark only the specified example
	--test					# Benchmark only the specified test target
	--bench					# Benchmark only the specified bench target
	--package(-p)					# Package to run benchmarks for
	--exclude					# Exclude packages from the benchmark
	--jobs(-j)					# Number of parallel jobs, defaults to # of CPUs
	--features					# Space or comma separated list of features to activate
	--target					# Build for the target triple
	--target-dir					# Directory for all generated artifacts
	--manifest-path					# Path to Cargo.toml
	--message-format					# Error format
	--color					# Coloring: auto, always, never
	--config					# Override a configuration value (unstable)
	--quiet(-q)					# No output printed to stdout
	--lib					# Benchmark only this packages library
	--bins					# Benchmark all binaries
	--examples					# Benchmark all examples
	--tests					# Benchmark all tests
	--benches					# Benchmark all benches
	--all-targets					# Benchmark all targets
	--no-run					# Compile, but dont run benchmarks
	--all					# Alias for --workspace (deprecated)
	--workspace					# Benchmark all packages in the workspace
	--all-features					# Activate all available features
	--no-default-features					# Do not activate the `default` feature
	--ignore-rust-version					# Ignore `rust-version` specification in packages (unstable)
	--no-fail-fast					# Run all benchmarks regardless of failure
	--unit-graph					# Output build graph in JSON (unstable)
	--help(-h)					# Prints help information
	--version(-V)					# Prints version information
	--verbose(-v)					# Use verbose output (-vv very verbose/build.rs output)
	--frozen					# Require Cargo.lock and cache are up to date
	--locked					# Require Cargo.lock is up to date
	--offline					# Run without accessing the network
	...args
]

# Compile a local package and all of its dependencies
extern "cargo build" [
	--package(-p)					# Package to build (see `cargo help pkgid`)
	--exclude					# Exclude packages from the build
	--jobs(-j)					# Number of parallel jobs, defaults to # of CPUs
	--bin					# Build only the specified binary
	--example					# Build only the specified example
	--test					# Build only the specified test target
	--bench					# Build only the specified bench target
	--profile					# Build artifacts with the specified profile
	--features					# Space or comma separated list of features to activate
	--target					# Build for the target triple
	--target-dir					# Directory for all generated artifacts
	--out-dir					# Copy final artifacts to this directory (unstable)
	--manifest-path					# Path to Cargo.toml
	--message-format					# Error format
	--color					# Coloring: auto, always, never
	--config					# Override a configuration value (unstable)
	--quiet(-q)					# No output printed to stdout
	--all					# Alias for --workspace (deprecated)
	--workspace					# Build all packages in the workspace
	--lib					# Build only this packages library
	--bins					# Build all binaries
	--examples					# Build all examples
	--tests					# Build all tests
	--benches					# Build all benches
	--all-targets					# Build all targets
	--release					# Build artifacts in release mode, with optimizations
	--all-features					# Activate all available features
	--no-default-features					# Do not activate the `default` feature
	--ignore-rust-version					# Ignore `rust-version` specification in packages (unstable)
	--build-plan					# Output the build plan in JSON (unstable)
	--unit-graph					# Output build graph in JSON (unstable)
	--future-incompat-report					# Ouputs a future incompatibility report at the end of the build (unstable)
	--help(-h)					# Prints help information
	--version(-V)					# Prints version information
	--verbose(-v)					# Use verbose output (-vv very verbose/build.rs output)
	--frozen					# Require Cargo.lock and cache are up to date
	--locked					# Require Cargo.lock is up to date
	--offline					# Run without accessing the network
	...args
]

# Check a local package and all of its dependencies for errors
extern "cargo check" [
	--package(-p)					# Package(s) to check
	--exclude					# Exclude packages from the check
	--jobs(-j)					# Number of parallel jobs, defaults to # of CPUs
	--bin					# Check only the specified binary
	--example					# Check only the specified example
	--test					# Check only the specified test target
	--bench					# Check only the specified bench target
	--profile					# Check artifacts with the specified profile
	--features					# Space or comma separated list of features to activate
	--target					# Check for the target triple
	--target-dir					# Directory for all generated artifacts
	--manifest-path					# Path to Cargo.toml
	--message-format					# Error format
	--color					# Coloring: auto, always, never
	--config					# Override a configuration value (unstable)
	--quiet(-q)					# No output printed to stdout
	--all					# Alias for --workspace (deprecated)
	--workspace					# Check all packages in the workspace
	--lib					# Check only this packages library
	--bins					# Check all binaries
	--examples					# Check all examples
	--tests					# Check all tests
	--benches					# Check all benches
	--all-targets					# Check all targets
	--release					# Check artifacts in release mode, with optimizations
	--all-features					# Activate all available features
	--no-default-features					# Do not activate the `default` feature
	--ignore-rust-version					# Ignore `rust-version` specification in packages (unstable)
	--unit-graph					# Output build graph in JSON (unstable)
	--future-incompat-report					# Ouputs a future incompatibility report at the end of the build (unstable)
	--help(-h)					# Prints help information
	--version(-V)					# Prints version information
	--verbose(-v)					# Use verbose output (-vv very verbose/build.rs output)
	--frozen					# Require Cargo.lock and cache are up to date
	--locked					# Require Cargo.lock is up to date
	--offline					# Run without accessing the network
	--color					# Coloring: auto, always, never
	--config					# Override a configuration value (unstable)
	--help(-h)					# Prints help information
	--version(-V)					# Prints version information
	--verbose(-v)					# Use verbose output (-vv very verbose/build.rs output)
	--frozen					# Require Cargo.lock and cache are up to date
	--locked					# Require Cargo.lock is up to date
	--offline					# Run without accessing the network
	...args
]

# Remove artifacts that cargo has generated in the past
extern "cargo clean" [
	--package(-p)					# Package to clean artifacts for
	--manifest-path					# Path to Cargo.toml
	--target					# Target triple to clean output for
	--target-dir					# Directory for all generated artifacts
	--profile					# Clean artifacts of the specified profile
	--color					# Coloring: auto, always, never
	--config					# Override a configuration value (unstable)
	--quiet(-q)					# No output printed to stdout
	--release					# Whether or not to clean release artifacts
	--doc					# Whether or not to clean just the documentation directory
	--help(-h)					# Prints help information
	--version(-V)					# Prints version information
	--verbose(-v)					# Use verbose output (-vv very verbose/build.rs output)
	--frozen					# Require Cargo.lock and cache are up to date
	--locked					# Require Cargo.lock is up to date
	--offline					# Run without accessing the network
	...args
]

# Reports any crates which will eventually stop compiling
extern "cargo describe-future-incompatibilities" [
	--id					# identifier of the report [generated by a Cargo command invocation
	--color					# Coloring: auto, always, never
	--config					# Override a configuration value (unstable)
	--help(-h)					# Prints help information
	--version(-V)					# Prints version information
	--verbose(-v)					# Use verbose output (-vv very verbose/build.rs output)
	--frozen					# Require Cargo.lock and cache are up to date
	--locked					# Require Cargo.lock is up to date
	--offline					# Run without accessing the network
	...args
]

# Build a packages documentation
extern "cargo doc" [
	--package(-p)					# Package to document
	--exclude					# Exclude packages from the build
	--jobs(-j)					# Number of parallel jobs, defaults to # of CPUs
	--bin					# Document only the specified binary
	--profile					# Build artifacts with the specified profile
	--features					# Space or comma separated list of features to activate
	--target					# Build for the target triple
	--target-dir					# Directory for all generated artifacts
	--manifest-path					# Path to Cargo.toml
	--message-format					# Error format
	--color					# Coloring: auto, always, never
	--config					# Override a configuration value (unstable)
	--quiet(-q)					# No output printed to stdout
	--open					# Opens the docs in a browser after the operation
	--all					# Alias for --workspace (deprecated)
	--workspace					# Document all packages in the workspace
	--no-deps					# Dont build documentation for dependencies
	--document-private-items					# Document private items
	--lib					# Document only this packages library
	--bins					# Document all binaries
	--release					# Build artifacts in release mode, with optimizations
	--all-features					# Activate all available features
	--no-default-features					# Do not activate the `default` feature
	--ignore-rust-version					# Ignore `rust-version` specification in packages (unstable)
	--unit-graph					# Output build graph in JSON (unstable)
	--help(-h)					# Prints help information
	--version(-V)					# Prints version information
	--verbose(-v)					# Use verbose output (-vv very verbose/build.rs output)
	--frozen					# Require Cargo.lock and cache are up to date
	--locked					# Require Cargo.lock is up to date
	--offline					# Run without accessing the network
	--package(-p)					# Package to document
	--jobs(-j)					# Number of parallel jobs, defaults to # of CPUs
	--bin					# Build only the specified binary
	--example					# Build only the specified example
	--test					# Build only the specified test target
	--bench					# Build only the specified bench target
	--profile					# Build artifacts with the specified profile
	--features					# Space or comma separated list of features to activate
	--target					# Build for the target triple
	--target-dir					# Directory for all generated artifacts
	--manifest-path					# Path to Cargo.toml
	--message-format					# Error format
	--color					# Coloring: auto, always, never
	--config					# Override a configuration value (unstable)
	--quiet(-q)					# No output printed to stdout
	--open					# Opens the docs in a browser after the operation
	--lib					# Build only this packages library
	--bins					# Build all binaries
	--examples					# Build all examples
	--tests					# Build all tests
	--benches					# Build all benches
	--all-targets					# Build all targets
	--release					# Build artifacts in release mode, with optimizations
	--all-features					# Activate all available features
	--no-default-features					# Do not activate the `default` feature
	--unit-graph					# Output build graph in JSON (unstable)
	--ignore-rust-version					# Ignore `rust-version` specification in packages (unstable)
	--help(-h)					# Prints help information
	--version(-V)					# Prints version information
	--verbose(-v)					# Use verbose output (-vv very verbose/build.rs output)
	--frozen					# Require Cargo.lock and cache are up to date
	--locked					# Require Cargo.lock is up to date
	--offline					# Run without accessing the network
	...args
]

# Fetch dependencies of a package from the network
extern "cargo fetch" [
	--manifest-path					# Path to Cargo.toml
	--target					# Fetch dependencies for the target triple
	--color					# Coloring: auto, always, never
	--config					# Override a configuration value (unstable)
	--quiet(-q)					# No output printed to stdout
	--help(-h)					# Prints help information
	--version(-V)					# Prints version information
	--verbose(-v)					# Use verbose output (-vv very verbose/build.rs output)
	--frozen					# Require Cargo.lock and cache are up to date
	--locked					# Require Cargo.lock is up to date
	--offline					# Run without accessing the network
	...args
]

# Automatically fix lint warnings reported by rustc
extern "cargo fix" [
	--package(-p)					# Package(s) to fix
	--exclude					# Exclude packages from the fixes
	--jobs(-j)					# Number of parallel jobs, defaults to # of CPUs
	--bin					# Fix only the specified binary
	--example					# Fix only the specified example
	--test					# Fix only the specified test target
	--bench					# Fix only the specified bench target
	--profile					# Build artifacts with the specified profile
	--features					# Space or comma separated list of features to activate
	--target					# Fix for the target triple
	--target-dir					# Directory for all generated artifacts
	--manifest-path					# Path to Cargo.toml
	--message-format					# Error format
	--color					# Coloring: auto, always, never
	--config					# Override a configuration value (unstable)
	--quiet(-q)					# No output printed to stdout
	--all					# Alias for --workspace (deprecated)
	--workspace					# Fix all packages in the workspace
	--lib					# Fix only this packages library
	--bins					# Fix all binaries
	--examples					# Fix all examples
	--tests					# Fix all tests
	--benches					# Fix all benches
	--all-targets					# Fix all targets (default)
	--release					# Fix artifacts in release mode, with optimizations
	--all-features					# Activate all available features
	--no-default-features					# Do not activate the `default` feature
	--broken-code					# Fix code even if it already has compiler errors
	--edition					# Fix in preparation for the next edition
	--edition-idioms					# Fix warnings to migrate to the idioms of an edition
	--allow-no-vcs					# Fix code even if a VCS was not detected
	--allow-dirty					# Fix code even if the working directory is dirty
	--allow-staged					# Fix code even if the working directory has staged changes
	--ignore-rust-version					# Ignore `rust-version` specification in packages (unstable)
	--help(-h)					# Prints help information
	--version(-V)					# Prints version information
	--verbose(-v)					# Use verbose output (-vv very verbose/build.rs output)
	--frozen					# Require Cargo.lock and cache are up to date
	--locked					# Require Cargo.lock is up to date
	--offline					# Run without accessing the network
	...args
]

# Generate the lockfile for a package
extern "cargo generate-lockfile" [
	--manifest-path					# Path to Cargo.toml
	--color					# Coloring: auto, always, never
	--config					# Override a configuration value (unstable)
	--quiet(-q)					# No output printed to stdout
	--help(-h)					# Prints help information
	--version(-V)					# Prints version information
	--verbose(-v)					# Use verbose output (-vv very verbose/build.rs output)
	--frozen					# Require Cargo.lock and cache are up to date
	--locked					# Require Cargo.lock is up to date
	--offline					# Run without accessing the network
	...args
]

# This subcommand has been removed
extern "cargo git-checkout" [
	--color					# Coloring: auto, always, never
	--config					# Override a configuration value (unstable)
	--help(-h)					# Prints help information
	--version(-V)					# Prints version information
	--verbose(-v)					# Use verbose output (-vv very verbose/build.rs output)
	--frozen					# Require Cargo.lock and cache are up to date
	--locked					# Require Cargo.lock is up to date
	--offline					# Run without accessing the network
	...args
]

# Create a new cargo package in an existing directory
extern "cargo init" [
	--registry					# Registry to use
	--name					# Set the resulting package name, defaults to the directory name
	--color					# Coloring: auto, always, never
	--config					# Override a configuration value (unstable)
	--quiet(-q)					# No output printed to stdout
	--bin					# Use a binary (application) template [default]
	--lib					# Use a library template
	--help(-h)					# Prints help information
	--version(-V)					# Prints version information
	--verbose(-v)					# Use verbose output (-vv very verbose/build.rs output)
	--frozen					# Require Cargo.lock and cache are up to date
	--locked					# Require Cargo.lock is up to date
	--offline					# Run without accessing the network
	...args
]

# Install a Rust binary. Default location is $HOME/.cargo/bin
extern "cargo install" [
	--version					# Specify a version to install
	--git					# Git URL to install the specified crate from
	--branch					# Branch to use when installing from git
	--tag					# Tag to use when installing from git
	--rev					# Specific commit to use when installing from git
	--path					# Filesystem path to local crate to install
	--jobs(-j)					# Number of parallel jobs, defaults to # of CPUs
	--features					# Space or comma separated list of features to activate
	--profile					# Install artifacts with the specified profile
	--bin					# Install only the specified binary
	--example					# Install only the specified example
	--target					# Build for the target triple
	--target-dir					# Directory for all generated artifacts
	--root					# Directory to install packages into
	--index					# Registry index to install from
	--registry					# Registry to use
	--color					# Coloring: auto, always, never
	--config					# Override a configuration value (unstable)
	--quiet(-q)					# No output printed to stdout
	--list					# list all installed packages and their versions
	--force(-f)					# Force overwriting existing crates or binaries
	--no-track					# Do not save tracking information
	--all-features					# Activate all available features
	--no-default-features					# Do not activate the `default` feature
	--debug					# Build in debug mode instead of release mode
	--bins					# Install all binaries
	--examples					# Install all examples
	--help(-h)					# Prints help information
	--verbose(-v)					# Use verbose output (-vv very verbose/build.rs output)
	--frozen					# Require Cargo.lock and cache are up to date
	--locked					# Require Cargo.lock is up to date
	--offline					# Run without accessing the network
	--package(-p)					# Package to uninstall
	--bin					# Only uninstall the binary NAME
	--root					# Directory to uninstall packages from
	--color					# Coloring: auto, always, never
	--config					# Override a configuration value (unstable)
	--quiet(-q)					# No output printed to stdout
	--help(-h)					# Prints help information
	--version(-V)					# Prints version information
	--verbose(-v)					# Use verbose output (-vv very verbose/build.rs output)
	--frozen					# Require Cargo.lock and cache are up to date
	--locked					# Require Cargo.lock is up to date
	--offline					# Run without accessing the network
	...args
]

# Print a JSON representation of a Cargo.toml files location
extern "cargo locate-project" [
	--manifest-path					# Path to Cargo.toml
	--message-format					# Output representation [possible values: json, plain]
	--color					# Coloring: auto, always, never
	--config					# Override a configuration value (unstable)
	--quiet(-q)					# No output printed to stdout
	--workspace					# Locate Cargo.toml of the workspace root
	--help(-h)					# Prints help information
	--version(-V)					# Prints version information
	--verbose(-v)					# Use verbose output (-vv very verbose/build.rs output)
	--frozen					# Require Cargo.lock and cache are up to date
	--locked					# Require Cargo.lock is up to date
	--offline					# Run without accessing the network
	...args
]

# Save an api token from the registry locally. If token is not specified, it will be read from stdin.
extern "cargo login" [
	--host					# Host to set the token for
	--registry					# Registry to use
	--color					# Coloring: auto, always, never
	--config					# Override a configuration value (unstable)
	--quiet(-q)					# No output printed to stdout
	--help(-h)					# Prints help information
	--version(-V)					# Prints version information
	--verbose(-v)					# Use verbose output (-vv very verbose/build.rs output)
	--frozen					# Require Cargo.lock and cache are up to date
	--locked					# Require Cargo.lock is up to date
	--offline					# Run without accessing the network
	...args
]

# Remove an API token from the registry locally
extern "cargo logout" [
	--registry					# Registry to use
	--color					# Coloring: auto, always, never
	--config					# Override a configuration value (unstable)
	--quiet(-q)					# No output printed to stdout
	--help(-h)					# Prints help information
	--version(-V)					# Prints version information
	--verbose(-v)					# Use verbose output (-vv very verbose/build.rs output)
	--frozen					# Require Cargo.lock and cache are up to date
	--locked					# Require Cargo.lock is up to date
	--offline					# Run without accessing the network
	...args
]

# Output the resolved dependencies of a package, the concrete used versions including overrides, in machine-readable format
extern "cargo metadata" [
	--features					# Space or comma separated list of features to activate
	--filter-platform					# Only include resolve dependencies matching the given target-triple
	--manifest-path					# Path to Cargo.toml
	--color					# Coloring: auto, always, never
	--config					# Override a configuration value (unstable)
	--quiet(-q)					# Do not print cargo log messages
	--all-features					# Activate all available features
	--no-default-features					# Do not activate the `default` feature
	--no-deps					# Output information only about the workspace members and dont fetch dependencies
	--help(-h)					# Prints help information
	--version(-V)					# Prints version information
	--verbose(-v)					# Use verbose output (-vv very verbose/build.rs output)
	--frozen					# Require Cargo.lock and cache are up to date
	--locked					# Require Cargo.lock is up to date
	--offline					# Run without accessing the network
	...args
]

# Create a new cargo package at <path>
extern "cargo new" [
	--registry					# Registry to use
	--name					# Set the resulting package name, defaults to the directory name
	--color					# Coloring: auto, always, never
	--config					# Override a configuration value (unstable)
	--quiet(-q)					# No output printed to stdout
	--bin					# Use a binary (application) template [default]
	--lib					# Use a library template
	--help(-h)					# Prints help information
	--version(-V)					# Prints version information
	--verbose(-v)					# Use verbose output (-vv very verbose/build.rs output)
	--frozen					# Require Cargo.lock and cache are up to date
	--locked					# Require Cargo.lock is up to date
	--offline					# Run without accessing the network
	...args
]

# Manage the owners of a crate on the registry
extern "cargo owner" [
	--add(-a)					# Name of a user or team to invite as an owner
	--remove(-r)					# Name of a user or team to remove as an owner
	--index					# Registry index to modify owners for
	--token					# API token to use when authenticating
	--registry					# Registry to use
	--color					# Coloring: auto, always, never
	--config					# Override a configuration value (unstable)
	--quiet(-q)					# No output printed to stdout
	--list(-l)					# List owners of a crate
	--help(-h)					# Prints help information
	--version(-V)					# Prints version information
	--verbose(-v)					# Use verbose output (-vv very verbose/build.rs output)
	--frozen					# Require Cargo.lock and cache are up to date
	--locked					# Require Cargo.lock is up to date
	--offline					# Run without accessing the network
	...args
]

# Assemble the local package into a distributable tarball
extern "cargo package" [
	--target					# Build for the target triple
	--target-dir					# Directory for all generated artifacts
	--features					# Space or comma separated list of features to activate
	--manifest-path					# Path to Cargo.toml
	--jobs(-j)					# Number of parallel jobs, defaults to # of CPUs
	--color					# Coloring: auto, always, never
	--config					# Override a configuration value (unstable)
	--quiet(-q)					# No output printed to stdout
	--list(-l)					# Print files included in a package without making one
	--no-verify					# Dont verify the contents by building them
	--no-metadata					# Ignore warnings about a lack of human-usable metadata
	--allow-dirty					# Allow dirty working directories to be packaged
	--all-features					# Activate all available features
	--no-default-features					# Do not activate the `default` feature
	--help(-h)					# Prints help information
	--version(-V)					# Prints version information
	--verbose(-v)					# Use verbose output (-vv very verbose/build.rs output)
	--frozen					# Require Cargo.lock and cache are up to date
	--locked					# Require Cargo.lock is up to date
	--offline					# Run without accessing the network
	...args
]

# Print a fully qualified package specification
extern "cargo pkgid" [
	--package(-p)					# Argument to get the package ID specifier for
	--manifest-path					# Path to Cargo.toml
	--color					# Coloring: auto, always, never
	--config					# Override a configuration value (unstable)
	--quiet(-q)					# No output printed to stdout
	--help(-h)					# Prints help information
	--version(-V)					# Prints version information
	--verbose(-v)					# Use verbose output (-vv very verbose/build.rs output)
	--frozen					# Require Cargo.lock and cache are up to date
	--locked					# Require Cargo.lock is up to date
	--offline					# Run without accessing the network
	...args
]

# Upload a package to the registry
extern "cargo publish" [
	--index					# Registry index URL to upload the package to
	--host					# DEPRECATED, renamed to --index
	--token					# Token to use when uploading
	--target					# Build for the target triple
	--target-dir					# Directory for all generated artifacts
	--manifest-path					# Path to Cargo.toml
	--features					# Space or comma separated list of features to activate
	--jobs(-j)					# Number of parallel jobs, defaults to # of CPUs
	--registry					# Registry to publish to
	--color					# Coloring: auto, always, never
	--config					# Override a configuration value (unstable)
	--quiet(-q)					# No output printed to stdout
	--no-verify					# Dont verify the contents by building them
	--allow-dirty					# Allow dirty working directories to be packaged
	--all-features					# Activate all available features
	--no-default-features					# Do not activate the `default` feature
	--dry-run					# Perform all checks without uploading
	--help(-h)					# Prints help information
	--version(-V)					# Prints version information
	--verbose(-v)					# Use verbose output (-vv very verbose/build.rs output)
	--frozen					# Require Cargo.lock and cache are up to date
	--locked					# Require Cargo.lock is up to date
	--offline					# Run without accessing the network
	...args
]

# Print a JSON representation of a Cargo.toml manifest.
extern "cargo read-manifest" [
	--manifest-path					# Path to Cargo.toml
	--color					# Coloring: auto, always, never
	--config					# Override a configuration value (unstable)
	--quiet(-q)					# No output printed to stdout
	--help(-h)					# Prints help information
	--version(-V)					# Prints version information
	--verbose(-v)					# Use verbose output (-vv very verbose/build.rs output)
	--frozen					# Require Cargo.lock and cache are up to date
	--locked					# Require Cargo.lock is up to date
	--offline					# Run without accessing the network
	...args
]

# Run a binary or example of the local package
extern "cargo run" [
	--bin					# Name of the bin target to run
	--example					# Name of the example target to run
	--package(-p)					# Package with the target to run
	--jobs(-j)					# Number of parallel jobs, defaults to # of CPUs
	--profile					# Build artifacts with the specified profile
	--features					# Space or comma separated list of features to activate
	--target					# Build for the target triple
	--target-dir					# Directory for all generated artifacts
	--manifest-path					# Path to Cargo.toml
	--message-format					# Error format
	--color					# Coloring: auto, always, never
	--config					# Override a configuration value (unstable)
	--quiet(-q)					# No output printed to stdout
	--release					# Build artifacts in release mode, with optimizations
	--all-features					# Activate all available features
	--no-default-features					# Do not activate the `default` feature
	--unit-graph					# Output build graph in JSON (unstable)
	--ignore-rust-version					# Ignore `rust-version` specification in packages (unstable)
	--help(-h)					# Prints help information
	--version(-V)					# Prints version information
	--verbose(-v)					# Use verbose output (-vv very verbose/build.rs output)
	--frozen					# Require Cargo.lock and cache are up to date
	--locked					# Require Cargo.lock is up to date
	--offline					# Run without accessing the network
	...args
]

# Compile a package, and pass extra options to the compiler
extern "cargo rustc" [
	--package(-p)					# Package to build
	--jobs(-j)					# Number of parallel jobs, defaults to # of CPUs
	--bin					# Build only the specified binary
	--example					# Build only the specified example
	--test					# Build only the specified test target
	--bench					# Build only the specified bench target
	--profile					# Build artifacts with the specified profile
	--features					# Space or comma separated list of features to activate
	--target					# Target triple which compiles will be for
	--print					# Output compiler information without compiling
	--target-dir					# Directory for all generated artifacts
	--manifest-path					# Path to Cargo.toml
	--message-format					# Error format
	--color					# Coloring: auto, always, never
	--config					# Override a configuration value (unstable)
	--quiet(-q)					# No output printed to stdout
	--lib					# Build only this packages library
	--bins					# Build all binaries
	--examples					# Build all examples
	--tests					# Build all tests
	--benches					# Build all benches
	--all-targets					# Build all targets
	--release					# Build artifacts in release mode, with optimizations
	--all-features					# Activate all available features
	--no-default-features					# Do not activate the `default` feature
	--unit-graph					# Output build graph in JSON (unstable)
	--ignore-rust-version					# Ignore `rust-version` specification in packages (unstable)
	--future-incompat-report					# Ouputs a future incompatibility report at the end of the build (unstable)
	--help(-h)					# Prints help information
	--version(-V)					# Prints version information
	--verbose(-v)					# Use verbose output (-vv very verbose/build.rs output)
	--frozen					# Require Cargo.lock and cache are up to date
	--locked					# Require Cargo.lock is up to date
	--offline					# Run without accessing the network
	...args
]

# Build a packages documentation, using specified custom flags.
extern "cargo rustdoc" [
	--package(-p)					# Package to document
	--jobs(-j)					# Number of parallel jobs, defaults to # of CPUs
	--bin					# Build only the specified binary
	--example					# Build only the specified example
	--test					# Build only the specified test target
	--bench					# Build only the specified bench target
	--profile					# Build artifacts with the specified profile
	--features					# Space or comma separated list of features to activate
	--target					# Build for the target triple
	--target-dir					# Directory for all generated artifacts
	--manifest-path					# Path to Cargo.toml
	--message-format					# Error format
	--color					# Coloring: auto, always, never
	--config					# Override a configuration value (unstable)
	--quiet(-q)					# No output printed to stdout
	--open					# Opens the docs in a browser after the operation
	--lib					# Build only this packages library
	--bins					# Build all binaries
	--examples					# Build all examples
	--tests					# Build all tests
	--benches					# Build all benches
	--all-targets					# Build all targets
	--release					# Build artifacts in release mode, with optimizations
	--all-features					# Activate all available features
	--no-default-features					# Do not activate the `default` feature
	--unit-graph					# Output build graph in JSON (unstable)
	--ignore-rust-version					# Ignore `rust-version` specification in packages (unstable)
	--help(-h)					# Prints help information
	--version(-V)					# Prints version information
	--verbose(-v)					# Use verbose output (-vv very verbose/build.rs output)
	--frozen					# Require Cargo.lock and cache are up to date
	--locked					# Require Cargo.lock is up to date
	--offline					# Run without accessing the network
	...args
]

# Search packages in crates.io
extern "cargo search" [
	--index					# Registry index URL to upload the package to
	--host					# DEPRECATED, renamed to --index
	--limit					# Limit the number of results (default: 10, max: 100)
	--registry					# Registry to use
	--color					# Coloring: auto, always, never
	--config					# Override a configuration value (unstable)
	--quiet(-q)					# No output printed to stdout
	--help(-h)					# Prints help information
	--version(-V)					# Prints version information
	--verbose(-v)					# Use verbose output (-vv very verbose/build.rs output)
	--frozen					# Require Cargo.lock and cache are up to date
	--locked					# Require Cargo.lock is up to date
	--offline					# Run without accessing the network
	...args
]

# Execute all unit and integration tests and build examples of a local package
extern "cargo test" [
	--bin					# Test only the specified binary
	--example					# Test only the specified example
	--test					# Test only the specified test target
	--bench					# Test only the specified bench target
	--package(-p)					# Package to run tests for
	--exclude					# Exclude packages from the test
	--jobs(-j)					# Number of parallel jobs, defaults to # of CPUs
	--profile					# Build artifacts with the specified profile
	--features					# Space or comma separated list of features to activate
	--target					# Build for the target triple
	--target-dir					# Directory for all generated artifacts
	--manifest-path					# Path to Cargo.toml
	--message-format					# Error format
	--color					# Coloring: auto, always, never
	--config					# Override a configuration value (unstable)
	--quiet(-q)					# Display one character per test instead of one line
	--lib					# Test only this packages library unit tests
	--bins					# Test all binaries
	--examples					# Test all examples
	--tests					# Test all tests
	--benches					# Test all benches
	--all-targets					# Test all targets
	--doc					# Test only this librarys documentation
	--no-run					# Compile, but dont run tests
	--no-fail-fast					# Run all tests regardless of failure
	--all					# Alias for --workspace (deprecated)
	--workspace					# Test all packages in the workspace
	--release					# Build artifacts in release mode, with optimizations
	--all-features					# Activate all available features
	--no-default-features					# Do not activate the `default` feature
	--ignore-rust-version					# Ignore `rust-version` specification in packages (unstable)
	--unit-graph					# Output build graph in JSON (unstable)
	--future-incompat-report					# Ouputs a future incompatibility report at the end of the build (unstable)
	--help(-h)					# Prints help information
	--version(-V)					# Prints version information
	--verbose(-v)					# Use verbose output (-vv very verbose/build.rs output)
	--frozen					# Require Cargo.lock and cache are up to date
	--locked					# Require Cargo.lock is up to date
	--offline					# Run without accessing the network
	...args
]

# Display a tree visualization of a dependency graph
extern "cargo tree" [
	--manifest-path					# Path to Cargo.toml
	--package(-p)					# Package to be used as the root of the tree
	--exclude					# Exclude specific workspace members
	--features					# Space or comma separated list of features to activate
	--target					# Filter dependencies matching the given target-triple (default host platform). Pass `all` to include all targets.
	--edges(-e)					# The kinds of dependencies to display (features, normal, build, dev, all, no-dev, no-build, no-normal)
	--invert(-i)					# Invert the tree direction and focus on the given package
	--format(-f)					# Format string used for printing dependencies
	--color					# Coloring: auto, always, never
	--config					# Override a configuration value (unstable)
	--quiet(-q)					# Suppress status messages
	--workspace					# Display the tree for all packages in the workspace
	--all(-a)
	--all-targets
	--all-features					# Activate all available features
	--no-default-features					# Do not activate the `default` feature
	--no-dev-dependencies
	--no-indent
	--prefix-depth
	--no-dedupe					# Do not de-duplicate (repeats all shared dependencies)
	--duplicates(-d)					# Show only dependencies which come in multiple versions (implies -i)
	--version(-V)
	--help(-h)					# Prints help information
	--verbose(-v)					# Use verbose output (-vv very verbose/build.rs output)
	--frozen					# Require Cargo.lock and cache are up to date
	--locked					# Require Cargo.lock is up to date
	--offline					# Run without accessing the network
	...args
]

# Remove a Rust binary
extern "cargo uninstall" [
	--package(-p)					# Package to uninstall
	--bin					# Only uninstall the binary NAME
	--root					# Directory to uninstall packages from
	--color					# Coloring: auto, always, never
	--config					# Override a configuration value (unstable)
	--quiet(-q)					# No output printed to stdout
	--help(-h)					# Prints help information
	--version(-V)					# Prints version information
	--verbose(-v)					# Use verbose output (-vv very verbose/build.rs output)
	--frozen					# Require Cargo.lock and cache are up to date
	--locked					# Require Cargo.lock is up to date
	--offline					# Run without accessing the network
	...args
]

# Update dependencies as recorded in the local lock file
extern "cargo update" [
	--package(-p)					# Package to update
	--precise					# Update a single dependency to exactly PRECISE when used with -p
	--manifest-path					# Path to Cargo.toml
	--color					# Coloring: auto, always, never
	--config					# Override a configuration value (unstable)
	--quiet(-q)					# No output printed to stdout
	--workspace(-w)					# Only update the workspace packages
	--aggressive					# Force updating all dependencies of SPEC as well when used with -p
	--dry-run					# Dont actually write the lockfile
	--help(-h)					# Prints help information
	--version(-V)					# Prints version information
	--verbose(-v)					# Use verbose output (-vv very verbose/build.rs output)
	--frozen					# Require Cargo.lock and cache are up to date
	--locked					# Require Cargo.lock is up to date
	--offline					# Run without accessing the network
	...args
]

# Vendor all dependencies for a project locally
extern "cargo vendor" [
	--manifest-path					# Path to Cargo.toml
	--sync(-s)					# Additional `Cargo.toml` to sync and vendor
	--color					# Coloring: auto, always, never
	--config					# Override a configuration value (unstable)
	--quiet(-q)					# No output printed to stdout
	--no-delete					# Dont delete older crates in the vendor directory
	--respect-source-config					# Respect `[source]` config in `.cargo/config`
	--versioned-dirs					# Always include version in subdir name
	--no-merge-sources
	--relative-path
	--only-git-deps
	--disallow-duplicates
	--help(-h)					# Prints help information
	--version(-V)					# Prints version information
	--verbose(-v)					# Use verbose output (-vv very verbose/build.rs output)
	--frozen					# Require Cargo.lock and cache are up to date
	--locked					# Require Cargo.lock is up to date
	--offline					# Run without accessing the network
	...args
]

# Check correctness of crate manifest
extern "cargo verify-project" [
	--manifest-path					# Path to Cargo.toml
	--color					# Coloring: auto, always, never
	--config					# Override a configuration value (unstable)
	--quiet(-q)					# No output printed to stdout
	--help(-h)					# Prints help information
	--version(-V)					# Prints version information
	--verbose(-v)					# Use verbose output (-vv very verbose/build.rs output)
	--frozen					# Require Cargo.lock and cache are up to date
	--locked					# Require Cargo.lock is up to date
	--offline					# Run without accessing the network
	...args
]

# Show version information
extern "cargo version" [
	--color					# Coloring: auto, always, never
	--config					# Override a configuration value (unstable)
	--quiet(-q)					# No output printed to stdout
	--help(-h)					# Prints help information
	--version(-V)					# Prints version information
	--verbose(-v)					# Use verbose output (-vv very verbose/build.rs output)
	--frozen					# Require Cargo.lock and cache are up to date
	--locked					# Require Cargo.lock is up to date
	--offline					# Run without accessing the network
	...args
]

# Remove a pushed crate from the index
extern "cargo yank" [
	--vers					# The version to yank or un-yank
	--index					# Registry index to yank from
	--token					# API token to use when authenticating
	--registry					# Registry to use
	--color					# Coloring: auto, always, never
	--config					# Override a configuration value (unstable)
	--quiet(-q)					# No output printed to stdout
	--undo					# Undo a yank, putting a version back into the index
	--help(-h)					# Prints help information
	--version(-V)					# Prints version information
	--verbose(-v)					# Use verbose output (-vv very verbose/build.rs output)
	--frozen					# Require Cargo.lock and cache are up to date
	--locked					# Require Cargo.lock is up to date
	--offline					# Run without accessing the network
	...args
]

# Prints this message or the help of the given subcommand(s)
extern "cargo help" [
	--color					# Coloring: auto, always, never
	--config					# Override a configuration value (unstable)
	--help(-h)					# Prints help information
	--version(-V)					# Prints version information
	--verbose(-v)					# Use verbose output (-vv very verbose/build.rs output)
	--frozen					# Require Cargo.lock and cache are up to date
	--locked					# Require Cargo.lock is up to date
	--offline					# Run without accessing the network
	...args
]