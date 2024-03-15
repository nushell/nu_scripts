export extern "flutter" [
    command?: string@"nu-complete flutter commands"
    --help(-h)              # Print this usage information.
    --verbose(-v)           # Noisy logging, including all shell commands executed.
    --device-id(-d)         # Target device id or name (prefixes allowed).
    --version               # Reports the version of this tool.
    --enable-analytics      # Enable telemetry reporting each time a flutter or dart command runs.
    --disable-analytics     # Disable telemetry reporting each time a flutter or dart command runs, until it is re-enabled.
    --suppress-analytics    # Suppress analytics reporting for the current CLI invocation.
]

def "nu-complete flutter commands" [] {
    ^flutter --help 
    | into string 
    | str replace --regex --multiline '(Manage[\s\S]*(?=Flutter SDK))' '' 
    | lines 
    | filter { str starts-with "  " } 
    | each { str trim }
    | parse "{value} {description}"
    | str trim
}

export extern "flutter create" [
    project: string         # project to create
]

export extern "flutter pub" [
    command?: string@"nu-complete pub commands"
]

def "nu-complete pub commands" [] {
    ^flutter pub --help 
    | into string 
    | str replace --regex --multiline '(Commands[\s\S]*(?=Available subcommands))' '' 
    | lines 
    | filter { str starts-with "  " } 
    | each { str trim }
    | parse "{value} {description}"
    | str trim
}

