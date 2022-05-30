# Path containing probing policy and assemblies to probe
extern "dotnet" [

	...args
]

# Add a package/reference
extern "dotnet add" [
	--no-restore(-n)					# Add the reference without performing restore preview and compatibility check
	--source(-s)					# NuGet package source to use during the restore
	--package-directory					# Directory to restore packages
	--interactive					# Allow interactive input/action
	--prerelease					# Allow prerelease packages to be installed
	--interactive					# Allow interactive input/action
	--package-source(-s)					# Package source name
	--path					# Path to certificate file
	--store-password-in-clear-text					# Enable storing password for the certificate
	--store-location					# Certificate store location
	--store-name					# Certificate store name
	--find-by					# Search method to find certificate in certificate store
	--find-value					# Search the certificate store for the supplied value
	--force(-f)					# Skip certificate validation
	--configfile					# NuGet configuration file
	--name(-n)					# Name of the source
	--store-password-in-clear-text					# Enable storing portable package source credentials
	--valid-authentication-types					# Comma-separated list of valid authentication types
	--configfile					# NuGet configuration file
	--in-root					# Place project in root of the solution
	--solution-folder(-s)					# Destination solution folder path to add the projects
	...args
]

# Build a .NET project
extern "dotnet build" [
	--output(-o)					# Output directory to place built artifacts
	--no-incremental					# Don't use incremental building
	--no-dependencies					# Don't build P2P references
	--nologo					# Don't display the startup banner or the copyright message
	--no-restore					# Don't restore the project before building
	--interactive					# Allow interactive input/action
	--force					# Force all dependencies to be resolved
	--msbuild					# Shutdown the MSBuild build server
	--vbcscompiler					# Shutdown the VB/C# compiler build server
	--razor					# Shutdown the Razor build server
	...args
]

# Interact with build servers
extern "dotnet build-server" [
	--msbuild					# Shutdown the MSBuild build server
	--vbcscompiler					# Shutdown the VB/C# compiler build server
	--razor					# Shutdown the Razor build server
	...args
]

# Clean build outputs
extern "dotnet clean" [
	--output(-o)					# Directory containing the build artifacts to clean
	--nologo					# Don't display the startup banner or the copyright message
	--interactive					# Allow interactive input/action
	...args
]

# Show help
extern "dotnet help" [

	...args
]

# List project references
extern "dotnet list" [
	--outdated					# List packages that have newer versions
	--deprecated					# List packages that have been deprecated
	--include-transitive					# List transitive and top-level packages
	--include-prerelease					# Consider packages with prerelease versions
	--highest-patch					# Consider only the packages with a matching major and minor version numbers
	--highest-minor					# Consider only the packages with a matching major version number
	--config					# Path to the NuGet config file to use
	--source					# NuGet sources to use
	--interactive					# Allow interactive input/action
	--configfile					# NuGet configuration file
	--configfile					# NuGet configuration file
	--global(-g)					# List user-wide global tools
	--local					# List local tools
	--tool-path					# Directory containing the tools to list
	...args
]

# Run MSBuild commands
extern "dotnet msbuild" [

	...args
]

# Create a new .NET project
extern "dotnet new" [
	--list(-l)					# List templates containing the specified name
	--name(-n)					# Name for the output being created
	--output(-o)					# Location to place the generated output
	--install(-i)					# Install a template pack
	--uninstall(-u)					# Uninstall a template pack
	--interactive					# Allow interactive input/action
	--nuget-source					# Specify a NuGet source to use during install
	--dry-run					# Dry run
	--force					# Force content to be generated
	--update-check					# Check the currently installed template packs for updates
	--update-apply					# Check the currently installed template packs for updates and installs them
	...args
]

# Run additional NuGet commands
extern "dotnet nuget" [
	--version					# Show version
	--package-source(-s)					# Package source name
	--path					# Path to certificate file
	--store-password-in-clear-text					# Enable storing password for the certificate
	--store-location					# Certificate store location
	--store-name					# Certificate store name
	--find-by					# Search method to find certificate in certificate store
	--find-value					# Search the certificate store for the supplied value
	--force(-f)					# Skip certificate validation
	--configfile					# NuGet configuration file
	--name(-n)					# Name of the source
	--store-password-in-clear-text					# Enable storing portable package source credentials
	--valid-authentication-types					# Comma-separated list of valid authentication types
	--configfile					# NuGet configuration file
	--force-english-output					# Run the application with locale set to English
	--source(-s)					# Package source to use
	--non-interactive					# Don't prompt for user input or confirmations
	--no-service-endpoint					# Doesn't append \"api/v2/package\" to the source URL
	--interactive					# Allow interactive input/action
	--configfile					# NuGet configuration file
	--configfile					# NuGet configuration file
	--configfile					# NuGet configuration file
	--configfile					# NuGet configuration file
	--force-english-output					# Run the application with locale set to English
	--clear(-c)					# Clear the selected local resources or cache location
	--list(-l)					# List the selected local resources or cache location
	--force-english-output					# Run the application with locale set to English
	--source(-s)					# Package source to use
	--symbol-source					# Symbol server URL to use
	--disable-buffering(-d)					# Disable buffering when pushing to an HTTP server
	--no-symbols(-n)					# Doesn't push symbols
	--no-service-endpoint					# Doesn't append \"api/v2/package\" to the source URL
	--interactive					# Allow interactive input/action
	--skip-duplicate					# Treat any 409 Conflict response as a warning
	--package-source(-s)					# Package source name
	--configfile					# NuGet configuration file
	--configfile					# NuGet configuration file
	--package-source(-s)					# Package source name
	--path					# Path to certificate file
	--store-password-in-clear-text					# Enable storing password for the certificate
	--store-location					# Certificate store location
	--store-name					# Certificate store name
	--find-by					# Search method to find certificate in certificate store
	--find-value					# Search the certificate store for the supplied value
	--force(-f)					# Skip certificate validation
	--configfile					# NuGet configuration file
	--source(-s)					# Path to the package source
	--store-password-in-clear-text					# Enable storing portable package source credentials
	--valid-authentication-types					# Comma-separated list of valid authentication types
	--configfile					# NuGet configuration file
	--all					# Specify that all verifications possible should be performed
	...args
]

# Create a NuGet package
extern "dotnet pack" [
	--no-restore(-n)					# Add the reference without performing restore preview and compatibility check
	--source(-s)					# NuGet package source to use during the restore
	--package-directory					# Directory to restore packages
	--interactive					# Allow interactive input/action
	--prerelease					# Allow prerelease packages to be installed
	--outdated					# List packages that have newer versions
	--deprecated					# List packages that have been deprecated
	--include-transitive					# List transitive and top-level packages
	--include-prerelease					# Consider packages with prerelease versions
	--highest-patch					# Consider only the packages with a matching major and minor version numbers
	--highest-minor					# Consider only the packages with a matching major version number
	--config					# Path to the NuGet config file to use
	--source					# NuGet sources to use
	--interactive					# Allow interactive input/action
	--output(-o)					# Output directory to place built packages
	--no-build					# Don't build the project before packing
	--include-symbols					# Include packages with symbols in output directory
	--include-source					# Include PDBs and source files
	--serviceable(-s)					# Set the serviceable flag in the package
	--nologo					# Don't display the startup banner or the copyright message
	--interactive					# Allow interactive input/action
	--no-restore					# Don't restore the project before building
	--no-dependencies					# Don't build P2P references
	--force					# Force all dependencies to be resolved
	--interactive					# Allow interactive input/action
	...args
]

# Publish a .NET project for deployment
extern "dotnet publish" [
	--output(-o)					# Output directory to place the published artifacts
	--manifest					# Path to a target manifest file
	--no-build					# Don't build the project before publishing
	--no-self-contained					# Publish your application as a framework dependent application
	--nologo					# Don't display the startup banner or the copyright message
	--interactive					# Allow interactive input/action
	--no-restore					# Don't restore the project before building
	--no-dependencies					# Don't restore P2P references
	--force					# Force all dependencies to be resolved
	...args
]

# Remove a package/reference
extern "dotnet remove" [
	--package-source(-s)					# Package source name
	--configfile					# NuGet configuration file
	--configfile					# NuGet configuration file
	--interactive					# Allow interactive input/action
	...args
]

# Restore dependencies
extern "dotnet restore" [
	--source(-s)					# NuGet package source to use for the restore
	--packages					# Directory to restore packages
	--disable-parallel					# Prevent restoring multiple projects in parallel
	--configfile					# NuGet configuration file to use
	--no-cache					# Don't cache packages and HTTP requests
	--ignore-failed-sources					# Treat package source failures as warnings
	--no-dependencies					# Don't restore P2P references
	--force(-f)					# Force all dependencies to be resolved
	--interactive					# Allow interactive input/action
	--use-lock-file					# Enable project lock file to be generated
	--locked-mode					# Don't allow updating project lock file
	--lock-file-path					# Output location where project lock file is written
	--force-evaluate					# Force restore to reevaluate all dependencies
	--configfile					# NuGet configuration file to use
	--add-source					# Add an additional NuGet package source to use during installation
	--tool-manifest					# Path to the manifest file
	--disable-parallel					# Prevent restoring multiple projects in parallel
	--ignore-failed-sources					# Treat package source failures as warnings
	--no-cache					# Don't cache packages and HTTP requests
	--interactive					# Allow interactive input/action
	...args
]

# Run the application from source
extern "dotnet run" [
	--project(-p)					# Path to the project file to run
	--no-launch-profile					# Don't attempt to use launchSettings.json
	--no-build					# Don't build the project before running
	--interactive					# Allow interactive input/action
	--no-restore					# Don't restore the project before building
	--no-dependencies					# Don't restore P2P references
	--force					# Force all dependencies to be resolved
	...args
]

# Modify Visual Studio solution files
extern "dotnet sln" [
	--in-root					# Place project in root of the solution
	--solution-folder(-s)					# Destination solution folder path to add the projects
	...args
]

# Store assemblies
extern "dotnet store" [
	--source(-s)					# NuGet package source to use for the restore
	--packages					# Directory to restore packages
	--disable-parallel					# Prevent restoring multiple projects in parallel
	--configfile					# NuGet configuration file to use
	--no-cache					# Don't cache packages and HTTP requests
	--ignore-failed-sources					# Treat package source failures as warnings
	--no-dependencies					# Don't restore P2P references
	--force(-f)					# Force all dependencies to be resolved
	--interactive					# Allow interactive input/action
	--use-lock-file					# Enable project lock file to be generated
	--locked-mode					# Don't allow updating project lock file
	--lock-file-path					# Output location where project lock file is written
	--force-evaluate					# Force restore to reevaluate all dependencies
	--manifest(-m)					# XML file that contains the list of packages to be stored
	--output(-o)					# Output directory to store the given assemblies
	--working-dir(-w)					# Working directory used by the command
	--skip-optimization					# Skip the optimization phase
	--skip-symbols					# Skip creating symbol files
	--configfile					# NuGet configuration file to use
	--add-source					# Add an additional NuGet package source to use during installation
	--tool-manifest					# Path to the manifest file
	--disable-parallel					# Prevent restoring multiple projects in parallel
	--ignore-failed-sources					# Treat package source failures as warnings
	--no-cache					# Don't cache packages and HTTP requests
	--interactive					# Allow interactive input/action
	...args
]

# Run unit tests
extern "dotnet test" [
	--settings(-s)					# Settings file to use
	--list-tests(-t)					# List the discovered tests
	--test-adapter-path(-a)					# Path to the custom adapters to use
	--output(-o)					# Output directory to place built artifacts
	--diag(-d)					# Enable verbose logging to the specified file
	--no-build					# Don't build the project before testing
	--results-directory(-r)					# Directory where the test results will be placed
	--blame					# Run the tests in blame mode
	--blame-crash					# Run the tests in blame mode and enables collecting crash dump
	--blame-crash-collect-always					# Enable collecting crash dump on expected
	--blame-hang					# Run the tests in blame mode and enables collecting hang dump
	--nologo					# Run tests without displaying the Microsoft TestPlatform banner
	--no-restore					# Don't restore the project before building
	--interactive					# Allow interactive input/action
	...args
]

# Manage .NET tool
extern "dotnet tool" [
	--source(-s)					# NuGet package source to use for the restore
	--packages					# Directory to restore packages
	--disable-parallel					# Prevent restoring multiple projects in parallel
	--configfile					# NuGet configuration file to use
	--no-cache					# Don't cache packages and HTTP requests
	--ignore-failed-sources					# Treat package source failures as warnings
	--no-dependencies					# Don't restore P2P references
	--force(-f)					# Force all dependencies to be resolved
	--interactive					# Allow interactive input/action
	--use-lock-file					# Enable project lock file to be generated
	--locked-mode					# Don't allow updating project lock file
	--lock-file-path					# Output location where project lock file is written
	--force-evaluate					# Force restore to reevaluate all dependencies
	--project(-p)					# Path to the project file to run
	--no-launch-profile					# Don't attempt to use launchSettings.json
	--no-build					# Don't build the project before running
	--interactive					# Allow interactive input/action
	--no-restore					# Don't restore the project before building
	--no-dependencies					# Don't restore P2P references
	--force					# Force all dependencies to be resolved
	--global(-g)					# Specify that the installation is user-wide
	--local					# Specify a local tool installation
	--tool-path					# Directory where the tool will be installed
	--configfile					# NuGet configuration file to use
	--tool-manifest					# Path to the manifest file
	--add-source					# Add an additional NuGet package source to use during installation
	--disable-parallel					# Prevent restoring multiple projects in parallel
	--ignore-failed-sources					# Treat package source failures as warnings
	--no-cache					# Don't cache packages and HTTP requests
	--interactive					# Allow interactive input/action
	--global(-g)					# Specify that the tool to be removed is from a user-wide installation
	--local					# Specify that the tool to be removed is a local tool
	--tool-path					# Directory containing the tool to uninstall
	--tool-manifest					# Path to the manifest file
	--global(-g)					# Specify that the update is for a user-wide tool
	--tool-path					# Directory containing the tool to update
	--local					# Specify that the tool to be updated is a local tool
	--configfile					# NuGet configuration file to use
	--add-source					# Add an additional NuGet package source to use during the update
	--tool-manifest					# Path to the manifest file
	--disable-parallel					# Prevent restoring multiple projects in parallel
	--ignore-failed-sources					# Treat package source failures as warnings
	--no-cache					# Don't cache packages and HTTP requests
	--interactive					# Allow interactive input/action
	--global(-g)					# List user-wide global tools
	--local					# List local tools
	--tool-path					# Directory containing the tools to list
	--detail					# Show detail result of the query
	--prerelease					# Include pre-release packages
	--configfile					# NuGet configuration file to use
	--add-source					# Add an additional NuGet package source to use during installation
	--tool-manifest					# Path to the manifest file
	--disable-parallel					# Prevent restoring multiple projects in parallel
	--ignore-failed-sources					# Treat package source failures as warnings
	--no-cache					# Don't cache packages and HTTP requests
	--interactive					# Allow interactive input/action
	...args
]

# Run VSTest commands
extern "dotnet vstest" [

	...args
]

# Add a NuGet package reference
extern "dotnet package" [
	--no-restore(-n)					# Add the reference without performing restore preview and compatibility check
	--source(-s)					# NuGet package source to use during the restore
	--package-directory					# Directory to restore packages
	--interactive					# Allow interactive input/action
	--prerelease					# Allow prerelease packages to be installed
	--outdated					# List packages that have newer versions
	--deprecated					# List packages that have been deprecated
	--include-transitive					# List transitive and top-level packages
	--include-prerelease					# Consider packages with prerelease versions
	--highest-patch					# Consider only the packages with a matching major and minor version numbers
	--highest-minor					# Consider only the packages with a matching major version number
	--config					# Path to the NuGet config file to use
	--source					# NuGet sources to use
	--interactive					# Allow interactive input/action
	--interactive					# Allow interactive input/action
	...args
]

# Add a P2P reference
extern "dotnet reference" [
	--interactive					# Allow interactive input/action
	...args
]

# Add a client certificate configuration
extern "dotnet client-cert" [
	--package-source(-s)					# Package source name
	--path					# Path to certificate file
	--store-password-in-clear-text					# Enable storing password for the certificate
	--store-location					# Certificate store location
	--store-name					# Certificate store name
	--find-by					# Search method to find certificate in certificate store
	--find-value					# Search the certificate store for the supplied value
	--force(-f)					# Skip certificate validation
	--configfile					# NuGet configuration file
	--configfile					# NuGet configuration file
	--package-source(-s)					# Package source name
	--configfile					# NuGet configuration file
	--package-source(-s)					# Package source name
	--path					# Path to certificate file
	--store-password-in-clear-text					# Enable storing password for the certificate
	--store-location					# Certificate store location
	--store-name					# Certificate store name
	--find-by					# Search method to find certificate in certificate store
	--find-value					# Search the certificate store for the supplied value
	--force(-f)					# Skip certificate validation
	--configfile					# NuGet configuration file
	...args
]

# Add a NuGet source
extern "dotnet source" [
	--name(-n)					# Name of the source
	--store-password-in-clear-text					# Enable storing portable package source credentials
	--valid-authentication-types					# Comma-separated list of valid authentication types
	--configfile					# NuGet configuration file
	--configfile					# NuGet configuration file
	--configfile					# NuGet configuration file
	--configfile					# NuGet configuration file
	--configfile					# NuGet configuration file
	--source(-s)					# Path to the package source
	--store-password-in-clear-text					# Enable storing portable package source credentials
	--valid-authentication-types					# Comma-separated list of valid authentication types
	--configfile					# NuGet configuration file
	...args
]

# Delete a package from the server
extern "dotnet delete" [
	--force-english-output					# Run the application with locale set to English
	--source(-s)					# Package source to use
	--non-interactive					# Don't prompt for user input or confirmations
	--no-service-endpoint					# Doesn't append \"api/v2/package\" to the source URL
	--interactive					# Allow interactive input/action
	...args
]

# Disable a NuGet source
extern "dotnet disable" [
	--configfile					# NuGet configuration file
	...args
]

# Enable a NuGet source
extern "dotnet enable" [
	--configfile					# NuGet configuration file
	...args
]

# Clear/List local NuGet resources
extern "dotnet locals" [
	--force-english-output					# Run the application with locale set to English
	--clear(-c)					# Clear the selected local resources or cache location
	--list(-l)					# List the selected local resources or cache location
	...args
]

# Push a package to the server
extern "dotnet push" [
	--force-english-output					# Run the application with locale set to English
	--source(-s)					# Package source to use
	--symbol-source					# Symbol server URL to use
	--disable-buffering(-d)					# Disable buffering when pushing to an HTTP server
	--no-symbols(-n)					# Doesn't push symbols
	--no-service-endpoint					# Doesn't append \"api/v2/package\" to the source URL
	--interactive					# Allow interactive input/action
	--skip-duplicate					# Treat any 409 Conflict response as a warning
	...args
]

# Update a NuGet source
extern "dotnet update" [
	--package-source(-s)					# Package source name
	--path					# Path to certificate file
	--store-password-in-clear-text					# Enable storing password for the certificate
	--store-location					# Certificate store location
	--store-name					# Certificate store name
	--find-by					# Search method to find certificate in certificate store
	--find-value					# Search the certificate store for the supplied value
	--force(-f)					# Skip certificate validation
	--configfile					# NuGet configuration file
	--source(-s)					# Path to the package source
	--store-password-in-clear-text					# Enable storing portable package source credentials
	--valid-authentication-types					# Comma-separated list of valid authentication types
	--configfile					# NuGet configuration file
	--global(-g)					# Specify that the update is for a user-wide tool
	--tool-path					# Directory containing the tool to update
	--local					# Specify that the tool to be updated is a local tool
	--configfile					# NuGet configuration file to use
	--add-source					# Add an additional NuGet package source to use during the update
	--tool-manifest					# Path to the manifest file
	--disable-parallel					# Prevent restoring multiple projects in parallel
	--ignore-failed-sources					# Treat package source failures as warnings
	--no-cache					# Don't cache packages and HTTP requests
	--interactive					# Allow interactive input/action
	...args
]

# Verify a signed NuGet package
extern "dotnet verify" [
	--all					# Specify that all verifications possible should be performed
	...args
]

# Install global/local tool
extern "dotnet install" [
	--global(-g)					# Specify that the installation is user-wide
	--local					# Specify a local tool installation
	--tool-path					# Directory where the tool will be installed
	--configfile					# NuGet configuration file to use
	--tool-manifest					# Path to the manifest file
	--add-source					# Add an additional NuGet package source to use during installation
	--disable-parallel					# Prevent restoring multiple projects in parallel
	--ignore-failed-sources					# Treat package source failures as warnings
	--no-cache					# Don't cache packages and HTTP requests
	--interactive					# Allow interactive input/action
	--global(-g)					# Specify that the tool to be removed is from a user-wide installation
	--local					# Specify that the tool to be removed is a local tool
	--tool-path					# Directory containing the tool to uninstall
	--tool-manifest					# Path to the manifest file
	...args
]

# Uninstall a global/local tool
extern "dotnet uninstall" [
	--global(-g)					# Specify that the tool to be removed is from a user-wide installation
	--local					# Specify that the tool to be removed is a local tool
	--tool-path					# Directory containing the tool to uninstall
	--tool-manifest					# Path to the manifest file
	...args
]

# Search .NET tools in NuGet.org
extern "dotnet search" [
	--detail					# Show detail result of the query
	--prerelease					# Include pre-release packages
	...args
]

# Shutdown build servers
extern "dotnet shutdown" [
	--msbuild					# Shutdown the MSBuild build server
	--vbcscompiler					# Shutdown the VB/C# compiler build server
	--razor					# Shutdown the Razor build server
	...args
]