# author: e2dk4r

################################################################
# FUNCTIONS
################################################################

# list of supported architecture
def scoopArches [] {
  ["32bit" "64bit"]
}

# list of all installed apps
def scoopInstalledApps [] {
  let localAppDir = if ('SCOOP' in $env) {
    [$env.SCOOP 'apps'] | path join
  } else {
    [$env.USERPROFILE 'scoop' 'apps'] | path join
  }
  let localApps = (ls $localAppDir | get name | path basename)

  let globalAppDir = if ('SCOOP_GLOBAL' in $env) {
    [$env.SCOOP_GLOBAL 'apps'] | path join
  } else {
    [$env.ProgramData 'scoop' 'apps'] | path join
  }
  let globalApps = if ($globalAppDir | path exists) { ls $globalAppDir | get name | path basename }

  $localApps | append $globalApps
}

# list of all installed apps with star
def scoopInstalledAppsWithStar [] {
  scoopInstalledApps | prepend '*'
}

# list of all manifests from all buckets
def scoopAllApps [] {
  let bucketsDir = if ('SCOOP' in $env) {
    [$env.SCOOP 'buckets'] | path join
  } else {
    [$env.USERPROFILE 'scoop' 'buckets'] | path join
  }
  (ls -s $bucketsDir | get name) | each {|bucket| ls ([$bucketsDir $bucket 'bucket'] | path join) | get name | path parse | where extension == json | get stem } | flatten | uniq
}

# list of all apps that are not installed
def scoopAvailableApps [] {
  let all = (scoopAllApps)
  let installed = (scoopInstalledApps)

  $all | where $it not-in $installed
}

# list of all config options
def scoopConfigs [] {
  [
    '7ZIPEXTRACT_USE_EXTERNAL'
    'MSIEXTRACT_USE_LESSMSI'
    'NO_JUNCTIONS'
    'SCOOP_REPO'
    'SCOOP_BRANCH'
    'proxy'
    'default_architecture'
    'debug'
    'force_update'
    'show_update_log'
    'manifest_review'
    'shim'
    'rootPath'
    'globalPath'
    'cachePath'
    'gh_token'
    'virustotal_api_key'
    'cat_style'
    'ignore_running_processes'
    'private_hosts'
    'aria2-enabled'
    'aria2-warning-enabled'
    'aria2-retry-wait'
    'aria2-split'
    'aria2-max-connection-per-server'
    'aria2-min-split-size'
    'aria2-options'
  ]
}

# boolean as strings
def scoopBooleans [] {
  ["'true'" "'false'"]
}

def scoopRepos [] {
  [
    'https://github.com/ScoopInstaller/Scoop'
  ]
}

def scoopBranches [] {
  ['master' 'develop']
}

def scoopShimBuilds [] {
  ['kiennq' 'scoopcs' '71']
}

def scoopCommands [] {
  let libexecDir = if ('SCOOP' in $env) {
    [$env.SCOOP 'apps' 'scoop' 'current' 'libexec'] | path join
  } else {
    [$env.USERPROFILE 'scoop' 'apps' 'scoop' 'current' 'libexec'] | path join
  }

  let commands = (
    ls $libexecDir
    | each {|command|
      [
        [value description];
        [
          # eg. scoop-help.ps1 -> help
          ($command.name | path parse | get stem | str substring 6..)
          # second line is starts with '# Summary: '
          # eg. '# Summary: Install apps' -> 'Install apps'
          (open $command.name | lines | skip 1 | first | str substring 11..)
        ]
      ]
    }
    | flatten
  )
  $commands
}

def scoopAliases [] {
  scoop alias list | str trim | lines | slice 2.. | split column " " | get column1
}

def batStyles [] {
  ['default' 'auto' 'full' 'plain' 'changes' 'header' 'header-filename' 'header-filesize' 'grid' 'rule' 'numbers' 'snip']
}

def scoopShims [] {
  let localShimDir = if ('SCOOP' in $env) { [$env.SCOOP 'shims'] | path join } else if (scoop config root_path | path exists) { scoop config root_path } else { [$env.USERPROFILE 'scoop' 'shims'] | path join }
  let localShims = if ($localShimDir | path exists) { ls $localShimDir | get name | path parse | select stem extension | where extension == shim | get stem } else { [] }

  let globalShimDir = if ('SCOOP_GLOBAL' in $env) { [$env.SCOOP_GLOBAL 'shims'] | path join } else if (scoop config global_path | path exists) { scoop config global_path } else { [$env.ProgramData 'scoop' 'shims'] | path join }
  let globalShims = if ($globalShimDir | path exists) { ls $globalShimDir | get name | path parse | select stem extension | where extension == shim | get stem } else { [] }

  $localShims | append $globalShims | uniq | sort
}

################################################################
# scoop
################################################################

# Windows command line installer
export extern "scoop" [
  alias?: string@scoopCommands # available scoop commands and aliases
  --help (-h) # Show help for this command.
  --version (-v) # Show current scoop and added buckets versions
]

################################################################
# scoop list
################################################################

# Lists all installed apps, or the apps matching the supplied query.
export extern "scoop list" [
  query?: string@scoopInstalledApps # string that will be matched
  --help (-h) # Show help for this command.
]

################################################################
# scoop uninstall
################################################################

# Uninstall specified application(s).
export extern "scoop uninstall" [
  ...app: string@scoopInstalledApps # app that will be uninstalled
  --help (-h) # Show help for this command.
  --global (-g) # Uninstall a globally installed application(s).
  --purge (-p) # Persisted data will be removed. Normally when application is being uninstalled, the data defined in persist property/manually persisted are kept.
]

################################################################
# scoop cleanup
################################################################

# Perform cleanup on specified installed application(s) by removing old/not actively used versions.
export extern "scoop cleanup" [
  ...app: string@scoopInstalledAppsWithStar # app that will be cleaned
  --help (-h) # Show help for this command.
  --all (-a) # Cleanup all apps (alternative to '*')
  --global (-g) # Perform cleanup on globally installed application(s). (Include them if '*' is used)
  --cache (-k) # Remove outdated download cache. This will keep only the latest version cached.
]

################################################################
# scoop info
################################################################

# Display information about an application.
export extern "scoop info" [
  app: string@scoopAllApps # app that will be questioned
  --verbose (-v) # Show full paths and URLs
  --help (-h) # Show help for this command.
]

################################################################
# scoop update
################################################################

# Update installed application(s), or scoop itself.
export extern "scoop update" [
  ...app: string@scoopInstalledAppsWithStar # which apps
  --help (-h) # Show help for this command.
  --force (-f) # Force update even when there is not a newer version.
  --global (-g) # Update a globally installed application(s).
  --independent (-i) # Do not install dependencies automatically.
  --no-cache (-k) # Do not use the download cache.
  --skip (-s) # Skip hash validation (use with caution!).
  --quiet (-q) # Hide extraneous messages.
  --all (-a) # Update all apps (alternative to '*')
]

################################################################
# scoop install
################################################################

# Install specific application(s).
export extern "scoop install" [
  ...app: string@scoopAvailableApps # which apps
  --arch (-a): string@scoopArches # Use the specified architecture, if the application's manifest supports it.
  --help (-h) # Show help for this command.
  --global (-g) # Install the application(s) globally.
  --independent (-i) # Do not install dependencies automatically.
  --no-cache (-k) # Do not use the download cache.
  --skip (-s) # Skip hash validation (use with caution!).
  --no-update-scoop (-u) # Don't update Scoop before installing if it's outdated
]

################################################################
# scoop status
################################################################

# Show status and check for new app versions.
export extern "scoop status" [
  --help (-h) # Show help for this command.
  --local (-l) # Checks the status for only the locally installed apps, and disables remote fetching/checking for Scoop and buckets
]

################################################################
# scoop help
################################################################

# Show help for scoop
export extern "scoop help" [
  --help (-h) # Show help for this command.

  command?: string@scoopCommands # Show help for the specified command
]

################################################################
# scoop alias
################################################################

# Add, remove or list Scoop aliases
export extern "scoop alias" [
  --help (-h) # Show help for this command.
]

# add an alias
export extern "scoop alias add" [
  name: string # name of the alias
  command: string # scoop command
  description: string # description of the alias
]

# list all aliases
export extern "scoop alias list" [
  --verbose (-v) # Show alias description and table headers (works only for 'list')
]

# remove an alias
export extern "scoop alias rm" [
  ...name: string@scoopAliases # alias that will be removed
]

################################################################
# scoop shim
################################################################

# Manipulate Scoop shims
export extern "scoop shim" [
  --help (-h) # Show help for this command.
]

# add a custom shim
export extern "scoop shim add" [
  shim_name: string # name of the shim
  command_path: path # path to executable
  ...cmd_args # additional command arguments
  --global (-g) # Manipulate global shim(s)
]

# remove shims (CAUTION: this could remove shims added by an app manifest)
export extern "scoop shim rm" [
  ...shim_name: string@scoopShims # shim that will be removed
  --global (-g) # Manipulate global shim(s)
]

# list all shims or matching shims
export extern "scoop shim list" [
  pattern?: string # list only matching shims
  --global (-g) # Manipulate global shim(s)
]

# show a shim's information
export extern "scoop shim info" [
  shim_name: string@scoopShims # shim info to retrieve
  --global (-g) # Manipulate global shim(s)
]

# alternate a shim's target source
export extern "scoop shim alter" [
  shim_name: string@scoopShims # shim that will be alternated
  --global (-g) # Manipulate global shim(s)
]

################################################################
# scoop which
################################################################

# Locate the path to a shim/executable that was installed with Scoop (similar to 'which' on Linux)
export extern "scoop which" [
  command: string # executable name with .exe
  --help (-h) # Show help for this command.
]

################################################################
# scoop cat
################################################################

# Show content of specified manifest.
export extern "scoop cat" [
  app: string@scoopAllApps # app that will be shown
  --help (-h) # Show help for this command.
]

################################################################
# scoop checkup
################################################################

# Performs a series of diagnostic tests to try to identify things that may cause problems with Scoop.
export extern "scoop checkup" [
  --help (-h) # Show help for this command.
]

################################################################
# scoop home
################################################################

# Opens the app homepage
export extern "scoop home" [
  app: string@scoopAllApps # app that will be shown
  --help (-h) # Show help for this command.
]

################################################################
# scoop config ...
################################################################

# Get or set configuration values
export extern "scoop config" [
  --help (-h) # Show help for this command.
]

# External 7zip (from path) will be used for archives extraction.
export extern "scoop config 7ZIPEXTRACT_USE_EXTERNAL" [
  value?: string@scoopBooleans
]

# Prefer lessmsi utility over native msiexec.
export extern "scoop config MSIEXTRACT_USE_LESSMSI" [
  value?: string@scoopBooleans
]

# The 'current' version alias will not be used. Shims and shortcuts will point to specific version instead.
export extern "scoop config NO_JUNCTIONS" [
  value?: string@scoopBooleans
]

# Git repository containing scoop source code.
export extern "scoop config SCOOP_REPO" [
  value?: string@scoopRepos
]

# Allow to use different branch than master.
export extern "scoop config SCOOP_BRANCH" [
  value?: string@scoopBranches
]

# [username:password@]host:port
export extern "scoop config proxy" [
  value?: string
]

# Allow to configure preferred architecture for application installation. If not specified, architecture is determined be system.
export extern "scoop config default_architecture" [
  value?: string@scoopArches
]

# Additional and detailed output will be shown.
export extern "scoop config debug" [
  value?: string@scoopBooleans
]

# Force apps updating to bucket's version.
export extern "scoop config force_update" [
  value?: string@scoopBooleans
]

# Do not show changed commits on 'scoop update'
export extern "scoop config show_update_log" [
  value?: string@scoopBooleans
]

# Displays the manifest of every app that's about to be installed, then asks user if they wish to proceed.
export extern "scoop config manifest_review" [
  value?: string@scoopBooleans
]

# Choose scoop shim build.
export extern "scoop config shim" [
  value?: string@scoopShimBuilds
]

# Path to Scoop root directory.
export extern "scoop config root_path" [
  value?: directory
]

# Path to Scoop root directory for global apps.
export extern "scoop config global_path" [
  value?: directory
]

# For downloads, defaults to 'cache' folder under Scoop root directory.
export extern "scoop config cachePath" [
  value?: directory
]

# GitHub API token used to make authenticated requests.
export extern "scoop config gh_token" [
  value?: string
]

# API key used for uploading/scanning files using virustotal.
export extern "scoop config virustotal_api_key" [
  value?: string
]

# "scoop cat" display style. requires "bat" to be installed.
export extern "scoop config cat_style" [
  value?: string@batStyles
]

# Discard application running messages when reset, uninstall or update
export extern "scoop config ignore_running_processes" [
  value?: string@scoopBooleans
]

# Array of private hosts that need additional authentication.
export extern "scoop config private_hosts" [
  value?: string
]

# Aria2c will be used for downloading of artifacts.
export extern "scoop config aria2-enabled" [
  value?: string@scoopBooleans
]

# Disable Aria2c warning which is shown while downloading.
export extern "scoop config aria2-warning-enabled" [
  value?: string@scoopBooleans
]

# Number of seconds to wait between retries.
export extern "scoop config aria2-retry-wait" [
  value?: number
]

# Number of connections used for download.
export extern "scoop config aria2-split" [
  value?: number
]

# The maximum number of connections to one server for each download.
export extern "scoop config aria2-max-connection-per-server" [
  value?: number
]

# Downloaded files will be split by this configured size and downloaded using multiple connections.
export extern "scoop config aria2-min-split-size" [
  value?: string
]

# Array of additional aria2 options.
export extern "scoop config aria2-options" [
  value?: string
]

# Remove a configuration setting
export extern "scoop config rm" [
  name: string@scoopConfigs # app that will be removed
]

################################################################
# scoop hold
################################################################

# Hold an app to disable updates
export extern "scoop hold" [
  app: string@scoopInstalledApps # app that will be hold back
  --global (-g) # Hold globally installed apps
  --help (-h) # Show help for this command.
]

################################################################
# scoop unhold
################################################################

# Unhold an app to enable updates
export extern "scoop unhold" [
  app: string@scoopInstalledApps # app that will be unhold back
  --global (-g) # Unhold globally installed apps
  --help (-h) # Show help for this command.
]

################################################################
# scoop depends
################################################################

# List dependencies for an app, in the order they'll be installed
export extern "scoop depends" [
  app: string@scoopAllApps # app in question
  --arch (-a): string@scoopArches # Use the specified architecture, if the application's manifest supports it.
  --help (-h) # Show help for this command.
]

################################################################
# scoop export
################################################################

# Exports installed apps, buckets (and optionally configs) in JSON format
export extern "scoop export" [
  --config (-c) # Export the Scoop configuration file too
  --help (-h) # Show help for this command.
]

################################################################
# scoop import
################################################################

# Imports apps, buckets and configs from a Scoopfile in JSON format
export extern "scoop import" [
  file: path # path to Scoopfile
  --help (-h) # Show help for this command.
]

################################################################
# scoop reset
################################################################

# Reset an app to resolve conflicts
export extern "scoop reset" [
  app: string@scoopInstalledAppsWithStar # app that will be reset
  --all (-a) # Reset all apps. (alternative to '*')
  --help (-h) # Show help for this command.
]

################################################################
# scoop prefix
################################################################

# Returns the path to the specified app
export extern "scoop prefix" [
  app: string@scoopInstalledApps # app in question
  --help (-h) # Show help for this command.
]

################################################################
# scoop create
################################################################

# Create a custom app manifest
export extern "scoop create" [
  url: string # url of manifest
  --help (-h) # Show help for this command.
]

################################################################
# scoop search
################################################################

# Search available apps
export extern "scoop search" [
  query?: string # Show app names that match the query
  --help (-h) # Show help for this command.
]

################################################################
# scoop cache ...
################################################################

# Show the download cache
export extern "scoop cache" [
  ...apps: string@scoopInstalledAppsWithStar # apps in question
  --help (-h) # Show help for this command.
]

# Show the download cache
export extern "scoop cache show" [
  ...apps: string@scoopInstalledAppsWithStar # apps in question
]

# Clear the download cache
export extern "scoop cache rm" [
  ...apps: string@scoopInstalledAppsWithStar # apps in question
  --all (-a) # Clear all apps (alternative to '*')
]

################################################################
# scoop download
################################################################

# Download apps in the cache folder and verify hashes
export extern "scoop download" [
  app?: string@scoopAvailableApps # apps in question
  --help (-h) # Show help for this command.
  --force (-f) # Force download (overwrite cache)
  --no-hash-check (-h) # Skip hash verification (use with caution!)
  --no-update-scoop (-u) # Don't update Scoop before downloading if it's outdated
  --arch (-a): string@scoopArches # Use the specified architecture, if the app supports it
]

################################################################
# scoop bucket ...
################################################################

def scoopKnownBuckets [] {
  ["main" "extras" "versions" "nirsoft" "php" "nerd-fonts" "nonportable" "java" "games" "sysinternals"]
}

def scoopInstalledBuckets [] {
  let bucketsDir = if ('SCOOP' in $env) {
    [$env.SCOOP 'buckets'] | path join
  } else {
    [$env.USERPROFILE 'scoop' 'buckets'] | path join
  }

  let buckets = (ls $bucketsDir | get name | path basename)
  $buckets
}

def scoopAvailableBuckets [] {
  let known = (scoopKnownBuckets)
  let installed = (scoopInstalledBuckets)

  $known | where $it not-in $installed
}

# Add, list or remove buckets.
export extern "scoop bucket" [
  --help (-h) # Show help for this command.
]

# add a bucket
export extern "scoop bucket add" [
  name: string@scoopAvailableBuckets # name of the bucket
  repo?: string # url of git repo
  --help (-h) # Show help for this command.
]

# list installed buckets
export extern "scoop bucket list" [
  --help (-h) # Show help for this command.
]

# list known buckets
export extern "scoop bucket known" [
  --help (-h) # Show help for this command.
]

# remove installed buckets
export extern "scoop bucket rm" [
  name: string@scoopInstalledBuckets # bucket to be removed
  --help (-h) # Show help for this command.
]

################################################################
# scoop virustotal
################################################################

# Look for app's hash or url on virustotal.com
export extern "scoop virustotal" [
  ...apps: string@scoopInstalledAppsWithStar # app to be scanned
  --all (-a) # Check for all installed apps
  --scan (-s) # Send download URL for analysis (and future retrieval).
  --no-depends (-n) # By default, all dependencies are checked too. This flag avoids it.
  --no-update-scoop (-u) # Don't update Scoop before checking if it's outdated
  --passthru (-p) # Return reports as objects
  --help (-h) # Show help for this command.
]
