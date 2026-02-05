def "nu-complete flutter commands" [] {
    ^flutter --help --verbose
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

def "nu-complete pub commands" [] {
    ^flutter pub --help 
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

def "nu-complete android-languages" [] {
    [java kotlin]
}

def "nu-complete project-templates" [] {
    [app module package package_ffi plugin plugin_ffi skeleton]
}

def "nu-complete platforms" [] {
    [ios android windows linux macos web]
}

export extern "flutter" [
    command?: string@"nu-complete flutter commands"
    --help(-h)              # Print this usage information.
    --verbose(-v)           # Noisy logging, including all shell commands executed.
    --device-id(-d): string # Target device id or name (prefixes allowed).
    --version               # Reports the version of this tool.
    --enable-analytics      # Enable telemetry reporting each time a flutter or dart command runs.
    --disable-analytics     # Disable telemetry reporting each time a flutter or dart command runs, until it is re-enabled.
    --suppress-analytics    # Suppress analytics reporting for the current CLI invocation.
]

export extern "flutter create" [
    output_dir: string      # Output directory
    --pub                   # Run "flutter pub get" after creation (default)
    --no-pub                # Do not run "flutter pub get"
    --offline               # Run "flutter pub get" in offline mode
    --overwrite             # Overwrite existing files
    --description: string   # The description to use for your new Flutter project
    --org: string           # The organization responsible for your new Flutter project
    --project-name: string  # The project name for this new Flutter project
    --android-language(-a): string@"nu-complete android-languages" # The language to use for Android-specific code
    --platforms: string@"nu-complete platforms" # The platforms supported by this project
    --template(-t): string@"nu-complete project-templates" # Specify the type of project to create
    --empty(-e)             # Specifies creating using an application template with a main.dart that is minimal
    --help(-h)              # Print this usage information
]

export extern "flutter pub" [
    command?: string@"nu-complete pub commands"
]
