# ------------------ nu-complete commands ------------------

def "nu-complete rustup" [] {
  ^rustup --help 
  | str replace --regex --multiline '(rustup[\s\S]*(?=Commands:))' '' 
  | str replace --regex --multiline '\n+Arguments:[\s\S]*' ''
  | lines 
  | where $it starts-with "  " 
  | parse -r '\s*(?P<value>[^ ]+) \s*(?P<description>\w.*)'
}

def "nu-complete rustup toolchain" [] {
  ^rustup toolchain 
  | str replace --regex --multiline '(rustup[\s\S]*(?=Commands:))' '' 
  | str replace --regex --multiline '\n+Options:[\s\S]*' ''
  | lines 
  | where $it starts-with "  " 
  | parse -r '\s*(?P<value>[^ ]+) \s*(?P<description>\w.*)'
}


def "nu-complete rustup toolchain list" [] {
  ^rustup toolchain list
  | lines
  | append 'stable'
  | append 'beta'
  | append 'nightly'
  | each { |line| if ($line | str contains "(default)") {
    {value: ($line | str replace " (default)" ""), description: "default"}
    } else {
      {value: $line, description: ""}
    } 
  }
}

def "nu-complete rustup target" [] {
  ^rustup target 
  | str replace --regex --multiline '(rustup[\s\S]*(?=Commands:))' '' 
  | str replace --regex --multiline '\n+Options:[\s\S]*' ''
  | lines 
  | where $it starts-with "  " 
  | parse -r '\s*(?P<value>[^ ]+) \s*(?P<description>\w.*)'
}

def "nu-complete rustup target list" [] {
  ^rustup target list
  | lines
  | each {|line| if ($line | str contains "installed") {
    {value: ($line | str replace " (installed)" ""), description: "installed"}
  } else {
    {value: $line, description: ""}
  }}
}

def "nu-complete rustup target list --installed" [] {
  ^rustup target list --installed
  | lines
}

def "nu-complete rustup update" [] {
  ^rustup toolchain list 
  | lines 
  | each {|line| if ($line | str contains "default") {
    {value: ($line | str replace " (default)" ""), description: "default"}
  } else {
    {value: $line, description: ""}
  }}
}

def "nu-complete rustup component" [] {
  ^rustup component 
  | str replace --regex --multiline '(rustup[\s\S]*(?=Commands:))' '' 
  | str replace --regex --multiline '\n+Options:[\s\S]*' ''
  | lines 
  | where $it starts-with "  " 
  | parse -r '\s*(?P<value>[^ ]+) \s*(?P<description>\w.*)'
}

def "nu-complete rustup component list" [] {
  ^rustup component list
  | lines
  | each {|line| if ($line | str contains "installed") {
    {value: ($line | str replace " (installed)" ""), description: "installed"}
  } else {
    {value: $line, description: ""}
  }}
}

def "nu-complete rustup component list installed" [] {
  ^rustup component list 
  | lines 
  | find --regex '^.+(?=\s\(installed)'
}

def "nu-complete rustup override" [] {
  ^rustup override 
  | str replace --regex --multiline '(rustup[\s\S]*(?=Commands:))' '' 
  | str replace --regex --multiline '\n+Options:[\s\S]*' ''
  | lines 
  | where $it starts-with "  " 
  | parse -r '\s*(?P<value>[^ ]+) \s*(?P<description>\w.*)'
}

def "nu-complete rustup override list" [] {
  ^rustup override list
  | lines
  # TODO: I don't have any override to match
  # TODO: exclude the result "no overrides"
}

def "nu-complete rustup override list installed" [] {
  ^rustup override list 
  | lines 
  # TODO: I don't have any override to match
  # TODO: exclude the result "no overrides"
}

def "nu-complete rustup self" [] {
  ^rustup self 
  | str replace --regex --multiline '(rustup[\s\S]*(?=Commands:))' '' 
  | str replace --regex --multiline '\n+Options:[\s\S]*' ''
  | lines 
  | where $it starts-with "  " 
  | parse -r '\s*(?P<value>[^ ]+) \s*(?P<description>\w.*)'
}

def "nu-complete rustup set" [] {
  ^rustup set 
  | str replace --regex --multiline '(rustup[\s\S]*(?=Commands:))' '' 
  | str replace --regex --multiline '\n+Options:[\s\S]*' ''
  | lines 
  | where $it starts-with "  " 
  | parse -r '\s*(?P<value>[^ ]+) \s*(?P<description>\w.*)'
}

def "nu-complete rustup set profile" [] {
  ['minimal', 'default', 'complete']
}

def "nu-complete rustup set auto-self-update" [] {
  ['enable', 'disable', 'check-only']
}

def "nu-complete rustup completions" [] {
  ['bash', 'elvish', 'fish', 'powershell', 'zsh', 'cargo', 'rustup']
}

def "nu-complete rustup completions shell" [] {
  ['bash', 'elvish', 'fish', 'powershell', 'zsh']
}

# ------------------ export extern commands ------------------

export extern "rustup" [
  command?: string@"nu-complete rustup"
    --verbose(-v)    # Enable verbose output
    --quiet(-q)      # Disable progress output
    --help(-h)       # Print help information
    --version(-V)    # Print version information
]

export extern "rustup help" [
  command?: string@"nu-complete rustup"
]

export extern "rustup update" [
  command?: string@"nu-complete rustup update"
  --help(-h)        # Print help information
  --force           # Force an update, even if some components are missing
  --force-non-host  # Install toolchains that require an emulator. See https://github.com/rust-lang/rustup/wiki/Non-host-toolchains
  --no-self-update  # Don't perform self update when running the `rustup update` command
]

export extern "rustup default" [
  command?: string@"nu-complete rustup toolchain list"
]

export extern "rustup toolchain" [
  command?: string@"nu-complete rustup toolchain"
  --help(-h)        # Print help information
]

export extern "rustup toolchain install" [
  command?: string@"nu-complete rustup toolchain list"
  --help(-h)        # Print help information
]


export extern "rustup toolchain uninstall" [
  command?: string@"nu-complete rustup toolchain list"
]

export extern "rustup target" [
  command?: string@"nu-complete rustup target"
  --help(-h)        # Print help information
]

export extern "rustup target add" [
  command?: string@"nu-complete rustup target list"
  --toolchain       # Toolchain name, such as 'stable', 'nightly', or '1.8.0'. For more information see `rustup help toolchain`
  --help(-h)        # Print help information
]

export extern "rustup target remove" [
  command?: string@"nu-complete rustup target list --installed"
]

export extern "rustup component" [
  command?: string@"nu-complete rustup component"
  --help(-h)        # Print help information
]

export extern "rustup component add" [
  command?: string@"nu-complete rustup component list"
  --toolchain       # Toolchain name, such as 'stable', 'nightly', or '1.8.0'. For more information see `rustup help toolchain`
  --target          # <target> TODO: explain this command a bit further
  --help(-h)        # Print help information
]

export extern "rustup component remove" [
  command?: string@"nu-complete rustup component list installed"
  --toolchain       # Toolchain name, such as 'stable', 'nightly', or '1.8.0'. For more information see `rustup help toolchain`
  --target          # <target> TODO: explain this command a bit further
  --help(-h)        # Print help information
]

export extern "rustup override" [
  command?: string@"nu-complete rustup override"
  --help(-h)        # Print help information
]

export extern "rustup override set" [
  command?: string@"nu-complete rustup override list"
  --path            # Path to the directory
  --help(-h)        # Print help information
]

export extern "rustup override unset" [
  command?: string@"nu-complete rustup override list installed"
  --path            # Path to the directory
  --nonexistent     # Remove override toolchain for all nonexistent directories
  --help(-h)        # Print help information
]

export extern "rustup run" [
  command?: string@"nu-complete rustup toolchain list"
]

export extern "rustup self" [
  command?: string@"nu-complete rustup self"
]

export extern "rustup set" [
  command?: string@"nu-complete rustup set"
  --help(-h)        # Print help information
]

export extern "rustup set profile" [
  command?: string@"nu-complete rustup set profile"
  --help(-h)        # Print help information
]

export extern "rustup set auto-self-update" [
  command?: string@"nu-complete rustup set auto-self-update"
  --help(-h)        # Print help information
]

export extern "rustup completions" [
  command?: string@"nu-complete rustup completions"
  --help(-h)        # Print help information
]

export extern "rustup completions rustup" [
  command?: string@"nu-complete rustup completions shell"
  --help(-h)        # Print help information
]

export extern "rustup completions cargo" [
  command?: string@"nu-complete rustup completions shell"
  --help(-h)        # Print help information
]
