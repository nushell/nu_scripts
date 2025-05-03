# nu-version: 0.102.0

# This script was created by dumping the output of `uv generate-shell-completion` and adding more completers.

module completions {
  const PYPRJ = 'pyproject.toml'

  # Split a string to list of args, taking quotes into account.
  # Code is copied and modified from https://github.com/nushell/nushell/issues/14582#issuecomment-2542596272
  def args-split []: string -> list<string> {
    # Define our states
    const STATE_NORMAL = 0
    const STATE_IN_SINGLE_QUOTE = 1
    const STATE_IN_DOUBLE_QUOTE = 2
    const STATE_ESCAPE = 3
    const WHITESPACES = [" " "\t" "\n" "\r"]

    # Initialize variables
    mut state = $STATE_NORMAL
    mut current_token = ""
    mut result: list<string> = []
    mut prev_state = $STATE_NORMAL

    # Process each character
    for char in ($in | split chars) {
      if $state == $STATE_ESCAPE {
        # Handle escaped character
        $current_token = $current_token + $char
        $state = $prev_state
      } else if $char == '\' {
        # Enter escape state
        $prev_state = $state
        $state = $STATE_ESCAPE
      } else if $state == $STATE_NORMAL {
        if $char == "'" {
          $state = $STATE_IN_SINGLE_QUOTE
        } else if $char == '"' {
          $state = $STATE_IN_DOUBLE_QUOTE
        } else if ($char in $WHITESPACES) {
          # Whitespace in normal state means token boundary
          $result = $result | append $current_token
          $current_token = ""
        } else {
          $current_token = $current_token + $char
        }
      } else if $state == $STATE_IN_SINGLE_QUOTE {
        if $char == "'" {
          $state = $STATE_NORMAL
        } else {
          $current_token = $current_token + $char
        }
      } else if $state == $STATE_IN_DOUBLE_QUOTE {
        if $char == '"' {
          $state = $STATE_NORMAL
        } else {
          $current_token = $current_token + $char
        }
      }
    }
    # Handle the last token
    $result = $result | append $current_token
    # Return the result
    $result
  }

  def "nu-complete uv python_preference" [] {
    [ "only-managed" "managed" "system" "only-system" ]
  }

  def "nu-complete uv python_fetch" [] {
    [ "automatic" "manual" "never" ]
  }

  def "nu-complete uv color" [] {
    [ "auto" "always" "never" ]
  }

  def find-pyproject-file [] {
    mut folder = $env.PWD
    loop {
      let $try_path = $folder | path join $PYPRJ
      if ($try_path | path exists) {
        return $try_path
      }
      if (($folder | path parse).parent | is-empty) {
        # Already at root
        return null
      }
      $folder = $folder | path dirname
    }
  }

  def get-groups []: nothing -> list<string> {
    let file = (find-pyproject-file)
    try { open $file | get -i dependency-groups | columns } catch { [] }
  }

  # Groups completer for subcommands
  def "nu-complete uv groups" [] {
    get-groups
  }

  # Groups completer for "uv add".
  # When there is no groups, we suggest a common name "dev".
  def "nu-complete uv groups for add" [] {
    get-groups | default ['dev']
  }

  # From a list of packages and their version strings, get only package names.
  # Ref: https://packaging.python.org/en/latest/specifications/dependency-specifiers/#dependency-specifiers
  def parse-package-names []: list<string> -> list<string> {
    $in | split column  -n 2 -r '[\s\[@>=<;~!]' p v | get p
  }

  # Get packages from "project.dependencies"
  def get-main-packages [] {
    let file = (find-pyproject-file)
    try { open $file | get -i project.dependencies | parse-package-names } catch { [] }
  }

  # Get packages from "project.optional-dependencies"
  def get-optional-packages [] {
    let file = (find-pyproject-file)
    try { open $file | get -i project.optional-dependencies | parse-package-names } catch { [] }
  }

  # Get packages from "dependency-groups".
  # Ref: https://packaging.python.org/en/latest/specifications/dependency-groups/#dependency-groups
  def get-dependency-group-packages [only_group?: string] {
    let file = (find-pyproject-file)
    let dg = try { open $file | get -i dependency-groups } catch { [] }
    # One group can include other groups, like:
    # dev = ['click', { include-group = "docs" }, { include-group = "linting" }, { include-group = "test" }]
    let handle_line = {|p| if (($p | describe) == 'string') { $p } else { $dg | get ($p.include-group) } }
    if ($only_group | is-not-empty) {
      $dg | get $only_group | each $handle_line | flatten | parse-package-names
    } else {
      $dg | items { |gn, pk| $pk | each $handle_line | flatten } | flatten | parse-package-names
    }
  }

  def get-all-dependencies [] {
    get-main-packages | append (get-optional-packages) | append (get-dependency-group-packages)
  }

  export def "nu-complete uv packages" [context: string, position?:int] {
    let preceding = $context | str substring ..$position
    let prev_tokens = $preceding | str trim | args-split
    # Check if "--group" is specified
    let go = $prev_tokens | enumerate | find '--group' | get -i index.0
    let group = if ($go | is-not-empty) { $prev_tokens | get -i ($go + 1)}
    if ($group | is-empty ) {
      get-all-dependencies
    } else {
      get-dependency-group-packages $group
    }
  }

  # An extremely fast Python package manager.
  export extern uv [
    --no-cache(-n)                                                 # Avoid reading from or writing to the cache, instead using a temporary directory for the duration of the operation
    --cache-dir: string                                            # Path to the cache directory
    --python-preference: string@"nu-complete uv python_preference" # Whether to prefer uv-managed or system Python installations
    --allow-python-downloads                                       # Allow automatically downloading Python when required. [env: "UV_PYTHON_DOWNLOADS=auto"]
    --no-python-downloads                                          # Disable automatic downloads of Python. [env: "UV_PYTHON_DOWNLOADS=never"]
    --quiet(-q)                                                    # Do not print any output
    --verbose(-v)                                                  # Use verbose output
    --no-color                                                     # Disable colors
    --color: string@"nu-complete uv color"                         # Control colors in output
    --native-tls                                                   # Whether to load TLS certificates from the platform's native certificate store
    --no-native-tls
    --offline                                                      # Disable network access
    --no-offline
    --allow-insecure-host: string                                  # Allow insecure connections to a host
    --preview                                                      # Whether to enable experimental, preview features
    --no-preview
    --isolated                                                     # Avoid discovering a `pyproject.toml` or `uv.toml` file
    --show-settings                                                # Show the resolved settings for the current command
    --no-progress                                                  # Hide all progress outputs
    --no-installer-metadata                                        # Skip writing `uv` installer metadata files (e.g., `INSTALLER`, `REQUESTED`, and `direct_url.json`) to site-packages `.dist-info` directories
    --directory: string                                            # Change to the given directory prior to running the command
    --project: string                                              # Run the command within the given project directory
    --config-file: string                                          # The path to a `uv.toml` file to use for configuration
    --no-config                                                    # Avoid discovering configuration files (`pyproject.toml`, `uv.toml`)
    --help(-h)                                                     # Display the concise help for this command
    --version(-V)                                                  # Display the uv version
  ]

  def "nu-complete uv index_strategy" [] {
    [ "first-index" "unsafe-first-match" "unsafe-best-match" ]
  }

  def "nu-complete uv keyring_provider" [] {
    [ "disabled" "subprocess" ]
  }

  def "nu-complete uv resolution" [] {
    [ "highest" "lowest" "lowest-direct" ]
  }

  def "nu-complete uv prerelease" [] {
    [ "disallow" "allow" "if-necessary" "explicit" "if-necessary-or-explicit" ]
  }

  def "nu-complete uv fork_strategy" [] {
    [ "fewest" "requires-python" ]
  }

  def "nu-complete uv link_mode" [] {
    [ "clone" "copy" "hardlink" "symlink" ]
  }


  # Run a command or script
  export extern "uv run" [
    --extra: string                                                    # Include optional dependencies from the specified extra name
    --all-extras                                                       # Include all optional dependencies
    --no-extra: string                                                 # Exclude the specified optional dependencies, if `--all-extras` is supplied
    --no-all-extras
    --dev                                                              # Include the development dependency group
    --no-dev                                                           # Omit the development dependency group
    --group: string@"nu-complete uv groups"                            # Include dependencies from the specified dependency group
    --no-group: string@"nu-complete uv groups"                         # Exclude dependencies from the specified dependency group
    --only-group: string@"nu-complete uv groups"                       # Only include dependencies from the specified dependency group
    --all-groups                                                       # Include dependencies from all dependency groups
    --module(-m)                                                       # Run a Python module
    --only-dev                                                         # Only include the development dependency group
    --no-editable                                                      # Install any editable dependencies, including the project and any workspace members, as non-editable
    --env-file: string                                                 # Load environment variables from a `.env` file
    --no-env-file                                                      # Avoid reading environment variables from a `.env` file
    --with: string                                                     # Run with the given packages installed
    --with-editable: string                                            # Run with the given packages installed as editables
    --with-requirements: string                                        # Run with all packages listed in the given `requirements.txt` files
    --isolated                                                         # Run the command in an isolated virtual environment
    --no-sync                                                          # Avoid syncing the virtual environment
    --locked                                                           # Assert that the `uv.lock` will remain unchanged
    --frozen                                                           # Run without updating the `uv.lock` file
    --script(-s)                                                       # Run the given path as a Python script
    --gui-script                                                       # Run the given path as a Python GUI script
    --index: string                                                    # The URLs to use when resolving dependencies, in addition to the default index
    --default-index: string                                            # The URL of the default package index (by default: <https://pypi.org/simple>)
    --find-links(-f): string                                           # Locations to search for candidate distributions, in addition to those found in the registry indexes
    --no-index                                                         # Ignore the registry index (e.g., PyPI), instead relying on direct URL dependencies and those provided via `--find-links`
    --upgrade(-U)                                                      # Allow package upgrades, ignoring pinned versions in any existing output file. Implies `--refresh`
    --no-upgrade
    --upgrade-package(-P): string                                      # Allow upgrades for a specific package, ignoring pinned versions in any existing output file. Implies `--refresh-package`
    --reinstall                                                        # Reinstall all packages, regardless of whether they're already installed. Implies `--refresh`
    --no-reinstall
    --reinstall-package: string                                        # Reinstall a specific package, regardless of whether it's already installed. Implies `--refresh-package`
    --index-strategy: string@"nu-complete uv index_strategy"           # The strategy to use when resolving against multiple index URLs
    --keyring-provider: string@"nu-complete uv keyring_provider"       # Attempt to use `keyring` for authentication for index URLs
    --resolution: string@"nu-complete uv resolution"                   # The strategy to use when selecting between the different compatible versions for a given package requirement
    --prerelease: string@"nu-complete uv prerelease"                   # The strategy to use when considering pre-release versions
    --fork-strategy: string@"nu-complete uv fork_strategy"             # The strategy to use when selecting multiple versions of a given package across Python versions and platforms
    --config-setting(-C): string                                       # Settings to pass to the PEP 517 build backend, specified as `KEY=VALUE` pairs
    --no-build-isolation                                               # Disable isolation when building source distributions
    --no-build-isolation-package: string                               # Disable isolation when building source distributions for a specific package
    --build-isolation
    --exclude-newer: string                                            # Limit candidate packages to those that were uploaded prior to the given date
    --link-mode: string@"nu-complete uv link_mode"                     # The method to use when installing packages from the global cache
    --compile-bytecode                                                 # Compile Python files to bytecode after installation
    --no-compile-bytecode
    --no-sources                                                       # Ignore the `tool.uv.sources` table when resolving dependencies. Used to lock against the standards-compliant, publishable package metadata, as opposed to using any local or Git sources
    --no-build                                                         # Don't build source distributions
    --build
    --no-build-package: string                                         # Don't build source distributions for a specific package
    --no-binary                                                        # Don't install pre-built wheels
    --binary
    --no-binary-package: string                                        # Don't install pre-built wheels for a specific package
    --refresh                                                          # Refresh all cached data
    --no-refresh
    --refresh-package: string                                          # Refresh cached data for a specific package
    --all-packages                                                     # Run the command with all workspace members installed
    --package: string                                                  # Run the command in a specific package in the workspace
    --no-project                                                       # Avoid discovering the project or workspace
    --python(-p): string                                               # The Python interpreter to use for the run environment.
    --show-resolution                                                  # Whether to show resolver and installer output from any environment modifications
    --no-cache(-n)                                                     # Avoid reading from or writing to the cache, instead using a temporary directory for the duration of the operation
    --cache-dir: string                                                # Path to the cache directory
    --python-preference: string@"nu-complete uv python_preference"     # Whether to prefer uv-managed or system Python installations
    --allow-python-downloads                                           # Allow automatically downloading Python when required. [env: "UV_PYTHON_DOWNLOADS=auto"]
    --no-python-downloads                                              # Disable automatic downloads of Python. [env: "UV_PYTHON_DOWNLOADS=never"]
    --quiet(-q)                                                        # Do not print any output
    --verbose(-v)                                                      # Use verbose output
    --no-color                                                         # Disable colors
    --color: string@"nu-complete uv color"                             # Control colors in output
    --native-tls                                                       # Whether to load TLS certificates from the platform's native certificate store
    --no-native-tls
    --offline                                                          # Disable network access
    --no-offline
    --allow-insecure-host: string                                      # Allow insecure connections to a host
    --preview                                                          # Whether to enable experimental, preview features
    --no-preview
    --show-settings                                                    # Show the resolved settings for the current command
    --no-progress                                                      # Hide all progress outputs
    --no-installer-metadata                                            # Skip writing `uv` installer metadata files (e.g., `INSTALLER`, `REQUESTED`, and `direct_url.json`) to site-packages `.dist-info` directories
    --directory: string                                                # Change to the given directory prior to running the command
    --project: string                                                  # Run the command within the given project directory
    --config-file: string                                              # The path to a `uv.toml` file to use for configuration
    --no-config                                                        # Avoid discovering configuration files (`pyproject.toml`, `uv.toml`)
    --help(-h)                                                         # Display the concise help for this command
    --version(-V)                                                      # Display the uv version
  ]

  def "nu-complete uv init vcs" [] {
    [ "git" "none" ]
  }

  def "nu-complete uv init build_backend" [] {
    [ "uv" "hatch" "flit" "pdm" "setuptools" "maturin" "scikit" ]
  }

  def "nu-complete uv init author_from" [] {
    [ "auto" "git" "none" ]
  }


  # Create a new project
  export extern "uv init" [
    path?: string             # The path to use for the project/script
    --name: string                                                      # The name of the project
    --virtual                                                           # Create a virtual project, rather than a package
    --package                                                           # Set up the project to be built as a Python package
    --no-package                                                        # Do not set up the project to be built as a Python package
    --app                                                               # Create a project for an application
    --lib                                                               # Create a project for a library
    --script                                                            # Create a script
    --vcs: string@"nu-complete uv init vcs"                             # Initialize a version control system for the project
    --build-backend: string@"nu-complete uv init build_backend"         # Initialize a build-backend of choice for the project
    --no-readme                                                         # Do not create a `README.md` file
    --author-from: string@"nu-complete uv init author_from"             # Fill in the `authors` field in the `pyproject.toml`
    --no-pin-python                                                     # Do not create a `.python-version` file for the project
    --no-workspace                                                      # Avoid discovering a workspace and create a standalone project
    --python(-p): string                                                # The Python interpreter to use to determine the minimum supported Python version.
    --no-cache(-n)                                                      # Avoid reading from or writing to the cache, instead using a temporary directory for the duration of the operation
    --cache-dir: string                                                 # Path to the cache directory
    --python-preference: string@"nu-complete uv python_preference"      # Whether to prefer uv-managed or system Python installations
    --allow-python-downloads                                            # Allow automatically downloading Python when required. [env: "UV_PYTHON_DOWNLOADS=auto"]
    --no-python-downloads                                               # Disable automatic downloads of Python. [env: "UV_PYTHON_DOWNLOADS=never"]
    --quiet(-q)                                                         # Do not print any output
    --verbose(-v)                                                       # Use verbose output
    --no-color                                                          # Disable colors
    --color: string@"nu-complete uv color"                              # Control colors in output
    --native-tls                                                        # Whether to load TLS certificates from the platform's native certificate store
    --no-native-tls
    --offline                                                           # Disable network access
    --no-offline
    --allow-insecure-host: string                                       # Allow insecure connections to a host
    --preview                                                           # Whether to enable experimental, preview features
    --no-preview
    --isolated                                                          # Avoid discovering a `pyproject.toml` or `uv.toml` file
    --show-settings                                                     # Show the resolved settings for the current command
    --no-progress                                                       # Hide all progress outputs
    --no-installer-metadata                                             # Skip writing `uv` installer metadata files (e.g., `INSTALLER`, `REQUESTED`, and `direct_url.json`) to site-packages `.dist-info` directories
    --directory: string                                                 # Change to the given directory prior to running the command
    --project: string                                                   # Run the command within the given project directory
    --config-file: string                                               # The path to a `uv.toml` file to use for configuration
    --no-config                                                         # Avoid discovering configuration files (`pyproject.toml`, `uv.toml`)
    --help(-h)                                                          # Display the concise help for this command
    --version(-V)                                                       # Display the uv version
  ]


  # Add dependencies to the project
  export extern "uv add" [
    ...packages: string       # The packages to add, as PEP 508 requirements (e.g., `ruff==0.5.0`)
    --requirements(-r): string                                         # Add all packages listed in the given `requirements.txt` files
    --dev                                                              # Add the requirements to the development dependency group
    --optional: string                                                 # Add the requirements to the package's optional dependencies for the specified extra
    --group: string@"nu-complete uv groups"                            # Add the requirements to the specified dependency group
    --editable                                                         # Add the requirements as editable
    --no-editable
    --raw-sources                                                      # Add source requirements to `project.dependencies`, rather than `tool.uv.sources`
    --rev: string                                                      # Commit to use when adding a dependency from Git
    --tag: string                                                      # Tag to use when adding a dependency from Git
    --branch: string                                                   # Branch to use when adding a dependency from Git
    --extra: string                                                    # Extras to enable for the dependency
    --no-sync                                                          # Avoid syncing the virtual environment
    --locked                                                           # Assert that the `uv.lock` will remain unchanged
    --frozen                                                           # Add dependencies without re-locking the project
    --index: string                                                    # The URLs to use when resolving dependencies, in addition to the default index
    --default-index: string                                            # The URL of the default package index (by default: <https://pypi.org/simple>)
    --find-links(-f): string                                           # Locations to search for candidate distributions, in addition to those found in the registry indexes
    --no-index                                                         # Ignore the registry index (e.g., PyPI), instead relying on direct URL dependencies and those provided via `--find-links`
    --upgrade(-U)                                                      # Allow package upgrades, ignoring pinned versions in any existing output file. Implies `--refresh`
    --no-upgrade
    --upgrade-package(-P): string                                      # Allow upgrades for a specific package, ignoring pinned versions in any existing output file. Implies `--refresh-package`
    --reinstall                                                        # Reinstall all packages, regardless of whether they're already installed. Implies `--refresh`
    --no-reinstall
    --reinstall-package: string                                        # Reinstall a specific package, regardless of whether it's already installed. Implies `--refresh-package`
    --index-strategy: string@"nu-complete uv index_strategy"           # The strategy to use when resolving against multiple index URLs
    --keyring-provider: string@"nu-complete uv keyring_provider"       # Attempt to use `keyring` for authentication for index URLs
    --resolution: string@"nu-complete uv resolution"                   # The strategy to use when selecting between the different compatible versions for a given package requirement
    --prerelease: string@"nu-complete uv prerelease"                   # The strategy to use when considering pre-release versions
    --fork-strategy: string@"nu-complete uv fork_strategy"             # The strategy to use when selecting multiple versions of a given package across Python versions and platforms
    --config-setting(-C): string                                       # Settings to pass to the PEP 517 build backend, specified as `KEY=VALUE` pairs
    --no-build-isolation                                               # Disable isolation when building source distributions
    --no-build-isolation-package: string                               # Disable isolation when building source distributions for a specific package
    --build-isolation
    --exclude-newer: string                                            # Limit candidate packages to those that were uploaded prior to the given date
    --link-mode: string@"nu-complete uv link_mode"                     # The method to use when installing packages from the global cache
    --compile-bytecode                                                 # Compile Python files to bytecode after installation
    --no-compile-bytecode
    --no-sources                                                       # Ignore the `tool.uv.sources` table when resolving dependencies. Used to lock against the standards-compliant, publishable package metadata, as opposed to using any local or Git sources
    --no-build                                                         # Don't build source distributions
    --build
    --no-build-package: string                                         # Don't build source distributions for a specific package
    --no-binary                                                        # Don't install pre-built wheels
    --binary
    --no-binary-package: string                                        # Don't install pre-built wheels for a specific package
    --refresh                                                          # Refresh all cached data
    --no-refresh
    --refresh-package: string                                          # Refresh cached data for a specific package
    --package: string                                                  # Add the dependency to a specific package in the workspace
    --script: string                                                   # Add the dependency to the specified Python script, rather than to a project
    --python(-p): string                                               # The Python interpreter to use for resolving and syncing.
    --no-cache(-n)                                                     # Avoid reading from or writing to the cache, instead using a temporary directory for the duration of the operation
    --cache-dir: string                                                # Path to the cache directory
    --python-preference: string@"nu-complete uv python_preference"     # Whether to prefer uv-managed or system Python installations
    --allow-python-downloads                                           # Allow automatically downloading Python when required. [env: "UV_PYTHON_DOWNLOADS=auto"]
    --no-python-downloads                                              # Disable automatic downloads of Python. [env: "UV_PYTHON_DOWNLOADS=never"]
    --quiet(-q)                                                        # Do not print any output
    --verbose(-v)                                                      # Use verbose output
    --no-color                                                         # Disable colors
    --color: string@"nu-complete uv color"                             # Control colors in output
    --native-tls                                                       # Whether to load TLS certificates from the platform's native certificate store
    --no-native-tls
    --offline                                                          # Disable network access
    --no-offline
    --allow-insecure-host: string                                      # Allow insecure connections to a host
    --preview                                                          # Whether to enable experimental, preview features
    --no-preview
    --isolated                                                         # Avoid discovering a `pyproject.toml` or `uv.toml` file
    --show-settings                                                    # Show the resolved settings for the current command
    --no-progress                                                      # Hide all progress outputs
    --no-installer-metadata                                            # Skip writing `uv` installer metadata files (e.g., `INSTALLER`, `REQUESTED`, and `direct_url.json`) to site-packages `.dist-info` directories
    --directory: string                                                # Change to the given directory prior to running the command
    --project: string                                                  # Run the command within the given project directory
    --config-file: string                                              # The path to a `uv.toml` file to use for configuration
    --no-config                                                        # Avoid discovering configuration files (`pyproject.toml`, `uv.toml`)
    --help(-h)                                                         # Display the concise help for this command
    --version(-V)                                                      # Display the uv version
  ]


  # Remove dependencies from the project
  export extern "uv remove" [
    --dev                                                                 # Remove the packages from the development dependency group
    --optional: string                                                    # Remove the packages from the project's optional dependencies for the specified extra
    --group: string@"nu-complete uv groups"                               # Remove the packages from the specified dependency group
    --no-sync                                                             # Avoid syncing the virtual environment after re-locking the project
    --locked                                                              # Assert that the `uv.lock` will remain unchanged
    --frozen                                                              # Remove dependencies without re-locking the project
    --index: string                                                       # The URLs to use when resolving dependencies, in addition to the default index
    --default-index: string                                               # The URL of the default package index (by default: <https://pypi.org/simple>)
    --find-links(-f): string                                              # Locations to search for candidate distributions, in addition to those found in the registry indexes
    --no-index                                                            # Ignore the registry index (e.g., PyPI), instead relying on direct URL dependencies and those provided via `--find-links`
    --upgrade(-U)                                                         # Allow package upgrades, ignoring pinned versions in any existing output file. Implies `--refresh`
    --no-upgrade
    --upgrade-package(-P): string                                         # Allow upgrades for a specific package, ignoring pinned versions in any existing output file. Implies `--refresh-package`
    --reinstall                                                           # Reinstall all packages, regardless of whether they're already installed. Implies `--refresh`
    --no-reinstall
    --reinstall-package: string                                           # Reinstall a specific package, regardless of whether it's already installed. Implies `--refresh-package`
    --index-strategy: string@"nu-complete uv index_strategy"              # The strategy to use when resolving against multiple index URLs
    --keyring-provider: string@"nu-complete uv keyring_provider"          # Attempt to use `keyring` for authentication for index URLs
    --resolution: string@"nu-complete uv resolution"                      # The strategy to use when selecting between the different compatible versions for a given package requirement
    --prerelease: string@"nu-complete uv prerelease"                      # The strategy to use when considering pre-release versions
    --fork-strategy: string@"nu-complete uv fork_strategy"                # The strategy to use when selecting multiple versions of a given package across Python versions and platforms
    --config-setting(-C): string                                          # Settings to pass to the PEP 517 build backend, specified as `KEY=VALUE` pairs
    --no-build-isolation                                                  # Disable isolation when building source distributions
    --no-build-isolation-package: string                                  # Disable isolation when building source distributions for a specific package
    --build-isolation
    --exclude-newer: string                                               # Limit candidate packages to those that were uploaded prior to the given date
    --link-mode: string@"nu-complete uv link_mode"                        # The method to use when installing packages from the global cache
    --compile-bytecode                                                    # Compile Python files to bytecode after installation
    --no-compile-bytecode
    --no-sources                                                          # Ignore the `tool.uv.sources` table when resolving dependencies. Used to lock against the standards-compliant, publishable package metadata, as opposed to using any local or Git sources
    --no-build                                                            # Don't build source distributions
    --build
    --no-build-package: string                                            # Don't build source distributions for a specific package
    --no-binary                                                           # Don't install pre-built wheels
    --binary
    --no-binary-package: string                                           # Don't install pre-built wheels for a specific package
    --refresh                                                             # Refresh all cached data
    --no-refresh
    --refresh-package: string                                             # Refresh cached data for a specific package
    --package: string                                                     # Remove the dependencies from a specific package in the workspace
    --script: string                                                      # Remove the dependency from the specified Python script, rather than from a project
    --python(-p): string                                                  # The Python interpreter to use for resolving and syncing.
    --no-cache(-n)                                                        # Avoid reading from or writing to the cache, instead using a temporary directory for the duration of the operation
    --cache-dir: string                                                   # Path to the cache directory
    --python-preference: string@"nu-complete uv python_preference"        # Whether to prefer uv-managed or system Python installations
    --allow-python-downloads                                              # Allow automatically downloading Python when required. [env: "UV_PYTHON_DOWNLOADS=auto"]
    --no-python-downloads                                                 # Disable automatic downloads of Python. [env: "UV_PYTHON_DOWNLOADS=never"]
    --quiet(-q)                                                           # Do not print any output
    --verbose(-v)                                                         # Use verbose output
    --no-color                                                            # Disable colors
    --color: string@"nu-complete uv color"                                # Control colors in output
    --native-tls                                                          # Whether to load TLS certificates from the platform's native certificate store
    --no-native-tls
    --offline                                                             # Disable network access
    --no-offline
    --allow-insecure-host: string                                         # Allow insecure connections to a host
    --preview                                                             # Whether to enable experimental, preview features
    --no-preview
    --isolated                                                            # Avoid discovering a `pyproject.toml` or `uv.toml` file
    --show-settings                                                       # Show the resolved settings for the current command
    --no-progress                                                         # Hide all progress outputs
    --no-installer-metadata                                               # Skip writing `uv` installer metadata files (e.g., `INSTALLER`, `REQUESTED`, and `direct_url.json`) to site-packages `.dist-info` directories
    --directory: string                                                   # Change to the given directory prior to running the command
    --project: string                                                     # Run the command within the given project directory
    --config-file: string                                                 # The path to a `uv.toml` file to use for configuration
    --no-config                                                           # Avoid discovering configuration files (`pyproject.toml`, `uv.toml`)
    --help(-h)                                                            # Display the concise help for this command
    --version(-V)                                                         # Display the uv version
    ...packages: string@"nu-complete uv packages"                         # The names of the dependencies to remove (e.g., `ruff`)
  ]


  # Update the project's environment
  export extern "uv sync" [
    --extra: string                                                     # Include optional dependencies from the specified extra name
    --all-extras                                                        # Include all optional dependencies
    --no-extra: string                                                  # Exclude the specified optional dependencies, if `--all-extras` is supplied
    --no-all-extras
    --dev                                                               # Include the development dependency group
    --no-dev                                                            # Omit the development dependency group
    --only-dev                                                          # Only include the development dependency group
    --group: string@"nu-complete uv groups"                             # Include dependencies from the specified dependency group
    --no-group: string@"nu-complete uv groups"                          # Exclude dependencies from the specified dependency group
    --only-group: string@"nu-complete uv groups"                        # Only include dependencies from the specified dependency group
    --all-groups                                                        # Include dependencies from all dependency groups
    --no-editable                                                       # Install any editable dependencies, including the project and any workspace members, as non-editable
    --inexact                                                           # Do not remove extraneous packages present in the environment
    --exact                                                             # Perform an exact sync, removing extraneous packages
    --no-install-project                                                # Do not install the current project
    --no-install-workspace                                              # Do not install any workspace members, including the root project
    --no-install-package: string                                        # Do not install the given package(s)
    --locked                                                            # Assert that the `uv.lock` will remain unchanged
    --frozen                                                            # Sync without updating the `uv.lock` file
    --index: string                                                     # The URLs to use when resolving dependencies, in addition to the default index
    --default-index: string                                             # The URL of the default package index (by default: <https://pypi.org/simple>)
    --find-links(-f): string                                            # Locations to search for candidate distributions, in addition to those found in the registry indexes
    --no-index                                                          # Ignore the registry index (e.g., PyPI), instead relying on direct URL dependencies and those provided via `--find-links`
    --upgrade(-U)                                                       # Allow package upgrades, ignoring pinned versions in any existing output file. Implies `--refresh`
    --no-upgrade
    --upgrade-package(-P): string                                       # Allow upgrades for a specific package, ignoring pinned versions in any existing output file. Implies `--refresh-package`
    --reinstall                                                         # Reinstall all packages, regardless of whether they're already installed. Implies `--refresh`
    --no-reinstall
    --reinstall-package: string                                         # Reinstall a specific package, regardless of whether it's already installed. Implies `--refresh-package`
    --index-strategy: string@"nu-complete uv index_strategy"            # The strategy to use when resolving against multiple index URLs
    --keyring-provider: string@"nu-complete uv keyring_provider"        # Attempt to use `keyring` for authentication for index URLs
    --resolution: string@"nu-complete uv resolution"                    # The strategy to use when selecting between the different compatible versions for a given package requirement
    --prerelease: string@"nu-complete uv prerelease"                    # The strategy to use when considering pre-release versions
    --fork-strategy: string@"nu-complete uv fork_strategy"              # The strategy to use when selecting multiple versions of a given package across Python versions and platforms
    --config-setting(-C): string                                        # Settings to pass to the PEP 517 build backend, specified as `KEY=VALUE` pairs
    --no-build-isolation                                                # Disable isolation when building source distributions
    --no-build-isolation-package: string                                # Disable isolation when building source distributions for a specific package
    --build-isolation
    --exclude-newer: string                                             # Limit candidate packages to those that were uploaded prior to the given date
    --link-mode: string@"nu-complete uv link_mode"                      # The method to use when installing packages from the global cache
    --compile-bytecode                                                  # Compile Python files to bytecode after installation
    --no-compile-bytecode
    --no-sources                                                        # Ignore the `tool.uv.sources` table when resolving dependencies. Used to lock against the standards-compliant, publishable package metadata, as opposed to using any local or Git sources
    --no-build                                                          # Don't build source distributions
    --build
    --no-build-package: string                                          # Don't build source distributions for a specific package
    --no-binary                                                         # Don't install pre-built wheels
    --binary
    --no-binary-package: string                                         # Don't install pre-built wheels for a specific package
    --refresh                                                           # Refresh all cached data
    --no-refresh
    --refresh-package: string                                           # Refresh cached data for a specific package
    --all-packages                                                      # Sync all packages in the workspace
    --package: string                                                   # Sync for a specific package in the workspace
    --python(-p): string                                                # The Python interpreter to use for the project environment.
    --no-cache(-n)                                                      # Avoid reading from or writing to the cache, instead using a temporary directory for the duration of the operation
    --cache-dir: string                                                 # Path to the cache directory
    --python-preference: string@"nu-complete uv python_preference"      # Whether to prefer uv-managed or system Python installations
    --allow-python-downloads                                            # Allow automatically downloading Python when required. [env: "UV_PYTHON_DOWNLOADS=auto"]
    --no-python-downloads                                               # Disable automatic downloads of Python. [env: "UV_PYTHON_DOWNLOADS=never"]
    --quiet(-q)                                                         # Do not print any output
    --verbose(-v)                                                       # Use verbose output
    --no-color                                                          # Disable colors
    --color: string@"nu-complete uv color"                              # Control colors in output
    --native-tls                                                        # Whether to load TLS certificates from the platform's native certificate store
    --no-native-tls
    --offline                                                           # Disable network access
    --no-offline
    --allow-insecure-host: string                                       # Allow insecure connections to a host
    --preview                                                           # Whether to enable experimental, preview features
    --no-preview
    --isolated                                                          # Avoid discovering a `pyproject.toml` or `uv.toml` file
    --show-settings                                                     # Show the resolved settings for the current command
    --no-progress                                                       # Hide all progress outputs
    --no-installer-metadata                                             # Skip writing `uv` installer metadata files (e.g., `INSTALLER`, `REQUESTED`, and `direct_url.json`) to site-packages `.dist-info` directories
    --directory: string                                                 # Change to the given directory prior to running the command
    --project: string                                                   # Run the command within the given project directory
    --config-file: string                                               # The path to a `uv.toml` file to use for configuration
    --no-config                                                         # Avoid discovering configuration files (`pyproject.toml`, `uv.toml`)
    --help(-h)                                                          # Display the concise help for this command
    --version(-V)                                                       # Display the uv version
  ]


  # Update the project's lockfile
  export extern "uv lock" [
    --check                                                             # Check if the lockfile is up-to-date
    --check-exists                                                      # Assert that a `uv.lock` exists without checking if it is up-to-date
    --dry-run                                                           # Perform a dry run, without writing the lockfile
    --index: string                                                     # The URLs to use when resolving dependencies, in addition to the default index
    --default-index: string                                             # The URL of the default package index (by default: <https://pypi.org/simple>)
    --find-links(-f): string                                            # Locations to search for candidate distributions, in addition to those found in the registry indexes
    --no-index                                                          # Ignore the registry index (e.g., PyPI), instead relying on direct URL dependencies and those provided via `--find-links`
    --upgrade(-U)                                                       # Allow package upgrades, ignoring pinned versions in any existing output file. Implies `--refresh`
    --no-upgrade
    --upgrade-package(-P): string                                       # Allow upgrades for a specific package, ignoring pinned versions in any existing output file. Implies `--refresh-package`
    --index-strategy: string@"nu-complete uv index_strategy"            # The strategy to use when resolving against multiple index URLs
    --keyring-provider: string@"nu-complete uv keyring_provider"        # Attempt to use `keyring` for authentication for index URLs
    --resolution: string@"nu-complete uv resolution"                    # The strategy to use when selecting between the different compatible versions for a given package requirement
    --prerelease: string@"nu-complete uv prerelease"                    # The strategy to use when considering pre-release versions
    --fork-strategy: string@"nu-complete uv fork_strategy"              # The strategy to use when selecting multiple versions of a given package across Python versions and platforms
    --config-setting(-C): string                                        # Settings to pass to the PEP 517 build backend, specified as `KEY=VALUE` pairs
    --no-build-isolation                                                # Disable isolation when building source distributions
    --no-build-isolation-package: string                                # Disable isolation when building source distributions for a specific package
    --build-isolation
    --exclude-newer: string                                             # Limit candidate packages to those that were uploaded prior to the given date
    --link-mode: string@"nu-complete uv link_mode"                      # The method to use when installing packages from the global cache
    --no-sources                                                        # Ignore the `tool.uv.sources` table when resolving dependencies. Used to lock against the standards-compliant, publishable package metadata, as opposed to using any local or Git sources
    --no-build                                                          # Don't build source distributions
    --build
    --no-build-package: string                                          # Don't build source distributions for a specific package
    --no-binary                                                         # Don't install pre-built wheels
    --binary
    --no-binary-package: string                                         # Don't install pre-built wheels for a specific package
    --refresh                                                           # Refresh all cached data
    --no-refresh
    --refresh-package: string                                           # Refresh cached data for a specific package
    --python(-p): string                                                # The Python interpreter to use during resolution.
    --no-cache(-n)                                                      # Avoid reading from or writing to the cache, instead using a temporary directory for the duration of the operation
    --cache-dir: string                                                 # Path to the cache directory
    --python-preference: string@"nu-complete uv python_preference"      # Whether to prefer uv-managed or system Python installations
    --allow-python-downloads                                            # Allow automatically downloading Python when required. [env: "UV_PYTHON_DOWNLOADS=auto"]
    --no-python-downloads                                               # Disable automatic downloads of Python. [env: "UV_PYTHON_DOWNLOADS=never"]
    --quiet(-q)                                                         # Do not print any output
    --verbose(-v)                                                       # Use verbose output
    --no-color                                                          # Disable colors
    --color: string@"nu-complete uv color"                              # Control colors in output
    --native-tls                                                        # Whether to load TLS certificates from the platform's native certificate store
    --no-native-tls
    --offline                                                           # Disable network access
    --no-offline
    --allow-insecure-host: string                                       # Allow insecure connections to a host
    --preview                                                           # Whether to enable experimental, preview features
    --no-preview
    --isolated                                                          # Avoid discovering a `pyproject.toml` or `uv.toml` file
    --show-settings                                                     # Show the resolved settings for the current command
    --no-progress                                                       # Hide all progress outputs
    --no-installer-metadata                                             # Skip writing `uv` installer metadata files (e.g., `INSTALLER`, `REQUESTED`, and `direct_url.json`) to site-packages `.dist-info` directories
    --directory: string                                                 # Change to the given directory prior to running the command
    --project: string                                                   # Run the command within the given project directory
    --config-file: string                                               # The path to a `uv.toml` file to use for configuration
    --no-config                                                         # Avoid discovering configuration files (`pyproject.toml`, `uv.toml`)
    --help(-h)                                                          # Display the concise help for this command
    --version(-V)                                                       # Display the uv version
  ]

  def "nu-complete uv export format" [] {
    [ "requirements-txt" ]
  }


  # Export the project's lockfile to an alternate format
  export extern "uv export" [
    --format: string@"nu-complete uv export format"                       # The format to which `uv.lock` should be exported
    --all-packages                                                        # Export the entire workspace
    --package: string                                                     # Export the dependencies for a specific package in the workspace
    --prune: string                                                       # Prune the given package from the dependency tree
    --extra: string                                                       # Include optional dependencies from the specified extra name
    --all-extras                                                          # Include all optional dependencies
    --no-extra: string                                                    # Exclude the specified optional dependencies, if `--all-extras` is supplied
    --no-all-extras
    --dev                                                                 # Include the development dependency group
    --no-dev                                                              # Omit the development dependency group
    --only-dev                                                            # Only include the development dependency group
    --group: string@"nu-complete uv groups"                               # Include dependencies from the specified dependency group
    --no-group: string@"nu-complete uv groups"                            # Exclude dependencies from the specified dependency group
    --only-group: string@"nu-complete uv groups"                          # Only include dependencies from the specified dependency group
    --all-groups                                                          # Include dependencies from all dependency groups
    --no-header                                                           # Exclude the comment header at the top of the generated output file
    --header
    --no-editable                                                         # Install any editable dependencies, including the project and any workspace members, as non-editable
    --hashes                                                              # Include hashes for all dependencies
    --no-hashes                                                           # Omit hashes in the generated output
    --output-file(-o): string                                             # Write the exported requirements to the given file
    --no-emit-project                                                     # Do not emit the current project
    --no-emit-workspace                                                   # Do not emit any workspace members, including the root project
    --no-emit-package: string                                             # Do not emit the given package(s)
    --locked                                                              # Assert that the `uv.lock` will remain unchanged
    --frozen                                                              # Do not update the `uv.lock` before exporting
    --index: string                                                       # The URLs to use when resolving dependencies, in addition to the default index
    --default-index: string                                               # The URL of the default package index (by default: <https://pypi.org/simple>)
    --find-links(-f): string                                              # Locations to search for candidate distributions, in addition to those found in the registry indexes
    --no-index                                                            # Ignore the registry index (e.g., PyPI), instead relying on direct URL dependencies and those provided via `--find-links`
    --upgrade(-U)                                                         # Allow package upgrades, ignoring pinned versions in any existing output file. Implies `--refresh`
    --no-upgrade
    --upgrade-package(-P): string                                         # Allow upgrades for a specific package, ignoring pinned versions in any existing output file. Implies `--refresh-package`
    --index-strategy: string@"nu-complete uv index_strategy"              # The strategy to use when resolving against multiple index URLs
    --keyring-provider: string@"nu-complete uv keyring_provider"          # Attempt to use `keyring` for authentication for index URLs
    --resolution: string@"nu-complete uv resolution"                      # The strategy to use when selecting between the different compatible versions for a given package requirement
    --prerelease: string@"nu-complete uv prerelease"                      # The strategy to use when considering pre-release versions
    --fork-strategy: string@"nu-complete uv fork_strategy"                # The strategy to use when selecting multiple versions of a given package across Python versions and platforms
    --config-setting(-C): string                                          # Settings to pass to the PEP 517 build backend, specified as `KEY=VALUE` pairs
    --no-build-isolation                                                  # Disable isolation when building source distributions
    --no-build-isolation-package: string                                  # Disable isolation when building source distributions for a specific package
    --build-isolation
    --exclude-newer: string                                               # Limit candidate packages to those that were uploaded prior to the given date
    --link-mode: string@"nu-complete uv link_mode"                        # The method to use when installing packages from the global cache
    --no-sources                                                          # Ignore the `tool.uv.sources` table when resolving dependencies. Used to lock against the standards-compliant, publishable package metadata, as opposed to using any local or Git sources
    --no-build                                                            # Don't build source distributions
    --build
    --no-build-package: string                                            # Don't build source distributions for a specific package
    --no-binary                                                           # Don't install pre-built wheels
    --binary
    --no-binary-package: string                                           # Don't install pre-built wheels for a specific package
    --refresh                                                             # Refresh all cached data
    --no-refresh
    --refresh-package: string                                             # Refresh cached data for a specific package
    --python(-p): string                                                  # The Python interpreter to use during resolution.
    --no-cache(-n)                                                        # Avoid reading from or writing to the cache, instead using a temporary directory for the duration of the operation
    --cache-dir: string                                                   # Path to the cache directory
    --python-preference: string@"nu-complete uv python_preference"        # Whether to prefer uv-managed or system Python installations
    --allow-python-downloads                                              # Allow automatically downloading Python when required. [env: "UV_PYTHON_DOWNLOADS=auto"]
    --no-python-downloads                                                 # Disable automatic downloads of Python. [env: "UV_PYTHON_DOWNLOADS=never"]
    --quiet(-q)                                                           # Do not print any output
    --verbose(-v)                                                         # Use verbose output
    --no-color                                                            # Disable colors
    --color: string@"nu-complete uv color"                                # Control colors in output
    --native-tls                                                          # Whether to load TLS certificates from the platform's native certificate store
    --no-native-tls
    --offline                                                             # Disable network access
    --no-offline
    --allow-insecure-host: string                                         # Allow insecure connections to a host
    --preview                                                             # Whether to enable experimental, preview features
    --no-preview
    --isolated                                                            # Avoid discovering a `pyproject.toml` or `uv.toml` file
    --show-settings                                                       # Show the resolved settings for the current command
    --no-progress                                                         # Hide all progress outputs
    --no-installer-metadata                                               # Skip writing `uv` installer metadata files (e.g., `INSTALLER`, `REQUESTED`, and `direct_url.json`) to site-packages `.dist-info` directories
    --directory: string                                                   # Change to the given directory prior to running the command
    --project: string                                                     # Run the command within the given project directory
    --config-file: string                                                 # The path to a `uv.toml` file to use for configuration
    --no-config                                                           # Avoid discovering configuration files (`pyproject.toml`, `uv.toml`)
    --help(-h)                                                            # Display the concise help for this command
    --version(-V)                                                         # Display the uv version
  ]

  def "nu-complete uv python_platform" [] {
    [ "windows" "linux" "macos" "x86_64-pc-windows-msvc" "i686-pc-windows-msvc" "x86_64-unknown-linux-gnu" "aarch64-apple-darwin" "x86_64-apple-darwin" "aarch64-unknown-linux-gnu" "aarch64-unknown-linux-musl" "x86_64-unknown-linux-musl" "x86_64-manylinux_2_17" "x86_64-manylinux_2_28" "x86_64-manylinux_2_31" "x86_64-manylinux_2_32" "x86_64-manylinux_2_33" "x86_64-manylinux_2_34" "x86_64-manylinux_2_35" "x86_64-manylinux_2_36" "x86_64-manylinux_2_37" "x86_64-manylinux_2_38" "x86_64-manylinux_2_39" "x86_64-manylinux_2_40" "aarch64-manylinux_2_17" "aarch64-manylinux_2_28" "aarch64-manylinux_2_31" "aarch64-manylinux_2_32" "aarch64-manylinux_2_33" "aarch64-manylinux_2_34" "aarch64-manylinux_2_35" "aarch64-manylinux_2_36" "aarch64-manylinux_2_37" "aarch64-manylinux_2_38" "aarch64-manylinux_2_39" "aarch64-manylinux_2_40" ]
  }

  # Display the project's dependency tree
  export extern "uv tree" [
    --universal                                                         # Show a platform-independent dependency tree
    --depth(-d): string                                                 # Maximum display depth of the dependency tree
    --prune: string                                                     # Prune the given package from the display of the dependency tree
    --package: string                                                   # Display only the specified packages
    --no-dedupe                                                         # Do not de-duplicate repeated dependencies. Usually, when a package has already displayed its dependencies, further occurrences will not re-display its dependencies, and will include a (*) to indicate it has already been shown. This flag will cause those duplicates to be repeated
    --invert                                                            # Show the reverse dependencies for the given package. This flag will invert the tree and display the packages that depend on the given package
    --outdated                                                          # Show the latest available version of each package in the tree
    --dev                                                               # Include the development dependency group
    --only-dev                                                          # Only include the development dependency group
    --no-dev                                                            # Omit the development dependency group
    --group: string@"nu-complete uv groups"                             # Include dependencies from the specified dependency group
    --no-group: string@"nu-complete uv groups"                          # Exclude dependencies from the specified dependency group
    --only-group: string@"nu-complete uv groups"                        # Only include dependencies from the specified dependency group
    --all-groups                                                        # Include dependencies from all dependency groups
    --locked                                                            # Assert that the `uv.lock` will remain unchanged
    --frozen                                                            # Display the requirements without locking the project
    --no-build                                                          # Don't build source distributions
    --build
    --no-build-package: string                                          # Don't build source distributions for a specific package
    --no-binary                                                         # Don't install pre-built wheels
    --binary
    --no-binary-package: string                                         # Don't install pre-built wheels for a specific package
    --index: string                                                     # The URLs to use when resolving dependencies, in addition to the default index
    --default-index: string                                             # The URL of the default package index (by default: <https://pypi.org/simple>)
    --find-links(-f): string                                            # Locations to search for candidate distributions, in addition to those found in the registry indexes
    --no-index                                                          # Ignore the registry index (e.g., PyPI), instead relying on direct URL dependencies and those provided via `--find-links`
    --upgrade(-U)                                                       # Allow package upgrades, ignoring pinned versions in any existing output file. Implies `--refresh`
    --no-upgrade
    --upgrade-package(-P): string                                       # Allow upgrades for a specific package, ignoring pinned versions in any existing output file. Implies `--refresh-package`
    --index-strategy: string@"nu-complete uv index_strategy"            # The strategy to use when resolving against multiple index URLs
    --keyring-provider: string@"nu-complete uv keyring_provider"        # Attempt to use `keyring` for authentication for index URLs
    --resolution: string@"nu-complete uv resolution"                    # The strategy to use when selecting between the different compatible versions for a given package requirement
    --prerelease: string@"nu-complete uv prerelease"                    # The strategy to use when considering pre-release versions
    --fork-strategy: string@"nu-complete uv fork_strategy"              # The strategy to use when selecting multiple versions of a given package across Python versions and platforms
    --config-setting(-C): string                                        # Settings to pass to the PEP 517 build backend, specified as `KEY=VALUE` pairs
    --no-build-isolation                                                # Disable isolation when building source distributions
    --no-build-isolation-package: string                                # Disable isolation when building source distributions for a specific package
    --build-isolation
    --exclude-newer: string                                             # Limit candidate packages to those that were uploaded prior to the given date
    --link-mode: string@"nu-complete uv link_mode"                      # The method to use when installing packages from the global cache
    --no-sources                                                        # Ignore the `tool.uv.sources` table when resolving dependencies. Used to lock against the standards-compliant, publishable package metadata, as opposed to using any local or Git sources
    --python-version: string                                            # The Python version to use when filtering the tree
    --python-platform: string@"nu-complete uv python_platform"          # The platform to use when filtering the tree
    --python(-p): string                                                # The Python interpreter to use for locking and filtering.
    --no-cache(-n)                                                      # Avoid reading from or writing to the cache, instead using a temporary directory for the duration of the operation
    --cache-dir: string                                                 # Path to the cache directory
    --python-preference: string@"nu-complete uv python_preference"      # Whether to prefer uv-managed or system Python installations
    --allow-python-downloads                                            # Allow automatically downloading Python when required. [env: "UV_PYTHON_DOWNLOADS=auto"]
    --no-python-downloads                                               # Disable automatic downloads of Python. [env: "UV_PYTHON_DOWNLOADS=never"]
    --quiet(-q)                                                         # Do not print any output
    --verbose(-v)                                                       # Use verbose output
    --no-color                                                          # Disable colors
    --color: string@"nu-complete uv color"                              # Control colors in output
    --native-tls                                                        # Whether to load TLS certificates from the platform's native certificate store
    --no-native-tls
    --offline                                                           # Disable network access
    --no-offline
    --allow-insecure-host: string                                       # Allow insecure connections to a host
    --preview                                                           # Whether to enable experimental, preview features
    --no-preview
    --isolated                                                          # Avoid discovering a `pyproject.toml` or `uv.toml` file
    --show-settings                                                     # Show the resolved settings for the current command
    --no-progress                                                       # Hide all progress outputs
    --no-installer-metadata                                             # Skip writing `uv` installer metadata files (e.g., `INSTALLER`, `REQUESTED`, and `direct_url.json`) to site-packages `.dist-info` directories
    --directory: string                                                 # Change to the given directory prior to running the command
    --project: string                                                   # Run the command within the given project directory
    --config-file: string                                               # The path to a `uv.toml` file to use for configuration
    --no-config                                                         # Avoid discovering configuration files (`pyproject.toml`, `uv.toml`)
    --help(-h)                                                          # Display the concise help for this command
    --version(-V)                                                       # Display the uv version
  ]


  # Run and install commands provided by Python packages
  export extern "uv tool" [
    --no-cache(-n)                                                      # Avoid reading from or writing to the cache, instead using a temporary directory for the duration of the operation
    --cache-dir: string                                                 # Path to the cache directory
    --python-preference: string@"nu-complete uv python_preference"      # Whether to prefer uv-managed or system Python installations
    --allow-python-downloads                                            # Allow automatically downloading Python when required. [env: "UV_PYTHON_DOWNLOADS=auto"]
    --no-python-downloads                                               # Disable automatic downloads of Python. [env: "UV_PYTHON_DOWNLOADS=never"]
    --quiet(-q)                                                         # Do not print any output
    --verbose(-v)                                                       # Use verbose output
    --no-color                                                          # Disable colors
    --color: string@"nu-complete uv color"                              # Control colors in output
    --native-tls                                                        # Whether to load TLS certificates from the platform's native certificate store
    --no-native-tls
    --offline                                                           # Disable network access
    --no-offline
    --allow-insecure-host: string                                       # Allow insecure connections to a host
    --preview                                                           # Whether to enable experimental, preview features
    --no-preview
    --isolated                                                          # Avoid discovering a `pyproject.toml` or `uv.toml` file
    --show-settings                                                     # Show the resolved settings for the current command
    --no-progress                                                       # Hide all progress outputs
    --no-installer-metadata                                             # Skip writing `uv` installer metadata files (e.g., `INSTALLER`, `REQUESTED`, and `direct_url.json`) to site-packages `.dist-info` directories
    --directory: string                                                 # Change to the given directory prior to running the command
    --project: string                                                   # Run the command within the given project directory
    --config-file: string                                               # The path to a `uv.toml` file to use for configuration
    --no-config                                                         # Avoid discovering configuration files (`pyproject.toml`, `uv.toml`)
    --help(-h)                                                          # Display the concise help for this command
    --version(-V)                                                       # Display the uv version
  ]


  def "nu-complete uv generate_shell_completion" [] {
    [ "bash" "elvish" "fish" "nushell" "powershell" "zsh" ]
  }


  # Run a command provided by a Python package
  export extern "uv tool run" [
    --from: string                                                                          # Use the given package to provide the command
    --with: string                                                                          # Run with the given packages installed
    --with-editable: string                                                                 # Run with the given packages installed as editables
    --with-requirements: string                                                             # Run with all packages listed in the given `requirements.txt` files
    --isolated                                                                              # Run the tool in an isolated virtual environment, ignoring any already-installed tools
    --index: string                                                                         # The URLs to use when resolving dependencies, in addition to the default index
    --default-index: string                                                                 # The URL of the default package index (by default: <https://pypi.org/simple>)
    --find-links(-f): string                                                                # Locations to search for candidate distributions, in addition to those found in the registry indexes
    --no-index                                                                              # Ignore the registry index (e.g., PyPI), instead relying on direct URL dependencies and those provided via `--find-links`
    --upgrade(-U)                                                                           # Allow package upgrades, ignoring pinned versions in any existing output file. Implies `--refresh`
    --no-upgrade
    --upgrade-package(-P): string                                                           # Allow upgrades for a specific package, ignoring pinned versions in any existing output file. Implies `--refresh-package`
    --reinstall                                                                             # Reinstall all packages, regardless of whether they're already installed. Implies `--refresh`
    --no-reinstall
    --reinstall-package: string                                                             # Reinstall a specific package, regardless of whether it's already installed. Implies `--refresh-package`
    --index-strategy: string@"nu-complete uv index_strategy"                                # The strategy to use when resolving against multiple index URLs
    --keyring-provider: string@"nu-complete uv keyring_provider"                            # Attempt to use `keyring` for authentication for index URLs
    --resolution: string@"nu-complete uv resolution"                                        # The strategy to use when selecting between the different compatible versions for a given package requirement
    --prerelease: string@"nu-complete uv prerelease"                                        # The strategy to use when considering pre-release versions
    --fork-strategy: string@"nu-complete uv fork_strategy"                                  # The strategy to use when selecting multiple versions of a given package across Python versions and platforms
    --config-setting(-C): string                                                            # Settings to pass to the PEP 517 build backend, specified as `KEY=VALUE` pairs
    --no-build-isolation                                                                    # Disable isolation when building source distributions
    --no-build-isolation-package: string                                                    # Disable isolation when building source distributions for a specific package
    --build-isolation
    --exclude-newer: string                                                                 # Limit candidate packages to those that were uploaded prior to the given date
    --link-mode: string@"nu-complete uv link_mode"                                          # The method to use when installing packages from the global cache
    --compile-bytecode                                                                      # Compile Python files to bytecode after installation
    --no-compile-bytecode
    --no-sources                                                                            # Ignore the `tool.uv.sources` table when resolving dependencies. Used to lock against the standards-compliant, publishable package metadata, as opposed to using any local or Git sources
    --no-build                                                                              # Don't build source distributions
    --build
    --no-build-package: string                                                              # Don't build source distributions for a specific package
    --no-binary                                                                             # Don't install pre-built wheels
    --binary
    --no-binary-package: string                                                             # Don't install pre-built wheels for a specific package
    --refresh                                                                               # Refresh all cached data
    --no-refresh
    --refresh-package: string                                                               # Refresh cached data for a specific package
    --python(-p): string                                                                    # The Python interpreter to use to build the run environment.
    --show-resolution                                                                       # Whether to show resolver and installer output from any environment modifications
    --generate-shell-completion: string@"nu-complete uv generate_shell_completion"
    --no-cache(-n)                                                                          # Avoid reading from or writing to the cache, instead using a temporary directory for the duration of the operation
    --cache-dir: string                                                                     # Path to the cache directory
    --python-preference: string@"nu-complete uv python_preference"                          # Whether to prefer uv-managed or system Python installations
    --allow-python-downloads                                                                # Allow automatically downloading Python when required. [env: "UV_PYTHON_DOWNLOADS=auto"]
    --no-python-downloads                                                                   # Disable automatic downloads of Python. [env: "UV_PYTHON_DOWNLOADS=never"]
    --quiet(-q)                                                                             # Do not print any output
    --verbose(-v)                                                                           # Use verbose output
    --no-color                                                                              # Disable colors
    --color: string@"nu-complete uv color"                                                  # Control colors in output
    --native-tls                                                                            # Whether to load TLS certificates from the platform's native certificate store
    --no-native-tls
    --offline                                                                               # Disable network access
    --no-offline
    --allow-insecure-host: string                                                           # Allow insecure connections to a host
    --preview                                                                               # Whether to enable experimental, preview features
    --no-preview
    --show-settings                                                                         # Show the resolved settings for the current command
    --no-progress                                                                           # Hide all progress outputs
    --no-installer-metadata                                                                 # Skip writing `uv` installer metadata files (e.g., `INSTALLER`, `REQUESTED`, and `direct_url.json`) to site-packages `.dist-info` directories
    --directory: string                                                                     # Change to the given directory prior to running the command
    --project: string                                                                       # Run the command within the given project directory
    --config-file: string                                                                   # The path to a `uv.toml` file to use for configuration
    --no-config                                                                             # Avoid discovering configuration files (`pyproject.toml`, `uv.toml`)
    --help(-h)                                                                              # Display the concise help for this command
    --version(-V)                                                                           # Display the uv version
  ]


  # Run a command provided by a Python package.
  export extern "uv tool uvx" [
    --from: string                                                                          # Use the given package to provide the command
    --with: string                                                                          # Run with the given packages installed
    --with-editable: string                                                                 # Run with the given packages installed as editables
    --with-requirements: string                                                             # Run with all packages listed in the given `requirements.txt` files
    --isolated                                                                              # Run the tool in an isolated virtual environment, ignoring any already-installed tools
    --index: string                                                                         # The URLs to use when resolving dependencies, in addition to the default index
    --default-index: string                                                                 # The URL of the default package index (by default: <https://pypi.org/simple>)
    --find-links(-f): string                                                                # Locations to search for candidate distributions, in addition to those found in the registry indexes
    --no-index                                                                              # Ignore the registry index (e.g., PyPI), instead relying on direct URL dependencies and those provided via `--find-links`
    --upgrade(-U)                                                                           # Allow package upgrades, ignoring pinned versions in any existing output file. Implies `--refresh`
    --no-upgrade
    --upgrade-package(-P): string                                                           # Allow upgrades for a specific package, ignoring pinned versions in any existing output file. Implies `--refresh-package`
    --reinstall                                                                             # Reinstall all packages, regardless of whether they're already installed. Implies `--refresh`
    --no-reinstall
    --reinstall-package: string                                                             # Reinstall a specific package, regardless of whether it's already installed. Implies `--refresh-package`
    --index-strategy: string@"nu-complete uv index_strategy"                                # The strategy to use when resolving against multiple index URLs
    --keyring-provider: string@"nu-complete uv keyring_provider"                            # Attempt to use `keyring` for authentication for index URLs
    --resolution: string@"nu-complete uv resolution"                                        # The strategy to use when selecting between the different compatible versions for a given package requirement
    --prerelease: string@"nu-complete uv prerelease"                                        # The strategy to use when considering pre-release versions
    --fork-strategy: string@"nu-complete uv fork_strategy"                                  # The strategy to use when selecting multiple versions of a given package across Python versions and platforms
    --config-setting(-C): string                                                            # Settings to pass to the PEP 517 build backend, specified as `KEY=VALUE` pairs
    --no-build-isolation                                                                    # Disable isolation when building source distributions
    --no-build-isolation-package: string                                                    # Disable isolation when building source distributions for a specific package
    --build-isolation
    --exclude-newer: string                                                                 # Limit candidate packages to those that were uploaded prior to the given date
    --link-mode: string@"nu-complete uv link_mode"                                          # The method to use when installing packages from the global cache
    --compile-bytecode                                                                      # Compile Python files to bytecode after installation
    --no-compile-bytecode
    --no-sources                                                                            # Ignore the `tool.uv.sources` table when resolving dependencies. Used to lock against the standards-compliant, publishable package metadata, as opposed to using any local or Git sources
    --no-build                                                                              # Don't build source distributions
    --build
    --no-build-package: string                                                              # Don't build source distributions for a specific package
    --no-binary                                                                             # Don't install pre-built wheels
    --binary
    --no-binary-package: string                                                             # Don't install pre-built wheels for a specific package
    --refresh                                                                               # Refresh all cached data
    --no-refresh
    --refresh-package: string                                                               # Refresh cached data for a specific package
    --python(-p): string                                                                    # The Python interpreter to use to build the run environment.
    --show-resolution                                                                       # Whether to show resolver and installer output from any environment modifications
    --generate-shell-completion: string@"nu-complete uv generate_shell_completion"
    --no-cache(-n)                                                                          # Avoid reading from or writing to the cache, instead using a temporary directory for the duration of the operation
    --cache-dir: string                                                                     # Path to the cache directory
    --python-preference: string@"nu-complete uv python_preference"                          # Whether to prefer uv-managed or system Python installations
    --allow-python-downloads                                                                # Allow automatically downloading Python when required. [env: "UV_PYTHON_DOWNLOADS=auto"]
    --no-python-downloads                                                                   # Disable automatic downloads of Python. [env: "UV_PYTHON_DOWNLOADS=never"]
    --quiet(-q)                                                                             # Do not print any output
    --verbose(-v)                                                                           # Use verbose output
    --no-color                                                                              # Disable colors
    --color: string@"nu-complete uv color"                                                  # Control colors in output
    --native-tls                                                                            # Whether to load TLS certificates from the platform's native certificate store
    --no-native-tls
    --offline                                                                               # Disable network access
    --no-offline
    --allow-insecure-host: string                                                           # Allow insecure connections to a host
    --preview                                                                               # Whether to enable experimental, preview features
    --no-preview
    --show-settings                                                                         # Show the resolved settings for the current command
    --no-progress                                                                           # Hide all progress outputs
    --no-installer-metadata                                                                 # Skip writing `uv` installer metadata files (e.g., `INSTALLER`, `REQUESTED`, and `direct_url.json`) to site-packages `.dist-info` directories
    --directory: string                                                                     # Change to the given directory prior to running the command
    --project: string                                                                       # Run the command within the given project directory
    --config-file: string                                                                   # The path to a `uv.toml` file to use for configuration
    --no-config                                                                             # Avoid discovering configuration files (`pyproject.toml`, `uv.toml`)
    --help(-h)                                                                              # Display the concise help for this command
    --version(-V)                                                                           # Display the uv version
  ]


  # Install commands provided by a Python package
  export extern "uv tool install" [
  package: string           # The package to install commands from
    --editable(-e)
    --from: string                                                              # The package to install commands from
    --with: string                                                              # Include the following extra requirements
    --with-editable: string                                                     # Include the given packages as editables
    --with-requirements: string                                                 # Run all requirements listed in the given `requirements.txt` files
    --constraints(-c): string                                                   # Constrain versions using the given requirements files
    --overrides: string                                                         # Override versions using the given requirements files
    --index: string                                                             # The URLs to use when resolving dependencies, in addition to the default index
    --default-index: string                                                     # The URL of the default package index (by default: <https://pypi.org/simple>)
    --find-links(-f): string                                                    # Locations to search for candidate distributions, in addition to those found in the registry indexes
    --no-index                                                                  # Ignore the registry index (e.g., PyPI), instead relying on direct URL dependencies and those provided via `--find-links`
    --upgrade(-U)                                                               # Allow package upgrades, ignoring pinned versions in any existing output file. Implies `--refresh`
    --no-upgrade
    --upgrade-package(-P): string                                               # Allow upgrades for a specific package, ignoring pinned versions in any existing output file. Implies `--refresh-package`
    --reinstall                                                                 # Reinstall all packages, regardless of whether they're already installed. Implies `--refresh`
    --no-reinstall
    --reinstall-package: string                                                 # Reinstall a specific package, regardless of whether it's already installed. Implies `--refresh-package`
    --index-strategy: string@"nu-complete uv index_strategy"                    # The strategy to use when resolving against multiple index URLs
    --keyring-provider: string@"nu-complete uv keyring_provider"                # Attempt to use `keyring` for authentication for index URLs
    --resolution: string@"nu-complete uv resolution"                            # The strategy to use when selecting between the different compatible versions for a given package requirement
    --prerelease: string@"nu-complete uv prerelease"                            # The strategy to use when considering pre-release versions
    --fork-strategy: string@"nu-complete uv fork_strategy"                      # The strategy to use when selecting multiple versions of a given package across Python versions and platforms
    --config-setting(-C): string                                                # Settings to pass to the PEP 517 build backend, specified as `KEY=VALUE` pairs
    --no-build-isolation                                                        # Disable isolation when building source distributions
    --no-build-isolation-package: string                                        # Disable isolation when building source distributions for a specific package
    --build-isolation
    --exclude-newer: string                                                     # Limit candidate packages to those that were uploaded prior to the given date
    --link-mode: string@"nu-complete uv link_mode"                              # The method to use when installing packages from the global cache
    --compile-bytecode                                                          # Compile Python files to bytecode after installation
    --no-compile-bytecode
    --no-sources                                                                # Ignore the `tool.uv.sources` table when resolving dependencies. Used to lock against the standards-compliant, publishable package metadata, as opposed to using any local or Git sources
    --no-build                                                                  # Don't build source distributions
    --build
    --no-build-package: string                                                  # Don't build source distributions for a specific package
    --no-binary                                                                 # Don't install pre-built wheels
    --binary
    --no-binary-package: string                                                 # Don't install pre-built wheels for a specific package
    --refresh                                                                   # Refresh all cached data
    --no-refresh
    --refresh-package: string                                                   # Refresh cached data for a specific package
    --force                                                                     # Force installation of the tool
    --python(-p): string                                                        # The Python interpreter to use to build the tool environment.
    --no-cache(-n)                                                              # Avoid reading from or writing to the cache, instead using a temporary directory for the duration of the operation
    --cache-dir: string                                                         # Path to the cache directory
    --python-preference: string@"nu-complete uv python_preference"              # Whether to prefer uv-managed or system Python installations
    --allow-python-downloads                                                    # Allow automatically downloading Python when required. [env: "UV_PYTHON_DOWNLOADS=auto"]
    --no-python-downloads                                                       # Disable automatic downloads of Python. [env: "UV_PYTHON_DOWNLOADS=never"]
    --quiet(-q)                                                                 # Do not print any output
    --verbose(-v)                                                               # Use verbose output
    --no-color                                                                  # Disable colors
    --color: string@"nu-complete uv color"                                      # Control colors in output
    --native-tls                                                                # Whether to load TLS certificates from the platform's native certificate store
    --no-native-tls
    --offline                                                                   # Disable network access
    --no-offline
    --allow-insecure-host: string                                               # Allow insecure connections to a host
    --preview                                                                   # Whether to enable experimental, preview features
    --no-preview
    --isolated                                                                  # Avoid discovering a `pyproject.toml` or `uv.toml` file
    --show-settings                                                             # Show the resolved settings for the current command
    --no-progress                                                               # Hide all progress outputs
    --no-installer-metadata                                                     # Skip writing `uv` installer metadata files (e.g., `INSTALLER`, `REQUESTED`, and `direct_url.json`) to site-packages `.dist-info` directories
    --directory: string                                                         # Change to the given directory prior to running the command
    --project: string                                                           # Run the command within the given project directory
    --config-file: string                                                       # The path to a `uv.toml` file to use for configuration
    --no-config                                                                 # Avoid discovering configuration files (`pyproject.toml`, `uv.toml`)
    --help(-h)                                                                  # Display the concise help for this command
    --version(-V)                                                               # Display the uv version
  ]


  # Upgrade installed tools
  export extern "uv tool upgrade" [
...name: string           # The name of the tool to upgrade, along with an optional version specifier
    --all                                                                       # Upgrade all tools
    --python(-p): string                                                        # Upgrade a tool, and specify it to use the given Python interpreter to build its environment. Use with `--all` to apply to all tools.
    --upgrade(-U)                                                               # Allow package upgrades, ignoring pinned versions in any existing output file. Implies `--refresh`
    --upgrade-package(-P): string                                               # Allow upgrades for a specific package, ignoring pinned versions in any existing output file. Implies `--refresh-package`
    --index: string                                                             # The URLs to use when resolving dependencies, in addition to the default index
    --default-index: string                                                     # The URL of the default package index (by default: <https://pypi.org/simple>)
    --find-links(-f): string                                                    # Locations to search for candidate distributions, in addition to those found in the registry indexes
    --no-index                                                                  # Ignore the registry index (e.g., PyPI), instead relying on direct URL dependencies and those provided via `--find-links`
    --reinstall                                                                 # Reinstall all packages, regardless of whether they're already installed. Implies `--refresh`
    --no-reinstall
    --reinstall-package: string                                                 # Reinstall a specific package, regardless of whether it's already installed. Implies `--refresh-package`
    --index-strategy: string@"nu-complete uv index_strategy"                    # The strategy to use when resolving against multiple index URLs
    --keyring-provider: string@"nu-complete uv keyring_provider"                # Attempt to use `keyring` for authentication for index URLs
    --resolution: string@"nu-complete uv resolution"                            # The strategy to use when selecting between the different compatible versions for a given package requirement
    --prerelease: string@"nu-complete uv prerelease"                            # The strategy to use when considering pre-release versions
    --fork-strategy: string@"nu-complete uv fork_strategy"                      # The strategy to use when selecting multiple versions of a given package across Python versions and platforms
    --config-setting(-C): string                                                # Settings to pass to the PEP 517 build backend, specified as `KEY=VALUE` pairs
    --no-build-isolation                                                        # Disable isolation when building source distributions
    --no-build-isolation-package: string                                        # Disable isolation when building source distributions for a specific package
    --build-isolation
    --exclude-newer: string                                                     # Limit candidate packages to those that were uploaded prior to the given date
    --link-mode: string@"nu-complete uv link_mode"                              # The method to use when installing packages from the global cache
    --compile-bytecode                                                          # Compile Python files to bytecode after installation
    --no-compile-bytecode
    --no-sources                                                                # Ignore the `tool.uv.sources` table when resolving dependencies. Used to lock against the standards-compliant, publishable package metadata, as opposed to using any local or Git sources
    --no-build                                                                  # Don't build source distributions
    --build
    --no-build-package: string                                                  # Don't build source distributions for a specific package
    --no-binary                                                                 # Don't install pre-built wheels
    --binary
    --no-binary-package: string                                                 # Don't install pre-built wheels for a specific package
    --no-cache(-n)                                                              # Avoid reading from or writing to the cache, instead using a temporary directory for the duration of the operation
    --cache-dir: string                                                         # Path to the cache directory
    --python-preference: string@"nu-complete uv python_preference"              # Whether to prefer uv-managed or system Python installations
    --allow-python-downloads                                                    # Allow automatically downloading Python when required. [env: "UV_PYTHON_DOWNLOADS=auto"]
    --no-python-downloads                                                       # Disable automatic downloads of Python. [env: "UV_PYTHON_DOWNLOADS=never"]
    --quiet(-q)                                                                 # Do not print any output
    --verbose(-v)                                                               # Use verbose output
    --no-color                                                                  # Disable colors
    --color: string@"nu-complete uv color"                                      # Control colors in output
    --native-tls                                                                # Whether to load TLS certificates from the platform's native certificate store
    --no-native-tls
    --offline                                                                   # Disable network access
    --no-offline
    --allow-insecure-host: string                                               # Allow insecure connections to a host
    --preview                                                                   # Whether to enable experimental, preview features
    --no-preview
    --isolated                                                                  # Avoid discovering a `pyproject.toml` or `uv.toml` file
    --show-settings                                                             # Show the resolved settings for the current command
    --no-progress                                                               # Hide all progress outputs
    --no-installer-metadata                                                     # Skip writing `uv` installer metadata files (e.g., `INSTALLER`, `REQUESTED`, and `direct_url.json`) to site-packages `.dist-info` directories
    --directory: string                                                         # Change to the given directory prior to running the command
    --project: string                                                           # Run the command within the given project directory
    --config-file: string                                                       # The path to a `uv.toml` file to use for configuration
    --no-config                                                                 # Avoid discovering configuration files (`pyproject.toml`, `uv.toml`)
    --help(-h)                                                                  # Display the concise help for this command
    --version(-V)                                                               # Display the uv version
  ]


  # List installed tools
  export extern "uv tool list" [
    --show-paths                                                             # Whether to display the path to each tool environment and installed executable
    --show-version-specifiers                                                # Whether to display the version specifier(s) used to install each tool
    --python-preference: string@"nu-complete uv python_preference"
    --no-python-downloads
    --no-cache(-n)                                                           # Avoid reading from or writing to the cache, instead using a temporary directory for the duration of the operation
    --cache-dir: string                                                      # Path to the cache directory
    --allow-python-downloads                                                 # Allow automatically downloading Python when required. [env: "UV_PYTHON_DOWNLOADS=auto"]
    --quiet(-q)                                                              # Do not print any output
    --verbose(-v)                                                            # Use verbose output
    --no-color                                                               # Disable colors
    --color: string@"nu-complete uv color"                                   # Control colors in output
    --native-tls                                                             # Whether to load TLS certificates from the platform's native certificate store
    --no-native-tls
    --offline                                                                # Disable network access
    --no-offline
    --allow-insecure-host: string                                            # Allow insecure connections to a host
    --preview                                                                # Whether to enable experimental, preview features
    --no-preview
    --isolated                                                               # Avoid discovering a `pyproject.toml` or `uv.toml` file
    --show-settings                                                          # Show the resolved settings for the current command
    --no-progress                                                            # Hide all progress outputs
    --no-installer-metadata                                                  # Skip writing `uv` installer metadata files (e.g., `INSTALLER`, `REQUESTED`, and `direct_url.json`) to site-packages `.dist-info` directories
    --directory: string                                                      # Change to the given directory prior to running the command
    --project: string                                                        # Run the command within the given project directory
    --config-file: string                                                    # The path to a `uv.toml` file to use for configuration
    --no-config                                                              # Avoid discovering configuration files (`pyproject.toml`, `uv.toml`)
    --help(-h)                                                               # Display the concise help for this command
    --version(-V)                                                            # Display the uv version
  ]


  # Uninstall a tool
  export extern "uv tool uninstall" [
...name: string           # The name of the tool to uninstall
    --all                                                                         # Uninstall all tools
    --no-cache(-n)                                                                # Avoid reading from or writing to the cache, instead using a temporary directory for the duration of the operation
    --cache-dir: string                                                           # Path to the cache directory
    --python-preference: string@"nu-complete uv python_preference"                # Whether to prefer uv-managed or system Python installations
    --allow-python-downloads                                                      # Allow automatically downloading Python when required. [env: "UV_PYTHON_DOWNLOADS=auto"]
    --no-python-downloads                                                         # Disable automatic downloads of Python. [env: "UV_PYTHON_DOWNLOADS=never"]
    --quiet(-q)                                                                   # Do not print any output
    --verbose(-v)                                                                 # Use verbose output
    --no-color                                                                    # Disable colors
    --color: string@"nu-complete uv color"                                        # Control colors in output
    --native-tls                                                                  # Whether to load TLS certificates from the platform's native certificate store
    --no-native-tls
    --offline                                                                     # Disable network access
    --no-offline
    --allow-insecure-host: string                                                 # Allow insecure connections to a host
    --preview                                                                     # Whether to enable experimental, preview features
    --no-preview
    --isolated                                                                    # Avoid discovering a `pyproject.toml` or `uv.toml` file
    --show-settings                                                               # Show the resolved settings for the current command
    --no-progress                                                                 # Hide all progress outputs
    --no-installer-metadata                                                       # Skip writing `uv` installer metadata files (e.g., `INSTALLER`, `REQUESTED`, and `direct_url.json`) to site-packages `.dist-info` directories
    --directory: string                                                           # Change to the given directory prior to running the command
    --project: string                                                             # Run the command within the given project directory
    --config-file: string                                                         # The path to a `uv.toml` file to use for configuration
    --no-config                                                                   # Avoid discovering configuration files (`pyproject.toml`, `uv.toml`)
    --help(-h)                                                                    # Display the concise help for this command
    --version(-V)                                                                 # Display the uv version
  ]


  # Ensure that the tool executable directory is on the `PATH`
  export extern "uv tool update-shell" [
    --no-cache(-n)                                                                   # Avoid reading from or writing to the cache, instead using a temporary directory for the duration of the operation
    --cache-dir: string                                                              # Path to the cache directory
    --python-preference: string@"nu-complete uv python_preference"                   # Whether to prefer uv-managed or system Python installations
    --allow-python-downloads                                                         # Allow automatically downloading Python when required. [env: "UV_PYTHON_DOWNLOADS=auto"]
    --no-python-downloads                                                            # Disable automatic downloads of Python. [env: "UV_PYTHON_DOWNLOADS=never"]
    --quiet(-q)                                                                      # Do not print any output
    --verbose(-v)                                                                    # Use verbose output
    --no-color                                                                       # Disable colors
    --color: string@"nu-complete uv color"                                           # Control colors in output
    --native-tls                                                                     # Whether to load TLS certificates from the platform's native certificate store
    --no-native-tls
    --offline                                                                        # Disable network access
    --no-offline
    --allow-insecure-host: string                                                    # Allow insecure connections to a host
    --preview                                                                        # Whether to enable experimental, preview features
    --no-preview
    --isolated                                                                       # Avoid discovering a `pyproject.toml` or `uv.toml` file
    --show-settings                                                                  # Show the resolved settings for the current command
    --no-progress                                                                    # Hide all progress outputs
    --no-installer-metadata                                                          # Skip writing `uv` installer metadata files (e.g., `INSTALLER`, `REQUESTED`, and `direct_url.json`) to site-packages `.dist-info` directories
    --directory: string                                                              # Change to the given directory prior to running the command
    --project: string                                                                # Run the command within the given project directory
    --config-file: string                                                            # The path to a `uv.toml` file to use for configuration
    --no-config                                                                      # Avoid discovering configuration files (`pyproject.toml`, `uv.toml`)
    --help(-h)                                                                       # Display the concise help for this command
    --version(-V)                                                                    # Display the uv version
  ]


  # Show the path to the uv tools directory
  export extern "uv tool dir" [
    --bin                                                                   # Show the directory into which `uv tool` will install executables.
    --no-cache(-n)                                                          # Avoid reading from or writing to the cache, instead using a temporary directory for the duration of the operation
    --cache-dir: string                                                     # Path to the cache directory
    --python-preference: string@"nu-complete uv python_preference"          # Whether to prefer uv-managed or system Python installations
    --allow-python-downloads                                                # Allow automatically downloading Python when required. [env: "UV_PYTHON_DOWNLOADS=auto"]
    --no-python-downloads                                                   # Disable automatic downloads of Python. [env: "UV_PYTHON_DOWNLOADS=never"]
    --quiet(-q)                                                             # Do not print any output
    --verbose(-v)                                                           # Use verbose output
    --no-color                                                              # Disable colors
    --color: string@"nu-complete uv color"                                  # Control colors in output
    --native-tls                                                            # Whether to load TLS certificates from the platform's native certificate store
    --no-native-tls
    --offline                                                               # Disable network access
    --no-offline
    --allow-insecure-host: string                                           # Allow insecure connections to a host
    --preview                                                               # Whether to enable experimental, preview features
    --no-preview
    --isolated                                                              # Avoid discovering a `pyproject.toml` or `uv.toml` file
    --show-settings                                                         # Show the resolved settings for the current command
    --no-progress                                                           # Hide all progress outputs
    --no-installer-metadata                                                 # Skip writing `uv` installer metadata files (e.g., `INSTALLER`, `REQUESTED`, and `direct_url.json`) to site-packages `.dist-info` directories
    --directory: string                                                     # Change to the given directory prior to running the command
    --project: string                                                       # Run the command within the given project directory
    --config-file: string                                                   # The path to a `uv.toml` file to use for configuration
    --no-config                                                             # Avoid discovering configuration files (`pyproject.toml`, `uv.toml`)
    --help(-h)                                                              # Display the concise help for this command
    --version(-V)                                                           # Display the uv version
  ]


  # Manage Python versions and installations
  export extern "uv python" [
    --no-cache(-n)                                                        # Avoid reading from or writing to the cache, instead using a temporary directory for the duration of the operation
    --cache-dir: string                                                   # Path to the cache directory
    --python-preference: string@"nu-complete uv python_preference"        # Whether to prefer uv-managed or system Python installations
    --allow-python-downloads                                              # Allow automatically downloading Python when required. [env: "UV_PYTHON_DOWNLOADS=auto"]
    --no-python-downloads                                                 # Disable automatic downloads of Python. [env: "UV_PYTHON_DOWNLOADS=never"]
    --quiet(-q)                                                           # Do not print any output
    --verbose(-v)                                                         # Use verbose output
    --no-color                                                            # Disable colors
    --color: string@"nu-complete uv color"                                # Control colors in output
    --native-tls                                                          # Whether to load TLS certificates from the platform's native certificate store
    --no-native-tls
    --offline                                                             # Disable network access
    --no-offline
    --allow-insecure-host: string                                         # Allow insecure connections to a host
    --preview                                                             # Whether to enable experimental, preview features
    --no-preview
    --isolated                                                            # Avoid discovering a `pyproject.toml` or `uv.toml` file
    --show-settings                                                       # Show the resolved settings for the current command
    --no-progress                                                         # Hide all progress outputs
    --no-installer-metadata                                               # Skip writing `uv` installer metadata files (e.g., `INSTALLER`, `REQUESTED`, and `direct_url.json`) to site-packages `.dist-info` directories
    --directory: string                                                   # Change to the given directory prior to running the command
    --project: string                                                     # Run the command within the given project directory
    --config-file: string                                                 # The path to a `uv.toml` file to use for configuration
    --no-config                                                           # Avoid discovering configuration files (`pyproject.toml`, `uv.toml`)
    --help(-h)                                                            # Display the concise help for this command
    --version(-V)                                                         # Display the uv version
  ]


  # List the available Python installations
  export extern "uv python list" [
    --all-versions                                                             # List all Python versions, including old patch versions
    --all-platforms                                                            # List Python downloads for all platforms
    --all-arches                                                               # List Python downloads for all architectures
    --only-installed                                                           # Only show installed Python versions, exclude available downloads
    --only-downloads                                                           # Only show Python downloads, exclude installed distributions
    --show-urls                                                                # Show the URLs of available Python downloads
    --no-cache(-n)                                                             # Avoid reading from or writing to the cache, instead using a temporary directory for the duration of the operation
    --cache-dir: string                                                        # Path to the cache directory
    --python-preference: string@"nu-complete uv python_preference"             # Whether to prefer uv-managed or system Python installations
    --allow-python-downloads                                                   # Allow automatically downloading Python when required. [env: "UV_PYTHON_DOWNLOADS=auto"]
    --no-python-downloads                                                      # Disable automatic downloads of Python. [env: "UV_PYTHON_DOWNLOADS=never"]
    --quiet(-q)                                                                # Do not print any output
    --verbose(-v)                                                              # Use verbose output
    --no-color                                                                 # Disable colors
    --color: string@"nu-complete uv color"                                     # Control colors in output
    --native-tls                                                               # Whether to load TLS certificates from the platform's native certificate store
    --no-native-tls
    --offline                                                                  # Disable network access
    --no-offline
    --allow-insecure-host: string                                              # Allow insecure connections to a host
    --preview                                                                  # Whether to enable experimental, preview features
    --no-preview
    --isolated                                                                 # Avoid discovering a `pyproject.toml` or `uv.toml` file
    --show-settings                                                            # Show the resolved settings for the current command
    --no-progress                                                              # Hide all progress outputs
    --no-installer-metadata                                                    # Skip writing `uv` installer metadata files (e.g., `INSTALLER`, `REQUESTED`, and `direct_url.json`) to site-packages `.dist-info` directories
    --directory: string                                                        # Change to the given directory prior to running the command
    --project: string                                                          # Run the command within the given project directory
    --config-file: string                                                      # The path to a `uv.toml` file to use for configuration
    --no-config                                                                # Avoid discovering configuration files (`pyproject.toml`, `uv.toml`)
    --help(-h)                                                                 # Display the concise help for this command
    --version(-V)                                                              # Display the uv version
  ]


  # Download and install Python versions
  export extern "uv python install" [
    --install-dir(-i): string                                                     # The directory to store the Python installation in
...targets: string                                                                # The Python version(s) to install
    --mirror: string                                                              # Set the URL to use as the source for downloading Python installations
    --pypy-mirror: string                                                         # Set the URL to use as the source for downloading PyPy installations
    --reinstall(-r)                                                               # Reinstall the requested Python version, if it's already installed
    --force(-f)                                                                   # Replace existing Python executables during installation
    --default                                                                     # Use as the default Python version
    --no-cache(-n)                                                                # Avoid reading from or writing to the cache, instead using a temporary directory for the duration of the operation
    --cache-dir: string                                                           # Path to the cache directory
    --python-preference: string@"nu-complete uv python_preference"                # Whether to prefer uv-managed or system Python installations
    --allow-python-downloads                                                      # Allow automatically downloading Python when required. [env: "UV_PYTHON_DOWNLOADS=auto"]
    --no-python-downloads                                                         # Disable automatic downloads of Python. [env: "UV_PYTHON_DOWNLOADS=never"]
    --quiet(-q)                                                                   # Do not print any output
    --verbose(-v)                                                                 # Use verbose output
    --no-color                                                                    # Disable colors
    --color: string@"nu-complete uv color"                                        # Control colors in output
    --native-tls                                                                  # Whether to load TLS certificates from the platform's native certificate store
    --no-native-tls
    --offline                                                                     # Disable network access
    --no-offline
    --allow-insecure-host: string                                                 # Allow insecure connections to a host
    --preview                                                                     # Whether to enable experimental, preview features
    --no-preview
    --isolated                                                                    # Avoid discovering a `pyproject.toml` or `uv.toml` file
    --show-settings                                                               # Show the resolved settings for the current command
    --no-progress                                                                 # Hide all progress outputs
    --no-installer-metadata                                                       # Skip writing `uv` installer metadata files (e.g., `INSTALLER`, `REQUESTED`, and `direct_url.json`) to site-packages `.dist-info` directories
    --directory: string                                                           # Change to the given directory prior to running the command
    --project: string                                                             # Run the command within the given project directory
    --config-file: string                                                         # The path to a `uv.toml` file to use for configuration
    --no-config                                                                   # Avoid discovering configuration files (`pyproject.toml`, `uv.toml`)
    --help(-h)                                                                    # Display the concise help for this command
    --version(-V)                                                                 # Display the uv version
  ]


  # Search for a Python installation
  export extern "uv python find" [
  request?: string          # The Python request
    --no-project                                                               # Avoid discovering a project or workspace
    --system                                                                   # Only find system Python interpreters
    --no-system
    --no-cache(-n)                                                             # Avoid reading from or writing to the cache, instead using a temporary directory for the duration of the operation
    --cache-dir: string                                                        # Path to the cache directory
    --python-preference: string@"nu-complete uv python_preference"             # Whether to prefer uv-managed or system Python installations
    --allow-python-downloads                                                   # Allow automatically downloading Python when required. [env: "UV_PYTHON_DOWNLOADS=auto"]
    --no-python-downloads                                                      # Disable automatic downloads of Python. [env: "UV_PYTHON_DOWNLOADS=never"]
    --quiet(-q)                                                                # Do not print any output
    --verbose(-v)                                                              # Use verbose output
    --no-color                                                                 # Disable colors
    --color: string@"nu-complete uv color"                                     # Control colors in output
    --native-tls                                                               # Whether to load TLS certificates from the platform's native certificate store
    --no-native-tls
    --offline                                                                  # Disable network access
    --no-offline
    --allow-insecure-host: string                                              # Allow insecure connections to a host
    --preview                                                                  # Whether to enable experimental, preview features
    --no-preview
    --isolated                                                                 # Avoid discovering a `pyproject.toml` or `uv.toml` file
    --show-settings                                                            # Show the resolved settings for the current command
    --no-progress                                                              # Hide all progress outputs
    --no-installer-metadata                                                    # Skip writing `uv` installer metadata files (e.g., `INSTALLER`, `REQUESTED`, and `direct_url.json`) to site-packages `.dist-info` directories
    --directory: string                                                        # Change to the given directory prior to running the command
    --project: string                                                          # Run the command within the given project directory
    --config-file: string                                                      # The path to a `uv.toml` file to use for configuration
    --no-config                                                                # Avoid discovering configuration files (`pyproject.toml`, `uv.toml`)
    --help(-h)                                                                 # Display the concise help for this command
    --version(-V)                                                              # Display the uv version
  ]


  # Pin to a specific Python version
  export extern "uv python pin" [
  request?: string          # The Python version request
    --resolved                                                                # Write the resolved Python interpreter path instead of the request
    --no-resolved
    --no-project                                                              # Avoid validating the Python pin is compatible with the project or workspace
    --no-cache(-n)                                                            # Avoid reading from or writing to the cache, instead using a temporary directory for the duration of the operation
    --cache-dir: string                                                       # Path to the cache directory
    --python-preference: string@"nu-complete uv python_preference"            # Whether to prefer uv-managed or system Python installations
    --allow-python-downloads                                                  # Allow automatically downloading Python when required. [env: "UV_PYTHON_DOWNLOADS=auto"]
    --no-python-downloads                                                     # Disable automatic downloads of Python. [env: "UV_PYTHON_DOWNLOADS=never"]
    --quiet(-q)                                                               # Do not print any output
    --verbose(-v)                                                             # Use verbose output
    --no-color                                                                # Disable colors
    --color: string@"nu-complete uv color"                                    # Control colors in output
    --native-tls                                                              # Whether to load TLS certificates from the platform's native certificate store
    --no-native-tls
    --offline                                                                 # Disable network access
    --no-offline
    --allow-insecure-host: string                                             # Allow insecure connections to a host
    --preview                                                                 # Whether to enable experimental, preview features
    --no-preview
    --isolated                                                                # Avoid discovering a `pyproject.toml` or `uv.toml` file
    --show-settings                                                           # Show the resolved settings for the current command
    --no-progress                                                             # Hide all progress outputs
    --no-installer-metadata                                                   # Skip writing `uv` installer metadata files (e.g., `INSTALLER`, `REQUESTED`, and `direct_url.json`) to site-packages `.dist-info` directories
    --directory: string                                                       # Change to the given directory prior to running the command
    --project: string                                                         # Run the command within the given project directory
    --config-file: string                                                     # The path to a `uv.toml` file to use for configuration
    --no-config                                                               # Avoid discovering configuration files (`pyproject.toml`, `uv.toml`)
    --help(-h)                                                                # Display the concise help for this command
    --version(-V)                                                             # Display the uv version
  ]


  # Show the uv Python installation directory
  export extern "uv python dir" [
    --bin                                                                     # Show the directory into which `uv python` will install Python executables.
    --no-cache(-n)                                                            # Avoid reading from or writing to the cache, instead using a temporary directory for the duration of the operation
    --cache-dir: string                                                       # Path to the cache directory
    --python-preference: string@"nu-complete uv python_preference"            # Whether to prefer uv-managed or system Python installations
    --allow-python-downloads                                                  # Allow automatically downloading Python when required. [env: "UV_PYTHON_DOWNLOADS=auto"]
    --no-python-downloads                                                     # Disable automatic downloads of Python. [env: "UV_PYTHON_DOWNLOADS=never"]
    --quiet(-q)                                                               # Do not print any output
    --verbose(-v)                                                             # Use verbose output
    --no-color                                                                # Disable colors
    --color: string@"nu-complete uv color"                                    # Control colors in output
    --native-tls                                                              # Whether to load TLS certificates from the platform's native certificate store
    --no-native-tls
    --offline                                                                 # Disable network access
    --no-offline
    --allow-insecure-host: string                                             # Allow insecure connections to a host
    --preview                                                                 # Whether to enable experimental, preview features
    --no-preview
    --isolated                                                                # Avoid discovering a `pyproject.toml` or `uv.toml` file
    --show-settings                                                           # Show the resolved settings for the current command
    --no-progress                                                             # Hide all progress outputs
    --no-installer-metadata                                                   # Skip writing `uv` installer metadata files (e.g., `INSTALLER`, `REQUESTED`, and `direct_url.json`) to site-packages `.dist-info` directories
    --directory: string                                                       # Change to the given directory prior to running the command
    --project: string                                                         # Run the command within the given project directory
    --config-file: string                                                     # The path to a `uv.toml` file to use for configuration
    --no-config                                                               # Avoid discovering configuration files (`pyproject.toml`, `uv.toml`)
    --help(-h)                                                                # Display the concise help for this command
    --version(-V)                                                             # Display the uv version
  ]


  # Uninstall Python versions
  export extern "uv python uninstall" [
    --install-dir(-i): string                                                       # The directory where the Python was installed
...targets: string                                                                  # The Python version(s) to uninstall
    --all                                                                           # Uninstall all managed Python versions
    --no-cache(-n)                                                                  # Avoid reading from or writing to the cache, instead using a temporary directory for the duration of the operation
    --cache-dir: string                                                             # Path to the cache directory
    --python-preference: string@"nu-complete uv python_preference"                  # Whether to prefer uv-managed or system Python installations
    --allow-python-downloads                                                        # Allow automatically downloading Python when required. [env: "UV_PYTHON_DOWNLOADS=auto"]
    --no-python-downloads                                                           # Disable automatic downloads of Python. [env: "UV_PYTHON_DOWNLOADS=never"]
    --quiet(-q)                                                                     # Do not print any output
    --verbose(-v)                                                                   # Use verbose output
    --no-color                                                                      # Disable colors
    --color: string@"nu-complete uv color"                                          # Control colors in output
    --native-tls                                                                    # Whether to load TLS certificates from the platform's native certificate store
    --no-native-tls
    --offline                                                                       # Disable network access
    --no-offline
    --allow-insecure-host: string                                                   # Allow insecure connections to a host
    --preview                                                                       # Whether to enable experimental, preview features
    --no-preview
    --isolated                                                                      # Avoid discovering a `pyproject.toml` or `uv.toml` file
    --show-settings                                                                 # Show the resolved settings for the current command
    --no-progress                                                                   # Hide all progress outputs
    --no-installer-metadata                                                         # Skip writing `uv` installer metadata files (e.g., `INSTALLER`, `REQUESTED`, and `direct_url.json`) to site-packages `.dist-info` directories
    --directory: string                                                             # Change to the given directory prior to running the command
    --project: string                                                               # Run the command within the given project directory
    --config-file: string                                                           # The path to a `uv.toml` file to use for configuration
    --no-config                                                                     # Avoid discovering configuration files (`pyproject.toml`, `uv.toml`)
    --help(-h)                                                                      # Display the concise help for this command
    --version(-V)                                                                   # Display the uv version
  ]


  # Manage Python packages with a pip-compatible interface
  export extern "uv pip" [
    --no-cache(-n)                                                     # Avoid reading from or writing to the cache, instead using a temporary directory for the duration of the operation
    --cache-dir: string                                                # Path to the cache directory
    --python-preference: string@"nu-complete uv python_preference"     # Whether to prefer uv-managed or system Python installations
    --allow-python-downloads                                           # Allow automatically downloading Python when required. [env: "UV_PYTHON_DOWNLOADS=auto"]
    --no-python-downloads                                              # Disable automatic downloads of Python. [env: "UV_PYTHON_DOWNLOADS=never"]
    --quiet(-q)                                                        # Do not print any output
    --verbose(-v)                                                      # Use verbose output
    --no-color                                                         # Disable colors
    --color: string@"nu-complete uv color"                             # Control colors in output
    --native-tls                                                       # Whether to load TLS certificates from the platform's native certificate store
    --no-native-tls
    --offline                                                          # Disable network access
    --no-offline
    --allow-insecure-host: string                                      # Allow insecure connections to a host
    --preview                                                          # Whether to enable experimental, preview features
    --no-preview
    --isolated                                                         # Avoid discovering a `pyproject.toml` or `uv.toml` file
    --show-settings                                                    # Show the resolved settings for the current command
    --no-progress                                                      # Hide all progress outputs
    --no-installer-metadata                                            # Skip writing `uv` installer metadata files (e.g., `INSTALLER`, `REQUESTED`, and `direct_url.json`) to site-packages `.dist-info` directories
    --directory: string                                                # Change to the given directory prior to running the command
    --project: string                                                  # Run the command within the given project directory
    --config-file: string                                              # The path to a `uv.toml` file to use for configuration
    --no-config                                                        # Avoid discovering configuration files (`pyproject.toml`, `uv.toml`)
    --help(-h)                                                         # Display the concise help for this command
    --version(-V)                                                      # Display the uv version
  ]


  def "nu-complete uv pip compile annotation_style" [] {
    [ "line" "split" ]
  }

  def "nu-complete uv pip compile resolver" [] {
    [ "backtracking" "legacy" ]
  }


  # Compile a `requirements.in` file to a `requirements.txt` file
  export extern "uv pip compile" [
...src_file: string       # Include all packages listed in the given `requirements.in` files
    --constraints(-c): string                                                  # Constrain versions using the given requirements files
    --overrides: string                                                        # Override versions using the given requirements files
    --build-constraints(-b): string                                            # Constrain build dependencies using the given requirements files when building source distributions
    --extra: string                                                            # Include optional dependencies from the specified extra name; may be provided more than once
    --all-extras                                                               # Include all optional dependencies
    --no-all-extras
    --index: string                                                            # The URLs to use when resolving dependencies, in addition to the default index
    --default-index: string                                                    # The URL of the default package index (by default: <https://pypi.org/simple>)
    --find-links(-f): string                                                   # Locations to search for candidate distributions, in addition to those found in the registry indexes
    --no-index                                                                 # Ignore the registry index (e.g., PyPI), instead relying on direct URL dependencies and those provided via `--find-links`
    --upgrade(-U)                                                              # Allow package upgrades, ignoring pinned versions in any existing output file. Implies `--refresh`
    --no-upgrade
    --upgrade-package(-P): string                                              # Allow upgrades for a specific package, ignoring pinned versions in any existing output file. Implies `--refresh-package`
    --index-strategy: string@"nu-complete uv index_strategy"                   # The strategy to use when resolving against multiple index URLs
    --keyring-provider: string@"nu-complete uv keyring_provider"               # Attempt to use `keyring` for authentication for index URLs
    --resolution: string@"nu-complete uv resolution"                           # The strategy to use when selecting between the different compatible versions for a given package requirement
    --prerelease: string@"nu-complete uv prerelease"                           # The strategy to use when considering pre-release versions
    --fork-strategy: string@"nu-complete uv fork_strategy"                     # The strategy to use when selecting multiple versions of a given package across Python versions and platforms
    --config-setting(-C): string                                               # Settings to pass to the PEP 517 build backend, specified as `KEY=VALUE` pairs
    --no-build-isolation                                                       # Disable isolation when building source distributions
    --no-build-isolation-package: string                                       # Disable isolation when building source distributions for a specific package
    --build-isolation
    --exclude-newer: string                                                    # Limit candidate packages to those that were uploaded prior to the given date
    --link-mode: string@"nu-complete uv link_mode"                             # The method to use when installing packages from the global cache
    --no-sources                                                               # Ignore the `tool.uv.sources` table when resolving dependencies. Used to lock against the standards-compliant, publishable package metadata, as opposed to using any local or Git sources
    --refresh                                                                  # Refresh all cached data
    --no-refresh
    --refresh-package: string                                                  # Refresh cached data for a specific package
    --no-deps                                                                  # Ignore package dependencies, instead only add those packages explicitly listed on the command line to the resulting the requirements file
    --deps
    --output-file(-o): string                                                  # Write the compiled requirements to the given `requirements.txt` file
    --no-strip-extras                                                          # Include extras in the output file
    --strip-extras
    --no-strip-markers                                                         # Include environment markers in the output file
    --strip-markers
    --no-annotate                                                              # Exclude comment annotations indicating the source of each package
    --annotate
    --no-header                                                                # Exclude the comment header at the top of the generated output file
    --header
    --annotation-style: string@"nu-complete uv pip compile annotation_style"   # The style of the annotation comments included in the output file, used to indicate the source of each package
    --custom-compile-command: string                                           # The header comment to include at the top of the output file generated by `uv pip compile`
    --python: string                                                           # The Python interpreter to use during resolution.
    --system                                                                   # Install packages into the system Python environment
    --no-system
    --generate-hashes                                                          # Include distribution hashes in the output file
    --no-generate-hashes
    --no-build                                                                 # Don't build source distributions
    --build
    --no-binary: string                                                        # Don't install pre-built wheels
    --only-binary: string                                                      # Only use pre-built wheels; don't build source distributions
    --python-version(-p): string                                               # The Python version to use for resolution
    --python-platform: string@"nu-complete uv python_platform"                 # The platform for which requirements should be resolved
    --universal                                                                # Perform a universal resolution, attempting to generate a single `requirements.txt` output file that is compatible with all operating systems, architectures, and Python implementations
    --no-universal
    --no-emit-package: string                                                  # Specify a package to omit from the output resolution. Its dependencies will still be included in the resolution. Equivalent to pip-compile's `--unsafe-package` option
    --emit-index-url                                                           # Include `--index-url` and `--extra-index-url` entries in the generated output file
    --no-emit-index-url
    --emit-find-links                                                          # Include `--find-links` entries in the generated output file
    --no-emit-find-links
    --emit-build-options                                                       # Include `--no-binary` and `--only-binary` entries in the generated output file
    --no-emit-build-options
    --emit-marker-expression                                                   # Whether to emit a marker string indicating when it is known that the resulting set of pinned dependencies is valid
    --no-emit-marker-expression
    --emit-index-annotation                                                    # Include comment annotations indicating the index used to resolve each package (e.g., `# from https://pypi.org/simple`)
    --no-emit-index-annotation
    --allow-unsafe
    --no-allow-unsafe
    --reuse-hashes
    --no-reuse-hashes
    --resolver: string@"nu-complete uv pip compile resolver"
    --max-rounds: string
    --cert: string
    --client-cert: string
    --emit-trusted-host
    --no-emit-trusted-host
    --config: string
    --no-config
    --emit-options
    --no-emit-options
    --pip-args: string
    --no-cache(-n)                                                             # Avoid reading from or writing to the cache, instead using a temporary directory for the duration of the operation
    --cache-dir: string                                                        # Path to the cache directory
    --python-preference: string@"nu-complete uv python_preference"             # Whether to prefer uv-managed or system Python installations
    --allow-python-downloads                                                   # Allow automatically downloading Python when required. [env: "UV_PYTHON_DOWNLOADS=auto"]
    --no-python-downloads                                                      # Disable automatic downloads of Python. [env: "UV_PYTHON_DOWNLOADS=never"]
    --quiet(-q)                                                                # Do not print any output
    --verbose(-v)                                                              # Use verbose output
    --no-color                                                                 # Disable colors
    --color: string@"nu-complete uv color"                                     # Control colors in output
    --native-tls                                                               # Whether to load TLS certificates from the platform's native certificate store
    --no-native-tls
    --offline                                                                  # Disable network access
    --no-offline
    --allow-insecure-host: string                                              # Allow insecure connections to a host
    --preview                                                                  # Whether to enable experimental, preview features
    --no-preview
    --isolated                                                                 # Avoid discovering a `pyproject.toml` or `uv.toml` file
    --show-settings                                                            # Show the resolved settings for the current command
    --no-progress                                                              # Hide all progress outputs
    --no-installer-metadata                                                    # Skip writing `uv` installer metadata files (e.g., `INSTALLER`, `REQUESTED`, and `direct_url.json`) to site-packages `.dist-info` directories
    --directory: string                                                        # Change to the given directory prior to running the command
    --project: string                                                          # Run the command within the given project directory
    --config-file: string                                                      # The path to a `uv.toml` file to use for configuration
    --help(-h)                                                                 # Display the concise help for this command
    --version(-V)                                                              # Display the uv version
  ]

  # Sync an environment with a `requirements.txt` file
  export extern "uv pip sync" [
...src_file: string       # Include all packages listed in the given `requirements.txt` files
    --constraints(-c): string                                               # Constrain versions using the given requirements files
    --build-constraints(-b): string                                         # Constrain build dependencies using the given requirements files when building source distributions
    --index: string                                                         # The URLs to use when resolving dependencies, in addition to the default index
    --default-index: string                                                 # The URL of the default package index (by default: <https://pypi.org/simple>)
    --find-links(-f): string                                                # Locations to search for candidate distributions, in addition to those found in the registry indexes
    --no-index                                                              # Ignore the registry index (e.g., PyPI), instead relying on direct URL dependencies and those provided via `--find-links`
    --reinstall                                                             # Reinstall all packages, regardless of whether they're already installed. Implies `--refresh`
    --no-reinstall
    --reinstall-package: string                                             # Reinstall a specific package, regardless of whether it's already installed. Implies `--refresh-package`
    --index-strategy: string@"nu-complete uv index_strategy"                # The strategy to use when resolving against multiple index URLs
    --keyring-provider: string@"nu-complete uv keyring_provider"            # Attempt to use `keyring` for authentication for index URLs
    --config-setting(-C): string                                            # Settings to pass to the PEP 517 build backend, specified as `KEY=VALUE` pairs
    --no-build-isolation                                                    # Disable isolation when building source distributions
    --build-isolation
    --exclude-newer: string                                                 # Limit candidate packages to those that were uploaded prior to the given date
    --link-mode: string@"nu-complete uv link_mode"                          # The method to use when installing packages from the global cache
    --compile-bytecode                                                      # Compile Python files to bytecode after installation
    --no-compile-bytecode
    --no-sources                                                            # Ignore the `tool.uv.sources` table when resolving dependencies. Used to lock against the standards-compliant, publishable package metadata, as opposed to using any local or Git sources
    --refresh                                                               # Refresh all cached data
    --no-refresh
    --refresh-package: string                                               # Refresh cached data for a specific package
    --require-hashes                                                        # Require a matching hash for each requirement
    --no-require-hashes
    --verify-hashes
    --no-verify-hashes                                                      # Disable validation of hashes in the requirements file
    --python(-p): string                                                    # The Python interpreter into which packages should be installed.
    --system                                                                # Install packages into the system Python environment
    --no-system
    --break-system-packages                                                 # Allow uv to modify an `EXTERNALLY-MANAGED` Python installation
    --no-break-system-packages
    --target: string                                                        # Install packages into the specified directory, rather than into the virtual or system Python environment. The packages will be installed at the top-level of the directory
    --prefix: string                                                        # Install packages into `lib`, `bin`, and other top-level folders under the specified directory, as if a virtual environment were present at that location
    --no-build                                                              # Don't build source distributions
    --build
    --no-binary: string                                                     # Don't install pre-built wheels
    --only-binary: string                                                   # Only use pre-built wheels; don't build source distributions
    --allow-empty-requirements                                              # Allow sync of empty requirements, which will clear the environment of all packages
    --no-allow-empty-requirements
    --python-version: string                                                # The minimum Python version that should be supported by the requirements (e.g., `3.7` or `3.7.9`)
    --python-platform: string@"nu-complete uv python_platform"              # The platform for which requirements should be installed
    --strict                                                                # Validate the Python environment after completing the installation, to detect packages with missing dependencies or other issues
    --no-strict
    --dry-run                                                               # Perform a dry run, i.e., don't actually install anything but resolve the dependencies and print the resulting plan
    --ask(-a)
    --python-executable: string
    --user
    --cert: string
    --client-cert: string
    --config: string
    --no-config
    --pip-args: string
    --no-cache(-n)                                                          # Avoid reading from or writing to the cache, instead using a temporary directory for the duration of the operation
    --cache-dir: string                                                     # Path to the cache directory
    --python-preference: string@"nu-complete uv python_preference"          # Whether to prefer uv-managed or system Python installations
    --allow-python-downloads                                                # Allow automatically downloading Python when required. [env: "UV_PYTHON_DOWNLOADS=auto"]
    --no-python-downloads                                                   # Disable automatic downloads of Python. [env: "UV_PYTHON_DOWNLOADS=never"]
    --quiet(-q)                                                             # Do not print any output
    --verbose(-v)                                                           # Use verbose output
    --no-color                                                              # Disable colors
    --color: string@"nu-complete uv color"                                  # Control colors in output
    --native-tls                                                            # Whether to load TLS certificates from the platform's native certificate store
    --no-native-tls
    --offline                                                               # Disable network access
    --no-offline
    --allow-insecure-host: string                                           # Allow insecure connections to a host
    --preview                                                               # Whether to enable experimental, preview features
    --no-preview
    --isolated                                                              # Avoid discovering a `pyproject.toml` or `uv.toml` file
    --show-settings                                                         # Show the resolved settings for the current command
    --no-progress                                                           # Hide all progress outputs
    --no-installer-metadata                                                 # Skip writing `uv` installer metadata files (e.g., `INSTALLER`, `REQUESTED`, and `direct_url.json`) to site-packages `.dist-info` directories
    --directory: string                                                     # Change to the given directory prior to running the command
    --project: string                                                       # Run the command within the given project directory
    --config-file: string                                                   # The path to a `uv.toml` file to use for configuration
    --help(-h)                                                              # Display the concise help for this command
    --version(-V)                                                           # Display the uv version
  ]


  # Install packages into an environment
  export extern "uv pip install" [
...package: string        # Install all listed packages
    --requirements(-r): string                                                 # Install all packages listed in the given `requirements.txt` files
    --editable(-e): string                                                     # Install the editable package based on the provided local file path
    --constraints(-c): string                                                  # Constrain versions using the given requirements files
    --overrides: string                                                        # Override versions using the given requirements files
    --build-constraints(-b): string                                            # Constrain build dependencies using the given requirements files when building source distributions
    --extra: string                                                            # Include optional dependencies from the specified extra name; may be provided more than once
    --all-extras                                                               # Include all optional dependencies
    --no-all-extras
    --index: string                                                            # The URLs to use when resolving dependencies, in addition to the default index
    --default-index: string                                                    # The URL of the default package index (by default: <https://pypi.org/simple>)
    --find-links(-f): string                                                   # Locations to search for candidate distributions, in addition to those found in the registry indexes
    --no-index                                                                 # Ignore the registry index (e.g., PyPI), instead relying on direct URL dependencies and those provided via `--find-links`
    --upgrade(-U)                                                              # Allow package upgrades, ignoring pinned versions in any existing output file. Implies `--refresh`
    --no-upgrade
    --upgrade-package(-P): string                                              # Allow upgrades for a specific package, ignoring pinned versions in any existing output file. Implies `--refresh-package`
    --reinstall                                                                # Reinstall all packages, regardless of whether they're already installed. Implies `--refresh`
    --no-reinstall
    --reinstall-package: string                                                # Reinstall a specific package, regardless of whether it's already installed. Implies `--refresh-package`
    --index-strategy: string@"nu-complete uv index_strategy"                   # The strategy to use when resolving against multiple index URLs
    --keyring-provider: string@"nu-complete uv keyring_provider"               # Attempt to use `keyring` for authentication for index URLs
    --resolution: string@"nu-complete uv resolution"                           # The strategy to use when selecting between the different compatible versions for a given package requirement
    --prerelease: string@"nu-complete uv prerelease"                           # The strategy to use when considering pre-release versions
    --fork-strategy: string@"nu-complete uv fork_strategy"                     # The strategy to use when selecting multiple versions of a given package across Python versions and platforms
    --config-setting(-C): string                                               # Settings to pass to the PEP 517 build backend, specified as `KEY=VALUE` pairs
    --no-build-isolation                                                       # Disable isolation when building source distributions
    --no-build-isolation-package: string                                       # Disable isolation when building source distributions for a specific package
    --build-isolation
    --exclude-newer: string                                                    # Limit candidate packages to those that were uploaded prior to the given date
    --link-mode: string@"nu-complete uv link_mode"                             # The method to use when installing packages from the global cache
    --compile-bytecode                                                         # Compile Python files to bytecode after installation
    --no-compile-bytecode
    --no-sources                                                               # Ignore the `tool.uv.sources` table when resolving dependencies. Used to lock against the standards-compliant, publishable package metadata, as opposed to using any local or Git sources
    --refresh                                                                  # Refresh all cached data
    --no-refresh
    --refresh-package: string                                                  # Refresh cached data for a specific package
    --no-deps                                                                  # Ignore package dependencies, instead only installing those packages explicitly listed on the command line or in the requirements files
    --deps
    --require-hashes                                                           # Require a matching hash for each requirement
    --no-require-hashes
    --verify-hashes
    --no-verify-hashes                                                         # Disable validation of hashes in the requirements file
    --python(-p): string                                                       # The Python interpreter into which packages should be installed.
    --system                                                                   # Install packages into the system Python environment
    --no-system
    --break-system-packages                                                    # Allow uv to modify an `EXTERNALLY-MANAGED` Python installation
    --no-break-system-packages
    --target: string                                                           # Install packages into the specified directory, rather than into the virtual or system Python environment. The packages will be installed at the top-level of the directory
    --prefix: string                                                           # Install packages into `lib`, `bin`, and other top-level folders under the specified directory, as if a virtual environment were present at that location
    --no-build                                                                 # Don't build source distributions
    --build
    --no-binary: string                                                        # Don't install pre-built wheels
    --only-binary: string                                                      # Only use pre-built wheels; don't build source distributions
    --python-version: string                                                   # The minimum Python version that should be supported by the requirements (e.g., `3.7` or `3.7.9`)
    --python-platform: string@"nu-complete uv python_platform"                 # The platform for which requirements should be installed
    --inexact                                                                  # Do not remove extraneous packages present in the environment
    --exact                                                                    # Perform an exact sync, removing extraneous packages
    --strict                                                                   # Validate the Python environment after completing the installation, to detect packages with missing dependencies or other issues
    --no-strict
    --dry-run                                                                  # Perform a dry run, i.e., don't actually install anything but resolve the dependencies and print the resulting plan
    --disable-pip-version-check
    --user
    --no-cache(-n)                                                             # Avoid reading from or writing to the cache, instead using a temporary directory for the duration of the operation
    --cache-dir: string                                                        # Path to the cache directory
    --python-preference: string@"nu-complete uv python_preference"             # Whether to prefer uv-managed or system Python installations
    --allow-python-downloads                                                   # Allow automatically downloading Python when required. [env: "UV_PYTHON_DOWNLOADS=auto"]
    --no-python-downloads                                                      # Disable automatic downloads of Python. [env: "UV_PYTHON_DOWNLOADS=never"]
    --quiet(-q)                                                                # Do not print any output
    --verbose(-v)                                                              # Use verbose output
    --no-color                                                                 # Disable colors
    --color: string@"nu-complete uv color"                                     # Control colors in output
    --native-tls                                                               # Whether to load TLS certificates from the platform's native certificate store
    --no-native-tls
    --offline                                                                  # Disable network access
    --no-offline
    --allow-insecure-host: string                                              # Allow insecure connections to a host
    --preview                                                                  # Whether to enable experimental, preview features
    --no-preview
    --isolated                                                                 # Avoid discovering a `pyproject.toml` or `uv.toml` file
    --show-settings                                                            # Show the resolved settings for the current command
    --no-progress                                                              # Hide all progress outputs
    --no-installer-metadata                                                    # Skip writing `uv` installer metadata files (e.g., `INSTALLER`, `REQUESTED`, and `direct_url.json`) to site-packages `.dist-info` directories
    --directory: string                                                        # Change to the given directory prior to running the command
    --project: string                                                          # Run the command within the given project directory
    --config-file: string                                                      # The path to a `uv.toml` file to use for configuration
    --no-config                                                                # Avoid discovering configuration files (`pyproject.toml`, `uv.toml`)
    --help(-h)                                                                 # Display the concise help for this command
    --version(-V)                                                              # Display the uv version
  ]


  # Uninstall packages from an environment
  export extern "uv pip uninstall" [
...package: string        # Uninstall all listed packages
    --requirements(-r): string                                                   # Uninstall all packages listed in the given requirements files
    --python(-p): string                                                         # The Python interpreter from which packages should be uninstalled.
    --keyring-provider: string@"nu-complete uv keyring_provider"                 # Attempt to use `keyring` for authentication for remote requirements files
    --system                                                                     # Use the system Python to uninstall packages
    --no-system
    --break-system-packages                                                      # Allow uv to modify an `EXTERNALLY-MANAGED` Python installation
    --no-break-system-packages
    --target: string                                                             # Uninstall packages from the specified `--target` directory
    --prefix: string                                                             # Uninstall packages from the specified `--prefix` directory
    --dry-run                                                                    # Perform a dry run, i.e., don't actually uninstall anything but print the resulting plan
    --disable-pip-version-check
    --no-cache(-n)                                                               # Avoid reading from or writing to the cache, instead using a temporary directory for the duration of the operation
    --cache-dir: string                                                          # Path to the cache directory
    --python-preference: string@"nu-complete uv python_preference"               # Whether to prefer uv-managed or system Python installations
    --allow-python-downloads                                                     # Allow automatically downloading Python when required. [env: "UV_PYTHON_DOWNLOADS=auto"]
    --no-python-downloads                                                        # Disable automatic downloads of Python. [env: "UV_PYTHON_DOWNLOADS=never"]
    --quiet(-q)                                                                  # Do not print any output
    --verbose(-v)                                                                # Use verbose output
    --no-color                                                                   # Disable colors
    --color: string@"nu-complete uv color"                                       # Control colors in output
    --native-tls                                                                 # Whether to load TLS certificates from the platform's native certificate store
    --no-native-tls
    --offline                                                                    # Disable network access
    --no-offline
    --allow-insecure-host: string                                                # Allow insecure connections to a host
    --preview                                                                    # Whether to enable experimental, preview features
    --no-preview
    --isolated                                                                   # Avoid discovering a `pyproject.toml` or `uv.toml` file
    --show-settings                                                              # Show the resolved settings for the current command
    --no-progress                                                                # Hide all progress outputs
    --no-installer-metadata                                                      # Skip writing `uv` installer metadata files (e.g., `INSTALLER`, `REQUESTED`, and `direct_url.json`) to site-packages `.dist-info` directories
    --directory: string                                                          # Change to the given directory prior to running the command
    --project: string                                                            # Run the command within the given project directory
    --config-file: string                                                        # The path to a `uv.toml` file to use for configuration
    --no-config                                                                  # Avoid discovering configuration files (`pyproject.toml`, `uv.toml`)
    --help(-h)                                                                   # Display the concise help for this command
    --version(-V)                                                                # Display the uv version
  ]


  # List, in requirements format, packages installed in an environment
  export extern "uv pip freeze" [
    --exclude-editable                                                        # Exclude any editable packages from output
    --strict                                                                  # Validate the Python environment, to detect packages with missing dependencies and other issues
    --no-strict
    --python(-p): string                                                      # The Python interpreter for which packages should be listed.
    --system                                                                  # List packages in the system Python environment
    --no-system
    --disable-pip-version-check
    --no-cache(-n)                                                            # Avoid reading from or writing to the cache, instead using a temporary directory for the duration of the operation
    --cache-dir: string                                                       # Path to the cache directory
    --python-preference: string@"nu-complete uv python_preference"            # Whether to prefer uv-managed or system Python installations
    --allow-python-downloads                                                  # Allow automatically downloading Python when required. [env: "UV_PYTHON_DOWNLOADS=auto"]
    --no-python-downloads                                                     # Disable automatic downloads of Python. [env: "UV_PYTHON_DOWNLOADS=never"]
    --quiet(-q)                                                               # Do not print any output
    --verbose(-v)                                                             # Use verbose output
    --no-color                                                                # Disable colors
    --color: string@"nu-complete uv color"                                    # Control colors in output
    --native-tls                                                              # Whether to load TLS certificates from the platform's native certificate store
    --no-native-tls
    --offline                                                                 # Disable network access
    --no-offline
    --allow-insecure-host: string                                             # Allow insecure connections to a host
    --preview                                                                 # Whether to enable experimental, preview features
    --no-preview
    --isolated                                                                # Avoid discovering a `pyproject.toml` or `uv.toml` file
    --show-settings                                                           # Show the resolved settings for the current command
    --no-progress                                                             # Hide all progress outputs
    --no-installer-metadata                                                   # Skip writing `uv` installer metadata files (e.g., `INSTALLER`, `REQUESTED`, and `direct_url.json`) to site-packages `.dist-info` directories
    --directory: string                                                       # Change to the given directory prior to running the command
    --project: string                                                         # Run the command within the given project directory
    --config-file: string                                                     # The path to a `uv.toml` file to use for configuration
    --no-config                                                               # Avoid discovering configuration files (`pyproject.toml`, `uv.toml`)
    --help(-h)                                                                # Display the concise help for this command
    --version(-V)                                                             # Display the uv version
  ]

  def "nu-complete uv pip list format" [] {
    [ "columns" "freeze" "json" ]
  }

  # List, in tabular format, packages installed in an environment
  export extern "uv pip list" [
    --editable(-e)                                                          # Only include editable projects
    --exclude-editable                                                      # Exclude any editable packages from output
    --exclude: string                                                       # Exclude the specified package(s) from the output
    --format: string@"nu-complete uv pip list format"                       # Select the output format between: `columns` (default), `freeze`, or `json`
    --outdated                                                              # List outdated packages
    --no-outdated
    --strict                                                                # Validate the Python environment, to detect packages with missing dependencies and other issues
    --no-strict
    --index: string                                                         # The URLs to use when resolving dependencies, in addition to the default index
    --default-index: string                                                 # The URL of the default package index (by default: <https://pypi.org/simple>)
    --find-links(-f): string                                                # Locations to search for candidate distributions, in addition to those found in the registry indexes
    --no-index                                                              # Ignore the registry index (e.g., PyPI), instead relying on direct URL dependencies and those provided via `--find-links`
    --index-strategy: string@"nu-complete uv index_strategy"                # The strategy to use when resolving against multiple index URLs
    --keyring-provider: string@"nu-complete uv keyring_provider"            # Attempt to use `keyring` for authentication for index URLs
    --exclude-newer: string                                                 # Limit candidate packages to those that were uploaded prior to the given date
    --python(-p): string                                                    # The Python interpreter for which packages should be listed.
    --system                                                                # List packages in the system Python environment
    --no-system
    --disable-pip-version-check
    --no-cache(-n)                                                          # Avoid reading from or writing to the cache, instead using a temporary directory for the duration of the operation
    --cache-dir: string                                                     # Path to the cache directory
    --python-preference: string@"nu-complete uv python_preference"          # Whether to prefer uv-managed or system Python installations
    --allow-python-downloads                                                # Allow automatically downloading Python when required. [env: "UV_PYTHON_DOWNLOADS=auto"]
    --no-python-downloads                                                   # Disable automatic downloads of Python. [env: "UV_PYTHON_DOWNLOADS=never"]
    --quiet(-q)                                                             # Do not print any output
    --verbose(-v)                                                           # Use verbose output
    --no-color                                                              # Disable colors
    --color: string@"nu-complete uv color"                                  # Control colors in output
    --native-tls                                                            # Whether to load TLS certificates from the platform's native certificate store
    --no-native-tls
    --offline                                                               # Disable network access
    --no-offline
    --allow-insecure-host: string                                           # Allow insecure connections to a host
    --preview                                                               # Whether to enable experimental, preview features
    --no-preview
    --isolated                                                              # Avoid discovering a `pyproject.toml` or `uv.toml` file
    --show-settings                                                         # Show the resolved settings for the current command
    --no-progress                                                           # Hide all progress outputs
    --no-installer-metadata                                                 # Skip writing `uv` installer metadata files (e.g., `INSTALLER`, `REQUESTED`, and `direct_url.json`) to site-packages `.dist-info` directories
    --directory: string                                                     # Change to the given directory prior to running the command
    --project: string                                                       # Run the command within the given project directory
    --config-file: string                                                   # The path to a `uv.toml` file to use for configuration
    --no-config                                                             # Avoid discovering configuration files (`pyproject.toml`, `uv.toml`)
    --help(-h)                                                              # Display the concise help for this command
    --version(-V)                                                           # Display the uv version
  ]


  # Show information about one or more installed packages
  export extern "uv pip show" [
...package: string        # The package(s) to display
    --strict                                                                # Validate the Python environment, to detect packages with missing dependencies and other issues
    --no-strict
    --files(-f)                                                             # Show the full list of installed files for each package
    --python(-p): string                                                    # The Python interpreter to find the package in.
    --system                                                                # Show a package in the system Python environment
    --no-system
    --disable-pip-version-check
    --no-cache(-n)                                                          # Avoid reading from or writing to the cache, instead using a temporary directory for the duration of the operation
    --cache-dir: string                                                     # Path to the cache directory
    --python-preference: string@"nu-complete uv python_preference"          # Whether to prefer uv-managed or system Python installations
    --allow-python-downloads                                                # Allow automatically downloading Python when required. [env: "UV_PYTHON_DOWNLOADS=auto"]
    --no-python-downloads                                                   # Disable automatic downloads of Python. [env: "UV_PYTHON_DOWNLOADS=never"]
    --quiet(-q)                                                             # Do not print any output
    --verbose(-v)                                                           # Use verbose output
    --no-color                                                              # Disable colors
    --color: string@"nu-complete uv color"                                  # Control colors in output
    --native-tls                                                            # Whether to load TLS certificates from the platform's native certificate store
    --no-native-tls
    --offline                                                               # Disable network access
    --no-offline
    --allow-insecure-host: string                                           # Allow insecure connections to a host
    --preview                                                               # Whether to enable experimental, preview features
    --no-preview
    --isolated                                                              # Avoid discovering a `pyproject.toml` or `uv.toml` file
    --show-settings                                                         # Show the resolved settings for the current command
    --no-progress                                                           # Hide all progress outputs
    --no-installer-metadata                                                 # Skip writing `uv` installer metadata files (e.g., `INSTALLER`, `REQUESTED`, and `direct_url.json`) to site-packages `.dist-info` directories
    --directory: string                                                     # Change to the given directory prior to running the command
    --project: string                                                       # Run the command within the given project directory
    --config-file: string                                                   # The path to a `uv.toml` file to use for configuration
    --no-config                                                             # Avoid discovering configuration files (`pyproject.toml`, `uv.toml`)
    --help(-h)                                                              # Display the concise help for this command
    --version(-V)                                                           # Display the uv version
  ]


  # Display the dependency tree for an environment
  export extern "uv pip tree" [
    --show-version-specifiers                                               # Show the version constraint(s) imposed on each package
    --depth(-d): string                                                     # Maximum display depth of the dependency tree
    --prune: string                                                         # Prune the given package from the display of the dependency tree
    --package: string                                                       # Display only the specified packages
    --no-dedupe                                                             # Do not de-duplicate repeated dependencies. Usually, when a package has already displayed its dependencies, further occurrences will not re-display its dependencies, and will include a (*) to indicate it has already been shown. This flag will cause those duplicates to be repeated
    --invert                                                                # Show the reverse dependencies for the given package. This flag will invert the tree and display the packages that depend on the given package
    --outdated                                                              # Show the latest available version of each package in the tree
    --strict                                                                # Validate the Python environment, to detect packages with missing dependencies and other issues
    --no-strict
    --python(-p): string                                                    # The Python interpreter for which packages should be listed.
    --system                                                                # List packages in the system Python environment
    --no-system
    --disable-pip-version-check
    --no-cache(-n)                                                          # Avoid reading from or writing to the cache, instead using a temporary directory for the duration of the operation
    --cache-dir: string                                                     # Path to the cache directory
    --python-preference: string@"nu-complete uv python_preference"          # Whether to prefer uv-managed or system Python installations
    --allow-python-downloads                                                # Allow automatically downloading Python when required. [env: "UV_PYTHON_DOWNLOADS=auto"]
    --no-python-downloads                                                   # Disable automatic downloads of Python. [env: "UV_PYTHON_DOWNLOADS=never"]
    --quiet(-q)                                                             # Do not print any output
    --verbose(-v)                                                           # Use verbose output
    --no-color                                                              # Disable colors
    --color: string@"nu-complete uv color"                                  # Control colors in output
    --native-tls                                                            # Whether to load TLS certificates from the platform's native certificate store
    --no-native-tls
    --offline                                                               # Disable network access
    --no-offline
    --allow-insecure-host: string                                           # Allow insecure connections to a host
    --preview                                                               # Whether to enable experimental, preview features
    --no-preview
    --isolated                                                              # Avoid discovering a `pyproject.toml` or `uv.toml` file
    --show-settings                                                         # Show the resolved settings for the current command
    --no-progress                                                           # Hide all progress outputs
    --no-installer-metadata                                                 # Skip writing `uv` installer metadata files (e.g., `INSTALLER`, `REQUESTED`, and `direct_url.json`) to site-packages `.dist-info` directories
    --directory: string                                                     # Change to the given directory prior to running the command
    --project: string                                                       # Run the command within the given project directory
    --config-file: string                                                   # The path to a `uv.toml` file to use for configuration
    --no-config                                                             # Avoid discovering configuration files (`pyproject.toml`, `uv.toml`)
    --help(-h)                                                              # Display the concise help for this command
    --version(-V)                                                           # Display the uv version
  ]


  # Verify installed packages have compatible dependencies
  export extern "uv pip check" [
    --python(-p): string                                                     # The Python interpreter for which packages should be checked.
    --system                                                                 # Check packages in the system Python environment
    --no-system
    --no-cache(-n)                                                           # Avoid reading from or writing to the cache, instead using a temporary directory for the duration of the operation
    --cache-dir: string                                                      # Path to the cache directory
    --python-preference: string@"nu-complete uv python_preference"           # Whether to prefer uv-managed or system Python installations
    --allow-python-downloads                                                 # Allow automatically downloading Python when required. [env: "UV_PYTHON_DOWNLOADS=auto"]
    --no-python-downloads                                                    # Disable automatic downloads of Python. [env: "UV_PYTHON_DOWNLOADS=never"]
    --quiet(-q)                                                              # Do not print any output
    --verbose(-v)                                                            # Use verbose output
    --no-color                                                               # Disable colors
    --color: string@"nu-complete uv color"                                   # Control colors in output
    --native-tls                                                             # Whether to load TLS certificates from the platform's native certificate store
    --no-native-tls
    --offline                                                                # Disable network access
    --no-offline
    --allow-insecure-host: string                                            # Allow insecure connections to a host
    --preview                                                                # Whether to enable experimental, preview features
    --no-preview
    --isolated                                                               # Avoid discovering a `pyproject.toml` or `uv.toml` file
    --show-settings                                                          # Show the resolved settings for the current command
    --no-progress                                                            # Hide all progress outputs
    --no-installer-metadata                                                  # Skip writing `uv` installer metadata files (e.g., `INSTALLER`, `REQUESTED`, and `direct_url.json`) to site-packages `.dist-info` directories
    --directory: string                                                      # Change to the given directory prior to running the command
    --project: string                                                        # Run the command within the given project directory
    --config-file: string                                                    # The path to a `uv.toml` file to use for configuration
    --no-config                                                              # Avoid discovering configuration files (`pyproject.toml`, `uv.toml`)
    --help(-h)                                                               # Display the concise help for this command
    --version(-V)                                                            # Display the uv version
  ]

  # Create a virtual environment
  export extern "uv venv" [
    --python(-p): string                                                # The Python interpreter to use for the virtual environment.
    --system                                                            # Ignore virtual environments when searching for the Python interpreter
    --no-system                                                         # This flag is included for compatibility only, it has no effect
    --no-project                                                        # Avoid discovering a project or workspace
    --seed                                                              # Install seed packages (one or more of: `pip`, `setuptools`, and `wheel`) into the virtual environment
    --allow-existing                                                    # Preserve any existing files or directories at the target path
  path?: string                                                         # The path to the virtual environment to create
    --prompt: string                                                    # Provide an alternative prompt prefix for the virtual environment.
    --system-site-packages                                              # Give the virtual environment access to the system site packages directory
    --relocatable                                                       # Make the virtual environment relocatable
    --index: string                                                     # The URLs to use when resolving dependencies, in addition to the default index
    --default-index: string                                             # The URL of the default package index (by default: <https://pypi.org/simple>)
    --find-links(-f): string                                            # Locations to search for candidate distributions, in addition to those found in the registry indexes
    --no-index                                                          # Ignore the registry index (e.g., PyPI), instead relying on direct URL dependencies and those provided via `--find-links`
    --index-strategy: string@"nu-complete uv index_strategy"            # The strategy to use when resolving against multiple index URLs
    --keyring-provider: string@"nu-complete uv keyring_provider"        # Attempt to use `keyring` for authentication for index URLs
    --exclude-newer: string                                             # Limit candidate packages to those that were uploaded prior to the given date
    --link-mode: string@"nu-complete uv link_mode"                      # The method to use when installing packages from the global cache
    --clear
    --no-seed
    --no-pip
    --no-setuptools
    --no-wheel
    --no-cache(-n)                                                      # Avoid reading from or writing to the cache, instead using a temporary directory for the duration of the operation
    --cache-dir: string                                                 # Path to the cache directory
    --python-preference: string@"nu-complete uv python_preference"      # Whether to prefer uv-managed or system Python installations
    --allow-python-downloads                                            # Allow automatically downloading Python when required. [env: "UV_PYTHON_DOWNLOADS=auto"]
    --no-python-downloads                                               # Disable automatic downloads of Python. [env: "UV_PYTHON_DOWNLOADS=never"]
    --quiet(-q)                                                         # Do not print any output
    --verbose(-v)                                                       # Use verbose output
    --no-color                                                          # Disable colors
    --color: string@"nu-complete uv color"                              # Control colors in output
    --native-tls                                                        # Whether to load TLS certificates from the platform's native certificate store
    --no-native-tls
    --offline                                                           # Disable network access
    --no-offline
    --allow-insecure-host: string                                       # Allow insecure connections to a host
    --preview                                                           # Whether to enable experimental, preview features
    --no-preview
    --isolated                                                          # Avoid discovering a `pyproject.toml` or `uv.toml` file
    --show-settings                                                     # Show the resolved settings for the current command
    --no-progress                                                       # Hide all progress outputs
    --no-installer-metadata                                             # Skip writing `uv` installer metadata files (e.g., `INSTALLER`, `REQUESTED`, and `direct_url.json`) to site-packages `.dist-info` directories
    --directory: string                                                 # Change to the given directory prior to running the command
    --project: string                                                   # Run the command within the given project directory
    --config-file: string                                               # The path to a `uv.toml` file to use for configuration
    --no-config                                                         # Avoid discovering configuration files (`pyproject.toml`, `uv.toml`)
    --help(-h)                                                          # Display the concise help for this command
    --version(-V)                                                       # Display the uv version
  ]


  # Build Python packages into source distributions and wheels
  export extern "uv build" [
  src?: string              # The directory from which distributions should be built, or a source distribution archive to build into a wheel
    --package: string                                                    # Build a specific package in the workspace
    --all-packages                                                       # Builds all packages in the workspace
    --out-dir(-o): string                                                # The output directory to which distributions should be written
    --sdist                                                              # Build a source distribution ("sdist") from the given directory
    --wheel                                                              # Build a binary distribution ("wheel") from the given directory
    --list                                                               # When using the uv build backend, list the files that would be included when building
    --build-logs
    --no-build-logs                                                      # Hide logs from the build backend
    --force-pep517                                                       # Always build through PEP 517, don't use the fast path for the uv build backend
    --build-constraints(-b): string                                      # Constrain build dependencies using the given requirements files when building distributions
    --require-hashes                                                     # Require a matching hash for each requirement
    --no-require-hashes
    --verify-hashes
    --no-verify-hashes                                                   # Disable validation of hashes in the requirements file
    --python(-p): string                                                 # The Python interpreter to use for the build environment.
    --index: string                                                      # The URLs to use when resolving dependencies, in addition to the default index
    --default-index: string                                              # The URL of the default package index (by default: <https://pypi.org/simple>)
    --find-links(-f): string                                             # Locations to search for candidate distributions, in addition to those found in the registry indexes
    --no-index                                                           # Ignore the registry index (e.g., PyPI), instead relying on direct URL dependencies and those provided via `--find-links`
    --upgrade(-U)                                                        # Allow package upgrades, ignoring pinned versions in any existing output file. Implies `--refresh`
    --no-upgrade
    --upgrade-package(-P): string                                        # Allow upgrades for a specific package, ignoring pinned versions in any existing output file. Implies `--refresh-package`
    --index-strategy: string@"nu-complete uv index_strategy"             # The strategy to use when resolving against multiple index URLs
    --keyring-provider: string@"nu-complete uv keyring_provider"         # Attempt to use `keyring` for authentication for index URLs
    --resolution: string@"nu-complete uv resolution"                     # The strategy to use when selecting between the different compatible versions for a given package requirement
    --prerelease: string@"nu-complete uv prerelease"                     # The strategy to use when considering pre-release versions
    --fork-strategy: string@"nu-complete uv fork_strategy"               # The strategy to use when selecting multiple versions of a given package across Python versions and platforms
    --config-setting(-C): string                                         # Settings to pass to the PEP 517 build backend, specified as `KEY=VALUE` pairs
    --no-build-isolation                                                 # Disable isolation when building source distributions
    --no-build-isolation-package: string                                 # Disable isolation when building source distributions for a specific package
    --build-isolation
    --exclude-newer: string                                              # Limit candidate packages to those that were uploaded prior to the given date
    --link-mode: string@"nu-complete uv link_mode"                       # The method to use when installing packages from the global cache
    --no-sources                                                         # Ignore the `tool.uv.sources` table when resolving dependencies. Used to lock against the standards-compliant, publishable package metadata, as opposed to using any local or Git sources
    --no-build                                                           # Don't build source distributions
    --build
    --no-build-package: string                                           # Don't build source distributions for a specific package
    --no-binary                                                          # Don't install pre-built wheels
    --binary
    --no-binary-package: string                                          # Don't install pre-built wheels for a specific package
    --refresh                                                            # Refresh all cached data
    --no-refresh
    --refresh-package: string                                            # Refresh cached data for a specific package
    --no-cache(-n)                                                       # Avoid reading from or writing to the cache, instead using a temporary directory for the duration of the operation
    --cache-dir: string                                                  # Path to the cache directory
    --python-preference: string@"nu-complete uv python_preference"       # Whether to prefer uv-managed or system Python installations
    --allow-python-downloads                                             # Allow automatically downloading Python when required. [env: "UV_PYTHON_DOWNLOADS=auto"]
    --no-python-downloads                                                # Disable automatic downloads of Python. [env: "UV_PYTHON_DOWNLOADS=never"]
    --quiet(-q)                                                          # Do not print any output
    --verbose(-v)                                                        # Use verbose output
    --no-color                                                           # Disable colors
    --color: string@"nu-complete uv color"                               # Control colors in output
    --native-tls                                                         # Whether to load TLS certificates from the platform's native certificate store
    --no-native-tls
    --offline                                                            # Disable network access
    --no-offline
    --allow-insecure-host: string                                        # Allow insecure connections to a host
    --preview                                                            # Whether to enable experimental, preview features
    --no-preview
    --isolated                                                           # Avoid discovering a `pyproject.toml` or `uv.toml` file
    --show-settings                                                      # Show the resolved settings for the current command
    --no-progress                                                        # Hide all progress outputs
    --no-installer-metadata                                              # Skip writing `uv` installer metadata files (e.g., `INSTALLER`, `REQUESTED`, and `direct_url.json`) to site-packages `.dist-info` directories
    --directory: string                                                  # Change to the given directory prior to running the command
    --project: string                                                    # Run the command within the given project directory
    --config-file: string                                                # The path to a `uv.toml` file to use for configuration
    --no-config                                                          # Avoid discovering configuration files (`pyproject.toml`, `uv.toml`)
    --help(-h)                                                           # Display the concise help for this command
    --version(-V)                                                        # Display the uv version
  ]

  def "nu-complete uv publish trusted_publishing" [] {
    [ "automatic" "always" "never" ]
  }


  # Upload distributions to an index
  export extern "uv publish" [
...files: string          # Paths to the files to upload. Accepts glob expressions
    --index: string                                                          # The name of an index in the configuration to use for publishing
    --username(-u): string                                                   # The username for the upload
    --password(-p): string                                                   # The password for the upload
    --token(-t): string                                                      # The token for the upload
    --trusted-publishing: string@"nu-complete uv publish trusted_publishing" # Configure using trusted publishing through GitHub Actions
    --keyring-provider: string@"nu-complete uv keyring_provider"             # Attempt to use `keyring` for authentication for remote requirements files
    --publish-url: string                                                    # The URL of the upload endpoint (not the index URL)
    --check-url: string                                                      # Check an index URL for existing files to skip duplicate uploads
    --skip-existing
    --no-cache(-n)                                                           # Avoid reading from or writing to the cache, instead using a temporary directory for the duration of the operation
    --cache-dir: string                                                      # Path to the cache directory
    --python-preference: string@"nu-complete uv python_preference"           # Whether to prefer uv-managed or system Python installations
    --allow-python-downloads                                                 # Allow automatically downloading Python when required. [env: "UV_PYTHON_DOWNLOADS=auto"]
    --no-python-downloads                                                    # Disable automatic downloads of Python. [env: "UV_PYTHON_DOWNLOADS=never"]
    --quiet(-q)                                                              # Do not print any output
    --verbose(-v)                                                            # Use verbose output
    --no-color                                                               # Disable colors
    --color: string@"nu-complete uv color"                                   # Control colors in output
    --native-tls                                                             # Whether to load TLS certificates from the platform's native certificate store
    --no-native-tls
    --offline                                                                # Disable network access
    --no-offline
    --allow-insecure-host: string                                            # Allow insecure connections to a host
    --preview                                                                # Whether to enable experimental, preview features
    --no-preview
    --isolated                                                               # Avoid discovering a `pyproject.toml` or `uv.toml` file
    --show-settings                                                          # Show the resolved settings for the current command
    --no-progress                                                            # Hide all progress outputs
    --no-installer-metadata                                                  # Skip writing `uv` installer metadata files (e.g., `INSTALLER`, `REQUESTED`, and `direct_url.json`) to site-packages `.dist-info` directories
    --directory: string                                                      # Change to the given directory prior to running the command
    --project: string                                                        # Run the command within the given project directory
    --config-file: string                                                    # The path to a `uv.toml` file to use for configuration
    --no-config                                                              # Avoid discovering configuration files (`pyproject.toml`, `uv.toml`)
    --help(-h)                                                               # Display the concise help for this command
    --version(-V)                                                            # Display the uv version
  ]


  # The implementation of the build backend
  export extern "uv build-backend" [
    --no-cache(-n)                                                               # Avoid reading from or writing to the cache, instead using a temporary directory for the duration of the operation
    --cache-dir: string                                                          # Path to the cache directory
    --python-preference: string@"nu-complete uv python_preference"               # Whether to prefer uv-managed or system Python installations
    --allow-python-downloads                                                     # Allow automatically downloading Python when required. [env: "UV_PYTHON_DOWNLOADS=auto"]
    --no-python-downloads                                                        # Disable automatic downloads of Python. [env: "UV_PYTHON_DOWNLOADS=never"]
    --quiet(-q)                                                                  # Do not print any output
    --verbose(-v)                                                                # Use verbose output
    --no-color                                                                   # Disable colors
    --color: string@"nu-complete uv color"                                       # Control colors in output
    --native-tls                                                                 # Whether to load TLS certificates from the platform's native certificate store
    --no-native-tls
    --offline                                                                    # Disable network access
    --no-offline
    --allow-insecure-host: string                                                # Allow insecure connections to a host
    --preview                                                                    # Whether to enable experimental, preview features
    --no-preview
    --isolated                                                                   # Avoid discovering a `pyproject.toml` or `uv.toml` file
    --show-settings                                                              # Show the resolved settings for the current command
    --no-progress                                                                # Hide all progress outputs
    --no-installer-metadata                                                      # Skip writing `uv` installer metadata files (e.g., `INSTALLER`, `REQUESTED`, and `direct_url.json`) to site-packages `.dist-info` directories
    --directory: string                                                          # Change to the given directory prior to running the command
    --project: string                                                            # Run the command within the given project directory
    --config-file: string                                                        # The path to a `uv.toml` file to use for configuration
    --no-config                                                                  # Avoid discovering configuration files (`pyproject.toml`, `uv.toml`)
    --help(-h)                                                                   # Display the concise help for this command
    --version(-V)                                                                # Display the uv version
  ]


  # PEP 517 hook `build_sdist`
  export extern "uv build-backend build-sdist" [
  sdist_directory: string
    --no-cache(-n)                                                                           # Avoid reading from or writing to the cache, instead using a temporary directory for the duration of the operation
    --cache-dir: string                                                                      # Path to the cache directory
    --python-preference: string@"nu-complete uv python_preference"                           # Whether to prefer uv-managed or system Python installations
    --allow-python-downloads                                                                 # Allow automatically downloading Python when required. [env: "UV_PYTHON_DOWNLOADS=auto"]
    --no-python-downloads                                                                    # Disable automatic downloads of Python. [env: "UV_PYTHON_DOWNLOADS=never"]
    --quiet(-q)                                                                              # Do not print any output
    --verbose(-v)                                                                            # Use verbose output
    --no-color                                                                               # Disable colors
    --color: string@"nu-complete uv color"                                                   # Control colors in output
    --native-tls                                                                             # Whether to load TLS certificates from the platform's native certificate store
    --no-native-tls
    --offline                                                                                # Disable network access
    --no-offline
    --allow-insecure-host: string                                                            # Allow insecure connections to a host
    --preview                                                                                # Whether to enable experimental, preview features
    --no-preview
    --isolated                                                                               # Avoid discovering a `pyproject.toml` or `uv.toml` file
    --show-settings                                                                          # Show the resolved settings for the current command
    --no-progress                                                                            # Hide all progress outputs
    --no-installer-metadata                                                                  # Skip writing `uv` installer metadata files (e.g., `INSTALLER`, `REQUESTED`, and `direct_url.json`) to site-packages `.dist-info` directories
    --directory: string                                                                      # Change to the given directory prior to running the command
    --project: string                                                                        # Run the command within the given project directory
    --config-file: string                                                                    # The path to a `uv.toml` file to use for configuration
    --no-config                                                                              # Avoid discovering configuration files (`pyproject.toml`, `uv.toml`)
    --help(-h)                                                                               # Display the concise help for this command
    --version(-V)                                                                            # Display the uv version
  ]


  # PEP 517 hook `build_wheel`
  export extern "uv build-backend build-wheel" [
    wheel_directory: string
    --metadata-directory: string
    --no-cache(-n)                                                                           # Avoid reading from or writing to the cache, instead using a temporary directory for the duration of the operation
    --cache-dir: string                                                                      # Path to the cache directory
    --python-preference: string@"nu-complete uv python_preference"                           # Whether to prefer uv-managed or system Python installations
    --allow-python-downloads                                                                 # Allow automatically downloading Python when required. [env: "UV_PYTHON_DOWNLOADS=auto"]
    --no-python-downloads                                                                    # Disable automatic downloads of Python. [env: "UV_PYTHON_DOWNLOADS=never"]
    --quiet(-q)                                                                              # Do not print any output
    --verbose(-v)                                                                            # Use verbose output
    --no-color                                                                               # Disable colors
    --color: string@"nu-complete uv color"                                                   # Control colors in output
    --native-tls                                                                             # Whether to load TLS certificates from the platform's native certificate store
    --no-native-tls
    --offline                                                                                # Disable network access
    --no-offline
    --allow-insecure-host: string                                                            # Allow insecure connections to a host
    --preview                                                                                # Whether to enable experimental, preview features
    --no-preview
    --isolated                                                                               # Avoid discovering a `pyproject.toml` or `uv.toml` file
    --show-settings                                                                          # Show the resolved settings for the current command
    --no-progress                                                                            # Hide all progress outputs
    --no-installer-metadata                                                                  # Skip writing `uv` installer metadata files (e.g., `INSTALLER`, `REQUESTED`, and `direct_url.json`) to site-packages `.dist-info` directories
    --directory: string                                                                      # Change to the given directory prior to running the command
    --project: string                                                                        # Run the command within the given project directory
    --config-file: string                                                                    # The path to a `uv.toml` file to use for configuration
    --no-config                                                                              # Avoid discovering configuration files (`pyproject.toml`, `uv.toml`)
    --help(-h)                                                                               # Display the concise help for this command
    --version(-V)                                                                            # Display the uv version
  ]


  # PEP 660 hook `build_editable`
  export extern "uv build-backend build-editable" [
    wheel_directory: string
    --metadata-directory: string
    --no-cache(-n)                                                                              # Avoid reading from or writing to the cache, instead using a temporary directory for the duration of the operation
    --cache-dir: string                                                                         # Path to the cache directory
    --python-preference: string@"nu-complete uv python_preference"                              # Whether to prefer uv-managed or system Python installations
    --allow-python-downloads                                                                    # Allow automatically downloading Python when required. [env: "UV_PYTHON_DOWNLOADS=auto"]
    --no-python-downloads                                                                       # Disable automatic downloads of Python. [env: "UV_PYTHON_DOWNLOADS=never"]
    --quiet(-q)                                                                                 # Do not print any output
    --verbose(-v)                                                                               # Use verbose output
    --no-color                                                                                  # Disable colors
    --color: string@"nu-complete uv color"                                                      # Control colors in output
    --native-tls                                                                                # Whether to load TLS certificates from the platform's native certificate store
    --no-native-tls
    --offline                                                                                   # Disable network access
    --no-offline
    --allow-insecure-host: string                                                               # Allow insecure connections to a host
    --preview                                                                                   # Whether to enable experimental, preview features
    --no-preview
    --isolated                                                                                  # Avoid discovering a `pyproject.toml` or `uv.toml` file
    --show-settings                                                                             # Show the resolved settings for the current command
    --no-progress                                                                               # Hide all progress outputs
    --no-installer-metadata                                                                     # Skip writing `uv` installer metadata files (e.g., `INSTALLER`, `REQUESTED`, and `direct_url.json`) to site-packages `.dist-info` directories
    --directory: string                                                                         # Change to the given directory prior to running the command
    --project: string                                                                           # Run the command within the given project directory
    --config-file: string                                                                       # The path to a `uv.toml` file to use for configuration
    --no-config                                                                                 # Avoid discovering configuration files (`pyproject.toml`, `uv.toml`)
    --help(-h)                                                                                  # Display the concise help for this command
    --version(-V)                                                                               # Display the uv version
  ]


  # PEP 517 hook `get_requires_for_build_sdist`
  export extern "uv build-backend get-requires-for-build-sdist" [
    --no-cache(-n)                                                                                            # Avoid reading from or writing to the cache, instead using a temporary directory for the duration of the operation
    --cache-dir: string                                                                                       # Path to the cache directory
    --python-preference: string@"nu-complete uv python_preference"                                            # Whether to prefer uv-managed or system Python installations
    --allow-python-downloads                                                                                  # Allow automatically downloading Python when required. [env: "UV_PYTHON_DOWNLOADS=auto"]
    --no-python-downloads                                                                                     # Disable automatic downloads of Python. [env: "UV_PYTHON_DOWNLOADS=never"]
    --quiet(-q)                                                                                               # Do not print any output
    --verbose(-v)                                                                                             # Use verbose output
    --no-color                                                                                                # Disable colors
    --color: string@"nu-complete uv color"                                                                    # Control colors in output
    --native-tls                                                                                              # Whether to load TLS certificates from the platform's native certificate store
    --no-native-tls
    --offline                                                                                                 # Disable network access
    --no-offline
    --allow-insecure-host: string                                                                             # Allow insecure connections to a host
    --preview                                                                                                 # Whether to enable experimental, preview features
    --no-preview
    --isolated                                                                                                # Avoid discovering a `pyproject.toml` or `uv.toml` file
    --show-settings                                                                                           # Show the resolved settings for the current command
    --no-progress                                                                                             # Hide all progress outputs
    --no-installer-metadata                                                                                   # Skip writing `uv` installer metadata files (e.g., `INSTALLER`, `REQUESTED`, and `direct_url.json`) to site-packages `.dist-info` directories
    --directory: string                                                                                       # Change to the given directory prior to running the command
    --project: string                                                                                         # Run the command within the given project directory
    --config-file: string                                                                                     # The path to a `uv.toml` file to use for configuration
    --no-config                                                                                               # Avoid discovering configuration files (`pyproject.toml`, `uv.toml`)
    --help(-h)                                                                                                # Display the concise help for this command
    --version(-V)                                                                                             # Display the uv version
  ]


  # PEP 517 hook `get_requires_for_build_wheel`
  export extern "uv build-backend get-requires-for-build-wheel" [
    --no-cache(-n)                                                                                            # Avoid reading from or writing to the cache, instead using a temporary directory for the duration of the operation
    --cache-dir: string                                                                                       # Path to the cache directory
    --python-preference: string@"nu-complete uv python_preference"                                            # Whether to prefer uv-managed or system Python installations
    --allow-python-downloads                                                                                  # Allow automatically downloading Python when required. [env: "UV_PYTHON_DOWNLOADS=auto"]
    --no-python-downloads                                                                                     # Disable automatic downloads of Python. [env: "UV_PYTHON_DOWNLOADS=never"]
    --quiet(-q)                                                                                               # Do not print any output
    --verbose(-v)                                                                                             # Use verbose output
    --no-color                                                                                                # Disable colors
    --color: string@"nu-complete uv color"                                                                    # Control colors in output
    --native-tls                                                                                              # Whether to load TLS certificates from the platform's native certificate store
    --no-native-tls
    --offline                                                                                                 # Disable network access
    --no-offline
    --allow-insecure-host: string                                                                             # Allow insecure connections to a host
    --preview                                                                                                 # Whether to enable experimental, preview features
    --no-preview
    --isolated                                                                                                # Avoid discovering a `pyproject.toml` or `uv.toml` file
    --show-settings                                                                                           # Show the resolved settings for the current command
    --no-progress                                                                                             # Hide all progress outputs
    --no-installer-metadata                                                                                   # Skip writing `uv` installer metadata files (e.g., `INSTALLER`, `REQUESTED`, and `direct_url.json`) to site-packages `.dist-info` directories
    --directory: string                                                                                       # Change to the given directory prior to running the command
    --project: string                                                                                         # Run the command within the given project directory
    --config-file: string                                                                                     # The path to a `uv.toml` file to use for configuration
    --no-config                                                                                               # Avoid discovering configuration files (`pyproject.toml`, `uv.toml`)
    --help(-h)                                                                                                # Display the concise help for this command
    --version(-V)                                                                                             # Display the uv version
  ]


  # PEP 517 hook `prepare_metadata_for_build_wheel`
  export extern "uv build-backend prepare-metadata-for-build-wheel" [
    wheel_directory: string
    --no-cache(-n)                                                                                                # Avoid reading from or writing to the cache, instead using a temporary directory for the duration of the operation
    --cache-dir: string                                                                                           # Path to the cache directory
    --python-preference: string@"nu-complete uv python_preference"                                                # Whether to prefer uv-managed or system Python installations
    --allow-python-downloads                                                                                      # Allow automatically downloading Python when required. [env: "UV_PYTHON_DOWNLOADS=auto"]
    --no-python-downloads                                                                                         # Disable automatic downloads of Python. [env: "UV_PYTHON_DOWNLOADS=never"]
    --quiet(-q)                                                                                                   # Do not print any output
    --verbose(-v)                                                                                                 # Use verbose output
    --no-color                                                                                                    # Disable colors
    --color: string@"nu-complete uv color"                                                                        # Control colors in output
    --native-tls                                                                                                  # Whether to load TLS certificates from the platform's native certificate store
    --no-native-tls
    --offline                                                                                                     # Disable network access
    --no-offline
    --allow-insecure-host: string                                                                                 # Allow insecure connections to a host
    --preview                                                                                                     # Whether to enable experimental, preview features
    --no-preview
    --isolated                                                                                                    # Avoid discovering a `pyproject.toml` or `uv.toml` file
    --show-settings                                                                                               # Show the resolved settings for the current command
    --no-progress                                                                                                 # Hide all progress outputs
    --no-installer-metadata                                                                                       # Skip writing `uv` installer metadata files (e.g., `INSTALLER`, `REQUESTED`, and `direct_url.json`) to site-packages `.dist-info` directories
    --directory: string                                                                                           # Change to the given directory prior to running the command
    --project: string                                                                                             # Run the command within the given project directory
    --config-file: string                                                                                         # The path to a `uv.toml` file to use for configuration
    --no-config                                                                                                   # Avoid discovering configuration files (`pyproject.toml`, `uv.toml`)
    --help(-h)                                                                                                    # Display the concise help for this command
    --version(-V)                                                                                                 # Display the uv version
  ]


  # PEP 660 hook `get_requires_for_build_editable`
  export extern "uv build-backend get-requires-for-build-editable" [
    --no-cache(-n)                                                                                               # Avoid reading from or writing to the cache, instead using a temporary directory for the duration of the operation
    --cache-dir: string                                                                                          # Path to the cache directory
    --python-preference: string@"nu-complete uv python_preference"                                               # Whether to prefer uv-managed or system Python installations
    --allow-python-downloads                                                                                     # Allow automatically downloading Python when required. [env: "UV_PYTHON_DOWNLOADS=auto"]
    --no-python-downloads                                                                                        # Disable automatic downloads of Python. [env: "UV_PYTHON_DOWNLOADS=never"]
    --quiet(-q)                                                                                                  # Do not print any output
    --verbose(-v)                                                                                                # Use verbose output
    --no-color                                                                                                   # Disable colors
    --color: string@"nu-complete uv color"                                                                       # Control colors in output
    --native-tls                                                                                                 # Whether to load TLS certificates from the platform's native certificate store
    --no-native-tls
    --offline                                                                                                    # Disable network access
    --no-offline
    --allow-insecure-host: string                                                                                # Allow insecure connections to a host
    --preview                                                                                                    # Whether to enable experimental, preview features
    --no-preview
    --isolated                                                                                                   # Avoid discovering a `pyproject.toml` or `uv.toml` file
    --show-settings                                                                                              # Show the resolved settings for the current command
    --no-progress                                                                                                # Hide all progress outputs
    --no-installer-metadata                                                                                      # Skip writing `uv` installer metadata files (e.g., `INSTALLER`, `REQUESTED`, and `direct_url.json`) to site-packages `.dist-info` directories
    --directory: string                                                                                          # Change to the given directory prior to running the command
    --project: string                                                                                            # Run the command within the given project directory
    --config-file: string                                                                                        # The path to a `uv.toml` file to use for configuration
    --no-config                                                                                                  # Avoid discovering configuration files (`pyproject.toml`, `uv.toml`)
    --help(-h)                                                                                                   # Display the concise help for this command
    --version(-V)                                                                                                # Display the uv version
  ]


  # PEP 660 hook `prepare_metadata_for_build_editable`
  export extern "uv build-backend prepare-metadata-for-build-editable" [
    wheel_directory: string
    --no-cache(-n)                                                                                                   # Avoid reading from or writing to the cache, instead using a temporary directory for the duration of the operation
    --cache-dir: string                                                                                              # Path to the cache directory
    --python-preference: string@"nu-complete uv python_preference"                                                   # Whether to prefer uv-managed or system Python installations
    --allow-python-downloads                                                                                         # Allow automatically downloading Python when required. [env: "UV_PYTHON_DOWNLOADS=auto"]
    --no-python-downloads                                                                                            # Disable automatic downloads of Python. [env: "UV_PYTHON_DOWNLOADS=never"]
    --quiet(-q)                                                                                                      # Do not print any output
    --verbose(-v)                                                                                                    # Use verbose output
    --no-color                                                                                                       # Disable colors
    --color: string@"nu-complete uv color"                                                                           # Control colors in output
    --native-tls                                                                                                     # Whether to load TLS certificates from the platform's native certificate store
    --no-native-tls
    --offline                                                                                                        # Disable network access
    --no-offline
    --allow-insecure-host: string                                                                                    # Allow insecure connections to a host
    --preview                                                                                                        # Whether to enable experimental, preview features
    --no-preview
    --isolated                                                                                                       # Avoid discovering a `pyproject.toml` or `uv.toml` file
    --show-settings                                                                                                  # Show the resolved settings for the current command
    --no-progress                                                                                                    # Hide all progress outputs
    --no-installer-metadata                                                                                          # Skip writing `uv` installer metadata files (e.g., `INSTALLER`, `REQUESTED`, and `direct_url.json`) to site-packages `.dist-info` directories
    --directory: string                                                                                              # Change to the given directory prior to running the command
    --project: string                                                                                                # Run the command within the given project directory
    --config-file: string                                                                                            # The path to a `uv.toml` file to use for configuration
    --no-config                                                                                                      # Avoid discovering configuration files (`pyproject.toml`, `uv.toml`)
    --help(-h)                                                                                                       # Display the concise help for this command
    --version(-V)                                                                                                    # Display the uv version
  ]


  # Manage uv's cache
  export extern "uv cache" [
    --no-cache(-n)                                                       # Avoid reading from or writing to the cache, instead using a temporary directory for the duration of the operation
    --cache-dir: string                                                  # Path to the cache directory
    --python-preference: string@"nu-complete uv python_preference"       # Whether to prefer uv-managed or system Python installations
    --allow-python-downloads                                             # Allow automatically downloading Python when required. [env: "UV_PYTHON_DOWNLOADS=auto"]
    --no-python-downloads                                                # Disable automatic downloads of Python. [env: "UV_PYTHON_DOWNLOADS=never"]
    --quiet(-q)                                                          # Do not print any output
    --verbose(-v)                                                        # Use verbose output
    --no-color                                                           # Disable colors
    --color: string@"nu-complete uv color"                               # Control colors in output
    --native-tls                                                         # Whether to load TLS certificates from the platform's native certificate store
    --no-native-tls
    --offline                                                            # Disable network access
    --no-offline
    --allow-insecure-host: string                                        # Allow insecure connections to a host
    --preview                                                            # Whether to enable experimental, preview features
    --no-preview
    --isolated                                                           # Avoid discovering a `pyproject.toml` or `uv.toml` file
    --show-settings                                                      # Show the resolved settings for the current command
    --no-progress                                                        # Hide all progress outputs
    --no-installer-metadata                                              # Skip writing `uv` installer metadata files (e.g., `INSTALLER`, `REQUESTED`, and `direct_url.json`) to site-packages `.dist-info` directories
    --directory: string                                                  # Change to the given directory prior to running the command
    --project: string                                                    # Run the command within the given project directory
    --config-file: string                                                # The path to a `uv.toml` file to use for configuration
    --no-config                                                          # Avoid discovering configuration files (`pyproject.toml`, `uv.toml`)
    --help(-h)                                                           # Display the concise help for this command
    --version(-V)                                                        # Display the uv version
  ]


  # Clear the cache, removing all entries or those linked to specific packages
  export extern "uv cache clean" [
...package: string        # The packages to remove from the cache
    --no-cache(-n)                                                             # Avoid reading from or writing to the cache, instead using a temporary directory for the duration of the operation
    --cache-dir: string                                                        # Path to the cache directory
    --python-preference: string@"nu-complete uv python_preference"             # Whether to prefer uv-managed or system Python installations
    --allow-python-downloads                                                   # Allow automatically downloading Python when required. [env: "UV_PYTHON_DOWNLOADS=auto"]
    --no-python-downloads                                                      # Disable automatic downloads of Python. [env: "UV_PYTHON_DOWNLOADS=never"]
    --quiet(-q)                                                                # Do not print any output
    --verbose(-v)                                                              # Use verbose output
    --no-color                                                                 # Disable colors
    --color: string@"nu-complete uv color"                                     # Control colors in output
    --native-tls                                                               # Whether to load TLS certificates from the platform's native certificate store
    --no-native-tls
    --offline                                                                  # Disable network access
    --no-offline
    --allow-insecure-host: string                                              # Allow insecure connections to a host
    --preview                                                                  # Whether to enable experimental, preview features
    --no-preview
    --isolated                                                                 # Avoid discovering a `pyproject.toml` or `uv.toml` file
    --show-settings                                                            # Show the resolved settings for the current command
    --no-progress                                                              # Hide all progress outputs
    --no-installer-metadata                                                    # Skip writing `uv` installer metadata files (e.g., `INSTALLER`, `REQUESTED`, and `direct_url.json`) to site-packages `.dist-info` directories
    --directory: string                                                        # Change to the given directory prior to running the command
    --project: string                                                          # Run the command within the given project directory
    --config-file: string                                                      # The path to a `uv.toml` file to use for configuration
    --no-config                                                                # Avoid discovering configuration files (`pyproject.toml`, `uv.toml`)
    --help(-h)                                                                 # Display the concise help for this command
    --version(-V)                                                              # Display the uv version
  ]


  # Prune all unreachable objects from the cache
  export extern "uv cache prune" [
    --ci                                                                       # Optimize the cache for persistence in a continuous integration environment, like GitHub Actions
    --no-cache(-n)                                                             # Avoid reading from or writing to the cache, instead using a temporary directory for the duration of the operation
    --cache-dir: string                                                        # Path to the cache directory
    --python-preference: string@"nu-complete uv python_preference"             # Whether to prefer uv-managed or system Python installations
    --allow-python-downloads                                                   # Allow automatically downloading Python when required. [env: "UV_PYTHON_DOWNLOADS=auto"]
    --no-python-downloads                                                      # Disable automatic downloads of Python. [env: "UV_PYTHON_DOWNLOADS=never"]
    --quiet(-q)                                                                # Do not print any output
    --verbose(-v)                                                              # Use verbose output
    --no-color                                                                 # Disable colors
    --color: string@"nu-complete uv color"                                     # Control colors in output
    --native-tls                                                               # Whether to load TLS certificates from the platform's native certificate store
    --no-native-tls
    --offline                                                                  # Disable network access
    --no-offline
    --allow-insecure-host: string                                              # Allow insecure connections to a host
    --preview                                                                  # Whether to enable experimental, preview features
    --no-preview
    --isolated                                                                 # Avoid discovering a `pyproject.toml` or `uv.toml` file
    --show-settings                                                            # Show the resolved settings for the current command
    --no-progress                                                              # Hide all progress outputs
    --no-installer-metadata                                                    # Skip writing `uv` installer metadata files (e.g., `INSTALLER`, `REQUESTED`, and `direct_url.json`) to site-packages `.dist-info` directories
    --directory: string                                                        # Change to the given directory prior to running the command
    --project: string                                                          # Run the command within the given project directory
    --config-file: string                                                      # The path to a `uv.toml` file to use for configuration
    --no-config                                                                # Avoid discovering configuration files (`pyproject.toml`, `uv.toml`)
    --help(-h)                                                                 # Display the concise help for this command
    --version(-V)                                                              # Display the uv version
  ]


  # Show the cache directory
  export extern "uv cache dir" [
    --no-cache(-n)                                                           # Avoid reading from or writing to the cache, instead using a temporary directory for the duration of the operation
    --cache-dir: string                                                      # Path to the cache directory
    --python-preference: string@"nu-complete uv python_preference"           # Whether to prefer uv-managed or system Python installations
    --allow-python-downloads                                                 # Allow automatically downloading Python when required. [env: "UV_PYTHON_DOWNLOADS=auto"]
    --no-python-downloads                                                    # Disable automatic downloads of Python. [env: "UV_PYTHON_DOWNLOADS=never"]
    --quiet(-q)                                                              # Do not print any output
    --verbose(-v)                                                            # Use verbose output
    --no-color                                                               # Disable colors
    --color: string@"nu-complete uv color"                                   # Control colors in output
    --native-tls                                                             # Whether to load TLS certificates from the platform's native certificate store
    --no-native-tls
    --offline                                                                # Disable network access
    --no-offline
    --allow-insecure-host: string                                            # Allow insecure connections to a host
    --preview                                                                # Whether to enable experimental, preview features
    --no-preview
    --isolated                                                               # Avoid discovering a `pyproject.toml` or `uv.toml` file
    --show-settings                                                          # Show the resolved settings for the current command
    --no-progress                                                            # Hide all progress outputs
    --no-installer-metadata                                                  # Skip writing `uv` installer metadata files (e.g., `INSTALLER`, `REQUESTED`, and `direct_url.json`) to site-packages `.dist-info` directories
    --directory: string                                                      # Change to the given directory prior to running the command
    --project: string                                                        # Run the command within the given project directory
    --config-file: string                                                    # The path to a `uv.toml` file to use for configuration
    --no-config                                                              # Avoid discovering configuration files (`pyproject.toml`, `uv.toml`)
    --help(-h)                                                               # Display the concise help for this command
    --version(-V)                                                            # Display the uv version
  ]


  # Manage the uv executable
  export extern "uv self" [
    --no-cache(-n)                                                      # Avoid reading from or writing to the cache, instead using a temporary directory for the duration of the operation
    --cache-dir: string                                                 # Path to the cache directory
    --python-preference: string@"nu-complete uv python_preference"      # Whether to prefer uv-managed or system Python installations
    --allow-python-downloads                                            # Allow automatically downloading Python when required. [env: "UV_PYTHON_DOWNLOADS=auto"]
    --no-python-downloads                                               # Disable automatic downloads of Python. [env: "UV_PYTHON_DOWNLOADS=never"]
    --quiet(-q)                                                         # Do not print any output
    --verbose(-v)                                                       # Use verbose output
    --no-color                                                          # Disable colors
    --color: string@"nu-complete uv color"                              # Control colors in output
    --native-tls                                                        # Whether to load TLS certificates from the platform's native certificate store
    --no-native-tls
    --offline                                                           # Disable network access
    --no-offline
    --allow-insecure-host: string                                       # Allow insecure connections to a host
    --preview                                                           # Whether to enable experimental, preview features
    --no-preview
    --isolated                                                          # Avoid discovering a `pyproject.toml` or `uv.toml` file
    --show-settings                                                     # Show the resolved settings for the current command
    --no-progress                                                       # Hide all progress outputs
    --no-installer-metadata                                             # Skip writing `uv` installer metadata files (e.g., `INSTALLER`, `REQUESTED`, and `direct_url.json`) to site-packages `.dist-info` directories
    --directory: string                                                 # Change to the given directory prior to running the command
    --project: string                                                   # Run the command within the given project directory
    --config-file: string                                               # The path to a `uv.toml` file to use for configuration
    --no-config                                                         # Avoid discovering configuration files (`pyproject.toml`, `uv.toml`)
    --help(-h)                                                          # Display the concise help for this command
    --version(-V)                                                       # Display the uv version
  ]


  # Update uv
  export extern "uv self update" [
    target_version?: string   # Update to the specified version. If not provided, uv will update to the latest version
    --token: string                                                            # A GitHub token for authentication. A token is not required but can be used to reduce the chance of encountering rate limits
    --no-cache(-n)                                                             # Avoid reading from or writing to the cache, instead using a temporary directory for the duration of the operation
    --cache-dir: string                                                        # Path to the cache directory
    --python-preference: string@"nu-complete uv python_preference"             # Whether to prefer uv-managed or system Python installations
    --allow-python-downloads                                                   # Allow automatically downloading Python when required. [env: "UV_PYTHON_DOWNLOADS=auto"]
    --no-python-downloads                                                      # Disable automatic downloads of Python. [env: "UV_PYTHON_DOWNLOADS=never"]
    --quiet(-q)                                                                # Do not print any output
    --verbose(-v)                                                              # Use verbose output
    --no-color                                                                 # Disable colors
    --color: string@"nu-complete uv color"                                     # Control colors in output
    --native-tls                                                               # Whether to load TLS certificates from the platform's native certificate store
    --no-native-tls
    --offline                                                                  # Disable network access
    --no-offline
    --allow-insecure-host: string                                              # Allow insecure connections to a host
    --preview                                                                  # Whether to enable experimental, preview features
    --no-preview
    --isolated                                                                 # Avoid discovering a `pyproject.toml` or `uv.toml` file
    --show-settings                                                            # Show the resolved settings for the current command
    --no-progress                                                              # Hide all progress outputs
    --no-installer-metadata                                                    # Skip writing `uv` installer metadata files (e.g., `INSTALLER`, `REQUESTED`, and `direct_url.json`) to site-packages `.dist-info` directories
    --directory: string                                                        # Change to the given directory prior to running the command
    --project: string                                                          # Run the command within the given project directory
    --config-file: string                                                      # The path to a `uv.toml` file to use for configuration
    --no-config                                                                # Avoid discovering configuration files (`pyproject.toml`, `uv.toml`)
    --help(-h)                                                                 # Display the concise help for this command
    --version(-V)                                                              # Display the uv version
  ]


  # Clear the cache, removing all entries or those linked to specific packages
  export extern "uv clean" [
    ...package: string        # The packages to remove from the cache
    --no-cache(-n)                                                       # Avoid reading from or writing to the cache, instead using a temporary directory for the duration of the operation
    --cache-dir: string                                                  # Path to the cache directory
    --python-preference: string@"nu-complete uv python_preference"       # Whether to prefer uv-managed or system Python installations
    --allow-python-downloads                                             # Allow automatically downloading Python when required. [env: "UV_PYTHON_DOWNLOADS=auto"]
    --no-python-downloads                                                # Disable automatic downloads of Python. [env: "UV_PYTHON_DOWNLOADS=never"]
    --quiet(-q)                                                          # Do not print any output
    --verbose(-v)                                                        # Use verbose output
    --no-color                                                           # Disable colors
    --color: string@"nu-complete uv color"                               # Control colors in output
    --native-tls                                                         # Whether to load TLS certificates from the platform's native certificate store
    --no-native-tls
    --offline                                                            # Disable network access
    --no-offline
    --allow-insecure-host: string                                        # Allow insecure connections to a host
    --preview                                                            # Whether to enable experimental, preview features
    --no-preview
    --isolated                                                           # Avoid discovering a `pyproject.toml` or `uv.toml` file
    --show-settings                                                      # Show the resolved settings for the current command
    --no-progress                                                        # Hide all progress outputs
    --no-installer-metadata                                              # Skip writing `uv` installer metadata files (e.g., `INSTALLER`, `REQUESTED`, and `direct_url.json`) to site-packages `.dist-info` directories
    --directory: string                                                  # Change to the given directory prior to running the command
    --project: string                                                    # Run the command within the given project directory
    --config-file: string                                                # The path to a `uv.toml` file to use for configuration
    --no-config                                                          # Avoid discovering configuration files (`pyproject.toml`, `uv.toml`)
    --help(-h)                                                           # Display the concise help for this command
    --version(-V)                                                        # Display the uv version
  ]

  def "nu-complete uv version output_format" [] {
    [ "text" "json" ]
  }


  # Display uv's version
  export extern "uv version" [
    --output-format: string@"nu-complete uv version output_format"
    --no-cache(-n)                                                         # Avoid reading from or writing to the cache, instead using a temporary directory for the duration of the operation
    --cache-dir: string                                                    # Path to the cache directory
    --python-preference: string@"nu-complete uv python_preference"         # Whether to prefer uv-managed or system Python installations
    --allow-python-downloads                                               # Allow automatically downloading Python when required. [env: "UV_PYTHON_DOWNLOADS=auto"]
    --no-python-downloads                                                  # Disable automatic downloads of Python. [env: "UV_PYTHON_DOWNLOADS=never"]
    --quiet(-q)                                                            # Do not print any output
    --verbose(-v)                                                          # Use verbose output
    --no-color                                                             # Disable colors
    --color: string@"nu-complete uv color"                                 # Control colors in output
    --native-tls                                                           # Whether to load TLS certificates from the platform's native certificate store
    --no-native-tls
    --offline                                                              # Disable network access
    --no-offline
    --allow-insecure-host: string                                          # Allow insecure connections to a host
    --preview                                                              # Whether to enable experimental, preview features
    --no-preview
    --isolated                                                             # Avoid discovering a `pyproject.toml` or `uv.toml` file
    --show-settings                                                        # Show the resolved settings for the current command
    --no-progress                                                          # Hide all progress outputs
    --no-installer-metadata                                                # Skip writing `uv` installer metadata files (e.g., `INSTALLER`, `REQUESTED`, and `direct_url.json`) to site-packages `.dist-info` directories
    --directory: string                                                    # Change to the given directory prior to running the command
    --project: string                                                      # Run the command within the given project directory
    --config-file: string                                                  # The path to a `uv.toml` file to use for configuration
    --no-config                                                            # Avoid discovering configuration files (`pyproject.toml`, `uv.toml`)
    --help(-h)                                                             # Display the concise help for this command
    --version(-V)                                                          # Display the uv version
  ]


  # Generate shell completion
  export extern "uv generate-shell-completion" [
    shell: string@"nu-complete uv generate_shell_completion"                                # The shell to generate the completion script for
    --no-cache(-n)
    --cache-dir: string
    --python-preference: string@"nu-complete uv python_preference"
    --no-python-downloads
    --quiet(-q)
    --verbose(-v)
    --color: string@"nu-complete uv color"
    --native-tls
    --offline
    --no-progress
    --config-file: string
    --no-config
    --help(-h)
    --version(-V)
    --allow-python-downloads                                                                 # Allow automatically downloading Python when required. [env: "UV_PYTHON_DOWNLOADS=auto"]
    --no-color                                                                               # Disable colors
    --no-native-tls
    --no-offline
    --allow-insecure-host: string                                                            # Allow insecure connections to a host
    --preview                                                                                # Whether to enable experimental, preview features
    --no-preview
    --isolated                                                                               # Avoid discovering a `pyproject.toml` or `uv.toml` file
    --show-settings                                                                          # Show the resolved settings for the current command
    --no-installer-metadata                                                                  # Skip writing `uv` installer metadata files (e.g., `INSTALLER`, `REQUESTED`, and `direct_url.json`) to site-packages `.dist-info` directories
    --directory: string                                                                      # Change to the given directory prior to running the command
    --project: string                                                                        # Run the command within the given project directory
  ]


  # Display documentation for a command
  export extern "uv help" [
    --no-pager                # Disable pager when printing help
    ...command: string
    --no-cache(-n)            # Avoid reading from or writing to the cache, instead using a temporary directory for the duration of the operation
    --cache-dir: string       # Path to the cache directory
    --python-preference: string@"nu-complete uv python_preference" # Whether to prefer uv-managed or system Python installations
    --allow-python-downloads                                       # Allow automatically downloading Python when required. [env: "UV_PYTHON_DOWNLOADS=auto"]
    --no-python-downloads                                          # Disable automatic downloads of Python. [env: "UV_PYTHON_DOWNLOADS=never"]
    --quiet(-q)                                                    # Do not print any output
    --verbose(-v)                                                  # Use verbose output
    --no-color                                                     # Disable colors
    --color: string@"nu-complete uv color"                         # Control colors in output
    --native-tls                                                   # Whether to load TLS certificates from the platform's native certificate store
    --no-native-tls
    --offline                 # Disable network access
    --no-offline
    --allow-insecure-host: string # Allow insecure connections to a host
    --preview                     # Whether to enable experimental, preview features
    --no-preview
    --isolated                # Avoid discovering a `pyproject.toml` or `uv.toml` file
    --show-settings           # Show the resolved settings for the current command
    --no-progress             # Hide all progress outputs
    --no-installer-metadata   # Skip writing `uv` installer metadata files (e.g., `INSTALLER`, `REQUESTED`, and `direct_url.json`) to site-packages `.dist-info` directories
    --directory: string       # Change to the given directory prior to running the command
    --project: string         # Run the command within the given project directory
    --config-file: string     # The path to a `uv.toml` file to use for configuration
    --no-config               # Avoid discovering configuration files (`pyproject.toml`, `uv.toml`)
    --help(-h)                # Display the concise help for this command
    --version(-V)             # Display the uv version
  ]

}

export use completions *
