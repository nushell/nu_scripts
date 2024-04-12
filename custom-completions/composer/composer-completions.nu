# Written for composer v2.7.0

def "nu-complete composer installed-packages" [] {
  cat composer.lock | from json | get packages | each {get name}
}

def "nu-complete composer installation-modes" [] {
  [
    { value: 'dist', description: 'Install from package dist' }
    { value: 'source', description: 'Install from package source and include VSC information' }
    { value: 'auto', description: 'Use source for dev versions and dist for the rest' }
  ]
}

def "nu-complete composer audit-formats" [] {
  ['table' 'plain' 'json' 'summary']
}

def "nu-complete composer commands" [] {
  composer list --format json |
    from json |
    get commands |
    filter {|cmd| not $cmd.hidden} |
    each {|cmd| {value: $cmd.name, description: $cmd.description}}
}

# Composer is a tool for dependency management in PHP.
export extern "composer" [
  --help(-h) # Display help for the given command. When no command is given display help for the list command.
  --quiet(-q) # Do not output any message.
  --version(-V) # Display the application version.
  --ansi # Force ANSI output.
  --no-ansi # Disable ANSI output.
  --no-interaction(-n) # Do not ask any interactive question.
  --profile # Display timing and memory usage information.
  --no-plugins # Whether to disable plugins.
  --no-scripts # Skips the execution of all scripts defined in composer.json file.
  --working-dir(-d): string # If specified, use the given directory as working directory.
  --no-cache # Prevent use of the cache.
  --verbose(-v) # Increase the verbosity of messages: 1 for normal output, 2 for more verbose output and 3 for debug.
]

def "nu-complete composer command-description-output-formats" [] {
  ['txt', 'xml', 'json', 'md']
}

# Shows a short information about Composer.
export extern "composer about" []

def "nu-complete composer archive-formats" [] {
  ['tar' 'tar.gz' 'tar.bz2' 'zip']
}

# Creates an archive of this composer package.
export extern "composer archive" [
  --format(-f): string@"nu-complete composer archive-formats" # Format of the resulting archive: tar, tar.gz, tar.gz2, zip. [default: "tar"]
  --dir: string # Write the archive to this directory.
  --file: string # Write the archive with the given file name. Note that the format will be appended.
  --ignore-filters # Ignore filters when saving package.

  package?: string # The package to archive instead of the current project.
  version?: string # A versions constraint to find the package to archive.
]

# Checks for security vulnerability advisories for the installed packages.
export extern "composer audit" [
  --no-dev # Disables auditing of require-dev packages.
  --format(-f): string@"nu-complete composer audit-formats" # Output format. Must be "table", "plain", "json", or "summary". [default: "table"]
  --locked # Audit based on the lock file instead of the installed packages.
]

# Opens the package's repository URL or homepage in your browser.
export extern "composer browse" [
  --homepage(-H) # Open the homepage instead of the repository URL.
  --show(-s) # Only show the homepage or repository URL.

  ...packages: string # Package(s) to browse to.
]

# Increases the lower limit of your composer.json requirements to the currently installed versions.
export extern "composer bump" [
  --dev-only(-D) # Only bump requirements in "require-dev".
  --no-dev-only(-R) # Only bump requirements in "require"
  --dry-run # Outputs the packages to bump, but will not execute anything.

  ...packages: string@"nu-complete composer installed-packages" # Optional package name(s) to restrict which packages are bumped.
]

def "nu-complete composer platform-reqs-formats" [] {
  ['text' 'json']
}

# Check that platform requirements are satisfied.
export extern "composer check-platform-reqs" [
  --no-dev # Disables checking of require-dev packages requirements.
  --lock # Checks requirements only from the lock file, not from installed packages.
  --format(-f): string@"nu-complete composer platform-reqs-formats" # Format of the output: text or json. [default: "text"]
]

# [clearcache|cc] Clears composer's internal package cache.
export extern "composer clear-cache" [
  --gc # Only run garbage collection, not a full cache clear.
]

def "nu-complete composer completion-shells" [] {
  ['bash']
}

# Dump the shell completion script.
export extern "composer completion" [
  --debug # Tail the completion debug log.
  shell: string@"nu-complete composer completion-shells" = 'bash' # The shell type (e.g. "bash"), the value of the "$SHELL" env var will be used if this is not given.
]

# Sets config options.
export extern "composer config" [
  --global(-g) # Apply command to the global config file.
  --editor(-e) # Open editor.
  --auth(-a) # Affect auth config file (only used for --editor).
  --unset # Unset the given setting-key.
  --list(-l) # List configuration settings.
  --file(-f): string # If you want to choose a different composer.json or config.json.
  --absolute # Returns absolute paths when fetching *-dir config values instead of relative.
  --json(-j) # JSON decode the setting value, to be used with extra.* keys.
  --merge(-m) # Merge the setting value with the current value, to be used with extra.* keys instead of prepending it (highest priority).
  --append # When adding a repository, append it (lowest priority) to the existing ones instead of prepending it (highest priority).
  --source # Display where the config value is loaded from.

  settings_key: string
  settings_value?: string
]

# Creates a new project from a package into a given directory.
export extern "composer create-project" [
  --stability(-s) # Minimum-stability allowed (unless as version is specified).

  --prefer-source # Forces installation from package sources when possible, including VCS information.
  --prefer-dist # Forces installation from package dist (default behavior).
  --prefer-install: string@"nu-complete composer installation-modes" # Forces installation from package dist|source|auto (auto chooses source for dev versions, dist for the rest).

  --repository: string # Add custom repositories to look the package up, either by URL or using JSON arrays (multiple values allowed).
  --add-repository # Add the custom repository in the composer.json. If a lockfile is present it will be deleted and an update will be run instead of install.

  --no-dev # Disables installation of require-dev packages.
  --no-scripts # Skips the execution of all scripts defined in composer.json file.
  --no-progress # Do not output download progress.
  --no-secure-http # Disable the secure-http config option temporarily while installing the root package. Use at your own risk. Using this flag is a bad idea.
  --keep-vcs # Whether to prevent deleting the vcs folder.
  --remove-vcs # Whether to force deletion of the vcs folder without prompting.
  --no-install # Whether to skip installation of the package dependencies.
  --no-audit # Whether to skip auditing of the installed package dependencies (can also be set via the COMPOSER_NO_AUDIT=1 env var).
  --audit-format: string@"nu-complete composer audit-formats" # Audit output format. Must be "table", "plain", "json" or "summary". [default: "summary"]
  --ignore-platform-req: string # Ignore a specific platform requirement (php & ext- packages). (multiple values allowed).
  --ignore-platform-reqs # Ignore all platform requirements (php & ext- packages).
  --ask # Whether to ask for project directory.

  package?: string # Package name to be installed.
  directory?: string # Directory where the files should be created.
  version?: string # Version, will default to latest.
]

# [why] Shows which packages cause the given package to be installed.
export extern "composer depends" [
  --recursive(-r) # Recursively resolves up to the root package.
  --tree(-t) # Prints the results as a nested tree.
  --locked # Read dependency information from composer.lock.

  package: string # Package to inspect.
]

# Diagnoses the system to identify common errors.
export extern "composer diagnose" []

# [dumpautoload] Dumps the autoloader.
export extern "composer dump-autoload" [
  --optimize(-o) # Optimizes PSR0 and PSR4 packages to be loaded with classmaps too, good for production.
  --classmap-authoritative(-a) # Autoload classes from the classmap only. Implicitly enables `--optimize`.
  --apcu # Use APCu to cache found/not-found classes.
  --apcu-prefix: string # Use a custom prefix for the APCu autoloader cache. Implicitly  enables --apcu

  --dry-run # Outputs the operations but will not execute anything.
  --dev # Enables autoload-dev rules. Composer will by default infer  this automatically according to the last install or update --no-dev state.
  --no-dev # Disables autoload-dev rules. Composer will by default inf er  this automatically according to the last install or update --no-dev state.

  --ignore-platform-req: string # Ignore a specific platform requirement (php & ext- package es).  (multiple values allowed).
  --ignore-platform-reqs # Ignore all platform requirements (php & ext- packages).
  --strict-psr # Return a failed status code (1) if PSR-4 or PSR-0 mapping errors are present. Requires --optimize to work.
]

def "nu-complete composer exec-scripts" [] {
  composer exec --list |
    split row (char newline) |
    skip 1 |
    str trim --char '-' |
    str trim
}

# Executes a vendored binary/script.
export extern "composer exec" [
  --list(-l) # List all executable scripts.

  script?: string@"nu-complete composer exec-scripts" # The binary to run, e.g. phpunit.
  ...args: string # Arguments to pass to the binary. Use `--` to separate from composer arguments.
]

def "nu-complete composer fund-formats" [] {
  ['text' 'json']
}

# Discover how to help fund the maintenance of your dependencies.
export extern "composer fund" [
  --format(-f): string@"nu-complete composer fund-formats" # Format of the output: text or json. [default: "text"]
]

# Allows running commands in the global composer dir ($COMPOSER_HOME).
export extern "composer global" [
  command_name: string@"nu-complete composer commands"
  ...args: string
]

# Display help for a command.
export extern "composer help" [
  --raw # To output raw command help.
  --format: string@"nu-complete composer command-description-output-formats" # The output format (txt, xml, json, or md) [default: "txt"].

  command?: string@"nu-complete composer commands" # The command name. [default: "help"]
]

def "nu-complete composer project-types" [] {
  ['library' 'project' 'metapackage' 'composer-plugin']
}

# Creates a basic composer.json file in current directory.
export extern "composer init" [
  --name: string # Name of the package.
  --description: string # Description of package.
  --author: string # Author name of package.
  --type: string@"nu-complete composer project-types" # Type of package (e.g. library, project, metapackage, composer-plugin).
  --homepage: string # Homepage of package.
  --require: string # Package to require with a version constraint, e.g. foo/bar:1.0.0 or foo/bar=1.0.0 or "foo/bar 1.0.0" (multiple values allowed).
  --require-dev: string #-DEV  Package to require for development with a version constraint, e.g. foo/bar:1.0.0 or foo/bar=1.0.0 or "foo/bar 1.0.0" (multiple values allowed).
  -s, --stability: string # Minimum stability (empty or one of: stable, RC, beta, alpha, dev).
  -l, --license: string # License of package.
  --repository: string # Add custom repositories, either by URL or using JSON arrays (multiple values allowed).
  --autoload(-a): string # Add PSR-4 autoload mapping. Maps your package's namespace to the provided directory. (Expects a relative path, e.g. src/).
]

# [i] Installs the project dependencies from the composer.lock file if present, or falls back on the composer.json
export extern "composer install" [
  --prefer-source # Forces installation from package sources when possible, including VCS information.
  --prefer-dist # Forces installation from package dist (default behavior).
  --prefer-install: string@"nu-complete composer installation-modes" # Forces installation from package dist|source|auto (auto chooses source for dev versions, dist for the rest).

  --dry-run # Outputs the operations but will not execute anything (implicitly enables --verbose).
  --download-only # Download only, do not install packages.
  --no-dev # Disables installation of require-dev packages.
  --no-autoloader # Skips autoloader generation.
  --no-progress # Do not output download progress.

  --audit # Run an audit after installation is complete.
  --audit-format: string@"nu-complete composer audit-formats" # Audit output format. Must be "table", "plain", "json", or "summary". [default: "summary"]

  --optimize-autoloader(-o) # Optimize autoloader during autoloader dump.
  --classmap-authoritative(-a) # Autoload classes from the classmap only. Implicitly enables --apcu-autoloader
  --apcu-autoloader # Use APCu to cache found/not-found classes.
  --apcu-autoloader-prefix: string # Use a custom prefix for the APCu autoloader cache. Implicitly enables --apcu-autoloader.

  --ignore-platform-req: string # Ignore a specific platform requirements (php & ext- packages). (multiple values allowed).
  --ignore-platform-reqs # Ignore all platform requirements (php & ext- packages).
]

def "nu-complete composer licenses-formats" [] {
  ['text' 'json' 'summary']
}

# Shows information about licenses of dependencies.
export extern "composer licenses" [
  --format(-f): string@"nu-complete composer licenses-formats" # Format of the output: text, json or summary. [default: "text"]
  --no-dev # Disables search in require-dev packages.
]

# List commands
export extern "composer list" [
  --raw # To output raw command list.
  --format: string@"nu-complete composer command-description-output-formats" # The output format (txt, xml, json, or md) [default: "txt"].
  --short # To skip describing commands' arguments.
]

def "nu-complete composer show-formats" [] {
  ['text' 'json']
}

# Shows a list of installed packages that have updates available, including their latest version.
export extern "composer outdated" [
  --outdated(-o) # Show only packages that are outdated (this is the default, but present here for compat with `show`)
  --all(-a) # Show all installed packages with their latest versions
  --locked # Shows updates for packages from the lock file, regardless of what is currently in vendor dir
  --direct(-D) # Shows only packages that are directly required by the root package
  --strict # Return a non-zero exit code when there are outdated packages
  --major-only(-M) # Show only packages that have major SemVer-compatible updates.
  --minor-only(-m) # Show only packages that have minor SemVer-compatible updates.
  --patch-only(-p) # Show only packages that have patch SemVer-compatible updates.
  --sort-by-age(-A) # Displays the installed version's age, and sorts packages oldest first.
  --format(-f): string@"nu-complete composer show-formats" # Format of the output: text or json [default: "text"]
  --ignore: string # Ignore specified package(s). Can contain wildcards (*). Use it if you don't want to be informed about new versions of some packages. (multiple values allowed)
  --no-dev # Disables search in require-dev packages.

  --ignore-platform-req: string # Ignore a specific platform requirement (php & ext- packages). Use with the --outdated option (multiple values allowed).
  --ignore-platform-reqs # Ignore all platform requirements (php & ext- packages). Use with the --outdated option

  package?: string # Package to inspect. Or a name including a wildcard (*) to filter lists of packages instead.
]

# [why-not] Shows which packages prevent the given package from being installed
export extern "composer prohibits" [
  --recursive(-r) # Recursively resolves up to the root package.
  --tree(-t) # Prints the results as a nested tree.
  --locked # Read dependency information from composer.lock.

  package: string # Package to inspect.
  version?: string # Version constraint, which version you expected to be installed.
]

# Uninstalls and reinstalls the given package names.
export extern "composer reinstall" [
  --prefer-source # Forces installation from package sources when possible, including VCS information.
  --prefer-dist # Forces installation from package dist (default behavior).
  --prefer-install: string@"nu-complete composer installation-modes" # Forces installation from package dist|source|auto (auto chooses source for dev versions, dist for the rest).

  --no-autoloader # Skips autoloader generation.
  --no-progress # Do not output download progress.

  --optimize-autoloader(-o) # Optimize autoloader during autoloader dump.
  --classmap-authoritative(-a) # Autoload classes from the classmap only. Implicitly enables --apcu-autoloader
  --apcu-autoloader # Use APCu to cache found/not-found classes.
  --apcu-autoloader-prefix: string # Use a custom prefix for the APCu autoloader cache. Implicitly enables --apcu-autoloader.

  --ignore-platform-req: string # Ignore a specific platform requirements (php & ext- packages). (multiple values allowed).
  --ignore-platform-reqs # Ignore all platform requirements (php & ext- packages).

  ...packages: string@"nu-complete composer installed-packages" # List of package names to reinstall, can include a wildcard (*) to match any substring.
]

# [rm] Removes a package from the require or require-dev
export extern "composer remove" [
  --dev # Removes a package from the require-dev section.
  --dry-run # Outputs the operations but will not execute anything (implicitly enables --verbose).

  --no-progress # Do not output download progress.
  --no-update # Disables the automatic update of the dependencies (implies --no-install).
  --no-install # Skip the install step after update the composer.lock file.
  --no-audit # Skip the audit step after updating the composer.lock file (can also be set via the COMPOSER_NO_AUDIT=1 env var).
  --audit-format: string@"nu-complete composer audit-formats" # Audit output format. Must be "table", "plain", "json", or "summary". [default: "summary"]
  --update-no-dev # Run the dependency update with the --no-dev option.
  --update-with-dependencies(-w) # Allows inherited dependencies to be updated, except those that are root requirements.
  --update-with-all-dependencies(-W) # Allows all inherited dependencies to be updated, including those that are root requirements.
  --with-dependencies # Alias for --update-with-dependencies
  --with-all-dependencies # Alias for --update-with-all-dependencies

  --minimal-changes(-M) # During an update with -w/-W, only perform absolutely necessary changes to transitive dependencies (can also be set via the COMPOSER_MINIMAL_CHANGES=1 env var).

  --unused # Remove all packages which are locked but not required by any other package.

  --ignore-platform-req: string # Ignore a specific platform requirements (php & ext- packages). (multiple values allowed).
  --ignore-platform-reqs # Ignore all platform requirements (php & ext- packages).

  --optimize-autoloader(-o) # Optimize autoloader during autoloader dump.
  --classmap-authoritative(-a) # Autoload classes from the classmap only. Implicitly enables --apcu-autoloader
  --apcu-autoloader # Use APCu to cache found/not-found classes.
  --apcu-autoloader-prefix: string # Use a custom prefix for the APCu autoloader cache. Implicitly enables --apcu-autoloader.

  ...packages: string@"nu-complete composer installed-packages" # Packages that should be removed.
]

# [r|req] Adds required packages to your composer.json and installs them
export extern "composer require" [
  --dev # Add requirement to require-dev.
  --dry-run # Outputs the operations but will not execute anything (implicitly enables --verbose).

  --prefer-source # Forces installation from package sources when possible, including VCS information.
  --prefer-dist # Forces installation from package dist (default behavior).
  --prefer-install: string@"nu-complete composer installation-modes" # Forces installation from package dist|source|auto (auto chooses source for dev versions, dist for the rest).

  --fixed # Write fixed version to the composer.json.

  --no-progress # Do not output download progress.
  --no-update # Disables the automatic update of the dependencies (implies --no-install).
  --no-install # Skip the install step after update the composer.lock file.
  --no-audit # Skip the audit step after updating the composer.lock file (can also be set via the COMPOSER_NO_AUDIT=1 env var).
  --audit-format: string@"nu-complete composer audit-formats" # Audit output format. Must be "table", "plain", "json", or "summary". [default: "summary"]
  --update-no-dev # Run the dependency update with the --no-dev option.
  --update-with-dependencies(-w) # Allows inherited dependencies to be updated, except those that are root requirements.
  --update-with-all-dependencies(-W) # Allows all inherited dependencies to be updated, including those that are root requirements.
  --with-dependencies # Alias for --update-with-dependencies
  --with-all-dependencies # Alias for --update-with-all-dependencies

  --ignore-platform-req: string # Ignore a specific platform requirements (php & ext- packages). (multiple values allowed).
  --ignore-platform-reqs # Ignore all platform requirements (php & ext- packages).

  --prefer-stable # Prefer stable versions of dependencies (can also be set via the COMPOSER_PREFER_STABLE=1 env var)
  --prefer-lowest # Prefer lowest versions of dependencies (can also be set via the COMPOSER_PREFER_LOWEST=1 env var)

  --minimal-changes(-M) # During an update with -w/-W, only perform absolutely necessary changes to transitive dependencies (can also be set via the COMPOSER_MINIMAL_CHANGES=1 env var).
  --sort-packages # Sorts packages when adding/updateing a new dependency.

  --optimize-autoloader(-o) # Optimize autoloader during autoloader dump.
  --classmap-authoritative(-a) # Autoload classes from the classmap only. Implicitly enables --apcu-autoloader
  --apcu-autoloader # Use APCu to cache found/not-found classes.
  --apcu-autoloader-prefix: string # Use a custom prefix for the APCu autoloader cache. Implicitly enables --apcu-autoloader.

  ...packages: string
]

def "nu-complete composer scripts" [] {
  do { composer run --list } |
  complete |
  get stdout |
  split row (char newline) |
  parse '  {value} {description}' |
  str trim
}

# [run] Runs the scripts defined in composer.json.
export extern "composer run-script" [
  --timeout: int # Sets script timeout in seconds, or 0 for never.
  --dev # Sets the dev mode.
  --list(-l) # List scripts.
  script?: string@"nu-complete composer scripts" # Script name to run.
  ...args: string
]

def "nu-complete composer search-formats" [] {
  ['text' 'json']
}

# Searches for packages
export extern "composer search" [
  --only-name(-N) # Search only in package name
  --only-vendor(-O) # Search only for vendor / organization names, returns only "vendor" as result.
  --type(-t): string@"nu-complete composer project-types" # Search for a specific package type.
  --format(-f): string@"nu-complete composer search-formats" # Format of the output: text or json. [default: "text"]

  ...tokens: string # Tokens to search for.
]

## TODO: find a way to specify --1 --2 --2.2 flags for self-update command
# --1 # Force an update to the stable channel, but only use 1.x versions
# --2 # Force an update to the stable channel, but only use 2.x versions
# --2.2 # Force an update to the stable channel, but only use 2.2.x LTS versions

# [selfupdate] Updates composer.phar to the latest version.
export extern "composer self-update" [
  --rollback(-r) # Revert to an older installation of composer
  --clean-backups # Delete old backups during an update. This makes the current version of compsoer the only backup available after the update.
  --no-progress # Do not output download progress.
  --update-keys # Prompt user for a key update.
  --stable # Force an update to the stable channel.
  --preview # Force an update to the preview channel.
  --snapshot # Force an update to the snapshot channel.
  --set-channel-only # Only store the channel as the default one and then exit.

  version?: string # The version to update to
]

# [info] Shows information about packages.
export extern "composer show" [
  --outdated(-o) # Show only packages that are outdated (this is the default, but present here for compat with `show`)
  --all(-a) # Show all installed packages with their latest versions
  --locked # Shows updates for packages from the lock file, regardless of what is currently in vendor dir
  --direct(-D) # Shows only packages that are directly required by the root package
  --strict # Return a non-zero exit code when there are outdated packages
  --major-only(-M) # Show only packages that have major SemVer-compatible updates.
  --minor-only(-m) # Show only packages that have minor SemVer-compatible updates.
  --patch-only(-p) # Show only packages that have patch SemVer-compatible updates.
  --sort-by-age(-A) # Displays the installed version's age, and sorts packages oldest first.
  --format(-f): string@"nu-complete composer show-formats" # Format of the output: text or json [default: "text"]
  --ignore: string # Ignore specified package(s). Can contain wildcards (*). Use it if you don't want to be informed about new versions of some packages. (multiple values allowed)
  --no-dev # Disables search in require-dev packages.

  --ignore-platform-req: string # Ignore a specific platform requirements (php & ext- packages). (multiple values allowed).
  --ignore-platform-reqs # Ignore all platform requirements (php & ext- packages).

  package?: string # Package to inspect. Or a name including a wildcard (*) to filter lists of packages instead.
  version?: string # Version constraint, which version you expected to be installed.
]

# Shows a list of locally modified packages.
export extern "composer status" []

# Shows package suggestions.
export extern "composer suggest" [
  --by-package # Groups output by suggesting package (default)
  --by-suggestion # Groups output by suggested package
  --all(-a) # Show suggestions from all dependencies, including transitive ones
  --list # Show only list of suggested package names
  --no-dev # Exclude suggestions from require-dev packages

  ...packages: string # Packages that you want to list suggestions from.
]

# [u|upgrade] Updates your dependencies to the latest version according to composer.json, and updates the composer.lock file.
export extern "composer update" [
  --with: string # Temporary version constraint to add, e.g. foo/bar:1.0.0 or foo/bar=1.0.0 (multiple values allowed)

  --prefer-source # Forces installation from package sources when possible, including VCS information.
  --prefer-dist # Forces installation from package dist (default behavior).
  --prefer-install: string@"nu-complete composer installation-modes" # Forces installation from package dist|source|auto (auto chooses source for dev versions, dist for the rest).

  --dry-run # Outputs the packages to bump, but will not execute anything.
  --no-dev # Disables installation of require-dev packages

  --lock # Overwrites the lock file hash to suppress warning about the lock file being out of date without updating package versions. Package metadata like mirrors and URLs are updated if they changed.

  --no-audit # Skip the audit step after updating the composer.lock file (can also be set via the COMPOSER_NO_AUDIT=1 env var).
  --audit-format: string@"nu-complete composer audit-formats" # Audit output format. Must be "table", "plain", "json", or "summary". [default: "summary"]
  --update-no-dev # Run the dependency update with the --no-dev option.
  --with-dependencies(-w) # Update also dependencies of packages in the argument list, except those which are root requirements.
  --with-all-dependencies(-W) # Update also dependencies of packages in the argument list, including those which are root requirements.


  --optimize-autoloader(-o) # Optimize autoloader during autoloader dump.
  --classmap-authoritative(-a) # Autoload classes from the classmap only. Implicitly enables --apcu-autoloader
  --apcu-autoloader # Use APCu to cache found/not-found classes.
  --apcu-autoloader-prefix: string # Use a custom prefix for the APCu autoloader cache. Implicitly enables --apcu-autoloader.

  --ignore-platform-req: string # Ignore a specific platform requirements (php & ext- packages). (multiple values allowed).
  --ignore-platform-reqs # Ignore all platform requirements (php & ext- packages).

  --prefer-source # Forces installation from package sources when possible, including VCS information.
  --prefer-dist # Forces installation from package dist (default behavior).
  --prefer-install: string@"nu-complete composer installation-modes" # Forces installation from package dist|source|auto (auto chooses source for dev versions, dist for the rest).

  --minimal-changes(-M) # During an update with -w/-W, only perform absolutely necessary changes to transitive dependencies (can also be set via the COMPOSER_MINIMAL_CHANGES=1 env var).

  --interactive(-i) # Interactive interface with autocompletion to select the packages to update.
  --root-reqs # Restricts the update to your first degree dependencies.

  ...packages: string@"nu-complete composer installed-packages"
]

# Validates a composer.json and composer.lock.
export extern "composer validate" [
  --no-check-all # Do not validate requires for overly strict/loose constraints.
  --check-lock # Check if lock file is up to date (even when config.lock is false).
  --no-check-lock # Do not check if lock file is up to date.
  --no-check-publish # Do not check for publish errors.
  --no-check-version # Do not report a warning if the version field is present.
  --with-dependencies(-A) # Also validate the composer.json of all installed dependencies.
  --strict # Return a non-zero exit code for warnings as well as errors.
  file?: string = "composer.json"
]
