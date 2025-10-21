# Windows Package Manager (winget) completions for Nushell
# winget v1.11.510
#
# The winget command line tool enables users to discover, install, upgrade,
# remove and configure applications on Windows 10 and Windows 11 computers.
# This tool is the client interface to the Windows Package Manager service.

# Completion functions

def "nu-complete winget sources" [] {
    ^winget source list
    | lines
    | skip 2
    | parse "{name} {arg}"
    | get name
}

def "nu-complete winget scope" [] {
    ["user", "machine"]
}

def "nu-complete winget locale" [] {
    [
        "ar-SA", "bn-BD", "bn-IN", "cs-CZ", "da-DK", "de-AT", "de-CH", "de-DE", "el-GR",
        "en-AU", "en-CA", "en-GB", "en-IE", "en-IN", "en-NZ", "en-US", "en-ZA", "es-AR",
        "es-CL", "es-CO", "es-ES", "es-MX", "es-US", "fi-FI", "fr-BE", "fr-CA", "fr-CH",
        "fr-FR", "he-IL", "hi-IN", "hu-HU", "id-ID", "it-CH", "it-IT", "jp-JP", "ko-KR",
        "nl-BE", "nl-NL", "no-NO", "pl-PL", "pt-BR", "pt-PT", "ro-RO", "ru-RU", "sk-SK",
        "sv-SE", "ta-IN", "ta-LK", "th-TH", "tr-TR", "zh-CN", "zh-HK", "zh-TW"
    ]
}

def "nu-complete winget architecture" [] {
    ["x86", "x64", "arm", "arm64", "neutral"]
}

def "nu-complete winget installer-type" [] {
    ["msix", "msi", "appx", "exe", "zip", "inno", "nullsoft", "wix", "burn", "pwa", "portable"]
}

def "nu-complete winget authentication-mode" [] {
    ["silent", "silentPreferred", "interactive"]
}

def "nu-complete winget source-type" [] {
    ["Microsoft.PreIndexed.Package", "Microsoft.Rest"]
}

def "nu-complete winget trust-level" [] {
    ["none", "trusted"]
}

def "nu-complete winget installed packages" [] {
    let path = ($env.TMP | path join "winget-installed.json")

    if not ($path | path exists) or (ls $path | first | get modified | ((date now) - $in) > 1day) {
        ^winget export -o $path -s winget | complete | ignore
    }

    if ($path | path exists) {
        open $path
        | get Sources.Packages?.0?
        | default []
        | get PackageIdentifier
    } else {
        []
    }
}

def "nu-complete winget flagify" [name: string, value: any, --short(-s)] {
    let flag_start = if $short { '-' } else { '--' }

    if $value == null or $value == false {
        []
    } else if $value == true {
        [$"($flag_start)($name)"]
    } else {
        [$"($flag_start)($name)" $"($value)"]
    }
}

def "nu-complete winget trimLoadingSymbol" [] {
    str replace -r r#'^[^\w]*'# ""
}

# Windows Package Manager
#
# The winget command line tool enables users to discover, install, upgrade,
# remove and configure applications on Windows 10 and Windows 11 computers.
@category package-manager
export extern winget [
    --version(-v)                # Display the version of the tool
    --info                       # Display general info of the tool
    --help(-?)                   # Shows help about the selected command
    --wait                       # Prompts the user to press any key before exiting
    --logs                       # Open the default logs location
    --open-logs                  # Open the default logs location
    --verbose                    # Enables verbose logging for winget
    --verbose-logs               # Enables verbose logging for winget
    --nowarn                     # Suppresses warning outputs
    --ignore-warnings            # Suppresses warning outputs
    --disable-interactivity      # Disable interactive prompts
    --proxy: string              # Set a proxy to use for this execution
    --no-proxy                   # Disable the use of proxy for this execution
]

# Installs the given package
#
# By default, the query must case-insensitively match the id, name, or moniker
# of the package. Other fields can be used by passing their appropriate option.
@category package-manager
@example "Install a package by name" {
    winget install "Google Chrome"
}
@example "Install a specific version of a package" {
    winget install --id Microsoft.PowerShell --version 7.3.0
}
@example "Install a package silently" {
    winget install Python.Python.3.12 --silent
}
export extern "winget install" [
    query?: string               # The query used to search for a package
    --query(-q): string          # The query used to search for a package
    --manifest(-m): path         # The path to the manifest of the package
    --id: string                 # Filter results by id
    --name: string               # Filter results by name
    --moniker: string            # Filter results by moniker
    --version(-v): string        # Use the specified version; default is the latest version
    --source(-s): string@"nu-complete winget sources"  # Find package using the specified source
    --scope: string@"nu-complete winget scope"  # Select install scope (user or machine)
    --architecture(-a): string@"nu-complete winget architecture"  # Select the architecture
    --installer-type: string@"nu-complete winget installer-type"  # Select the installer type
    --exact(-e)                  # Find package using exact match
    --interactive(-i)            # Request interactive installation; user input may be needed
    --silent(-h)                 # Request silent installation
    --locale: string@"nu-complete winget locale"  # Locale to use (BCP47 format)
    --log(-o): path              # Log location (if supported)
    --custom: string             # Arguments to be passed on to the installer in addition to the defaults
    --override: string           # Override arguments to be passed on to the installer
    --location(-l): path         # Location to install to (if supported)
    --ignore-security-hash       # Ignore the installer hash check failure
    --allow-reboot               # Allows a reboot if applicable
    --skip-dependencies          # Skips processing package dependencies and Windows features
    --ignore-local-archive-malware-scan  # Ignore the malware scan performed as part of installing an archive type package
    --dependency-source: string@"nu-complete winget sources"  # Find package dependencies using the specified source
    --accept-package-agreements  # Accept all license agreements for packages
    --no-upgrade                 # Skips upgrade if an installed version already exists
    --header: string             # Optional Windows-Package-Manager REST source HTTP header
    --authentication-mode: string@"nu-complete winget authentication-mode"  # Specify authentication window preference
    --authentication-account: string  # Specify the account to be used for authentication
    --accept-source-agreements   # Accept all source agreements during source operations
    --rename(-r): string         # The value to rename the executable file (portable)
    --uninstall-previous         # Uninstall the previous version of the package during upgrade
    --force                      # Direct run the command and continue with non security related issues
    --help(-?)                   # Shows help about the selected command
    --wait                       # Prompts the user to press any key before exiting
    --logs                       # Open the default logs location
    --open-logs                  # Open the default logs location
    --verbose                    # Enables verbose logging for winget
    --verbose-logs               # Enables verbose logging for winget
    --nowarn                     # Suppresses warning outputs
    --ignore-warnings            # Suppresses warning outputs
    --disable-interactivity      # Disable interactive prompts
    --proxy: string              # Set a proxy to use for this execution
    --no-proxy                   # Disable the use of proxy for this execution
]

export alias "winget add" = winget install

# Shows information about a package
#
# Displays detailed information about the specified package.
@category package-manager
@example "Show package information" {
    winget show Microsoft.PowerShell
}
@example "Show available versions of a package" {
    winget show Python.Python.3.12 --versions
}
export extern "winget show" [
    query?: string               # The query used to search for a package
    --query(-q): string          # The query used to search for a package
    --manifest(-m): path         # The path to the manifest of the package
    --id: string                 # Filter results by id
    --name: string               # Filter results by name
    --moniker: string            # Filter results by moniker
    --version(-v): string        # Use the specified version; default is the latest version
    --source(-s): string@"nu-complete winget sources"  # Find package using the specified source
    --exact(-e)                  # Find package using exact match
    --scope: string@"nu-complete winget scope"  # Select install scope (user or machine)
    --architecture(-a): string@"nu-complete winget architecture"  # Select the architecture
    --installer-type: string@"nu-complete winget installer-type"  # Select the installer type
    --locale: string@"nu-complete winget locale"  # Locale to use (BCP47 format)
    --versions                   # Show available versions of the package
    --header: string             # Optional Windows-Package-Manager REST source HTTP header
    --authentication-mode: string@"nu-complete winget authentication-mode"  # Specify authentication window preference
    --authentication-account: string  # Specify the account to be used for authentication
    --accept-source-agreements   # Accept all source agreements during source operations
    --help(-?)                   # Shows help about the selected command
    --wait                       # Prompts the user to press any key before exiting
    --logs                       # Open the default logs location
    --open-logs                  # Open the default logs location
    --verbose                    # Enables verbose logging for winget
    --verbose-logs               # Enables verbose logging for winget
    --nowarn                     # Suppresses warning outputs
    --ignore-warnings            # Suppresses warning outputs
    --disable-interactivity      # Disable interactive prompts
    --proxy: string              # Set a proxy to use for this execution
    --no-proxy                   # Disable the use of proxy for this execution
]

export alias "winget view" = winget show

# Find and show basic info of packages
#
# Searches for packages in the configured sources.
@category package-manager
@example "Search for a package" {
    winget search firefox
}
@example "Search for a package by exact ID" {
    winget search --id Mozilla.Firefox --exact
}
export def "winget search" [
    pos_query?: string                # The query used to search for a package
    --query(-q): string               # The query used to search for a package
    --id: string                      # Filter results by id
    --name: string                    # Filter results by name
    --moniker: string                 # Filter results by moniker
    --tag: string                     # Filter results by tag
    --command: string                 # Filter results by command
    --cmd: string                     # Filter results by command
    --source(-s): string@"nu-complete winget sources"  # Find package using the specified source
    --count(-n): int                  # Show no more than specified number of results (between 1 and 1000)
    --exact(-e)                       # Find package using exact match
    --header: string                  # Optional Windows-Package-Manager REST source HTTP header
    --authentication-mode: string@"nu-complete winget authentication-mode"  # Specify authentication window preference
    --authentication-account: string  # Specify the account to be used for authentication
    --accept-source-agreements        # Accept all source agreements during source operations
    --versions                        # Show available versions of the package
    --help(-?)                        # Shows help about the selected command
    --wait                            # Prompts the user to press any key before exiting
    --logs                            # Open the default logs location
    --open-logs                       # Open the default logs location
    --verbose                         # Enables verbose logging for winget
    --verbose-logs                    # Enables verbose logging for winget
    --nowarn                          # Suppresses warning outputs
    --ignore-warnings                 # Suppresses warning outputs
    --disable-interactivity           # Disable interactive prompts
    --proxy: string                   # Set a proxy to use for this execution
    --no-proxy                        # Disable the use of proxy for this execution
    --raw                             # Output the raw CLI output instead of structured data
] {
    let flagify = { |flag_name, flag_value| nu-complete winget flagify $flag_name $flag_value }
    let params = [
            "search"
            $"($pos_query)"
        ]
        | append (
            [
                (do $flagify query $query)
                (do $flagify id $id)
                (do $flagify name $name)
                (do $flagify moniker $moniker)
                (do $flagify tag $tag)
                (do $flagify command $command)
                (do $flagify cmd $cmd)
                (do $flagify source $source)
                (do $flagify count $count)
                (do $flagify exact $exact)
                (do $flagify header $header)
                (do $flagify authentication-mode $authentication_mode)
                (do $flagify authentication-account $authentication_account)
                (do $flagify accept-source-agreements $accept_source_agreements)
                (do $flagify versions $versions)
                (do $flagify wait $wait)
                (do $flagify logs $logs)
                (do $flagify open-logs $open_logs)
                (do $flagify verbose $verbose)
                (do $flagify verbose-logs $verbose_logs)
                (do $flagify nowarn $nowarn)
                (do $flagify ignore-warnings $ignore_warnings)
                (do $flagify disable-interactivity $disable_interactivity)
                (do $flagify proxy $proxy)
                (do $flagify no-proxy $no_proxy)
                (do $flagify help $help)
            ]
            | flatten
            | where { not ($in | is-empty) }
        )
        | flatten
        | where { not ($in | is-empty) }

    let output = ^winget ...$params | nu-complete winget trimLoadingSymbol

    if $raw or $help {
        $output
    } else {
        let detected = $output | detect columns --guess
        let table = if (($detected | columns | length) == 5) {
            $detected | rename name id version match source
        } else {
            $detected
        }

        if ($table | length) == 1 and ($table | columns | length) == 1 {
            print -e $"(ansi light_red)($output)(ansi reset)"
            null
        } else {
            $table
        }
    }
}

export alias "winget find" = winget search

# Display installed packages
#
# Lists packages installed on the system, with optional filters.
@category package-manager
@example "List all installed packages" {
    winget list
}
@example "List packages with available upgrades" {
    winget list --upgrade-available
}
@example "List installed packages from a specific source" {
    winget list --source winget
}
export def "winget list" [
    pos_query?: string                # The query used to search for a package
    --query(-q): string               # The query used to search for a package
    --id: string                      # Filter results by id
    --name: string                    # Filter results by name
    --moniker: string                 # Filter results by moniker
    --source(-s): string@"nu-complete winget sources"  # Find package using the specified source
    --tag: string                     # Filter results by tag
    --command: string                 # Filter results by command
    --cmd: string                     # Filter results by command
    --count(-n): int                  # Show no more than specified number of results (between 1 and 1000)
    --exact(-e)                       # Find package using exact match
    --scope: string@"nu-complete winget scope"  # Select installed package scope filter (user or machine)
    --header: string                  # Optional Windows-Package-Manager REST source HTTP header
    --authentication-mode: string@"nu-complete winget authentication-mode"  # Specify authentication window preference
    --authentication-account: string  # Specify the account to be used for authentication
    --accept-source-agreements        # Accept all source agreements during source operations
    --upgrade-available               # Lists only packages which have an upgrade available
    --unknown(-u)                     # List packages even if their current version cannot be determined
    --include-unknown                 # List packages even if their current version cannot be determined
    --pinned                          # List packages even if they have a pin that prevents upgrade
    --include-pinned                  # List packages even if they have a pin that prevents upgrade
    --help(-?)                        # Shows help about the selected command
    --wait                            # Prompts the user to press any key before exiting
    --logs                            # Open the default logs location
    --open-logs                       # Open the default logs location
    --verbose                         # Enables verbose logging for winget
    --verbose-logs                    # Enables verbose logging for winget
    --nowarn                          # Suppresses warning outputs
    --ignore-warnings                 # Suppresses warning outputs
    --disable-interactivity           # Disable interactive prompts
    --proxy: string                   # Set a proxy to use for this execution
    --no-proxy                        # Disable the use of proxy for this execution
    --raw                             # Output the raw CLI output instead of structured data
] {
    let flagify = { |flag_name, flag_value| nu-complete winget flagify $flag_name $flag_value }
    let params = [
            "list"
            $"($pos_query)"
        ]
        | append (
            [
                (do $flagify query $query)
                (do $flagify id $id)
                (do $flagify name $name)
                (do $flagify moniker $moniker)
                (do $flagify source $source)
                (do $flagify tag $tag)
                (do $flagify command $command)
                (do $flagify cmd $cmd)
                (do $flagify count $count)
                (do $flagify exact $exact)
                (do $flagify scope $scope)
                (do $flagify header $header)
                (do $flagify authentication-mode $authentication_mode)
                (do $flagify authentication-account $authentication_account)
                (do $flagify accept-source-agreements $accept_source_agreements)
                (do $flagify upgrade-available $upgrade_available)
                (do $flagify unknown $unknown)
                (do $flagify include-unknown $include_unknown)
                (do $flagify pinned $pinned)
                (do $flagify include-pinned $include_pinned)
                (do $flagify wait $wait)
                (do $flagify logs $logs)
                (do $flagify open-logs $open_logs)
                (do $flagify verbose $verbose)
                (do $flagify verbose-logs $verbose_logs)
                (do $flagify nowarn $nowarn)
                (do $flagify ignore-warnings $ignore_warnings)
                (do $flagify disable-interactivity $disable_interactivity)
                (do $flagify proxy $proxy)
                (do $flagify no-proxy $no_proxy)
                (do $flagify help $help)
            ]
            | flatten
            | where { not ($in | is-empty) }
        )
        | flatten
        | where { not ($in | is-empty) }

    let output = ^winget ...$params | nu-complete winget trimLoadingSymbol

    if $raw or $help {
        $output
    } else {
        let detected = $output | detect columns --guess
        let table = if (($detected | columns | length) == 5) {
            $detected | rename name id version available source
        } else {
            $detected
        }

        if ($table | length) == 1 and ($table | columns | length) == 1 {
            print -e $"(ansi light_red)($output)(ansi reset)"
            null
        } else {
            let has_source_column = ($table | columns | any { |col| $col == "source" })
            if $source != null and $has_source_column {
                $table | where source == $source
            } else {
                $table
            }
        }
    }
}

export alias "winget ls" = winget list

def "winget upgrades" [] {
    let output = ^winget upgrade | nu-complete winget trimLoadingSymbol

    if (($output | str starts-with 'No') or ($output | str starts-with '0')) {
        return
    }

    let lines = $output | lines
    let head = $lines | first
    let rest = $lines | skip 2

    let colnames = [Name Id Version Available Source]
    let cols = $colnames | each {|col| { name: $col i: ($head | str index-of $col --grapheme-clusters) }}

    let parsed = $rest | each {|line|
        let chars = $line | split chars
        {
            name: ($chars | slice ($cols.0.i)..($cols.1.i - 1) | str join | str trim)
            id: ($chars | slice ($cols.1.i)..($cols.2.i - 1) | str join | str trim)
            version: ($chars | slice ($cols.2.i)..($cols.3.i - 1) | str join | str trim)
            available: ($chars | slice ($cols.3.i)..($cols.4.i - 1) | str join | str trim)
            source: ($chars | slice ($cols.4.i).. | str join | str trim)
        }
    }

    $parsed | take until {|row| $row.source == '' }
}

# Shows and performs available upgrades
#
# Upgrades the specified package or shows available upgrades for all packages.
@category package-manager
@example "Show all available upgrades" {
    winget upgrade
}
@example "Upgrade all packages" {
    winget upgrade --all
}
@example "Upgrade a specific package" {
    winget upgrade Microsoft.PowerShell
}
export extern "winget upgrade" [
    query?: string               # The query used to search for a package
    --query(-q): string          # The query used to search for a package
    --manifest(-m): path         # The path to the manifest of the package
    --id: string                 # Filter results by id
    --name: string               # Filter results by name
    --moniker: string            # Filter results by moniker
    --version(-v): string        # Use the specified version; default is the latest version
    --source(-s): string@"nu-complete winget sources"  # Find package using the specified source
    --exact(-e)                  # Find package using exact match
    --interactive(-i)            # Request interactive installation; user input may be needed
    --silent(-h)                 # Request silent installation
    --purge                      # Deletes all files and directories in the package directory (portable)
    --log(-o): path              # Log location (if supported)
    --custom: string             # Arguments to be passed on to the installer in addition to the defaults
    --override: string           # Override arguments to be passed on to the installer
    --location(-l): path         # Location to install to (if supported)
    --scope: string@"nu-complete winget scope"  # Select installed package scope filter (user or machine)
    --architecture(-a): string@"nu-complete winget architecture"  # Select the architecture
    --installer-type: string@"nu-complete winget installer-type"  # Select the installer type
    --locale: string@"nu-complete winget locale"  # Locale to use (BCP47 format)
    --ignore-security-hash       # Ignore the installer hash check failure
    --allow-reboot               # Allows a reboot if applicable
    --skip-dependencies          # Skips processing package dependencies and Windows features
    --ignore-local-archive-malware-scan  # Ignore the malware scan performed as part of installing an archive type package
    --accept-package-agreements  # Accept all license agreements for packages
    --accept-source-agreements   # Accept all source agreements during source operations
    --header: string             # Optional Windows-Package-Manager REST source HTTP header
    --authentication-mode: string@"nu-complete winget authentication-mode"  # Specify authentication window preference
    --authentication-account: string  # Specify the account to be used for authentication
    --recurse(-r)                # Upgrade all installed packages to latest if available
    --all                        # Upgrade all installed packages to latest if available
    --unknown(-u)                # Upgrade packages even if their current version cannot be determined
    --include-unknown            # Upgrade packages even if their current version cannot be determined
    --pinned                     # Upgrade packages even if they have a non-blocking pin
    --include-pinned             # Upgrade packages even if they have a non-blocking pin
    --uninstall-previous         # Uninstall the previous version of the package during upgrade
    --force                      # Direct run the command and continue with non security related issues
    --help(-?)                   # Shows help about the selected command
    --wait                       # Prompts the user to press any key before exiting
    --logs                       # Open the default logs location
    --open-logs                  # Open the default logs location
    --verbose                    # Enables verbose logging for winget
    --verbose-logs               # Enables verbose logging for winget
    --nowarn                     # Suppresses warning outputs
    --ignore-warnings            # Suppresses warning outputs
    --disable-interactivity      # Disable interactive prompts
    --proxy: string              # Set a proxy to use for this execution
    --no-proxy                   # Disable the use of proxy for this execution
]

export alias "winget update" = winget upgrade

# Uninstalls the given package
#
# Removes the specified package from the system.
@category package-manager
@example "Uninstall a package" {
    winget uninstall "Google Chrome"
}
@example "Uninstall a package by ID" {
    winget uninstall --id Google.Chrome
}
export extern "winget uninstall" [
    query?: string@"nu-complete winget installed packages"  # The query used to search for a package
    --query(-q): string@"nu-complete winget installed packages"  # The query used to search for a package
    --manifest(-m): path         # The path to the manifest of the package
    --id: string@"nu-complete winget installed packages"  # Filter results by id
    --name: string               # Filter results by name
    --moniker: string            # Filter results by moniker
    --product-code: string       # Filters using the product code
    --version(-v): string        # The version to act upon
    --all                        # Uninstall all versions
    --all-versions               # Uninstall all versions
    --source(-s): string@"nu-complete winget sources"  # Find package using the specified source
    --exact(-e)                  # Find package using exact match
    --scope: string@"nu-complete winget scope"  # Select installed package scope filter (user or machine)
    --interactive(-i)            # Request interactive installation; user input may be needed
    --silent(-h)                 # Request silent installation
    --force                      # Direct run the command and continue with non security related issues
    --purge                      # Deletes all files and directories in the package directory (portable)
    --preserve                   # Retains all files and directories created by the package (portable)
    --log(-o): path              # Log location (if supported)
    --header: string             # Optional Windows-Package-Manager REST source HTTP header
    --authentication-mode: string@"nu-complete winget authentication-mode"  # Specify authentication window preference
    --authentication-account: string  # Specify the account to be used for authentication
    --accept-source-agreements   # Accept all source agreements during source operations
    --help(-?)                   # Shows help about the selected command
    --wait                       # Prompts the user to press any key before exiting
    --logs                       # Open the default logs location
    --open-logs                  # Open the default logs location
    --verbose                    # Enables verbose logging for winget
    --verbose-logs               # Enables verbose logging for winget
    --nowarn                     # Suppresses warning outputs
    --ignore-warnings            # Suppresses warning outputs
    --disable-interactivity      # Disable interactive prompts
    --proxy: string              # Set a proxy to use for this execution
    --no-proxy                   # Disable the use of proxy for this execution
]

export alias "winget remove" = winget uninstall
export alias "winget rm" = winget uninstall

# Downloads the installer from a given package
export extern "winget download" [
    query?: string               # The query used to search for a package
    --query(-q): string          # The query used to search for a package
    --download-directory(-d): path  # Directory where the installers are downloaded to
    --manifest(-m): path         # The path to the manifest of the package
    --id: string                 # Filter results by id
    --name: string               # Filter results by name
    --moniker: string            # Filter results by moniker
    --version(-v): string        # Use the specified version; default is the latest version
    --source(-s): string@"nu-complete winget sources"  # Find package using the specified source
    --scope: string@"nu-complete winget scope"  # Select install scope (user or machine)
    --architecture(-a): string@"nu-complete winget architecture"  # Select the architecture
    --installer-type: string@"nu-complete winget installer-type"  # Select the installer type
    --exact(-e)                  # Find package using exact match
    --locale: string@"nu-complete winget locale"  # Locale to use (BCP47 format)
    --ignore-security-hash       # Ignore the installer hash check failure
    --skip-dependencies          # Skips processing package dependencies and Windows features
    --header: string             # Optional Windows-Package-Manager REST source HTTP header
    --authentication-mode: string@"nu-complete winget authentication-mode"  # Specify authentication window preference
    --authentication-account: string  # Specify the account to be used for authentication
    --accept-package-agreements  # Accept all license agreements for packages
    --accept-source-agreements   # Accept all source agreements during source operations
    --skip-license               # Skips retrieving Microsoft Store package offline license
    --skip-microsoft-store-package-license  # Skips retrieving Microsoft Store package offline license
    --platform: string           # Select the target platform
    --help(-?)                   # Shows help about the selected command
    --wait                       # Prompts the user to press any key before exiting
    --logs                       # Open the default logs location
    --open-logs                  # Open the default logs location
    --verbose                    # Enables verbose logging for winget
    --verbose-logs               # Enables verbose logging for winget
    --nowarn                     # Suppresses warning outputs
    --ignore-warnings            # Suppresses warning outputs
    --disable-interactivity      # Disable interactive prompts
    --proxy: string              # Set a proxy to use for this execution
    --no-proxy                   # Disable the use of proxy for this execution
]

# Manage sources of packages
#
# Manages the repositories accessed by Windows Package Manager.
@category package-manager
export extern "winget source" [
    --help(-?)                   # Shows help about the selected command
    --wait                       # Prompts the user to press any key before exiting
    --logs                       # Open the default logs location
    --open-logs                  # Open the default logs location
    --verbose                    # Enables verbose logging for winget
    --verbose-logs               # Enables verbose logging for winget
    --nowarn                     # Suppresses warning outputs
    --ignore-warnings            # Suppresses warning outputs
    --disable-interactivity      # Disable interactive prompts
    --proxy: string              # Set a proxy to use for this execution
    --no-proxy                   # Disable the use of proxy for this execution
]

# Add a new source
export extern "winget source add" [
    name?: string                # Name of the source
    --name(-n): string           # Name of the source
    --arg(-a): string            # Argument given to the source
    --type(-t): string@"nu-complete winget source-type"  # Type of the source
    --trust-level: string@"nu-complete winget trust-level"  # Trust level of the source (none or trusted)
    --header: string             # Optional Windows-Package-Manager REST source HTTP header
    --accept-source-agreements   # Accept all source agreements during source operations
    --explicit                   # Excludes a source from discovery unless specified
    --help(-?)                   # Shows help about the selected command
    --wait                       # Prompts the user to press any key before exiting
    --logs                       # Open the default logs location
    --open-logs                  # Open the default logs location
    --verbose                    # Enables verbose logging for winget
    --verbose-logs               # Enables verbose logging for winget
    --nowarn                     # Suppresses warning outputs
    --ignore-warnings            # Suppresses warning outputs
    --disable-interactivity      # Disable interactive prompts
    --proxy: string              # Set a proxy to use for this execution
    --no-proxy                   # Disable the use of proxy for this execution
]

# List current sources
export def "winget source list" [
    pos_name?: string@"nu-complete winget sources"   # Name of the source
    --name(-n): string@"nu-complete winget sources"  # Name of the source
    --raw                        # Output the raw CLI output instead of structured data
    --help(-?)                   # Shows help about the selected command
    --wait                       # Prompts the user to press any key before exiting
    --logs                       # Open the default logs location
    --open-logs                  # Open the default logs location
    --verbose                    # Enables verbose logging for winget
    --verbose-logs               # Enables verbose logging for winget
    --nowarn                     # Suppresses warning outputs
    --ignore-warnings            # Suppresses warning outputs
    --disable-interactivity      # Disable interactive prompts
    --proxy: string              # Set a proxy to use for this execution
    --no-proxy                   # Disable the use of proxy for this execution
] {
    let flagify = { |flag_name, flag_value| nu-complete winget flagify $flag_name $flag_value }
    let params = [
            "source"
            "list"
            $"($pos_name)"
        ]
        | append (
            [
                (do $flagify name $name)
                (do $flagify help $help)
                (do $flagify wait $wait)
                (do $flagify logs $logs)
                (do $flagify open-logs $open_logs)
                (do $flagify verbose $verbose)
                (do $flagify verbose-logs $verbose_logs)
                (do $flagify nowarn $nowarn)
                (do $flagify ignore-warnings $ignore_warnings)
                (do $flagify disable-interactivity $disable_interactivity)
                (do $flagify proxy $proxy)
                (do $flagify no-proxy $no_proxy)
            ]
            | flatten
            | where { not ($in | is-empty) }
        )
        | flatten
        | where { not ($in | is-empty) }

    let output = ^winget ...$params | nu-complete winget trimLoadingSymbol

    if $raw or $help {
        $output
    } else {
        let lines = $output | lines
        if ($lines | length) == 1 {
            $"(ansi light_red)($lines | first)(ansi reset)"
        } else {
            $lines | skip 2 | split column -c ' ' | rename Name Argument
        }
    }
}

export alias "winget source ls" = winget source list

# Update current sources
export extern "winget source update" [
    name?: string@"nu-complete winget sources"  # Name of the source
    --name(-n): string@"nu-complete winget sources"  # Name of the source
    --help(-?)                   # Shows help about the selected command
    --wait                       # Prompts the user to press any key before exiting
    --logs                       # Open the default logs location
    --open-logs                  # Open the default logs location
    --verbose                    # Enables verbose logging for winget
    --verbose-logs               # Enables verbose logging for winget
    --nowarn                     # Suppresses warning outputs
    --ignore-warnings            # Suppresses warning outputs
    --disable-interactivity      # Disable interactive prompts
    --proxy: string              # Set a proxy to use for this execution
    --no-proxy                   # Disable the use of proxy for this execution
]

export alias "winget source refresh" = winget source update

# Remove current sources
export extern "winget source remove" [
    name?: string@"nu-complete winget sources"  # Name of the source
    --name(-n): string@"nu-complete winget sources"  # Name of the source
    --help(-?)                   # Shows help about the selected command
    --wait                       # Prompts the user to press any key before exiting
    --logs                       # Open the default logs location
    --open-logs                  # Open the default logs location
    --verbose                    # Enables verbose logging for winget
    --verbose-logs               # Enables verbose logging for winget
    --nowarn                     # Suppresses warning outputs
    --ignore-warnings            # Suppresses warning outputs
    --disable-interactivity      # Disable interactive prompts
    --proxy: string              # Set a proxy to use for this execution
    --no-proxy                   # Disable the use of proxy for this execution
]

export alias "winget source rm" = winget source remove

# Reset sources
export extern "winget source reset" [
    name?: string@"nu-complete winget sources"  # Name of the source
    --name(-n): string@"nu-complete winget sources"  # Name of the source
    --force                      # Forces the reset of the sources
    --help(-?)                   # Shows help about the selected command
    --wait                       # Prompts the user to press any key before exiting
    --logs                       # Open the default logs location
    --open-logs                  # Open the default logs location
    --verbose                    # Enables verbose logging for winget
    --verbose-logs               # Enables verbose logging for winget
    --nowarn                     # Suppresses warning outputs
    --ignore-warnings            # Suppresses warning outputs
    --disable-interactivity      # Disable interactive prompts
    --proxy: string              # Set a proxy to use for this execution
    --no-proxy                   # Disable the use of proxy for this execution
]

# Export current sources
export extern "winget source export" [
    name?: string@"nu-complete winget sources"  # Name of the source
    --name(-n): string@"nu-complete winget sources"  # Name of the source
    --help(-?)                   # Shows help about the selected command
    --wait                       # Prompts the user to press any key before exiting
    --logs                       # Open the default logs location
    --open-logs                  # Open the default logs location
    --verbose                    # Enables verbose logging for winget
    --verbose-logs               # Enables verbose logging for winget
    --nowarn                     # Suppresses warning outputs
    --ignore-warnings            # Suppresses warning outputs
    --disable-interactivity      # Disable interactive prompts
    --proxy: string              # Set a proxy to use for this execution
    --no-proxy                   # Disable the use of proxy for this execution
]

# Helper to hash installer files
export extern "winget hash" [
    file?: path                  # File to be hashed
    --file(-f): path             # File to be hashed
    --msix(-m)                   # Input file will be treated as msix; signature hash will be provided if signed
    --help(-?)                   # Shows help about the selected command
    --wait                       # Prompts the user to press any key before exiting
    --logs                       # Open the default logs location
    --open-logs                  # Open the default logs location
    --verbose                    # Enables verbose logging for winget
    --verbose-logs               # Enables verbose logging for winget
    --nowarn                     # Suppresses warning outputs
    --ignore-warnings            # Suppresses warning outputs
    --disable-interactivity      # Disable interactive prompts
    --proxy: string              # Set a proxy to use for this execution
    --no-proxy                   # Disable the use of proxy for this execution
]

# Validates a manifest file
export extern "winget validate" [
    manifest?: path              # The path to the manifest to be validated
    --manifest: path             # The path to the manifest to be validated
    --help(-?)                   # Shows help about the selected command
    --wait                       # Prompts the user to press any key before exiting
    --logs                       # Open the default logs location
    --open-logs                  # Open the default logs location
    --verbose                    # Enables verbose logging for winget
    --verbose-logs               # Enables verbose logging for winget
    --nowarn                     # Suppresses warning outputs
    --ignore-warnings            # Suppresses warning outputs
    --disable-interactivity      # Disable interactive prompts
    --proxy: string              # Set a proxy to use for this execution
    --no-proxy                   # Disable the use of proxy for this execution
]

# Open settings or set administrator settings
export extern "winget settings" [
    --enable: string             # Enables the specific administrator setting
    --disable: string            # Disables the specific administrator setting
    --help(-?)                   # Shows help about the selected command
    --wait                       # Prompts the user to press any key before exiting
    --logs                       # Open the default logs location
    --open-logs                  # Open the default logs location
    --verbose                    # Enables verbose logging for winget
    --verbose-logs               # Enables verbose logging for winget
    --nowarn                     # Suppresses warning outputs
    --ignore-warnings            # Suppresses warning outputs
    --disable-interactivity      # Disable interactive prompts
    --proxy: string              # Set a proxy to use for this execution
    --no-proxy                   # Disable the use of proxy for this execution
]

export alias "winget config" = winget settings

# Shows the status of experimental features
export extern "winget features" [
    --help(-?)                   # Shows help about the selected command
    --wait                       # Prompts the user to press any key before exiting
    --logs                       # Open the default logs location
    --open-logs                  # Open the default logs location
    --verbose                    # Enables verbose logging for winget
    --verbose-logs               # Enables verbose logging for winget
    --nowarn                     # Suppresses warning outputs
    --ignore-warnings            # Suppresses warning outputs
    --disable-interactivity      # Disable interactive prompts
    --proxy: string              # Set a proxy to use for this execution
    --no-proxy                   # Disable the use of proxy for this execution
]

# Exports a list of the installed packages
export extern "winget export" [
    output?: path                # File where the result is to be written
    --output(-o): path           # File where the result is to be written
    --source(-s): string@"nu-complete winget sources"  # Export packages from the specified source
    --include-versions           # Include package versions in export file
    --accept-source-agreements   # Accept all source agreements during source operations
    --help(-?)                   # Shows help about the selected command
    --wait                       # Prompts the user to press any key before exiting
    --logs                       # Open the default logs location
    --open-logs                  # Open the default logs location
    --verbose                    # Enables verbose logging for winget
    --verbose-logs               # Enables verbose logging for winget
    --nowarn                     # Suppresses warning outputs
    --ignore-warnings            # Suppresses warning outputs
    --disable-interactivity      # Disable interactive prompts
    --proxy: string              # Set a proxy to use for this execution
    --no-proxy                   # Disable the use of proxy for this execution
]

# Installs all the packages in a file
export extern "winget import" [
    import_file?: path           # File describing the packages to install
    --import-file(-i): path      # File describing the packages to install
    --ignore-unavailable         # Ignore unavailable packages
    --ignore-versions            # Ignore package versions in import file
    --no-upgrade                 # Skips upgrade if an installed version already exists
    --accept-package-agreements  # Accept all license agreements for packages
    --accept-source-agreements   # Accept all source agreements during source operations
    --help(-?)                   # Shows help about the selected command
    --wait                       # Prompts the user to press any key before exiting
    --logs                       # Open the default logs location
    --open-logs                  # Open the default logs location
    --verbose                    # Enables verbose logging for winget
    --verbose-logs               # Enables verbose logging for winget
    --nowarn                     # Suppresses warning outputs
    --ignore-warnings            # Suppresses warning outputs
    --disable-interactivity      # Disable interactive prompts
    --proxy: string              # Set a proxy to use for this execution
    --no-proxy                   # Disable the use of proxy for this execution
]

# Manage package pins
export extern "winget pin" [
    --help(-?)                   # Shows help about the selected command
    --wait                       # Prompts the user to press any key before exiting
    --logs                       # Open the default logs location
    --open-logs                  # Open the default logs location
    --verbose                    # Enables verbose logging for winget
    --verbose-logs               # Enables verbose logging for winget
    --nowarn                     # Suppresses warning outputs
    --ignore-warnings            # Suppresses warning outputs
    --disable-interactivity      # Disable interactive prompts
    --proxy: string              # Set a proxy to use for this execution
    --no-proxy                   # Disable the use of proxy for this execution
]
