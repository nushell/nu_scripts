# ------------------ helpers ------------------

const CHANNELS = [stable beta nightly]

# Crates whose docs `rustup doc` finds by topic path
const DOC_CRATES = [std core alloc test]

# A `name` or `name (status, ...)` line from rustup's list commands
const STATUS_LINE = '^(?<value>\S+)(?: \((?<description>[^)]+)\))?$'

# Lines rustup prints for `args`, or none when it fails, so completion never shows its errors
def --wrapped rustup-lines [...args: string]: nothing -> list<string> {
  # A toolchain name typed on the line must never start a download from `<tab>`
  $env.RUSTUP_AUTO_INSTALL = '0'
  let result = ^rustup ...$args | complete
  if $result.exit_code == 0 { $result.stdout | lines } else { [] }
}

# Rows parsed from a rustup list command that prints `name (status)` lines
def --wrapped status-rows [...args: string]: nothing -> table {
  rustup-lines ...$args | parse --regex $STATUS_LINE
}

def installed-toolchains []: nothing -> table {
  status-rows toolchain list | default 'installed' description
}

def installable-toolchains []: nothing -> table {
  installed-toolchains
  | append ($CHANNELS | each {|channel| {value: $channel, description: 'release channel'} })
}

# Completions read from rustup's current state, kept out of nushell's cross-prompt
# completion cache so installs and removals show up on the next `<tab>`
def fresh []: any -> record {
  {completions: $in, options: {cache: false}}
}

# `--toolchain <name>` as typed on the command line being completed
def toolchain-args [tokens: list<string>]: nothing -> list<string> {
  $tokens
  | window 2
  | where {|pair| $pair.0 == '--toolchain' }
  | last 1
  | each {|pair| ['--toolchain' $pair.1] }
  | flatten
}

# Directory `subdir` inside the selected toolchain, or nothing when it doesn't exist
def toolchain-dir [toolchain_args: list<string>, ...subdir: string]: nothing -> any {
  let rustc = rustup-lines which rustc ...$toolchain_args
  if ($rustc | is-empty) { return null }
  let dir = $rustc.0 | path dirname --num-levels 2 | path join ...$subdir
  if ($dir | path exists) { $dir }
}

# Names of the entries under `subdir` of the selected toolchain, without extensions
def toolchain-entries [toolchain_args: list<string>, ...subdir: string]: nothing -> list<string> {
  let dir = toolchain-dir $toolchain_args ...$subdir
  if $dir == null { return [] }
  ls --short-names $dir | get name | path parse | get stem
}

# Doc topics inside one module directory of the rendered docs, each named after `prefix`
def doc-items [dir: string, prefix: string] {
  if not ($dir | path exists) { return [] }
  ls --short-names $dir
  | each {|entry|
    if $entry.type == dir {
      # Modules end in `::` and take no space, so another `<tab>` descends into them
      {value: $'($prefix)($entry.name)::', description: module, append_whitespace: false}
    } else {
      # Item pages are `kind.Name.html`; macros also have a `kind.Name!.html` copy, skipped here
      $entry.name
      | parse --regex '^(?<kind>[a-z]+)\.(?<name>\w+)\.html$'
      | where kind not-in [attr attribute derive]
      | each {|item|
        let suffix = if $item.kind == macro { '!' } else { '' }
        {value: $'($prefix)($item.name)($suffix)', description: $item.kind}
      }
    }
  }
  | flatten
}

# How `words` complete as a command line of their own, with `toolchain` active
def complete-as [toolchain: string, ...words: string] {
  let line = $words | str join ' '
  let token_start = ($line | str length) - ($words | last | str length)
  # Completers for the inner command may call cargo or rustc, which must not auto-install either
  with-env {RUSTUP_TOOLCHAIN: $toolchain, RUSTUP_AUTO_INSTALL: '0'} {
    $line | commandline complete --detailed
  }
  | each {|suggestion|
    # A command name replaces from the command's start; keep only the part under the cursor
    let skip = [($token_start - ($suggestion.span?.start? | default $token_start)) 0] | math max
    $suggestion | reject --optional span match_indices | update value { str substring $skip.. }
  }
}

# The entry after those already typed in a comma-separated flag value
def comma-list [text: string, candidates: list<string>]: nothing -> list<string> {
  let typed = $text | split row ',' | drop
  let prefix = $typed | each { $'($in),' } | str join
  $candidates | where $it not-in $typed | each { $'($prefix)($in)' }
}

# ------------------ nu-complete commands ------------------

def "nu-complete rustup toolchains" [] {
  installed-toolchains | fresh
}

# Installed toolchains plus the release channels, for the commands that install them
def "nu-complete rustup installable" [] {
  installable-toolchains | fresh
}

def "nu-complete rustup default" [] {
  installable-toolchains
  | append {value: none, description: 'unset the default toolchain'}
  | fresh
}

# The `+toolchain` override, offered only once a `+` is typed so `rustup <tab>` lists commands
def "nu-complete rustup plus-toolchain" [token: record] {
  if not ($token.text starts-with '+') { return [] }
  installed-toolchains | update value { $'+($in)' } | fresh
}

def "nu-complete rustup profiles" [] {
  [minimal default complete]
}

def "nu-complete rustup targets" [place: record] {
  status-rows target list ...(toolchain-args $place.command) | fresh
}

def "nu-complete rustup targets add" [place: record] {
  status-rows target list ...(toolchain-args $place.command)
  | append {value: all, description: 'every available target'}
  | fresh
}

def "nu-complete rustup targets installed" [place: record] {
  rustup-lines target list --installed --quiet ...(toolchain-args $place.command) | fresh
}

def "nu-complete rustup components" [place: record] {
  status-rows component list ...(toolchain-args $place.command) | fresh
}

def "nu-complete rustup components installed" [place: record] {
  rustup-lines component list --installed --quiet ...(toolchain-args $place.command) | fresh
}

# Components for `--component`, named without the host suffix as rustup's docs spell them
def "nu-complete rustup component-list" [token: record] {
  let host = rustup-lines show | parse 'Default host: {host}' | get 0?.host?
  let components = rustup-lines component list --quiet
  | each {|name| if $host == null { $name } else { $name | str replace --regex $'-($host)$' '' } }
  comma-list $token.text $components | fresh
}

def "nu-complete rustup target-list" [token: record] {
  comma-list $token.text (rustup-lines target list --quiet) | fresh
}

# Directories with an override, quoted so a path with spaces stays one argument
def "nu-complete rustup overrides" [] {
  rustup-lines override list
  | parse "{path}\t{toolchain}"
  | each {|override|
    {value: ($override.path | to nuon), display_override: $override.path, description: $override.toolchain}
  }
  | fresh
}

def "nu-complete rustup binaries" [place: record] {
  toolchain-entries (toolchain-args $place.command) bin | fresh
}

def "nu-complete rustup man-pages" [place: record] {
  toolchain-entries (toolchain-args $place.command) share man man1 | fresh
}

# The command for `rustup run`, then its arguments as that command completes them
def "nu-complete rustup run-command" [place: record] {
  let args = $place.command | skip 1
  let toolchain_at = $args | enumerate | where not ($it.item starts-with '-') | get 0?.index?
  if $toolchain_at == null { return null }
  let toolchain = $args | get $toolchain_at
  let command = $args | skip ($toolchain_at + 1)
  if ($command | length) == 1 {
    toolchain-entries [--toolchain $toolchain] bin
  } else {
    complete-as $toolchain ...$command
  }
  | fresh
}

# Everything after `rustup +toolchain`, completed as the same command without the override
def "nu-complete rustup after-toolchain" [place: record] {
  let override = $place.command.1
  if not ($override starts-with '+') { return null }
  complete-as ($override | str substring 1..) rustup ...($place.command | skip 2) | fresh
}

# Topics for `rustup doc`, read from the selected toolchain's rendered docs one `::` level at a time
def "nu-complete rustup doc-topics" [token: record, place: record] {
  let html = toolchain-dir (toolchain-args $place.command) share doc rust html
  if $html == null { return [] }
  let module = $token.text | split row '::' | drop
  if ($module | is-empty) {
    # rustup looks up keywords, primitives and macros by bare name in std
    $DOC_CRATES
    | each {|crate| {value: $'($crate)::', description: crate, append_whitespace: false} }
    | append (doc-items ($html | path join std) '' | where description in [keyword primitive macro])
  } else {
    # rustup finds macros only at a crate's root
    doc-items ($html | path join ...$module) ($module | each { $'($in)::' } | str join)
    | where ($module | length) == 1 or $it.description != macro
  }
  | fresh
}

# Subcommands of the rustup command named so far, for `rustup help` and its nested forms
def "nu-complete rustup subcommands" [place: record] {
  let parent = $place.command.0 | str replace --regex ' help$' ''
  let prefix = $place.command | skip 1 | drop | prepend $parent | append '' | str join ' '
  scope commands
  | where name starts-with $prefix
  | each {|command| {value: ($command.name | str replace $prefix ''), description: $command.description} }
  | where value !~ ' '
}

# The flags of a command that takes no positional arguments, so `<tab>` lists them instead of files
def "nu-complete rustup flags" [place: record] {
  # Once a `-` is typed, nushell's own flag completion answers
  if $place.kind != positional { return null }
  let command = scope commands | where name == $place.command.0
  if ($command | is-empty) { return null }
  $command.0.signatures
  | values
  | first
  | where parameter_type in [switch named]
  | append {parameter_name: help, short_flag: h, description: 'Print help'}
  | each {|flag|
    [$'--($flag.parameter_name)' ($flag.short_flag | if $in != null { $'-($in)' })]
    | compact
    | each {|name| {value: $name, description: $flag.description} }
  }
  | flatten
}

# ------------------ export extern commands ------------------

# The Rust toolchain installer
export extern "rustup" [
  toolchain?: string@"nu-complete rustup plus-toolchain" # Release channel (e.g. +stable) or custom toolchain to set override
  ...args: string@"nu-complete rustup after-toolchain"
  --verbose(-v)     # Set log level to 'DEBUG' if 'RUSTUP_LOG' is unset
  --quiet(-q)       # Disable progress output, set log level to 'WARN' if 'RUSTUP_LOG' is unset
  --help(-h)        # Print help
  --version(-V)     # Print version
]

# Print the help of rustup or the given subcommand(s)
export extern "rustup help" [
  ...command: string@"nu-complete rustup subcommands"
]

# Install or update the given toolchains, or by default the active toolchain
export extern "rustup install" [
  ...toolchain: string@"nu-complete rustup installable" # Toolchain name, such as 'stable', 'nightly', or '1.8.0'
  --profile: string@"nu-complete rustup profiles"
  --component(-c): string@"nu-complete rustup component-list" # Comma-separated list of components to be added on installation
  --target(-t): string@"nu-complete rustup target-list" # Comma-separated list of targets to be added on installation
  --no-self-update  # Don't perform self update when running the `rustup toolchain install` command
  --no-update       # Don't try to update the installed toolchain
  --force           # Force an update, even if some components are missing
  --allow-downgrade # Allow rustup to downgrade the toolchain to satisfy your component choice
  --force-non-host  # Install toolchains that require an emulator
  --override        # Set the installed toolchain as the override for the current directory
  --default         # Set the installed toolchain as the default toolchain
  --help(-h)        # Print help
]

# Uninstall the given toolchains
export extern "rustup uninstall" [
  ...toolchain: string@"nu-complete rustup toolchains" # Toolchain name, such as 'stable', 'nightly', '1.8.0', or a custom toolchain name
  --help(-h)        # Print help
]

# Install, uninstall, or list toolchains
export extern "rustup toolchain" [
  --help(-h)        # Print help
]

# Print the help of the given toolchain subcommand(s)
export extern "rustup toolchain help" [
  ...command: string@"nu-complete rustup subcommands"
]

# List installed toolchains
export extern "rustup toolchain list" [
  ...flags: string@"nu-complete rustup flags"
  --verbose(-v)     # Enable verbose output with toolchain information
  --quiet(-q)       # Force the output to be a single column
  --help(-h)        # Print help
]

# Install or update the given toolchains, or by default the active toolchain
export extern "rustup toolchain install" [
  ...toolchain: string@"nu-complete rustup installable" # Toolchain name, such as 'stable', 'nightly', or '1.8.0'
  --profile: string@"nu-complete rustup profiles"
  --component(-c): string@"nu-complete rustup component-list" # Comma-separated list of components to be added on installation
  --target(-t): string@"nu-complete rustup target-list" # Comma-separated list of targets to be added on installation
  --no-self-update  # Don't perform self update when running the `rustup toolchain install` command
  --no-update       # Don't try to update the installed toolchain
  --force           # Force an update, even if some components are missing
  --allow-downgrade # Allow rustup to downgrade the toolchain to satisfy your component choice
  --force-non-host  # Install toolchains that require an emulator
  --override        # Set the installed toolchain as the override for the current directory
  --default         # Set the installed toolchain as the default toolchain
  --help(-h)        # Print help
]

# Uninstall the given toolchains
export extern "rustup toolchain uninstall" [
  ...toolchain: string@"nu-complete rustup toolchains" # Toolchain name, such as 'stable', 'nightly', '1.8.0', or a custom toolchain name
  --help(-h)        # Print help
]

# Create a custom toolchain by symlinking to a directory
export extern "rustup toolchain link" [
  toolchain: string # Custom toolchain name
  path: path        # Path to the directory
  --help(-h)        # Print help
]

# Set the default toolchain
export extern "rustup default" [
  toolchain?: string@"nu-complete rustup default" # 'none', a toolchain name, such as 'stable', 'nightly', '1.8.0', or a custom toolchain name
  --force-non-host  # Install toolchains that require an emulator
  --help(-h)        # Print help
]

# Show the active and installed toolchains or profiles
export extern "rustup show" [
  --verbose(-v)     # Enable verbose output with rustc information for all installed toolchains
  --help(-h)        # Print help
]

# Print the help of the given show subcommand(s)
export extern "rustup show help" [
  ...command: string@"nu-complete rustup subcommands"
]

# Show the active toolchain
export extern "rustup show active-toolchain" [
  ...flags: string@"nu-complete rustup flags"
  --verbose(-v)     # Enable verbose output with rustc information
  --help(-h)        # Print help
]

# Display the computed value of RUSTUP_HOME
export extern "rustup show home" [
  ...flags: string@"nu-complete rustup flags"
  --help(-h)        # Print help
]

# Show the default profile used for the `rustup install` command
export extern "rustup show profile" [
  ...flags: string@"nu-complete rustup flags"
  --help(-h)        # Print help
]

# Update Rust toolchains and rustup
export extern "rustup update" [
  ...toolchain: string@"nu-complete rustup installable" # Toolchain name, such as 'stable', 'nightly', or '1.8.0'
  --no-self-update  # Don't perform self update when running the `rustup update` command
  --force           # Force an update, even if some components are missing
  --force-non-host  # Install toolchains that require an emulator
  --help(-h)        # Print help
]

# Check for updates to Rust toolchains and rustup
export extern "rustup check" [
  ...flags: string@"nu-complete rustup flags"
  --no-self-update  # Don't check for self update when running the `rustup check` command
  --help(-h)        # Print help
]

# Modify a toolchain's supported targets
export extern "rustup target" [
  --help(-h)        # Print help
]

# Print the help of the given target subcommand(s)
export extern "rustup target help" [
  ...command: string@"nu-complete rustup subcommands"
]

# List installed and available targets
export extern "rustup target list" [
  ...flags: string@"nu-complete rustup flags"
  --toolchain: string@"nu-complete rustup toolchains" # Toolchain name, such as 'stable', 'nightly', or '1.8.0'
  --installed       # List only installed targets
  --quiet(-q)       # Force the output to be a single column
  --help(-h)        # Print help
]

# Add a target to a Rust toolchain
export extern "rustup target add" [
  ...target: string@"nu-complete rustup targets add" # Targets to install; "all" installs all available targets
  --toolchain: string@"nu-complete rustup toolchains" # Toolchain name, such as 'stable', 'nightly', or '1.8.0'
  --help(-h)        # Print help
]

# Remove a target from a Rust toolchain
export extern "rustup target remove" [
  ...target: string@"nu-complete rustup targets installed" # Targets to uninstall
  --toolchain: string@"nu-complete rustup toolchains" # Toolchain name, such as 'stable', 'nightly', or '1.8.0'
  --help(-h)        # Print help
]

# Modify a toolchain's installed components
export extern "rustup component" [
  --help(-h)        # Print help
]

# Print the help of the given component subcommand(s)
export extern "rustup component help" [
  ...command: string@"nu-complete rustup subcommands"
]

# List installed and available components
export extern "rustup component list" [
  ...flags: string@"nu-complete rustup flags"
  --toolchain: string@"nu-complete rustup toolchains" # Toolchain name, such as 'stable', 'nightly', or '1.8.0'
  --installed       # List only installed components
  --quiet(-q)       # Force the output to be a single column
  --help(-h)        # Print help
]

# Add a component to a Rust toolchain
export extern "rustup component add" [
  ...component: string@"nu-complete rustup components"
  --toolchain: string@"nu-complete rustup toolchains" # Toolchain name, such as 'stable', 'nightly', or '1.8.0'
  --target: string@"nu-complete rustup targets" # Target to add the component for
  --help(-h)        # Print help
]

# Remove a component from a Rust toolchain
export extern "rustup component remove" [
  ...component: string@"nu-complete rustup components installed"
  --toolchain: string@"nu-complete rustup toolchains" # Toolchain name, such as 'stable', 'nightly', or '1.8.0'
  --target: string@"nu-complete rustup targets installed" # Target to remove the component for
  --help(-h)        # Print help
]

# Modify toolchain overrides for directories
export extern "rustup override" [
  --help(-h)        # Print help
]

# Print the help of the given override subcommand(s)
export extern "rustup override help" [
  ...command: string@"nu-complete rustup subcommands"
]

# List directory toolchain overrides
export extern "rustup override list" [
  ...flags: string@"nu-complete rustup flags"
  --help(-h)        # Print help
]

# Set the override toolchain for a directory
export extern "rustup override set" [
  toolchain: string@"nu-complete rustup toolchains" # Toolchain name, such as 'stable', 'nightly', '1.8.0', or a custom toolchain name
  --path: path      # Path to the directory
  --help(-h)        # Print help
]

# Remove the override toolchain for a directory
export extern "rustup override unset" [
  ...flags: string@"nu-complete rustup flags"
  --path: string@"nu-complete rustup overrides" # Path to the directory
  --nonexistent     # Remove override toolchain for all nonexistent directories
  --help(-h)        # Print help
]

# Run a command with an environment configured for a given toolchain
export extern "rustup run" [
  toolchain: string@"nu-complete rustup toolchains" # Toolchain name, such as 'stable', 'nightly', '1.8.0', or a custom toolchain name, or an absolute path
  ...command: string@"nu-complete rustup run-command" # Command to run and its arguments
  --install         # Install the requested toolchain if needed
]

# Display which binary will be run for a given command
export extern "rustup which" [
  command: string@"nu-complete rustup binaries"
  --toolchain: string@"nu-complete rustup toolchains" # Toolchain name, such as 'stable', 'nightly', '1.8.0', or a custom toolchain name
  --help(-h)        # Print help
]

# Open the documentation for the current toolchain
export extern "rustup doc" [
  topic?: string@"nu-complete rustup doc-topics" # Topic such as 'core', 'fn', 'usize', 'eprintln!', 'core::arch', 'std::fs', 'std::io::Bytes'
  --path            # Only print the path to the documentation
  --serve           # Serve the documentation over a local HTTP server instead of opening it directly as a `file://` URL
  --toolchain: string@"nu-complete rustup toolchains" # Toolchain name, such as 'stable', 'nightly', or '1.8.0'
  --alloc           # The Rust core allocation and collections library
  --book            # The Rust Programming Language book
  --cargo           # The Cargo Book
  --clippy          # The Clippy Documentation
  --core            # The Rust Core Library
  --edition-guide   # The Rust Edition Guide
  --embedded-book   # The Embedded Rust Book
  --error-codes     # The Rust Error Codes Index
  --nomicon         # The Dark Arts of Advanced and Unsafe Rust Programming
  --proc_macro      # A support library for macro authors when defining new macros
  --reference       # The Rust Reference
  --releases        # Rust Release Notes
  --rust-by-example # A collection of runnable examples that illustrate various Rust concepts and standard libraries
  --rustc           # The compiler for the Rust programming language
  --rustc-docs      # The API documentation for the Rust compiler and other toolchain components
  --rustdoc         # Documentation generator for Rust projects
  --std             # Standard library API documentation
  --style-guide     # The Rust Style Guide
  --test            # Support code for rustc's built in unit-test and micro-benchmarking framework
  --unstable-book   # The Unstable Book
  --help(-h)        # Print help
]

# View the man page for a given command
export extern "rustup man" [
  command: string@"nu-complete rustup man-pages"
  --toolchain: string@"nu-complete rustup toolchains" # Toolchain name, such as 'stable', 'nightly', or '1.8.0'
  --help(-h)        # Print help
]

# Modify the rustup installation
export extern "rustup self" [
  --help(-h)        # Print help
]

# Print the help of the given self subcommand(s)
export extern "rustup self help" [
  ...command: string@"nu-complete rustup subcommands"
]

# Download and install updates to rustup
export extern "rustup self update" [
  ...flags: string@"nu-complete rustup flags"
  --help(-h)        # Print help
]

# Uninstall rustup
export extern "rustup self uninstall" [
  ...flags: string@"nu-complete rustup flags"
  --yes(-y)         # Disable confirmation prompt
  --no-modify-path  # Do not clean up the `PATH` environment variable
  --help(-h)        # Print help
]

# Upgrade the internal data format
export extern "rustup self upgrade-data" [
  ...flags: string@"nu-complete rustup flags"
  --help(-h)        # Print help
]

# Alter rustup settings
export extern "rustup set" [
  --help(-h)        # Print help
]

# Print the help of the given set subcommand(s)
export extern "rustup set help" [
  ...command: string@"nu-complete rustup subcommands"
]

# The tuple used to identify toolchains when not specified
export extern "rustup set default-host" [
  host_tuple: string@"nu-complete rustup targets"
  --help(-h)        # Print help
]

# The default components installed with a toolchain
export extern "rustup set profile" [
  profile_name?: string@"nu-complete rustup profiles"
  --help(-h)        # Print help
]

# The rustup auto self update mode
export extern "rustup set auto-self-update" [
  auto_self_update_mode?: string@[enable disable check-only]
  --help(-h)        # Print help
]

# The auto toolchain install mode
export extern "rustup set auto-install" [
  auto_install_mode?: string@[enable disable]
  --help(-h)        # Print help
]

# Generate tab-completion scripts for your shell
export extern "rustup completions" [
  shell: string@[bash elvish fish powershell zsh]
  command?: string@[rustup cargo]
  --help(-h)        # Print help
]

# ------------------ subcommand aliases rustup accepts ------------------

export alias "rustup add" = rustup install
export alias "rustup up" = rustup update
export alias "rustup upgrade" = rustup update
export alias "rustup remove" = rustup uninstall
export alias "rustup rm" = rustup uninstall
export alias "rustup delete" = rustup uninstall
export alias "rustup del" = rustup uninstall
export alias "rustup docs" = rustup doc
export alias "rustup toolchain add" = rustup toolchain install
export alias "rustup toolchain update" = rustup toolchain install
export alias "rustup toolchain up" = rustup toolchain install
export alias "rustup toolchain remove" = rustup toolchain uninstall
export alias "rustup toolchain rm" = rustup toolchain uninstall
export alias "rustup toolchain delete" = rustup toolchain uninstall
export alias "rustup toolchain del" = rustup toolchain uninstall
export alias "rustup target install" = rustup target add
export alias "rustup target uninstall" = rustup target remove
export alias "rustup target rm" = rustup target remove
export alias "rustup target delete" = rustup target remove
export alias "rustup target del" = rustup target remove
export alias "rustup component uninstall" = rustup component remove
export alias "rustup component rm" = rustup component remove
export alias "rustup component delete" = rustup component remove
export alias "rustup component del" = rustup component remove
export alias "rustup override add" = rustup override set
export alias "rustup override remove" = rustup override unset
export alias "rustup override rm" = rustup override unset
export alias "rustup override delete" = rustup override unset
export alias "rustup override del" = rustup override unset
export alias "rustup self up" = rustup self update
