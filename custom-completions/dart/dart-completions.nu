def "nu-complete dart commands" [] {
    ^dart --help
    | lines
    | skip until { $in | str contains "Available commands:" }
    | where { $in | str starts-with "  " } # Indented lines
    | where { |line| not ($line | str trim | str starts-with "-") } # Ignore options
    | each { 
        str trim 
        | str replace --regex '\s+' ' ' 
        | parse "{value} {description}" 
    }
    | flatten
    | where value not-in ["pub" "create"]
}

def "nu-complete dart pub commands" [] {
    ^dart pub --help 
    | lines
    | skip until { $in | str contains "Available subcommands:" }
    | where { $in | str starts-with "  " }
    | where { |line| not ($line | str trim | str starts-with "-") }
    | each { 
        str trim 
        | str replace --regex '\s+' ' ' 
        | parse "{value} {description}" 
    }
    | flatten
}

def "nu-complete dart templates" [] {
    [cli console package server-shelf web]
}

export extern "dart" [
    command?: string@"nu-complete dart commands"
    --help(-h)               # Print this usage information.
    --verbose(-v)            # Print detailed logging.
    --version                # Print the VM version.
    --enable-analytics       # Enable telemetry reporting.
    --disable-analytics      # Disable telemetry reporting.
    --suppress-analytics     # Suppress analytics reporting for the current CLI invocation.
]

export extern "dart create" [
    directory: string       # Output directory
    --template(-t): string@"nu-complete dart templates" # The project template to use
    --pub                   # Run "pub get" after creation (default)
    --no-pub                # Do not run "pub get"
    --force                 # Force project generation, even if the target directory already exists
    --help(-h)              # Print this usage information
]

export extern "dart pub" [
    command?: string@"nu-complete dart pub commands"
]
