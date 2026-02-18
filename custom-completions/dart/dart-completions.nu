def "nu-complete dart commands" [context: string, offset: int] {
    let commands = [
        {value: "analyze", description: "Analyze the project's Dart code."}
        {value: "build", description: "Build a Dart application for production deployment."}
        {value: "compile", description: "Compile Dart to various formats."}
        {value: "devtools", description: "Open DevTools (optionally connecting to an existing application)."}
        {value: "doc", description: "Generate API documentation for Dart projects."}
        {value: "fix", description: "Apply automated fixes to Dart source code."}
        {value: "format", description: "Idiomatically format Dart source code."}
        {value: "info", description: "Show diagnostic information about the installed tooling."}
        {value: "run", description: "Run a Dart program."}
        {value: "test", description: "Run tests for a project."}
    ]

    # Extract the current token from the context using the offset.
    # We need this to support completion in subdirectories (e.g. `bin/`).
    let token = ($context | str substring 0..$offset | split row ' ' | last)

    # Glob for files matching the token, filtering for directories (for traversal)
    # and .dart files (as valid script targets).
    let files = (glob $"($token)*" 
    | where { |item| ($item | path type) == 'dir' or ($item | str ends-with ".dart") }
    | each { |item| 
        let is_dir = ($item | path type) == 'dir'
        let relative = (try { $item | path relative-to $env.PWD } catch { $item })
        let final_value = if $is_dir { $"($relative)/" } else { $relative }
        { value: $final_value, description: (if $is_dir { "Directory" } else { "Dart script" }) } 
    })

    $commands | append $files
}

def "nu-complete dart pub commands" [] {
    [
        {value: "add", description: "Add a dependency to pubspec.yaml."}
        {value: "cache", description: "Work with the Pub system cache."}
        {value: "deps", description: "Print package dependencies."}
        {value: "downgrade", description: "Downgrade packages in a Dart project."}
        {value: "get", description: "Get the current package's dependencies."}
        {value: "global", description: "Work with globally hosted packages."}
        {value: "login", description: "Log into pub.dev."}
        {value: "logout", description: "Log out of pub.dev."}
        {value: "outdated", description: "Analyze dependencies to find which ones can be upgraded."}
        {value: "publish", description: "Publish the current package to pub.dartlang.org."}
        {value: "remove", description: "Remove a dependency from the current package."}
        {value: "token", description: "Manage authentication tokens for hosted pub repositories."}
        {value: "top-level", description: "Print the top-level directory of the current package."}
        {value: "unpack", description: "Downloads a package and unpacks it in a directory."}
        {value: "upgrade", description: "Upgrade the current package's dependencies to latest versions."}
        {value: "workspaces", description: "Work with workspaces."}
    ]
}

def "nu-complete dart templates" [] {
    [cli console package server-shelf web]
}

export extern "dart" [
    command?: string@"nu-complete dart commands"
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
]

export extern "dart pub" [
    command?: string@"nu-complete dart pub commands"
]
