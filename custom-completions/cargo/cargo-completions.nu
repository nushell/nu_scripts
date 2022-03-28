## Written by lukexor

def "nu-complete cargo targets" [type: string] {
  cargo metadata --format-version=1 --offline --no-deps | from json | get packages.targets | flatten | where ($type in $it.kind) | get name
}
def "nu-complete cargo bins" [] { nu-complete cargo targets bin }
def "nu-complete cargo examples" [] { nu-complete cargo targets example }

def "nu-complete cargo packages" [] {
  let metadata = (cargo metadata --format-version=1 --offline --no-deps)
  if $metadata == '' {
    []
  } else {
    $metadata | from json | get workspace_members | split column ' ' | get column1
  }
}

def "nu-complete cargo profiles" [] {
  open Cargo.toml | get profile | transpose | get column0
}

def "nu-complete cargo features" [] {
  open Cargo.toml | get features | transpose | get column0
}

extern "cargo run" [
  ...args: any                                      # arguments
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
  --color: string                                   # Coloring: auto, always, never
  --frozen                                          # Require Cargo.lock and cache are up to date
  --locked                                          # Require Cargo.lock is up to date
  --offline                                         # Run without accessing the network
  --config: string                                  # Override a configuration value (unstable)
  -Z: string                                        # Unstable (nightly-only) flags to Cargo, see 'cargo -Z help' for details
  --help(-h)                                        # Prints help information
]
