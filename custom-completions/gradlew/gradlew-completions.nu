def "nu-complete gradlew" [] {
    ./gradlew tasks
    | lines 
    | parse --regex '(?P<value>[a-zA-Z]+) - (?P<description>.+)'
}

def "nu-complete gradlew console" [] {
    [
        "plain" 
        "auto" 
        "rich" 
        "verbose"
    ]
}

def "nu-complete gradlew deps-verify" [] {
    [
        "strict" 
        "lenient" 
        "off"
    ]
}

def "nu-complete gradlew warning-mode" [] {
    [
        "all"
        "fail"
        "summary"
        "none"
    ]
}

# Tool used to automate compilation process using gradle
export extern "./gradlew" [
    task?: string@"nu-complete gradlew"
    --help(-h)                                                              # Shows this help message.
    --no-rebuild(-a)                                                        # Do not rebuild project dependencies.
    --build-file(-b)                                                        # Specify the build file. [deprecated]
    --build-cache                                                           # Enables the Gradle build cache. Gradle will try to reuse outputs from previous builds.
    --no-build-cache                                                        # Disables the Gradle build cache.
    --settings-file(-c)                                                     # Specify the settings file. [deprecated]
    --configuration-cache                                                   # Enables the configuration cache. Gradle will try to reuse the build configuration from previous builds.
    --no-configuration-cache                                                # Disables the configuration cache.
    --configuration-cache-problems                                          # Configures how the configuration cache handles problems (fail or warn). Defaults to fail.
    --configure-on-demand                                                   # Configure necessary projects only. Gradle will attempt to reduce configuration time for large multi-project builds. [incubating]
    --no-configure-on-demand                                                # Disables the use of configuration on demand. [incubating]
    --console: string@"nu-complete gradlew console"                         # Specifies which type of console output to generate. Values are 'plain', 'auto' (default), 'rich' or 'verbose'.
    --continue                                                              # Continue task execution after a task failure.
    --no-continue                                                           # Stop task execution after a task failure.
    --system-prop(-D)                                                       # Set system property of the JVM (e.g. -Dmyprop=myvalue).
    --debug(-d)                                                             # Log in debug mode (includes normal stacktrace).
    --daemon                                                                # Uses the Gradle daemon to run the build. Starts the daemon if not running.
    --no-daemon                                                             # Do not use the Gradle daemon to run the build. Useful occasionally if you have configured Gradle to always run with the daemon by default.
    --export-keys                                                           # Exports the public keys used for dependency verification.
    --dependency-verification(-F): string@"nu-complete gradlew deps-verify" # Configures the dependency verification mode. Values are 'strict', 'lenient' or 'off'.
    --foreground                                                            # Starts the Gradle daemon in the foreground.
    --gradle-user-home(-g)                                                  # Specifies the Gradle user home directory. Defaults to ~/.gradle
    --init-script(-I)                                                       # Specify an initialization script.
    --info(-i)                                                              # Set log level to info.
    --include-build                                                         # Include the specified build in the composite.
    --write-verification-metadata(-M)                                       # Generates checksums for dependencies used in the project (comma-separated list)
    --dry-run(-m)                                                           # Run the builds with all task actions disabled.
    --max-workers                                                           # Configure the number of concurrent workers Gradle is allowed to use.
    --offline                                                               # Execute the build without accessing network resources.
    --project-prop(-P)                                                      # Set project property for the build script (e.g. -Pmyprop=myvalue).
    --project-dir(-p)                                                       # Specifies the start directory for Gradle. Defaults to current directory.
    --parallel                                                              # Build projects in parallel. Gradle will attempt to determine the optimal number of executor threads to use.
    --no-parallel                                                           # Disables parallel execution to build projects.
    --priority                                                              # Specifies the scheduling priority for the Gradle daemon and all processes launched by it. Values are 'normal' (default) or 'low'
    --profile                                                               # Profile build execution time and generates a report in the <build_dir>/reports/profile directory.
    --project-cache-dir                                                     # Specify the project-specific cache directory. Defaults to .gradle in the root project directory.
    --quiet(-q)                                                             # Log errors only.
    --refresh-keys                                                          # Refresh the public keys used for dependency verification.
    --rerun-tasks                                                           # Ignore previously cached task results.
    --full-stacktrace(-S)                                                   # Print out the full (very verbose) stacktrace for all exceptions.
    --stacktrace(-s)                                                        # Print out the stacktrace for all exceptions.
    --scan                                                                  # Creates a build scan. Gradle will emit a warning if the build scan plugin has not been applied. (https://gradle.com/build-scans)
    --no-scan                                                               # Disables the creation of a build scan. For more information about build scans, please visit https://gradle.com/build-scans.
    --status                                                                # Shows status of running and recently stopped Gradle daemon(s).
    --stop                                                                  # Stops the Gradle daemon if it is running.
    --continuous(-t)                                                        # Enables continuous build. Gradle does not exit and will re-execute tasks when task file inputs change.
    --refresh-dependencies(-U)                                              # Refresh the state of dependencies.
    --update-locks                                                          # Perform a partial update of the dependency lock, letting passed in module notations change version. [incubating]
    --show-version(-V)                                                      # Print version info and continue.
    --version(-v)                                                           # Print version info and exit.
    --warn(-w)                                                              # Set log level to warn.
    --warning-mode: string@"nu-complete gradlew warning-mode"               # Specifies which mode of warnings to generate. Values are 'all', 'fail', 'summary'(default) or 'none'
    --watch-fs                                                              # Enables watching the file system for changes, allowing data about the file system to be re-used for the next build.
    --no-watch-fs                                                           # Disables watching the file system.
    --write-locks                                                           # Persists dependency resolution for locked configurations, ignoring existing locking information if it exists
    --exclude-task(-x)                                                      # Specify a task to be excluded from execution.
]