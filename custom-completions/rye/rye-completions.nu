export extern "rye" [
    command?: string@"nu-complete rye"
]

def "nu-complete rye" [] {
    ^rye --help 
    | lines 
    | filter { str starts-with "  " } 
    | each {str trim} 
    | parse "{value} {description}" 
    | str trim
}

export extern "rye add" [
    package: string                         # package to add (PEP 508 string)
    --git: string                           # Install the given package from this git repository
    --url: string                           # Install the given package from this URL
    --path: path                            # Install the given package from this local path
    --absolute                              # Force non interpolated absolute paths
    --tag: string                           # Install a specific tag
    --rev: string                           # Update to a specific git rev
    --branch: string                        # Update to a specific git branch
    --features: string                      # Adds a dependency with a specific feature
    --dev                                   # Add this as dev dependency
    --excluded                              # Add this as an excluded dependency that will not be installed even if it's a sub dependency
    --optional: string                      # Add this to an optional dependency group
    --pre                                   # Include pre-releases when finding a package version
    --pin: string                           # Overrides the pin operator [possible values: equal, tilde-equal, greater-than-equal]
    --sync                                  # Runs `sync` even if auto-sync is disabled
    --no-sync                               # Does not run `sync` even if auto-sync is enabled
    --verbose(-v)                           # Enables verbose diagnostics
    --quiet(-q)                             # Turns off all output
    --help(-h)                              # Print help
]

export extern "rye config" [
    --show-path            # Print the path to the config
    --format: string@"nu-complete config format" # Request parseable output format rather than lines [possible values: json]
    --get: string          # Reads a config key
    --set: string          # Sets a config key to a string
    --set-in: string       # Sets a config key to an integer
    --set-boo: string      # Sets a config key to a bool
    --unse: string         # Remove a config key
    --help(-h)             # Print help (see more with '--help')
]

def "nu-complete config format" [] {
    ["json"]
}

export extern "rye fmt" [
    path?: path                             # List of files or directories to limit the operation to
    --all(-a)                               # Perform the operation on all packages
    --package(-p)                           # Perform the operation on a specific package
    --pyproject: path                       # Use this pyproject.toml file
    --verbose(-v)                           # Enables verbose diagnostics
    --quiet(-q)                             # Turns off all output
    --check                                 # Run format in check mode
    --help(-h)                              # Print help (see a summary with '-h')
]

export extern "rye init" [
    path?: path                             # Where to place the project (defaults to current path . )
    --lib                                   # Generate a library project (default)
    --script                                # Generate an executable project
    --min-py: string                        # Minimal Python version supported by this project
    --py(-p)                                # Python version to use for the virtualenv
    --no-readme                             # Do not create a readme
    --no-pin                                # Do not create .python-version file (requires-python will be used)
    --build-system: string@"nu-complete build-system" # Which build system should be used (defaults to hatchling)?  [possible values: hatchling, setuptools, flit, pdm, maturin]
    --license: string                       # Which license should be used (SPDX identifier)?
    --name: string                          # The name of the package
    --private                               #  Set "Private :: Do Not Upload" classifier, used for private projects
    --no-import                             # Don't import from setup.cfg, setup.py, or requirements files
    --virtual                               # Initialize this as a virtual package.  A virtual package can have dependencies but is itself not installed as a Python package.  It also cannot be published.
    --requirements(-r): path                # Requirements files to initialize pyproject.toml with
    --dev-requirements: path                # Development requirements files to initialize pyproject.toml with
    --verbose(-v)                           # Enables verbose diagnostics
    --quiet(-q)                             # Turns off all output
    --help(-h)                              # Print help (see a summary with '-h')
]

def "nu-complete build-system" [] {
    ['hatchling', 'setuptools', 'flit', 'pdm', 'maturin']
}

export extern "rye lint" [
    path?: path                             # List of files or directories to limit the operation to
    --all(-a)                               # Perform the operation on all packages
    --package(-p): string                   # Perform the operation on a specific package
    --pyproject: path                       # Use this pyproject.toml file
    --verbose(-v)                           # Enables verbose diagnostics
    --quiet(-q)                             # Turns off all output
    --fix                                   # Apply fixes
    --help(-h)                              # Print help (see a summary with '-h')
]

export extern "rye run" [
    script?: string@"nu-complete rye run"
    --list(-l)                              # List all commands
    --pyproject: path                       # Use this pyproject.toml file
    --help                                  # Print help
]

def "nu-complete rye run" [] {
    open pyproject.toml | get project.scripts | transpose value description
}

export extern "rye test" [
    --all(-a)                               # Perform the operation on all packages
    --package(-p): string                   # Perform the operation on a specific package
    --pyproject: path                       # Use this pyproject.toml file
    --no-capture(-s)                        # 
    --verbose(-v)                           # Enables verbose diagnostics
    --quiet(-q)                             # Turns off all output
    --help(-h)                              # Print help (see a summary with '-h')
]

def "nu-complete rye tools" [] {
    ^rye tools --help 
    | lines 
    | drop 1
    | filter { str starts-with "  " } 
    | each {str trim} 
    | parse "{value} {description}" 
    | str trim
}

export extern "rye tools" [
    command?: string@"nu-complete rye tools"
    --help(-h)             # Print help (see more with '--help')
]

def "nu-complete rye self" [] {
    ^rye self --help 
    | lines 
    | drop 1
    | filter { str starts-with "  " } 
    | each {str trim} 
    | parse "{value} {description}" 
    | str trim
}

export extern "rye self" [
    command?: string@"nu-complete rye self"
    --help(-h)             # Print help (see more with '--help')
]

def "nu-complete rye toolchain" [] {
    ^rye toolchain --help 
    | lines 
    | drop 1
    | filter { str starts-with "  " } 
    | each {str trim} 
    | parse "{value} {description}" 
    | str trim
}

export extern "rye toolchain" [
    command?: string@"nu-complete rye toolchain"
    --help(-h)             # Print help (see more with '--help')
]

def "nu-complete .env files" [] {
    ls *.env | select name | rename value
}

export extern "rye --env-file" [
    file: path@"nu-complete .env files" # env file
]