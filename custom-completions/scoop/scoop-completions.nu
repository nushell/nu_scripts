# author: e2dk4r

# list of supported architecture
def scoopArches [] {
  [ "32bit", "64bit", "arm64" ]
}

# list of all installed apps
def scoopInstalledApps [] {
  # unoptimized tooks a long time
  # ^scoop list | lines | skip 2 | drop 1 | each { |line| $line | str trim | str replace ' .*' '' }

  let localAppDir = if (env | any? $it.name == 'SCOOP') { $"($env.SCOOP)\\apps" } else { $"($env.USERPROFILE)\\scoop\\apps" }
  let localApps   = (ls $localAppDir | get name | path basename)

  let globalAppDir = if (env | any? $it.name == 'SCOOP_GLOBAL') { "$env.SCOOP_GLOBAL\\apps" } else { $"($env.ProgramData)\\scoop\\apps" }
  let globalApps   = if ($globalAppDir | path exists) { ls $globalAppDir | get name | path basename }

  $localApps | append $globalApps
}

# list of all installed apps with star
def scoopInstalledAppsWithStar [] {
  scoopInstalledApps | prepend '*'
}

# list of all manifests from all buckets
def scoopAllApps [] {
  let bucketsDir = if (env | any? $it.name == 'SCOOP') { $"($env.SCOOP)\\buckets" } else { $"($env.USERPROFILE)\\scoop\\buckets" }
  for bucket in (ls -s $bucketsDir | get name) { ls ([$bucketsDir, $bucket, 'bucket', '*.json'] | str collect '\')  | get name | path basename | str substring ',-5' } | flatten | uniq
}

# list of all apps that are not installed
def scoopAvailableApps [] {
  let all       = (scoopAllApps)
  let installed = (scoopInstalledApps)

  $all | where not $it in $installed
}

# List installed applications.
export extern "scoop list" [
  --help(-h)      # Show help for this command.
  --installed(-i) # Applicaitons will be sorted by installed date.
  --reverse(-r)   # Applications will be listed in descending order. In case of Installed or Updated, apps will be listed from newest to oldest.
  --updated(-u)   # Applications will be sorted by update time.
]

# Uninstall specified application(s).
export extern "scoop uninstall" [
  ...app: string@scoopInstalledApps # app that will be uninstalled
  --help(-h)   # Show help for this command.
  --global(-g) # Uninstall a globally installed application(s).
  --purge(-p)  # Persisted data will be removed. Normally when application is being uninstalled, the data defined in persist property/manually persisted are kept.
]

# Perform cleanup on specified installed application(s) by removing old/not actively used versions.
export extern "scoop cleanup" [
  ...app: string@scoopInstalledAppsWithStar # app that will be cleaned
  --help(-h)   # Show help for this command.
  --global(-g) # Perform cleanup on globally installed application(s). (Include them if '*' is used)
  --cache(-k)  # Remove outdated download cache. This will keep only the latest version cached.
]

# Display information about an application.
export extern "scoop info" [
  app: string@scoopAllApps # app that will be questioned
  --arch(-a): string@scoopArches # Use the specified architecture, if the application's manifest supports it.
  --help(-h)   # Show help for this command.
]

# Update installed application(s), or scoop itself.
export extern "scoop update" [
  ...app: string@scoopInstalledAppsWithStar # which apps
  --help(-h)        # Show help for this command.
  --force(-f)       # Force update even when there is not a newer version.
  --global(-g)      # Update a globally installed application(s).
  --independent(-i) # Do not install dependencies automatically.
  --no-cache(-k)    # Do not use the download cache.
  --skip(-s)        # Skip hash validation (use with caution!).
  --quiet(-q)       # Hide extraneous messages.
]

# Install specific application(s).
export extern "scoop install" [
  ...app: string@scoopAvailableApps # which apps
  --arch(-a): string@scoopArches # Use the specified architecture, if the application's manifest supports it.
  --help(-h)                     # Show help for this command.
  --global(-g)                   # Install the application(s) globally.
  --independent(-i)              # Do not install dependencies automatically.
  --no-cache(-k)                 # Do not use the download cache.
  --skip(-s)                     # Skip hash validation (use with caution!).
]
