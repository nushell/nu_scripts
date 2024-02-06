# auto generated from pixi 0.6.0's source code

module completions {

  export extern pixi [
    --help(-h)                # Print help
  ]

  def "nu-complete pixi completion shell" [] {
    [ "bash" "elvish" "fish" "powershell" "zsh" ]
  }

  # Generates a completion script for a shell
  export extern "pixi completion" [
    --shell(-s): string@"nu-complete pixi completion shell" # The shell to generate a completion script for (defaults to 'bash')
    --help(-h)                # Print help
  ]

  # Creates a new project
  export extern "pixi init" [
    path?: string             # Where to place the project (defaults to current path)
    --channel(-c): string     # Channels to use in the project
    --platform(-p): string    # Platforms that the project supports
    --help(-h)                # Print help
  ]

  # Adds a dependency to the project
  export extern "pixi add" [
    ...specs: string          # Specify the dependencies you wish to add to the project
    --manifest-path: string   # The path to 'pixi.toml'
    --host                    # The specified dependencies are host dependencies. Conflicts with `build` and `pypi`
    --build                   # The specified dependencies are build dependencies. Conflicts with `host` and `pypi`
    --pypi                    # The specified dependencies are pypi dependencies. Conflicts with `host` and `build`
    --no-lockfile-update      # Don't update lockfile, implies the no-install as well
    --no-install              # Don't install the package to the environment, only add the package to the lock-file
    --platform(-p): string    # The platform(s) for which the dependency should be added
    --help(-h)                # Print help (see more with '--help')
  ]

  # Runs task in project
  export extern "pixi run" [
    ...task: string           # The task you want to run in the projects environment
    --manifest-path: string   # The path to 'pixi.toml'
    --frozen                  # Don't check or update the lockfile, continue with previously installed environment
    --locked                  # Check if lockfile is up to date, aborts when lockfile isn't up to date with the manifest file
    --environment(-e): string
    --help(-h)                # Print help
  ]

  # Start a shell in the pixi environment of the project
  export extern "pixi shell" [
    --manifest-path: string   # The path to 'pixi.toml'
    --frozen                  # Don't check or update the lockfile, continue with previously installed environment
    --locked                  # Check if lockfile is up to date, aborts when lockfile isn't up to date with the manifest file
    --environment(-e): string
    --help(-h)                # Print help
  ]

  # Print the activation script so users can source it in their shell, without needing the pixi executable    
  export extern "pixi shell-hook" [
    --shell(-s): string       # Sets the shell
    --manifest-path: string   # The path to 'pixi.toml'
    --frozen                  # Don't check or update the lockfile, continue with previously installed environment
    --locked                  # Check if lockfile is up to date, aborts when lockfile isn't up to date with the manifest file
    --environment(-e): string # The environment to activate in the script
    --help(-h)                # Print help
  ]

  # Global is the main entry point for the part of pixi that executes on the global(system) level
  export extern "pixi global" [
    --help(-h)                # Print help (see more with '--help')
  ]

  # Installs the defined package in a global accessible location
  export extern "pixi global install" [
    package: string           # Specifies the package that is to be installed
    --channel(-c): string     # Represents the channels from which the package will be installed. Multiple channels can be specified by using this field multiple times
    --help(-h)                # Print help (see more with '--help')
  ]

  # Removes a package previously installed into a globally accessible location via `pixi global install`      
  export extern "pixi global remove" [
    package: string           # Specifies the package that is to be removed
    --verbose(-v)             # Increase logging verbosity
    --quiet(-q)               # Decrease logging verbosity
    --help(-h)                # Print help
  ]

  # Lists all packages previously installed into a globally accessible location via `pixi global install`     
  export extern "pixi global list" [
    --help(-h)                # Print help
  ]

  # Upgrade specific package which is installed globally
  export extern "pixi global upgrade" [
    package: string           # Specifies the package that is to be upgraded
    --channel(-c): string     # Represents the channels from which to upgrade specified package. Multiple channels can be specified by using this field multiple times
    --help(-h)                # Print help (see more with '--help')
  ]

  # Upgrade all globally installed packages
  export extern "pixi global upgrade-all" [
    --channel(-c): string     # Represents the channels from which to upgrade packages. Multiple channels can be specified by using this field multiple times
    --help(-h)                # Print help (see more with '--help')
  ]

  # Print this message or the help of the given subcommand(s)
  export extern "pixi global help" [
  ]

  # Installs the defined package in a global accessible location
  export extern "pixi global help install" [
  ]

  # Removes a package previously installed into a globally accessible location via `pixi global install`      
  export extern "pixi global help remove" [
  ]

  # Lists all packages previously installed into a globally accessible location via `pixi global install`     
  export extern "pixi global help list" [
  ]

  # Upgrade specific package which is installed globally
  export extern "pixi global help upgrade" [
  ]

  # Upgrade all globally installed packages
  export extern "pixi global help upgrade-all" [
  ]

  # Print this message or the help of the given subcommand(s)
  export extern "pixi global help help" [
  ]

  # Login to prefix.dev or anaconda.org servers to access private channels
  export extern "pixi auth" [
    --help(-h)                # Print help
  ]

  # Store authentication information for a given host
  export extern "pixi auth login" [
    host: string              # The host to authenticate with (e.g. repo.prefix.dev)
    --token: string           # The token to use (for authentication with prefix.dev)
    --username: string        # The username to use (for basic HTTP authentication)
    --password: string        # The password to use (for basic HTTP authentication)
    --conda-token: string     # The token to use on anaconda.org / quetz authentication
    --help(-h)                # Print help
  ]

  # Remove authentication information for a given host
  export extern "pixi auth logout" [
    host: string              # The host to remove authentication for
    --help(-h)                # Print help
  ]

  # Print this message or the help of the given subcommand(s)
  export extern "pixi auth help" [
  ]

  # Store authentication information for a given host
  export extern "pixi auth help login" [
  ]

  # Remove authentication information for a given host
  export extern "pixi auth help logout" [
  ]

  # Print this message or the help of the given subcommand(s)
  export extern "pixi auth help help" [
  ]

  # Install all dependencies
  export extern "pixi install" [
    --manifest-path: string   # The path to 'pixi.toml'
    --frozen                  # Don't check or update the lockfile, continue with previously installed environment
    --locked                  # Check if lockfile is up to date, aborts when lockfile isn't up to date with the manifest file
    --environment(-e): string
    --help(-h)                # Print help
  ]

  # Command management in project
  export extern "pixi task" [
    --manifest-path: string   # The path to 'pixi.toml'
    --help(-h)                # Print help
  ]

  # Add a command to the project
  export extern "pixi task add" [
    name: string              # Task name
    ...commands: string       # One or more commands to actually execute
    --depends-on: string      # Depends on these other commands
    --platform(-p): string    # The platform for which the task should be added
    --feature(-f): string     # The feature for which the task should be added
    --cwd: string             # The working directory relative to the root of the project
    --help(-h)                # Print help
  ]

  # Remove a command from the project
  export extern "pixi task remove" [
    ...names: string          # Task names to remove
    --platform(-p): string    # The platform for which the task should be removed
    --feature(-f): string     # The feature for which the task should be removed
    --help(-h)                # Print help
  ]

  # Alias another specific command
  export extern "pixi task alias" [
    alias: string             # Alias name
    ...depends_on: string     # Depends on these tasks to execute
    --platform(-p): string    # The platform for which the alias should be added
    --help(-h)                # Print help
  ]

  # List all tasks
  export extern "pixi task list" [
    --summary(-s)
    --environment(-e): string # The environment the list should be generated for If not specified, the default environment is used
    --help(-h)                # Print help
  ]

  # Print this message or the help of the given subcommand(s)
  export extern "pixi task help" [
  ]

  # Add a command to the project
  export extern "pixi task help add" [
  ]

  # Remove a command from the project
  export extern "pixi task help remove" [
  ]

  # Alias another specific command
  export extern "pixi task help alias" [
  ]

  # List all tasks
  export extern "pixi task help list" [
  ]

  # Print this message or the help of the given subcommand(s)
  export extern "pixi task help help" [
  ]

  # Information about the system, project and environments for the current machine
  export extern "pixi info" [
    --extended                # Show cache and environment size
    --json                    # Whether to show the output as JSON or not
    --manifest-path: string   # The path to 'pixi.toml'
    --help(-h)                # Print help
  ]

  # Upload a package to a prefix.dev channel
  export extern "pixi upload" [
    host: string              # The host + channel to upload to
    package_file: string      # The file to upload
    --help(-h)                # Print help
  ]

  # Search a package, output will list the latest version of package
  export extern "pixi search" [
    package: string           # Name of package to search
    --channel(-c): string     # Channel to specifically search package, defaults to project channels or conda-forge
    --manifest-path: string   # The path to 'pixi.toml'
    --limit(-l): string       # Limit the number of search results
    --help(-h)                # Print help
  ]

  # Modify the project configuration file through the command line
  export extern "pixi project" [
    --manifest-path: string   # The path to 'pixi.toml'
    --help(-h)                # Print help
  ]

  # Commands to manage project channels
  export extern "pixi project channel" [
    --manifest-path: string   # The path to 'pixi.toml'
    --help(-h)                # Print help
  ]

  # Adds a channel to the project file and updates the lockfile
  export extern "pixi project channel add" [
    ...channel: string        # The channel name or URL
    --no-install              # Don't update the environment, only add changed packages to the lock-file      
    --feature(-f): string     # The name of the feature to add the channel to
    --manifest-path: string   # The path to 'pixi.toml'
    --help(-h)                # Print help
  ]

  # List the channels in the project file
  export extern "pixi project channel list" [
    --urls                    # Whether to display the channel's names or urls
    --manifest-path: string   # The path to 'pixi.toml'
    --help(-h)                # Print help
  ]

  # Remove channel(s) from the project file and updates the lockfile
  export extern "pixi project channel remove" [
    ...channel: string        # The channel name(s) or URL
    --no-install              # Don't update the environment, only remove the channel(s) from the lock-file   
    --feature(-f): string     # The name of the feature to remove the channel from
    --manifest-path: string   # The path to 'pixi.toml'
    --help(-h)                # Print help
  ]

  # Print this message or the help of the given subcommand(s)
  export extern "pixi project channel help" [
  ]

  # Adds a channel to the project file and updates the lockfile
  export extern "pixi project channel help add" [
  ]

  # List the channels in the project file
  export extern "pixi project channel help list" [
  ]

  # Remove channel(s) from the project file and updates the lockfile
  export extern "pixi project channel help remove" [
  ]

  # Print this message or the help of the given subcommand(s)
  export extern "pixi project channel help help" [
  ]

  # Commands to manage project description
  export extern "pixi project description" [
    --manifest-path: string   # The path to 'pixi.toml'
    --help(-h)                # Print help
  ]

  # Get the project description
  export extern "pixi project description get" [
    --manifest-path: string   # The path to 'pixi.toml'
    --help(-h)                # Print help
  ]

  # Set the project description
  export extern "pixi project description set" [
    description: string       # The project description
    --manifest-path: string   # The path to 'pixi.toml'
    --help(-h)                # Print help
  ]

  # Print this message or the help of the given subcommand(s)
  export extern "pixi project description help" [
  ]

  # Get the project description
  export extern "pixi project description help get" [
  ]

  # Set the project description
  export extern "pixi project description help set" [
  ]

  # Print this message or the help of the given subcommand(s)
  export extern "pixi project description help help" [
  ]

  # Commands to manage project channels
  export extern "pixi project platform" [
    --manifest-path: string   # The path to 'pixi.toml'
    --help(-h)                # Print help
  ]

  # Adds a platform(s) to the project file and updates the lockfile
  export extern "pixi project platform add" [
    ...platform: string       # The platform name(s) to add
    --no-install              # Don't update the environment, only add changed packages to the lock-file      
    --manifest-path: string   # The path to 'pixi.toml'
    --help(-h)                # Print help
  ]

  # List the platforms in the project file
  export extern "pixi project platform list" [
    --manifest-path: string   # The path to 'pixi.toml'
    --help(-h)                # Print help
  ]

  # Remove platform(s) from the project file and updates the lockfile
  export extern "pixi project platform remove" [
    ...platform: string       # The platform name(s) to remove
    --no-install              # Don't update the environment, only remove the platform(s) from the lock-file  
    --manifest-path: string   # The path to 'pixi.toml'
    --help(-h)                # Print help
  ]

  # Print this message or the help of the given subcommand(s)
  export extern "pixi project platform help" [
  ]

  # Adds a platform(s) to the project file and updates the lockfile
  export extern "pixi project platform help add" [
  ]

  # List the platforms in the project file
  export extern "pixi project platform help list" [
  ]

  # Remove platform(s) from the project file and updates the lockfile
  export extern "pixi project platform help remove" [
  ]

  # Print this message or the help of the given subcommand(s)
  export extern "pixi project platform help help" [
  ]

  # Commands to manage project description
  export extern "pixi project version" [
    --manifest-path: string   # The path to 'pixi.toml'
    --help(-h)                # Print help
  ]

  # Get the project version
  export extern "pixi project version get" [
    --manifest-path: string   # The path to 'pixi.toml'
    --help(-h)                # Print help
  ]

  # Set the project version
  export extern "pixi project version set" [
    version: string           # The new project version
    --manifest-path: string   # The path to 'pixi.toml'
    --help(-h)                # Print help
  ]

  # Bump the project version to MAJOR
  export extern "pixi project version major" [
    --manifest-path: string   # The path to 'pixi.toml'
    --help(-h)                # Print help
  ]

  # Bump the project version to MINOR
  export extern "pixi project version minor" [
    --manifest-path: string   # The path to 'pixi.toml'
    --help(-h)                # Print help
  ]

  # Bump the project version to PATCH
  export extern "pixi project version patch" [
    --manifest-path: string   # The path to 'pixi.toml'
    --help(-h)                # Print help
  ]

  # Print this message or the help of the given subcommand(s)
  export extern "pixi project version help" [
  ]

  # Get the project version
  export extern "pixi project version help get" [
  ]

  # Set the project version
  export extern "pixi project version help set" [
  ]

  # Bump the project version to MAJOR
  export extern "pixi project version help major" [
  ]

  # Bump the project version to MINOR
  export extern "pixi project version help minor" [
  ]

  # Bump the project version to PATCH
  export extern "pixi project version help patch" [
  ]

  # Print this message or the help of the given subcommand(s)
  export extern "pixi project version help help" [
  ]

  # Print this message or the help of the given subcommand(s)
  export extern "pixi project help" [
  ]

  # Commands to manage project channels
  export extern "pixi project help channel" [
  ]

  # Adds a channel to the project file and updates the lockfile
  export extern "pixi project help channel add" [
  ]

  # List the channels in the project file
  export extern "pixi project help channel list" [
  ]

  # Remove channel(s) from the project file and updates the lockfile
  export extern "pixi project help channel remove" [
  ]

  # Commands to manage project description
  export extern "pixi project help description" [
  ]

  # Get the project description
  export extern "pixi project help description get" [
  ]

  # Set the project description
  export extern "pixi project help description set" [
  ]

  # Commands to manage project channels
  export extern "pixi project help platform" [
  ]

  # Adds a platform(s) to the project file and updates the lockfile
  export extern "pixi project help platform add" [
  ]

  # List the platforms in the project file
  export extern "pixi project help platform list" [
  ]

  # Remove platform(s) from the project file and updates the lockfile
  export extern "pixi project help platform remove" [
  ]

  # Commands to manage project description
  export extern "pixi project help version" [
  ]

  # Get the project version
  export extern "pixi project help version get" [
  ]

  # Set the project version
  export extern "pixi project help version set" [
  ]

  # Bump the project version to MAJOR
  export extern "pixi project help version major" [
  ]

  # Bump the project version to MINOR
  export extern "pixi project help version minor" [
  ]

  # Bump the project version to PATCH
  export extern "pixi project help version patch" [
  ]

  # Print this message or the help of the given subcommand(s)
  export extern "pixi project help help" [
  ]

  # Remove the dependency from the project
  export extern "pixi remove" [
    ...deps: string           # List of dependencies you wish to remove from the project
    --manifest-path: string   # The path to 'pixi.toml'
    --host                    # Whether dependency is a host dependency
    --build                   # Whether dependency is a build dependency
    --pypi                    # Whether the dependency is a pypi package
    --platform(-p): string    # The platform for which the dependency should be removed
    --feature(-f): string     # The feature for which the dependency should be removed
    --help(-h)                # Print help
  ]

  # Update pixi to the latest version or a specific version. If the pixi binary is not found in the default location (e.g. `~/.pixi/bin/pixi`), pixi won't updated to prevent breaking the current installation (Homebrew, etc). The behaviour can be overridden with the `--force` flag
  export extern "pixi self-update" [
    --version: string         # The desired version (to downgrade or upgrade to). Update to the latest version if not specified
    --force                   # Force the update even if the pixi binary is not found in the default location 
    --help(-h)                # Print help
  ]

  def "nu-complete pixi list sort_by" [] {
    [ "size" "name" "type" ]
  }

  # List project's packages. Highlighted packages are explicit dependencies
  export extern "pixi list" [
    regex?: string            # List only packages matching a regular expression
    --platform: string        # The platform to list packages for. Defaults to the current platform
    --json                    # Whether to output in json format
    --json-pretty             # Whether to output in pretty json format
    --sort-by: string@"nu-complete pixi list sort_by" # Sorting strategy
    --manifest-path: string   # The path to 'pixi.toml'
    --environment(-e): string # The environment to list packages for. Defaults to the default environment     
    --help(-h)                # Print help
  ]

  # Print this message or the help of the given subcommand(s)
  export extern "pixi help" [
  ]

  # Generates a completion script for a shell
  export extern "pixi help completion" [
  ]

  # Creates a new project
  export extern "pixi help init" [
  ]

  # Adds a dependency to the project
  export extern "pixi help add" [
  ]

  # Runs task in project
  export extern "pixi help run" [
  ]

  # Start a shell in the pixi environment of the project
  export extern "pixi help shell" [
  ]

  # Print the activation script so users can source it in their shell, without needing the pixi executable    
  export extern "pixi help shell-hook" [
  ]

  # Global is the main entry point for the part of pixi that executes on the global(system) level
  export extern "pixi help global" [
  ]

  # Installs the defined package in a global accessible location
  export extern "pixi help global install" [
  ]

  # Removes a package previously installed into a globally accessible location via `pixi global install`      
  export extern "pixi help global remove" [
  ]

  # Lists all packages previously installed into a globally accessible location via `pixi global install`     
  export extern "pixi help global list" [
  ]

  # Upgrade specific package which is installed globally
  export extern "pixi help global upgrade" [
  ]

  # Upgrade all globally installed packages
  export extern "pixi help global upgrade-all" [
  ]

  # Login to prefix.dev or anaconda.org servers to access private channels
  export extern "pixi help auth" [
  ]

  # Store authentication information for a given host
  export extern "pixi help auth login" [
  ]

  # Remove authentication information for a given host
  export extern "pixi help auth logout" [
  ]

  # Install all dependencies
  export extern "pixi help install" [
  ]

  # Command management in project
  export extern "pixi help task" [
  ]

  # Add a command to the project
  export extern "pixi help task add" [
  ]

  # Remove a command from the project
  export extern "pixi help task remove" [
  ]

  # Alias another specific command
  export extern "pixi help task alias" [
  ]

  # List all tasks
  export extern "pixi help task list" [
  ]

  # Information about the system, project and environments for the current machine
  export extern "pixi help info" [
  ]

  # Upload a package to a prefix.dev channel
  export extern "pixi help upload" [
  ]

  # Search a package, output will list the latest version of package
  export extern "pixi help search" [
  ]

  # Modify the project configuration file through the command line
  export extern "pixi help project" [
  ]

  # Commands to manage project channels
  export extern "pixi help project channel" [
  ]

  # Adds a channel to the project file and updates the lockfile
  export extern "pixi help project channel add" [
  ]

  # List the channels in the project file
  export extern "pixi help project channel list" [
  ]

  # Remove channel(s) from the project file and updates the lockfile
  export extern "pixi help project channel remove" [
  ]

  # Commands to manage project description
  export extern "pixi help project description" [
  ]

  # Get the project description
  export extern "pixi help project description get" [
  ]

  # Set the project description
  export extern "pixi help project description set" [
  ]

  # Commands to manage project channels
  export extern "pixi help project platform" [
  ]

  # Adds a platform(s) to the project file and updates the lockfile
  export extern "pixi help project platform add" [
  ]

  # List the platforms in the project file
  export extern "pixi help project platform list" [
  ]

  # Remove platform(s) from the project file and updates the lockfile
  export extern "pixi help project platform remove" [
  ]

  # Commands to manage project description
  export extern "pixi help project version" [
  ]

  # Get the project version
  export extern "pixi help project version get" [
  ]

  # Set the project version
  export extern "pixi help project version set" [
  ]

  # Bump the project version to MAJOR
  export extern "pixi help project version major" [
  ]

  # Bump the project version to MINOR
  export extern "pixi help project version minor" [
  ]

  # Bump the project version to PATCH
  export extern "pixi help project version patch" [
  ]

  # Remove the dependency from the project
  export extern "pixi help remove" [
  ]

  # Update pixi to the latest version or a specific version. If the pixi binary is not found in the default location (e.g. `~/.pixi/bin/pixi`), pixi won't updated to prevent breaking the current installation (Homebrew, etc). The behaviour can be overridden with the `--force` flag
  export extern "pixi help self-update" [
  ]

  # List project's packages. Highlighted packages are explicit dependencies
  export extern "pixi help list" [
  ]

  # Print this message or the help of the given subcommand(s)
  export extern "pixi help help" [
  ]

}

export use completions *