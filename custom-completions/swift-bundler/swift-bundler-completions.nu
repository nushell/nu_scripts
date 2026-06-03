export module swift-bundler {
    def get-bundle-arg-values [arg_name: string]: nothing -> list<string> {
        ^swift-bundler bundle --experimental-dump-help
            | from json
            | get command.arguments
            | where valueName == $arg_name
            | get abstract
            | parse "{_} ({values}){_}"
            | get values
            | split row "|"
    }

    def "nu-complete sbun bundler" [] {
        get-bundle-arg-values bundler
    }
    def "nu-complete sbun configuration" [] {
        get-bundle-arg-values configuration
    }
    def "nu-complete sbun arch" [] {
        get-bundle-arg-values arch
    }
    def "nu-complete sbun platform" [] {
        get-bundle-arg-values platform
    }
    def "nu-complete sbun apps" [context: string] {
        let directory = $context
            | split row -r '\s+'
            | skip until {|arg| $arg in ["--directory" "-d"] }
            | get 1?
            | default "./"

        open ($directory | path join Bundler.toml) | get apps | columns
    }
    def "nu-complete sbun templates" [] {
        swift-bundler templates list
            | lines
            | where { str starts-with "* " }
            | each { parse "* {value}: {description}" }
            | flatten
    }
    def "nu-complete sbun devices" [] {
        {
            options: {sort: false}
            completions: (swift-bundler devices list
                | lines
                | where { str starts-with "* " }
                | each {
                    parse --regex r#'\* (?<uuid>[a-zA-Z0-9-]+): (?<device>.*) \(.*\)$'#
                    | rename --column {
                        uuid: "value"
                        device: "description"
                    }
                }
                | flatten
                | prepend "host")
        }
    }
    def "nu-complete sbun simulators" [] {
        {
            options: {sort: false}
            completions: (swift-bundler simulators list
                | lines
                | where { str starts-with "* " }
                | each {
                    parse --regex r#'\* (?<uuid>[a-zA-Z0-9-]+): (?<simulator>.*) \(.*\)$'#
                    | rename --column {
                        uuid: "value"
                        simulator: "description"
                    }
                }
                | flatten)
        }
    }

    # A tool for creating apps from Swift packages.
    export extern main [
        --version
        # Show the version.
        --help(-h)
        # Show help information.
    ]

    # Create an app bundle from a package.
    export extern bundle [
        app_name?: string@"nu-complete sbun apps"
        # The name of the app to build.
        --bundler: string@"nu-complete sbun bundler"
        # The bundler to use.
        --toolchain: string
        # An alternative Swift toolchain to use.
        --directory(-d): directory
        # The directory containing the package to build. This changes the working directory before any
        # other operation.
        --config-file: path
        # Overrides the default configuration file location.
        --products-directory: directory
        # The directory containing the built products. Can only be set when `--skip-build` is supplied.
        --configuration(-c): string@"nu-complete sbun configuration"
        # The build configuration to use.
        --arch(-a): string@"nu-complete sbun arch" = "arm64"
        # The architectures to build for.
        --scratch-path: directory = ".build"
        # A custom scratch directory path.
        --Xswiftpm: string
        # Additional arguments to pass to the SwiftPM builder when building.
        --Xxcodebuild: string
        # Additional arguments to pass to the xcodebuild builder when building.
        --platform(-p): string@"nu-complete sbun platform" = "macOS"
        # The platform to build for.
        --device: string@"nu-complete sbun devices"
        # A device name, id or search term to select a target device (e.g. `"Apple TV"` or
        # `"John Appleseed's iPhone"`). Can be a simulator. Use `"host"` to refer to the host machine.
        --strip
        # Strip the main executable.
        --simulator: string@"nu-complete sbun simulators"
        # A simulator name, id or search term to select the target simulator (e.g. `"iPhone 8"` or
        # `"Apple Vision Pro"`).
        --identity: string
        # The identity to use for codesigning.
        --provisioning-profile
        # The provisioning profile to embed in the app (only applicable when targeting non-macOS
        # physical Apple devices).
        --codesign
        # Codesign the application. Default on non-macOS Apple devices.
        --no-codesign
        # Do not codesign the application. Default on macOS, Linux and simulators.
        --entitlements: path
        # Provide an entitlements file to use when codesigning.
        --universal(-u)
        # Build a universal application. Equivalent to `--arch` `arm64` `--arch` `x86_64`.
        --experimental-stand-alone
        # Build an application which doesn't rely on any system-wide third-party libraries being
        # installed (such as gtk). This features is experimental and potentially incompatible with
        # `--universal`, use with care.
        --xcodebuild
        # Build with xcodebuild instead of SwiftPM. This is the default when building for non-macOS
        # Apple platforms from a Mac, since SwiftPM has issues doing so.
        --no-xcodebuild
        # Force swiftpm to be used when targeting non-macOS Apple platforms. Use with care because many
        # features, such as conditional dependencies in package manifests, may break.
        --skip-build
        # Skip the build step.
        --show-bundle-path
        # Print the path of the output bundle and exits. The bundle may not exist yet if you haven't
        # already performed a build.
        --built-with-xcode
        # Treats the products in the products directory as if they were built by Xcode (which is the
        # same as universal builds by SwiftPM). Can only be set when `--skip-build` is supplied.
        --verbose(-v)
        # Print verbose error messages.
        --version
        # Show the version.
        --help(-h)
        # Show help information.
    ]

    # Run a package as an app.
    export extern run [
        app_name?: string@"nu-complete sbun apps"
        # The name of the app to build.
        ...passThroughArguments
        # Command line arguments to pass through to the app.
        --bundler: string@"nu-complete sbun bundler"
        # The bundler to use.
        --toolchain: string
        # An alternative Swift toolchain to use.
        --directory(-d): directory
        # The directory containing the package to build. This changes the working directory before any
        # other operation.
        --config-file: path
        # Overrides the default configuration file location
        --products-directory: directory
        # The directory containing the built products. Can only be set when `--skip-build` is supplied.
        --configuration(-c): string@"nu-complete sbun configuration"
        # The build configuration to use.
        --arch(-a): string@"nu-complete sbun arch" = "arm64"
        # The architectures to build for.
        --scratch-path: directory = ".build"
        # A custom scratch directory path.
        --Xswiftpm: string
        # Additional arguments to pass to the SwiftPM builder when building.
        --Xxcodebuild: string
        # Additional arguments to pass to the xcodebuild builder when building.
        --platform(-p): string@"nu-complete sbun platform" = "macOS"
        # The platform to build for.
        --device: string@"nu-complete sbun devices"
        # A device name, id or search term to select a target device (e.g. `"Apple TV"` or
        # `"John Appleseed's iPhone"`). Can be a simulator. Use `"host"` to refer to the host machine.
        --strip
        # Strip the main executable.
        --simulator: string@"nu-complete sbun simulators"
        # A simulator name, id or search term to select the target simulator (e.g. `"iPhone 8"` or
        # `"Apple Vision Pro"`).
        --identity: string
        # The identity to use for codesigning.
        --provisioning-profile
        # The provisioning profile to embed in the app (only applicable when targeting non-macOS
        # physical Apple devices).
        --codesign
        # Codesign the application. Default on non-macOS Apple devices.
        --no-codesign
        # Do not codesign the application. Default on macOS, Linux and simulators.
        --entitlements: path
        # Provide an entitlements file to use when codesigning.
        --universal(-u)
        # Build a universal application. Equivalent to `--arch arm64 --arch x86_64`.
        --experimental-stand-alone
        # Build an application which doesn't rely on any system-wide third-party libraries being
        # installed (such as gtk). This features is experimental and potentially incompatible with `--universal`, use with care.
        --xcodebuild
        # Build with xcodebuild instead of SwiftPM. This is the default when building for non-macOS
        # Apple platforms from a Mac, since SwiftPM has issues doing so.
        --no-xcodebuild
        # Force swiftpm to be used when targeting non-macOS Apple platforms. Use with care because many
        # features, such as conditional dependencies in package manifests, may break.
        --env: path
        # A file containing environment variables to pass to the app.
        --skip-build
        # Skips the building and bundling steps.
        --hot
        # Enables hot reloading.
        --verbose(-v)
        # Print verbose error messages.
        --version
        # Show the version.
        --help(-h)
        # Show help information.
    ]

    # Clean a project's scratch directory.
    export extern clean [
        --directory(-d): directory
        # The directory containing the package to build.
        --scratch-path: directory = ".build"
        # A custom scratch directory path.
        --toolchain: string
        # An alternative Swift toolchain to use.
        --verbose(-v)
        # Print verbose error messages.
        --version
        # Show the version.
        --help(-h)
        # Show help information.
    ]

    # Create a new app package.
    export extern create [
        app_name: string
        # The app's name. Must only contain characters from the English alphabet.
        --identifier(-i): string
        # The app's identifier (e.g. `"com.example.ExampleApp"`).
        --version: string
        # The app's initial version.
        --category: string
        # The app's category.
        --icon: path
        # The app's icon file (1024x1024 png or icns file).
        --info-plist: path
        # An Info.plist file containing entries to add to the app's configuration.
        --directory(-d): directory
        # Directory to create the app in. Default: create a new directory at `./[app-name]`.
        --template(-t): string@"nu-complete sbun templates"
        # Template to create the app from.
        --template-repository: directory
        # A directory to search for the template in.
        --toolchain: string
        # An alternative Swift toolchain to use.
        --indentation: string = "spaces=4"
        # Custom indentation style: either `"tabs"` or `"spaces=[count]"`.
        --force(-f)
        # Force creation even if the template does not support the current OS and installed Swift
        # version.
        --vscode
        # Add vscode configuration files necessary to enable ergonomic debugging.
        --verbose(-v)
        # Print verbose error messages.
        --help(-h)
        # Show help information.
    ]

    # Converts an xcodeproj to a Swift Bundler project.
    export extern convert [
        xcode_file: path
        # Xcodeproj to convert.
        --out(-o): directory
        # The output directory.
        --dont-warn
        # Disables the experimental feature warning
        --verbose(-v)
        # Print verbose error messages.
        --version
        # Show the version.
        --help(-h)
        # Show help information.
    ]

    # List apps in the current Swift Bundler project.
    export extern "config apps" [
        --directory(-d): directory
        # The directory containing the package to inspect.
        --json
        # Format command output as JSON.
        --verbose(-v)
        # Print verbose error messages.
        --version
        # Show the version.
        --help(-h)
        # Show help information.
    ]

    # List apps in the current Swift Bundler project.
    export extern "config apps list" [
        --directory(-d): directory
        # The directory containing the package to inspect.
        --json
        # Format command output as JSON.
        --verbose(-v)
        # Print verbose error messages.
        --version
        # Show the version.
        --help(-h)
        # Show help information.
    ]

    # Migrate a project's config file to the latest format.
    export extern "config migrate" [
        --directory(-d): directory
        # The directory containing the package to migrate.
        --verbose(-v)
        # Print verbose error messages.
        --version
        # Show the version.
        --help(-h)
        # Show help information.
    ]

    # List available iOS, tvOS, visionOS, and Android devices.
    export extern devices [
        --verbose(-v)
        # Print verbose error messages.
        --version
        # Show the version.
        --help(-h)
        # Show help information.
    ]

    # List available iOS, tvOS, visionOS, and Android devices.
    export extern "devices list" [
        --verbose(-v)
        # Print verbose error messages.
        --version
        # Show the version.
        --help(-h)
        # Show help information.
    ]

    # List available iOS, tvOS visionOS, and Android simulators.
    export extern simulators [
        filter?: string
        # A search term to filter simulators with.
        --verbose(-v)
        # Print verbose error messages.
        --version
        # Show the version.
        --help(-h)
        # Show help information.
    ]

    # List available iOS, tvOS visionOS, and Android simulators.
    export extern "simulators list" [
        filter?: string
        # A search term to filter simulators with.
        --verbose(-v)
        # Print verbose error messages.
        --version
        # Show the version.
        --help(-h)
        # Show help information.
    ]

    # Boot an iOS, tvOS, visionOS, or Android simulator.
    export extern "simulators boot" [
        id_or_name: string@"nu-complete sbun simulators"
        # The id or name of the simulator to start. Substring matching is used when filtering simulator
        # names.
        --verbose(-v)
        # Print verbose error messages.
        --version
        # Show the version.
        --help(-h)
        # Show help information.
    ]

    # Boot an iOS, tvOS, or visionOS simulator.
    export extern "simulators simctl boot" [
        id_or_name: string@"nu-complete sbun simulators"
        # The id or name of the simulator to start. Substring matching is used when filtering simulator
        # names.
        simctl_arguments: string
        # Additional arguments to pass through to simctl.
        --arch: string@"nu-complete sbun arch"
        # Architecture for the simulator.
        --verbose(-v)
        # Print verbose error messages.
        --version
        # Show the version.
        --help(-h)
        # Show help information.
    ]

    # Boot an Android virtual device.
    export extern "simulators avd boot" [
        name: string@"nu-complete sbun simulators"
        # The name of the emulator to start. Supports partial substring matching.
        emulator_arguments: string
        # Additional arguments for the 'emulator' CLI.
        --arch: string@"nu-complete sbun arch"
        # Architecture to boot the emulator with.
        --verbose(-v)
        # Print verbose error messages.
        --attach
        # Attach to 'emulator' CLI after booting the emulator.
        --version
        # Show the version.
        --help(-h)
        # Show help information.
    ]

    # List available templates.
    export extern templates [
        --template-repository: directory
        # An alternate directory to search for templates in.
        --verbose(-v)
        # Print verbose error messages.
        --version
        # Show the version.
        --help(-h)
        # Show help information.
    ]

    # List available templates.
    export extern "templates list" [
        --template-repository: directory
        # An alternate directory to search for templates in.
        --verbose(-v)
        # Print verbose error messages.
        --version
        # Show the version.
        --help(-h)
        # Show help information.
    ]

    # Get info about a template.
    export extern "templates info" [
        template: string@"nu-complete sbun templates"
        # The template to get info about.
        --template-repository: directory
        # An alternate directory to search for the template in.
        --verbose(-v)
        # Print verbose error messages.
        --version
        # Show the version.
        --help(-h)
        # Show help information.
    ]

    # Update the default templates to the latest version.
    export extern "templates update" [
        --verbose(-v)
        # Print verbose error messages.
        --version
        # Show the version.
        --help(-h)
        # Show help information.
    ]

    # Generate the files required for Xcode to work nicely with a package.
    #
    # This requires Swift Bundler to be installed at `/opt/swift-bundler/swift-bundler`.
    export extern generate-xcode-support [
        --directory(-d): directory
        # The root directory of the package to generate Xcode support files for.
        --config-file: path
        # Overrides the default configuration file location.
        --verbose(-v)
        # Print verbose error messages.
        --version
        # Show the version.
        --help(-h)
        # Show help information.
    ]

    # List available codesigning identities.
    export extern list-identities [
        --verbose(-v)
        # Print verbose error messages.
        --version
        # Show the version.
        --help(-h)
        # Show help information.
    ]
}
