def "nu-complete dart commands" [context: string, offset: int] {
    # Get the list of built-in commands from `dart --help`
    let commands = (^dart --help
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
    # Filter out subcommands that are already handled by `export extern` definitions
    # to avoid duplication in the completion list.
    | where value not-in ["pub" "create"])

    # Extract the current token from the context using the offset.
    # We need this to support completion in subdirectories (e.g. `bin/`).
    let token = ($context | str substring 0..$offset | split row ' ' | last)

    # Glob for files matching the token, filtering for directories (for traversal)
    # and .dart files (as valid script targets).
    let files = (glob $"($token)*" 
    | where { |item| ($item | path type) == 'dir' or ($item | str ends-with ".dart") }
    | each { |item| 
        # Convert absolute paths from `glob` to relative paths to ensure Nushell
        # correctly filters and displays them.
        let relative = (try { $item | path relative-to $env.PWD } catch { $item })
        { value: $relative, description: (if ($item | path type) == 'dir' { "Directory" } else { "Dart script" }) } 
    })

    $commands | append $files
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
