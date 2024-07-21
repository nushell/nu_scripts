# !! WARNING !!
# This is for yarn v2(berry) and higher, which is not installed by default. see https://yarnpkg.com/getting-started/migration for a migration guide
# Before running any command after this is installed, please run `refresh-cache` to update the NPM registry and yarn plugin cache

def "nu-complete yarn run" [] {

  let userScripts = try {
    open ./package.json 
    | get scripts 
    | transpose 
    | rename value description
  } catch {[]}

  let binaries = try {
    yarn bin --json 
    | lines 
    | each { |it| $it | from json } 
    | select name source 
    | rename value description
  } catch {[]}

  $userScripts | append $binaries
}

def 'nu-complete yarn' [] {
  let commands = [
    {value:'add', description:'Add dependencies to the project'}
    {value:'bin', description:'Get the path to a binary script'}
    {value: 'cache clean', description: 'Remove the shared cache files'}
    {value: 'config get', description: 'Read a configuration settings'}
    {value: 'config set', description: 'Change a configuration settings'}
    {value: 'config unset', description: 'Unset a configuration setting'}
    {value: 'config', description: 'Display the current configuration'}
    {value: 'constraints query', description: 'Query the constraints fact database'}
    {value: 'constraints source', description: 'Print the source code for the constraints'}
    {value: 'yarn constraints', description: 'Check that the project constraints are met'}
    {value: 'dedupe', description: 'Deduplicate dependencies with overlapping ranges'}
    {value: 'dlx', description: 'Run a package in a temporary environment'}
    {value: 'exec', description: 'Execute a shell script'}
    {value: 'explain peer-requirements', description: 'Explain a set of peer requirements'}
    {value: 'explain', description: 'Explain an error code'}
    {value: 'info', description: 'See information related to packages'}
    {value: 'install', description: 'Install the project dependencies'}
    {value: 'link', description: 'Connect the local project to another one'}
    {value: 'node', description: 'Run node with the hook already setup'}
    {value: 'npm audit', description: 'Perform a vulnerability audit against the installed packages'}
    {value: 'npm info', description: 'Show information about a package'}
    {value: 'npm login', description: 'Store new login info to access the npm registry'}
    {value: 'npm logout', description: 'Logout of the npm registry'}
    {value: 'npm publish', description: 'Publish the active workspace to the npm registry'}
    {value: 'npm tag add', description: 'Add a tag for a specific version of a package'}
    {value: 'npm tag list', description: 'List all dist-tags of a package'}
    {value: 'npm tag remove', description: 'Remove a tag from a package'}
    {value: 'npm whoami', description: 'Display the name of the authenticated user'}
    {value: 'pack', description: 'Generate a tarball from the active workspace'}
    {value: 'patch-commit', description: 'Generate a patch out of a directory'}
    {value: 'patch', description: 'Prepare a package for patching'}
    {value: 'plugin import from sources', description: 'Build a plugin from sources'}
    {value: 'plugin import', description: 'Download a plugin'}
    {value: 'plugin list', description: 'List the available official plugins'}
    {value: 'plugin remove', description: 'Remove a plugin'}
    {value: 'plugin runtime', description: 'List the active plugins'}
    {value: 'rebuild', description: "Rebuild the project's native packages"}
    {value: 'remove', description: 'Remove dependencies from the project'}
    {value: 'run', description: 'Run a script defined in the package.json'}
    {value: 'search', description: 'Open the search interface'}
    {value: 'set resolution', description: 'Enforce a package resolution'}
    {value: 'set version from sources', description: 'Build Yarn from master'}
    {value: 'set version', description: 'Lock the Yarn version used by the project'}
    {value: 'stage', description: 'Add all yarn files to your vcs'}
    {value: 'unlink', description: 'Disconnect the local project from another one'}
    {value: 'unplug', description: 'Force the unpacking of a list of packages'}
    {value: 'up', description: 'Upgrade dependencies across the project'}
    {value: 'upgrade-interactive', description: 'Open the upgrade interface'}
    {value: 'version', description: 'Apply a new version to the current package'}
    {value: 'version apply', description: 'Apply all the deferred version bumps at once'}
    {value: 'version check', description: 'Check that all the relevant packages have been bumped'}
    {value: 'why', description: 'Display the reason why a package is needed'}
    {value: 'workspace', description: 'Run a command within the specified workspace'}
    {value: 'workspaces focus', description: 'Install a single workspace and its dependencies'}
    {value: 'workspaces foreach', description: 'Run a command on all workspaces'}
    {value: 'workspaces list', description: 'List all available workspaces'}
  ]

 let runnables = try {(nu-complete yarn run)} catch {[]}
  
 $commands | append $runnables
}

export extern "yarn" [
  command?: string@"nu-complete yarn"
]

def 'nu-complete yarn mode' [] {
  ["skip-build", "update-lockfile"]
}

export def "refresh-cache" [] {
  npm i -g all-the-package-names
  let npmCacheFilePath = ($nu.config-path | path dirname | path join "yarnCache" | path join $"npmCache.csv")
  all-the-package-names | each { |i| $i | split column "\n" | transpose col0 package | reject col0 } | flatten | to csv | save $npmCacheFilePath

  let yarnPluginCacheFilePath = ($nu.config-path | path dirname | path join "yarnCache" | path join $"yarnPluginCache.csv")
  ^yarn plugin list --json | lines | each { |it| from json } | to csv | save $yarnPluginCacheFilePath
}

def "nu-complete yarn add" [] {
  let cacheFilePath = ($nu.config-path | path dirname | path join "yarnCache" | path join $"npmCache.csv")
  # TODO switch to dataframes
  open $cacheFilePath | $in.package
}

# Add dependencies to the project
export extern "yarn add" [
  --json # Format the output as an NDJSON stream
  --exact(-E) # Don't use any semver modifier on the resolved range
  --tilde(-T) # Use the ~ semver modifier on the resolved range
  --caret(-C) # Use the ^ semver modifier on the resolved range
  --dev(-D) # Add a package as a dev dependency
  --peer(-P) # Add a package as a peer dependency
  --optional(-O) # Add / upgrade a package to an optional regular / peer dependency
  --prefer-dev # Add / upgrade a package to a dev dependency
  --interactive(-i) # Reuse the specified package from other workspaces in the project
  --cached # Reuse the highest version already used somewhere within the project
  --mode: string@"nu-complete yarn mode" # Change what artifacts installs generate
  package: string@"nu-complete yarn add"
]

def 'nu-complete yarn bin' [] {
  ^yarn bin --json
  |lines
  |each { |it| $it | from json }
  |$in.name
}

# Get the path to a binary script
export extern "yarn bin" [
  --json # Format the output as an NDJSON stream
  --verbose(-v) # Print both the binary name and the locator of the package that provides the binary
  binary?: string@"nu-complete yarn bin"
]

# Remove the shared cache files
export extern "yarn cache clean" [
  --mirror # Remove the global cache files instead of the local cache files
  --all # Remove both the global cache files and the local cache files of the current project
]

def "nu-complete yarn config" [] {
  ^yarn config --json
  |lines
  |each { |it| $it | from json }
  |$in.key
}

# Read a configuration settings
export extern "yarn config get" [
  --json # Format the output as an NDJSON stream
  --no-redacted # Don't redact secrets (such as tokens) from the output
  name: string@"nu-complete yarn config"
]

# Change a configuration settings
export extern "yarn config set" [
  --json # Set complex configuration settings to JSON values
  --home(-H) # Update the home configuration instead of the project configuration
  name: string@"nu-complete yarn config"
  value: string
]

# Unset a configuration setting
export extern "yarn config unset" [
  --home(-H) # Update the home configuration instead of the project configuration
  name: string@"nu-complete yarn config"
]

# Display the current configuration
export extern "yarn config" [
  --verbose(-v) # Print the setting description on top of the regular key/value information
  --json # Format the output as an NDJSON stream
  --why # Print the reason why a setting is set a particular way
]

# Query the constraints fact database
export extern "yarn constraints query" [
  --json # Format the output as NDJSON stream
  query: string
]

# Print the source code for the constraints
export extern "yarn constraints source" [
  --verbose(-v) # Also print the fact database automatically compiled from the workspace manifests
]

# Check that the project constraints are met
export extern "yarn constraints" [
  --fix # Attempt to automatically fix unambiguous issues, following a multi-pass process
]

def 'nu-complete yarn dedupe strategy' [] {
   ["highest"]
}

# Deduplicate dependencies with overlapping ranges
export extern "yarn dedupe" [
  --strategy(-s): string@"nu-complete yarn dedupe strategy" # The strategy to use when deduping dependencies
  --check(-c) # Exit with exit code 1 when duplicates are found, without persisting the dependency tree
  --json # Format the output as an NDJSON stream
  --mode: string@"nu-complete yarn mode" # Change what artifacts installs generate
  package: string
]

def "nu-complete yarn dlx" [] {
  let cacheFilePath = ($nu.config-path | path dirname | path join "yarnCache" | path join $"npmCache.csv")
  # TODO switch to dataframes
  open $cacheFilePath | $in.package
}

# Run a package in a temporary environment
export extern "yarn dlx" [
  --package(-p) # The package(s) to install before running the command
  --quiet(-q) # Only report critical errors instead of printing the full install logs
  package: string@"nu-complete yarn dlx"
  ...args: string
]

# Execute a shell script
export extern "yarn exec" [
  ...command: string
]

def "nu-complete yarn explain peer-requirements" [] {
  let cacheFilePath = ($nu.config-path | path dirname | path join "yarnCache" | path join $"(open ./package.json | get name)-peerReqs.json")

  if ($cacheFilePath | path exists) {
    let cache = (open $cacheFilePath)

    let hash = ($cache | get hash)
    let computedHash = (open yarn.lock | hash sha256)

    if $hash == $computedHash {
      $cache | get hashes
    } else {
       ^yarn explain peer-requirements | lines | parse -r '.+: (?P<hash>\w+) → .*' | $in.hash
    }
  } else {
    let hashes = (^yarn explain peer-requirements | lines | parse -r '.+: (?P<hash>\w+) → .*' | $in.hash)
    let computedHash = (open yarn.lock | hash sha256)

    let cache = {
      hash: $computedHash,
      hashes: $hashes
    }

    $cache | save $cacheFilePath
    $hashes
  }
}

# Explain a set of peer requirements
export extern "yarn explain peer-requirements" [
  hash?: string@"nu-complete yarn explain peer-requirements"
]

# Explain an error code
export extern "yarn explain" [
  --json # Format the output as an NDJSON stream
  code: string
]


def "nu-complete yarn info" [] {
  let packagejson = (open ./package.json)
  let deps = ($packagejson | get dependencies | columns)
  let devDeps = ($packagejson | get devDependencies | columns)

  $deps | append $devDeps
}

# See information related to packages
export extern "yarn info" [
  --all(-A) # Print versions of a package from the whole project
  --recursive(-R) # Print information for all packages, including transitive dependencies
  --extra(-X): string # An array of requests of extra data provided by plugins
  --cache # Print information about the cache entry of a package (path, size, checksum)
  --dependents # Print all dependents for each matching package
  --manifest # Print data obtained by looking at the package archive (license, homepage, ...)
  --name-only # Only print the name for the matching packages
  --virtuals # Print each instance of the virtual packages
  --json # Format the output as an NDJSON stream
  package: string@"nu-complete yarn info"
]

# Install the project dependencies
export extern "yarn install" [
  --json # Format the output as an NDJSON stream
  --immutable # Abort with an error exit code if the lockfile was to be modified
  --immutable-cache # Abort with an error exit code if the cache folder was to be modified
  --check-cache # Always refetch the packages and ensure that their checksums are consistent
  --inline-builds # Verbosely print the output of the build steps of dependencies
  --mode: string@"nu-complete yarn mode" # Change what artifacts installs generate
]

# Connect the local project to another one
export extern "yarn link" [
  --all(-A) # Link all workspaces belonging to the target project to the current one
  --private(-p) # Also link private workspaces belonging to the target project to the current one
  --relative(-r) # Link workspaces using relative paths instead of absolute paths
  path: string
]

# Run node with the hook already setup
export extern "yarn node" [
  ...command: string
]

def "nu-complete yarn npm audit severity" [] {
  ["info", "low", "moderate", "high", "critical"]
}

# Perform a vulnerability audit against the installed packages.
export extern "yarn npm audit" [
  --all(-A) # Audit dependencies from all workspaces
  --recursive(-R) # Audit transitive dependencies as well
  --environment: string # Which environments to cover
  --json # Format the output as an NDJSON stream
  --severity: string@"nu-complete yarn npm audit severity" # Minimal severity requested for packages to be displayed
]

# Show information about a package
export extern "yarn npm info" [
  --json # Format the output as an NDJSON stream
  --fields(-f): string # A comma-separated list of manifest fields that should be displayed
  package: string
]

# Store new login info to access the npm registry
export extern "yarn npm login" [
  --scope(-s) # Login to the registry configured for a given scope
  --publish # Login to the publish registry
]

# Logout of the npm registry.
export extern "yarn npm logout" [
  --scope(-s) # Logout of the registry configured for a given scope
  --publish # Logout of the publish registry
  --all(-A) # Logout of all registries
]

# Publish the active workspace to the npm registry
export extern "yarn npm publish" [
  --access: string # The access level of the published package (public or restricted)
  --tag: string # The tag on the registry that the package should be attached to
  --tolerate-republish # Warn and exit when republishing an already existing version of a package
  --opt: string # The OTP token to use with the command
]

# Add a tag for a specific version of a package
export extern "yarn npm tag add" [
  package: string
  tag: string
]

# List all dist-tags of a package
export extern "yarn npm tag list" [
  --json # Format the output as an NDJSON stream
  package: string
]

# Remove a tag from a package
export extern "yarn npm tag remove" [
  package: string
  tag: string
]

# Display the name of the authenticated user
export extern "yarn npm whoami" [
  --scope(-s) # Print username for the registry configured for a given scope
  --publish # Print username for the publish registry
]

# Generate a tarball from the active workspace
export extern "yarn pack" [
  --install-if-needed # Run a priliminary yarn install if the package contains build scripts
  --dry-run(-n) # Print the file paths without actually generating the package archive
  --json # Format the output as an NDJSON stream
  --out(-o): string # Create the archive at the specified path
]

# Generate a patch out of a directory
export extern "yarn patch-commit" [
  --save(-s) # Add the patch to your resolution entries
]

def "nu-complete yarn patch" [] {
  let packagejson = (open ./package.json)
  let deps = ($packagejson | get dependencies | columns)
  let devDeps = ($packagejson | get devDependencies | columns)

  $deps | append $devDeps
}

# Prepare a package for patching
export extern "yarn patch" [
  --json # Format the output as an NDJSON stream
  package: string@"nu-complete yarn patch"
]

export extern "yarn plugin" []

# Build a plugin from sources
export extern "yarn plugin import from sources" [
  --path: string # The path where the repository should be cloned to
  --repository: string # The repository that should be cloned
  --branch: string # The branch of the repository that should be cloned
  --no-minify # Build a plugin for development (debugging) - non-minified and non-mangled
  --force(-f) # Always clone the repository instead of trying to fetch the latest commits
  plugin: string
]

def "nu-complete yarn plugin import" [] {
  let yarnPluginCacheFilePath = ($nu.config-path | path dirname | path join "yarnCache" | path join $"yarnPluginCache.csv")
  open $yarnPluginCacheFilePath | get name
}

# Download a plugin
export extern "yarn plugin import" [
  plugin: string@"nu-complete yarn plugin import"
]

# List the available official plugins
export extern "yarn plugin list" [
  --json # Format the output as an NDJSON stream
]

def "nu-complete yarn plugin remove" [] {
  open ./.yarnrc.yml | get plugins | get spec
}

# Remove a plugin
export extern "yarn plugin remove" [
  plugin: string@"nu-complete yarn plugin remove"
]

# List the active plugins
export extern "yarn plugin runtime" [
  --json # Format the output as an NDJSON stream
]

def "nu-complete yarn rebuild" [] {
  let packagejson = (open ./package.json)
  let deps = ($packagejson | get dependencies | columns)
  let devDeps = ($packagejson | get devDependencies | columns)

  $deps | append $devDeps
}

# Rebuild the project's native packages
export extern "yarn rebuild" [
  ...packages: string@"nu-complete yarn rebuild"
]

# Remove a dependency from the project
export extern "yarn remove" [
  --all(-A) # Apply the operation to all workspaces from the current project
  --mode: string@"nu-complete yarn mode" # The mode to use when removing the dependency
]

# Run a script defined in the package.json
export extern "yarn run" [
  --inspect # forwarded to the underlying node process
  --inspect-brk # forwarded to the underlying node process
  --top-level(-T) # Check the root workspace for scripts and/or binaries instead of the current one
  --binaries-only(-B) # Ignore any user defined scripts and only check for binaries
  script: string@"nu-complete yarn run"
]

# Open the search interface. NOTE: requires the interactive-tools plugin to be installed.
export extern "yarn search" []

export extern "yarn set" []

# Enforce a package resolution
export extern "yarn set resolution" [
 --save(-s) # Persist the resolution inside the top-level manifest
 descriptor: string
 resolution: string
]

# Build yarn from master
export extern "yarn set version from sources" [
  --path: string # The path where the repository should be cloned to
  --repository: string # The repository that should be cloned
  --branch: string # The branch of the repository that should be cloned
  --no-minify # Build a plugin for development (debugging) - non-minified and non-mangled
  --force(-f) # Always clone the repository instead of trying to fetch the latest commits
  --skip-plugins # Skip updating the contrib plugins
]

# Lock the Yarn version used by the project
export extern "yarn set version" [
  --only-if-needed # Only lock the yarn version if it isn't already locked
  version: string
]

# Add all yarn files to your vcs. NOTE: requires the stage plugin to be installed.
export extern "yarn stage" [
  --commit(-c) # Commit the staged files
  --reset(-r) # Remove all files from the staging area
  --dry-run(-n) # Print the commit message and the list of modified files without staging / committing
]

# Disconnect the local project from another one
export extern "yarn unlink" [
  --all(-A) # Unlink all workspaces belonging to the target project from the current one
  ...packages: string
]

# Force the unpacking of a list of packages
export extern "yarn unplug" [
  --all(-A) #Unplug direct dependencies from the entire project
  --recursive(-R) #Unplug both direct and transitive dependencies
  --json # Format the output as an NDJSON stream
  ...packages: string
]

# Upgrade dependencies across the project
export extern "yarn up" [
 --interactive(-i) # Offer various choices, depending on the detected upgrade paths
 --exact(-E) # Don't use any semver modifier on the resolved range
 --tilde(-T) # Use the ~ semver modifier on the resolved range
 --caret(-C) # Use the ^ semver modifier on the resolved range
 --recursive(-R) # Resolve again ALL resolutions for those packages
 --mode: string@"nu-complete yarn mode" # Change what artifacts installs generate
]

# Open the upgrade interface. NOTE: requires the interactive-tools plugin to be installed.
export extern "yarn upgrade-interactive" []

def "nu-complete yarn version strategy" [] {
  let originalStrats = ["patch", "minor", "major"]
  let preStrats = ($originalStrats | each { |it| $"pre($it)" } | append "prerelease")
  let otherStrats = ["decline"]

  $originalStrats | append $preStrats | append $otherStrats
}



# Apply a new version to the current package. NOTE: requires the version plugin to be installed.
export extern "yarn version" [
  --deferred(-d) # Prepare the version to be bumped during the next release cycle
  --immediate(-i) # Bump the version immediately
  strategy: string@"nu-complete yarn version strategy"
]

# Apply all the deferred version bumps at once. NOTE: requires the version plugin to be installed.
export extern "yarn version apply" [
  --all # Apply the deferred version changes on all workspaces
  --dry-run # Print the versions without actually generating the package archive
  --prerelease # Add a prerelease identifier to new versions
  --recursive(-R) # Release the transitive workspaces as well
  --json # Format the output as an NDJSON stream
]

# Check that all the relevant packages have been bumped. NOTE: requires the version plugin to be installed. WARNING: This command currently requires git.
export extern "yarn version check" [
  --interactive(-i) # Open an interactive interface used to set version bumps
]

def "nu-complete yarn why" [] {
  let packagejson = (open ./package.json)
  let deps = ($packagejson | get dependencies | columns)
  let devDeps = ($packagejson | get devDependencies | columns)

  $deps | append $devDeps
}

# Display the reason why a package is needed
export extern "yarn why" [
  --recursive(-R) # List, for each workspace, what are all the paths that lead to the dependency
  --json # Format the output as an NDJSON stream
  --peers # Also print the peer dependencies that match the specified name
  package: string@"nu-complete yarn why"
]

def "nu-complete yarn workspace" [] {
  ^yarn workspaces list --json | lines | each {|it| from json} | get name
}

# Run a command within the specified workspace.
export extern "yarn workspace" [
  workspaceName: string@"nu-complete yarn workspace"
  ...commandName: string
]

export extern "yarn workspaces" [
  command: string
]
# Install a single workspace and its dependencies. NOTE: requires the workspace-tools plugin to be installed.
export extern "yarn workspaces focus" [
  --json # Format the output as an NDJSON stream
  --production # Only install regular dependencies by omitting dev dependencies
  --all(-A) # Install the entire project
  ...packages: string
]

# Run a command on all workspaces. NOTE: requires the workspace-tools plugin to be installed.
export extern "yarn workspaces foreach" [
  --recursive(-R) # Find packages via dependencies/devDependencies instead of using the workspaces field
  --from: string #An array of glob pattern idents from which to base any recursion
  --all(-A) #Run the command on all workspaces of a project
  --verbose(-v) # Prefix each output line with the name of the originating workspace
  --parallel(-p) # Run the commands in parallel
  --interlaced(-i) # Print the output of commands in real-time instead of buffering it
  --jobs(-j): string # The maximum number of parallel tasks that the execution will be limited to; or unlimited
  --topological(-t) # Run the command after all workspaces it depends on (regular) have finished
  --topological-dev # Run the command after all workspaces it depends on (regular + dev) have finished
  --include: string # An array of glob pattern idents; only matching workspaces will be traversed
  --exclude: string # An array of glob pattern idents; matching workspaces won't be traversed
  --no-private # Avoid running the command on private workspaces
  --since # Only include workspaces that have been changed since the specified ref.
  ...commandName: string
]

# List all available workspaces
export extern "yarn workspaces list" [
  --since # Only include workspaces that have been changed since the specified ref.
  --recursive(-R) # Find packages via dependencies/devDependencies instead of using the workspaces field
  --verbose(-v) # Also return the cross-dependencies between workspaces
  --json # Format the output as an NDJSON stream
]
