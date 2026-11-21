module completions {
    def "elan-complete toolchain installed" [] {
        ^elan toolchain list | lines | where $in != "no installed toolchains"
    }

    def "elan-complete toolchain installed or name" [] {
        (["stable" "beta" "nightly"] ++
            (^elan toolchain list | lines | where $in != "no installed toolchains"))
    }

    export extern "elan" [
        --verbose(-v) # Enable verbose output
        --version(-V) # Prints version information
    ]

    # Show the active and installed toolchains
    export extern "elan show" []

    # Install Lean toolchain
    export extern "elan install" [
        toolchain: string@["stable" "beta" "nightly"]
    ]

    # Uninstall Lean toolchains
    export extern "elan uninstall" [
        toolchain: string@"elan-complete toolchain installed"
    ]

    # Set the default toolchain
    export extern "elan default" [
        toolchain: string@"elan-complete toolchain installed or name"
    ]

    # Modify or query the installed toolchains
    export extern "elan toolchain" []

    # List installed toolchains
    export extern "elan toolchain list" []

    # Install a given toolchain
    export extern "elan toolchain install" [
        toolchain: string@["stable" "beta" "nightly"]
    ]

    # Uninstall a toolchain
    export extern "elan toolchain uninstall" [
        toolchain: string@"elan-complete toolchain installed"
    ]

    # Create a custom toolchain by symlinking to a directory
    export extern "elan toolchain link" [
        toolchain: string@["stable" "beta" "nightly"]
    ]

    # Garbage-collect toolchains not used by any known project
    export extern "elan toolchain gc" [
        --delete # Delete collected toolchains instead of only reporting them
        --json   # Format output as JSON
    ]

    # Prints this message or the help of the given subcommand(s)
    export extern "elan toolchain help" [
        subcommand: string@["list" "install" "uninstall" "link" "gc"]
    ]

    # Modify directory toolchain overrides
    export extern "elan override" []

    # List directory toolchain overrides
    export extern "elan override list" []

    # Set the override toolchain for a directory
    export extern "elan override set" [
        toolchain: string@["stable" "beta" "nightly"]
    ]

    # Remove the override toolchain for a directory
    export extern "elan override unset" [
        --nonexistent # Remove override toolchain for all nonexistent directories
        --path        # Path to the directory
    ]

    # Prints version information
    export extern "elan override help" [
        subcommand: string@["list" "set" "unset"]
    ]

    # Run a command with an environment configured for a given toolchain
    export extern "elan run" [
        --install # Install the requested toolchain if needed
        toolchain: string@["stable" "beta" "nightly"]
    ]

    # Display which binary will be run for a given command
    export extern "elan which" [
        toolchain: string@["stable" "beta" "nightly"]
    ]

    # Display which binary will be run for a given command
    export extern "elan self" []

    # Download and install updates to elan
    export extern "elan self update" []

    # Uninstall elan
    export extern "elan self uninstall" []

    # Prints this message or the help of the given subcommand(s)
    export extern "elan self help" [
        subcommand: string@["update" "uninstall"]
    ]

    # Generate completion scripts for your shell
    export extern "elan completions" [
        shell: string@["zsh" "bash" "fish" "powershell" "elvish"]
    ]

    # Prints this message or the help of the given subcommand(s)
    export extern "elan help" [
        subcommand: string@[
            "show" "install" "uninstall" "default" "toolchain" "override"
            "run" "which" "self" "completions"
        ]
    ]
}

export use completions *
