def "nu-complete flutter commands" [] {
    [
        {value: "analyze", description: "Analyze the project's Dart code."}
        {value: "assemble", description: "Assemble and build Flutter resources."}
        {value: "attach", description: "Attach to a running app."}
        {value: "bash-completion", description: "Output command line shell completion setup scripts."}
        {value: "build", description: "Build an executable app or install bundle."}
        {value: "channel", description: "List or switch Flutter channels."}
        {value: "clean", description: "Delete the build/ and .dart_tool/ directories."}
        {value: "config", description: "Configure Flutter settings."}
        {value: "custom-devices", description: "List, reset, add and delete custom devices."}
        {value: "daemon", description: "Run a persistent, JSON-RPC based server to communicate with devices."}
        {value: "debug-adapter", description: "Run a Debug Adapter Protocol (DAP) server to communicate with the Flutter tool."}
        {value: "devices", description: "List all connected devices."}
        {value: "doctor", description: "Show information about the installed tooling."}
        {value: "downgrade", description: "Downgrade Flutter to the last active version for the current channel."}
        {value: "drive", description: "Builds and installs the app, and runs a Dart program that connects to the app, often to run externally facing integration tests, such as with package:test and package:flutter_driver."}
        {value: "emulators", description: "List, launch and create emulators."}
        {value: "gen-l10n", description: "Generate localizations for the current project."}
        {value: "install", description: "Install a Flutter app on an attached device."}
        {value: "logs", description: "Show log output for running Flutter apps."}
        {value: "precache", description: "Populate the Flutter tool's cache of binary artifacts."}
        {value: "run", description: "Run your Flutter app on an attached device."}
        {value: "running-apps", description: "List running applications."}
        {value: "screenshot", description: "Take a screenshot from a connected device."}
        {value: "symbolize", description: "Symbolize a stack trace from an AOT-compiled Flutter app."}
        {value: "test", description: "Run Flutter unit tests for the current project."}
        {value: "upgrade", description: "Upgrade your copy of Flutter."}
        {value: "widget-preview", description: "Manage the widget preview environment."}
    ]
}

def "nu-complete pub commands" [] {
    [
        {value: "add", description: "Add a dependency to pubspec.yaml."}
        {value: "cache", description: "Work with the Pub system cache."}
        {value: "deps", description: "Print package dependencies."}
        {value: "downgrade", description: "Downgrade packages in a Flutter project."}
        {value: "get", description: "Get the current package's dependencies."}
        {value: "global", description: "Work with Pub global packages."}
        {value: "login", description: "Log into pub.dev."}
        {value: "logout", description: "Log out of pub.dev."}
        {value: "outdated", description: "Analyze dependencies to find which ones can be upgraded."}
        {value: "pub", description: "Pass the remaining arguments to Dart's \"pub\" tool."}
        {value: "publish", description: "Publish the current package to pub.dartlang.org."}
        {value: "remove", description: "Removes a dependency from the current package."}
        {value: "run", description: "Run an executable from a package."}
        {value: "test", description: "Run the \"test\" package."}
        {value: "token", description: "Manage authentication tokens for hosted pub repositories."}
        {value: "upgrade", description: "Upgrade the current package's dependencies to latest versions."}
        {value: "uploader", description: "Manage uploaders for a package on pub.dev."}
        {value: "version", description: "Print Pub version."}
    ]
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
]

export extern "flutter pub" [
    command?: string@"nu-complete pub commands"
]
