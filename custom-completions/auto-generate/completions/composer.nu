# Sets script timeout in seconds, or 0 for never.
extern "composer" [

	...args
]

# Short information about Composer
extern "composer about" [

	...args
]

# Create an archive of this composer package
extern "composer archive" [
	--format					# Format of the resulting archive: tar or zip
	--dir					# Write the archive to this directory
	--file					# Write the archive with the given file name. Note that the format will be appended.
	--ignore-filters					# Ignore filters when saving package
	...args
]

# Opens the packages repository URL or homepage in your browser.
extern "composer browse" [
	--homepage					# Open the homepage instead of the repository URL.
	--show					# Only show the homepage or repository URL.
	...args
]

# Check that platform requirements are satisfied.
extern "composer check-platform-reqs" [
	--no-dev					# Disables checking of require-dev packages requirements.
	...args
]

# Clears composers internal package cache.
extern "composer clear-cache" [

	...args
]

# Set config options
extern "composer config" [
	--global					# Apply command to the global config file
	--editor					# Open editor
	--auth					# Affect auth config file (only used for --editor)
	--unset					# Unset the given setting-key
	--list					# List configuration settings
	--file					# If you want to choose a different composer.json or config.json
	--absolute					# Returns absolute paths when fetching *-dir config values instead of relative
	...args
]

# Create new project from a package into given directory.
extern "composer create-project" [
	--stability					# Minimum-stability allowed (unless a version is specified).
	--prefer-source					# Forces installation from package sources when possible, including VCS information.
	--prefer-dist					# Forces installation from package dist even for dev versions.
	--repository					# Pick a different repository (as url or json config) to look for the package.
	--repository-url					# DEPRECATED: Use --repository instead.
	--dev					# Enables installation of require-dev packages (enabled by default, only present for BC).
	--no-dev					# Disables installation of require-dev packages.
	--no-custom-installers					# DEPRECATED: Use no-plugins instead.
	--no-scripts					# Whether to prevent execution of all defined scripts in the root package.
	--no-progress					# Do not output download progress.
	--no-secure-http					# Disable the secure-http config option temporarily while installing the root package. Use at your own risk. Using this flag is a bad idea.
	--keep-vcs					# Whether to prevent deleting the vcs folder.
	--remove-vcs					# Whether to force deletion of the vcs folder without prompting.
	--no-install					# Whether to skip installation of the package dependencies.
	--ignore-platform-reqs					# Ignore platform requirements (php & ext- packages).
	...args
]

# Shows which packages depend on the given package
extern "composer depends" [
	--recursive					# Recursively resolves up to the root package
	--tree					# Prints the results as a nested tree
	...args
]

# Diagnoses the system to identify common errors.
extern "composer diagnose" [

	...args
]

# Dumps the autoloader
extern "composer dump-autoload" [
	--no-scripts					# Skips the execution of all scripts defined in composer.json file.
	--optimize					# Optimizes PSR0 and PSR4 packages to be loaded with classmaps too, good for production.
	--classmap-authoritative					# Autoload classes from the classmap only. Implicitly enables `--optimize`.
	--apcu					# Use APCu to cache found/not-found classes.
	--no-dev					# Disables autoload-dev rules.
	...args
]

# Executes a vendored binary/script.
extern "composer exec" [
	--list
	...args
]

# Allows running commands in the global composer dir ($COMPOSER_HOME).
extern "composer global" [

	...args
]

# Displays help for a command
extern "composer help" [
	--xml					# To output help as XML
	--format					# The output format (txt, xml, json, or md)
	--raw					# To output raw command help
	...args
]

# Opens the packages repository URL or homepage in your browser.
extern "composer home" [

	...args
]

# Creates a basic composer.json file in current directory.
extern "composer init" [
	--name					# Name of the package
	--description					# Description of package
	--author					# Author name of package
	--type					# Type of package (e.g. library, project, metapackage, composer-plugin)
	--homepage					# Homepage of package
	--require					# Package to require with a version constraint, e.g. foo/bar:1.0.0 or foo/bar=1.0.0 or "foo/bar 1.0.0
	--require-dev					# Package to require for development with a version constraint, e.g. foo/bar:1.0.0 or foo/bar=1.0.0 or "foo/bar 1.0.0
	--stability					# Minimum stability (empty or one of: stable, RC, beta, alpha, dev)
	--license					# License of package
	--repository					# Add custom repositories, either by URL or using JSON arrays
	...args
]

# Installs the project dependencies from the composer.lock file if present, or falls back on the composer.json.
extern "composer install" [
	--prefer-source					# Forces installation from package sources when possible, including VCS information.
	--prefer-dist					# Forces installation from package dist even for dev versions.
	--dry-run					# Outputs the operations but will not execute anything (implicitly enables --verbose).
	--dev					# Enables installation of require-dev packages (enabled by default, only present for BC).
	--no-dev					# Disables installation of require-dev packages.
	--no-custom-installers					# DEPRECATED: Use no-plugins instead.
	--no-autoloader					# Skips autoloader generation
	--no-scripts					# Skips the execution of all scripts defined in composer.json file.
	--no-progress					# Do not output download progress.
	--no-suggest					# Do not show package suggestions.
	--optimize-autoloader					# Optimize autoloader during autoloader dump
	--classmap-authoritative					# Autoload classes from the classmap only. Implicitly enables `--optimize-autoloader`.
	--apcu-autoloader					# Use APCu to cache found/not-found classes.
	--ignore-platform-reqs					# Ignore platform requirements (php & ext- packages).
	...args
]

# Show information about licenses of dependencies
extern "composer licenses" [
	--format					# Format of the output: text or json
	--no-dev					# Disables search in require-dev packages.
	...args
]

# Lists commands
extern "composer list" [
	--xml					# To output list as XML
	--raw					# To output raw command list
	--format					# The output format (txt, xml, json, or md)
	...args
]

# Shows a list of installed packages that have updates available, including their latest version.
extern "composer outdated" [
	--outdated					# Show only packages that are outdated (this is the default, but present here for compat with `show`
	--all					# Show all installed packages with their latest versions
	--direct					# Shows only packages that are directly required by the root package
	--strict					# Return a non-zero exit code when there are outdated packages
	--minor-only					# Show only packages that have minor SemVer-compatible updates. Use with the --outdated option.
	--format					# Format of the output: text or json
	--ignore					# Ignore specified package(s). Use it with the --outdated option if you dont want to be informed about new versions of some packages.
	...args
]

# Shows which packages prevent the given package from being installed.
extern "composer prohibits" [
	--recursive					# Recursively resolves up to the root package
	--tree					# Prints the results as a nested tree
	...args
]

# Removes a package from the require or require-dev
extern "composer remove" [
	--dev					# Removes a package from the require-dev section.
	--no-progress					# Do not output download progress.
	--no-update					# Disables the automatic update of the dependencies.
	--no-scripts					# Skips the execution of all scripts defined in composer.json file.
	--update-no-dev					# Run the dependency update with the --no-dev option.
	--update-with-dependencies					# Allows inherited dependencies to be updated with explicit dependencies. (Deprecrated, is now default behavior)
	--no-update-with-dependencies					# Does not allow inherited dependencies to be updated with explicit dependencies.
	--ignore-platform-reqs					# Ignore platform requirements (php & ext- packages).
	--optimize-autoloader					# Optimize autoloader during autoloader dump
	--classmap-authoritative					# Autoload classes from the classmap only. Implicitly enables `--optimize-autoloader`.
	--apcu-autoloader					# Use APCu to cache found/not-found classes.
	...args
]

# Adds required packages to your composer.json and installs them
extern "composer require" [
	--dev					# Add requirement to require-dev.
	--prefer-source					# Forces installation from package sources when possible, including VCS information.
	--prefer-dist					# Forces installation from package dist even for dev versions.
	--no-progress					# Do not output download progress.
	--no-suggest					# Do not show package suggestions.
	--no-update					# Disables the automatic update of the dependencies.
	--no-scripts					# Skips the execution of all scripts defined in composer.json file.
	--update-no-dev					# Run the dependency update with the --no-dev option.
	--update-with-dependencies					# Allows inherited dependencies to be updated, except those that are root requirements.
	--update-with-all-dependencies					# Allows all inherited dependencies to be updated, including those that are root requirements.
	--ignore-platform-reqs					# Ignore platform requirements (php & ext- packages).
	--prefer-stable					# Prefer stable versions of dependencies.
	--prefer-lowest					# Prefer lowest versions of dependencies.
	--sort-packages					# Sorts packages when adding/updating a new dependency
	--optimize-autoloader					# Optimize autoloader during autoloader dump
	--classmap-authoritative					# Autoload classes from the classmap only. Implicitly enables `--optimize-autoloader`.
	--apcu-autoloader					# Use APCu to cache found/not-found classes.
	...args
]

# Run the scripts defined in composer.json.
extern "composer run-script" [
	--timeout					# Sets script timeout in seconds, or 0 for never.
	--dev					# Sets the dev mode.
	--no-dev					# Disables the dev mode.
	--list					# List scripts.
	...args
]

# Search for packages
extern "composer search" [
	--only-name					# Search only in name
	--type					# Search for a specific package type
	...args
]

# Updates composer.phar to the latest version.
extern "composer self-update" [
	--rollback					# Revert to an older installation of composer
	--clean-backups					# Delete old backups during an update. This makes the current version of composer the only backup available after the update
	--no-progress					# Do not output download progress.
	--update-keys					# Prompt user for a key update
	--stable					# Force an update to the stable channel
	--preview					# Force an update to the preview channel
	--snapshot					# Force an update to the snapshot channel
	--set-channel-only					# Only store the channel as the default one and then exit
	...args
]

# Show information about packages
extern "composer show" [
	--all					# List all packages
	--installed					# List installed packages only (enabled by default, only present for BC).
	--platform					# List platform packages only
	--available					# List available packages only
	--self					# Show the root package information
	--name-only					# List package names only
	--path					# Show package paths
	--tree					# List the dependencies as a tree
	--latest					# Show the latest version
	--outdated					# Show the latest version but only for packages that are outdated
	--ignore					# Ignore specified package(s). Use it with the --outdated option if you dont want to be informed about new versions of some packages.
	--minor-only					# Show only packages that have minor SemVer-compatible updates. Use with the --outdated option.
	--direct					# Shows only packages that are directly required by the root package
	--strict					# Return a non-zero exit code when there are outdated packages
	--format					# Format of the output: text or json
	...args
]

# Show a list of locally modified packages
extern "composer status" [

	...args
]

# Shows package suggestions.
extern "composer suggests" [
	--by-package					# Groups output by suggesting package
	--by-suggestion					# Groups output by suggested package
	--no-dev					# Exclude suggestions from require-dev packages
	...args
]

# Updates your dependencies to the latest version according to composer.json, and updates the composer.lock file.
extern "composer update" [
	--rollback					# Revert to an older installation of composer
	--clean-backups					# Delete old backups during an update. This makes the current version of composer the only backup available after the update
	--no-progress					# Do not output download progress.
	--update-keys					# Prompt user for a key update
	--stable					# Force an update to the stable channel
	--preview					# Force an update to the preview channel
	--snapshot					# Force an update to the snapshot channel
	--set-channel-only					# Only store the channel as the default one and then exit
	--prefer-source					# Forces installation from package sources when possible, including VCS information.
	--prefer-dist					# Forces installation from package dist even for dev versions.
	--dry-run					# Outputs the operations but will not execute anything (implicitly enables --verbose).
	--dev					# Enables installation of require-dev packages (enabled by default, only present for BC).
	--no-dev					# Disables installation of require-dev packages.
	--lock					# Only updates the lock file hash to suppress warning about the lock file being out of date.
	--no-custom-installers					# DEPRECATED: Use no-plugins instead.
	--no-autoloader					# Skips autoloader generation
	--no-scripts					# Skips the execution of all scripts defined in composer.json file.
	--no-progress					# Do not output download progress.
	--no-suggest					# Do not show package suggestions.
	--with-dependencies					# Add also dependencies of whitelisted packages to the whitelist, except those defined in root package.
	--with-all-dependencies					# Add also all dependencies of whitelisted packages to the whitelist, including those defined in root package.
	--verbose(-v)					# Shows more details including new commits pulled in when updating packages.
	--optimize-autoloader(-o)					# Optimize autoloader during autoloader dump.
	--classmap-authoritative(-a)					# Autoload classes from the classmap only. Implicitly enables `--optimize-autoloader`.
	--apcu-autoloader					# Use APCu to cache found/not-found classes.
	--ignore-platform-reqs					# Ignore platform requirements (php & ext- packages).
	--prefer-stable					# Prefer stable versions of dependencies.
	--prefer-lowest					# Prefer lowest versions of dependencies.
	--interactive(-i)					# Interactive interface with autocompletion to select the packages to update.
	--root-reqs					# Restricts the update to your first degree dependencies.
	...args
]

# Validates a composer.json
extern "composer validate" [
	--no-check-all					# Do not validate requires for overly strict/loose constraints
	--no-check-lock					# Do not check if lock file is up to date
	--no-check-publish					# Do not check for publish errors
	--with-dependencies					# Also validate the composer.json of all installed dependencies
	--strict					# Return a non-zero exit code for warnings as well as errors
	...args
]

# Shows which packages cause the given package to be installed
extern "composer why" [

	...args
]

# Shows which packages prevent the given package from being installed
extern "composer why-not" [

	...args
]