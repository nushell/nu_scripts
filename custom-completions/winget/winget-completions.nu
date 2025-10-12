# Written by Genna

# Windows Package Manager

def "nu-complete winget install locale" [] {
    [
        "ar-SA","bn-BD","bn-IN","cs-CZ","da-DK","de-AT","de-CH","de-DE","el-GR",
        "en-AU","en-CA","en-GB","en-IE","en-IN","en-NZ","en-US","en-ZA","es-AR",
        "es-CL","es-CO","es-ES","es-MX","es-US","fi-FI","fr-BE","fr-CA","fr-CH",
        "fr-FR","he-IL","hi-IN","hu-HU","id-ID","it-CH","it-IT","jp-JP","ko-KR",
        "nl-BE","nl-NL","no-NO","pl-PL","pt-BR","pt-PT","ro-RO","ru-RU","sk-SK",
        "sv-SE","ta-IN","ta-LK","th-TH","tr-TR","zh-CN","zh-HK","zh-TW"
    ]
}

def "nu-complete winget install source" [] {
    ^winget source list | lines | skip 2 | split column ' ' | get column1
}

def "nu-complete winget install scope" [] {
    ["user", "machine"]
}

def "nu-complete winget source type" [] {
    ["Microsoft.PreIndexed.Package"]
}

def "nu-complete winget flagify" [name: string, value: any, --short(-s)] {
  let flag_start = if $short { '-' } else { '--' }
  if $value == null or $value == false {
    []
  } else if $value == true {
    [$"($flag_start)($name)"]
  } else {
    [$"($flag_start)($name)", $"($value)"]
  }
}

def "nu-complete winget trimLoadingSymbol" [] {
    str replace -r r#'^[^\w]*'# ""
}

def "nu-complete winget uninstall package id" [] {
    ^winget export -s winget -o __winget-temp__.json | ignore
    let results = (open __winget-temp__.json | get Sources.Packages | first | get PackageIdentifier)
    rm __winget-temp__.json | ignore
    $results
}

def "nu-complete winget uninstall package name" [] {
    winget list | get name | str trim | str replace "…" "..."
}

def "nu-complete winget install name" [] {
    let path = ($env.TMP | path join winget-packages.csv)

    let completions = if ($path | path exists) and (ls $path | first | get modified | ((date now) - $in) < 1day) {
        open $path | get name | each { |it| $"(char dq)($it)(char dq)" } | str replace "…" ""
    } else {
        # Chinese characters break parsing, filter broken entries with `where source == winget`
        let data = (winget search | where source == winget | select name id)
        $data | save --force $path | ignore
        $data | get name | each { |it| $"(char dq)($it)(char dq)" } | str replace "…" ""
    }
    {
        completions: $completions
        options: {
            case_sensitive: false
            positional: false
        }
    }
}

def "nu-complete winget install id" [] {
    let path = ($env.TMP | path join winget-packages.csv)

    if ($path | path exists) and (ls $path | first | get modified | ((date now) - $in) < 1day) {
        open $path | get id | str replace "…" ""
    } else {
        # Chinese characters break parsing, filter broken entries with `where source == winget`
        let data = (winget search | where source == winget | select name id)
        $data | save --force $path | ignore
        $data | get id | str replace "…" ""
    }
}

export extern winget [
    --version(-v), # Display the version of the tool
    --info, # Display general info of the tool
    --help(-?), # Display the help for this command
]

# Installs the given package
export extern "winget install" [
    query?: string@"nu-complete winget install name",
    --query(-q): string@"nu-complete winget install name", # The query used to search for a package
    --manifest(-m): path, # The path to the manifest of the package
    --id: string@"nu-complete winget install id", # Filter results by id
    --name: string@"nu-complete winget install name", # Filter results by name
    --moniker: string, # Filter results by moniker
    --version(-v): string, # Use the specified version; default is the latest version
    --source(-s): string@"nu-complete winget install source", # Find package using the specified source
    --scope: string@"nu-complete winget install scope", # Select install scope (user or machine)
    --exact(-e), # Find package using exact match
    --interactive(-i), # Request interactive installation; user input may be needed
    --silent(-h), # Request silent installation
    --locale: string@"nu-complete winget install locale", # Locale to use (BCP47 format)
    --log(-o): path, # Log location (if supported)
    --override: string, # Override arguments to be passed on to the installer
    --location(-l): path, # Location to install to (if supported)
    --force, # Override the installer hash check
    --accept_package_agreements, # Accept all licence agreements for packages
    --header: string, # Optional Windows-Package-Manager REST source HTTP header
    --accept_source_agreements, # Accept all source agreements during source operations
    --help(-?) # Display the help for this command
]
export alias "winget add" = winget install

export extern "winget show" [
    pos_query?: string,
    --query(-q): string, # The query used to search for a package
    --manifest(-m): string # The path to the manifest of the application to show
    --id: string, # Filter results by id
    --name: string, # Filter results by name
    --moniker: string, # Filter results by moniker
    --version(-v): string, # Use the specified version; default is the latest version
    --source(-s): string@"nu-complete winget install source", # Find package using the specified source
    --exact(-e), # Find package using exact match
    --scope: string@"nu-complete winget install scope", # Select install scope (user or machine). Doesn't work rn, use ^winget
    --architecture(-a): string # Select the architecture to show
    --installer-type: string # Select the installer type to show
    --locale: string@"nu-complete winget install locale", # Locale to use (BCP47 format)
    --versions # Show available versions of the application
    --header: string, # Optional Windows-Package-Manager REST source HTTP header
    --authentication-mode: string # Specify authentication window preference (silent, silentPreferred or interactive)
    --authentication-account: string # Specify the account to be used for authentication
    --accept_source_agreements, # Accept all source agreements during source operations
    --help(-?), # Display the help for this command
    --wait # Prompts the user to press any key before exiting
    --logs # Open the default logs location
    --open-logs # Open the default logs location
    --verbose # Used to override the logging setting and create a verbose log
    --verbose-logs # Used to override the logging setting and create a verbose log
    --nowarn # Suppresses warning outputs.
    --ignore-warnings # Suppresses warning outputs
    --disable-interactivity # Disable interactive prompts
    --proxy # Set a proxy to use for this execution
    --no-proxy # Disable the use of proxy for this execution
]
export alias "winget view" = winget show

# Manage sources of packages
export extern "winget source" [
    --help(-?) # Display the help for this command
]

# Add a new source
export extern "winget source add" [
    --name(-n): string, # Name of the source
    --arg(-a): string, # Argument given to the source
    --type(-t): string@"nu-complete winget source type", # Type of the source
    --header: string, # Optional Windows-Package-Manager REST source HTTP header
    --accept_source_agreements, # Accept all source agreements during source operations
    --help(-?) # Display the help for this command
]

# List current sources
export def "winget source list" [
    pos_name?: string, # Name of the source
    --name(-n): string, # Name of the source
    --raw, # Output the raw CLI output instead of structured data
    --help(-?) # Display the help for this command
] {
    let flagify = { |name, value| nu-complete winget flagify $name $value }
    let params = ([
        "source"
        "list"
        $pos_name
        (do $flagify name $name)
        (do $flagify help $help)
    ] | compact --empty)

    if $raw or $help {
        ^winget ...$params
    } else {
        let output = (^winget ...$params | lines)
        if ($output | length) == 1 {
            $"(ansi light_red)($output | first)(ansi reset)"
        } else {
            $output | skip 2 | split column -c ' ' | rename Name Argument
        }
    }
}
export alias "winget source ls" = winget source list

# Update current sources
export extern "winget source update" [
    --name(-n): string, # Name of the source
    --help(-?) # Display the help for this command
]
export alias "winget source refresh" = winget source update

# Remove current sources
export extern "winget source remove" [
    --name(-n): string, # Name of the source
    --help(-?) # Display the help for this command
]
export alias "winget source rm" = winget source remove

# Reset sources
export extern "winget source reset" [
    --name(-n): string, # Name of the source
    --force, # Forces the reset of the sources
    --help(-?) # Display the help for this command
]

# Export current sources
export extern "winget source export" [
    --name(-n): string, # Name of the source
    --help(-?) # Display the help for this command
]

# Find and show basic info of packages
export def "winget search" [
    pos_query?: string,
    --query(-q): string, # The query used to search for a package
    --id: string, # Filter results by id
    --name: string, # Filter results by name
    --moniker: string, # Filter results by moniker
    --tag: string, # Filter results by tag
    --command: string, # Filter results by command
    --source(-s): string@"nu-complete winget install source", # Find package using the specified source
    --count(-n): int, # Show no more than specified number of results
    --exact(-e), # Find package using exact match
    --header: string, # Optional Windows-Package-Manager REST source HTTP header
    --accept_source_agreements, # Accept all source agreements during source operations
    --raw, # Output the raw CLI output instead of structured data
    --help(-?) # Display the help for this command
] {
    let flagify = { |name, value| nu-complete winget flagify $name $value }

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
                (do $flagify source $source)
                (do $flagify count $count)
                (do $flagify exact $exact)
                (do $flagify header $header)
                (do $flagify accept_source_agreements $accept_source_agreements)
                (do $flagify help $help)
            ]
            | flatten
            | where { not ($in | is-empty) }
        )

    let output = ^winget ...$params
        | nu-complete winget trimLoadingSymbol
    if $raw or $help {
        $output
    } else {
        let lines = ($output | detect columns --guess) | rename name id version match source
        if ($lines | length) == 1 {
            print -e $"(ansi light_red)($output)(ansi reset)"
            null
        } else {
            $lines
        }
    }
}
export alias "winget find" = winget search

# Display installed packages in a structured way.
export def "winget list" [
    pos_query?: string,
    --query(-q): string, # The query used to search for a package
    --id: string, # Filter results by id
    --name: string, # Filter results by name
    --moniker: string, # Filter results by moniker
    --tag: string, # Filter results by tag
    --command: string, # Filter results by command
    --source(-s): string@"nu-complete winget install source", # Find package using the specified source
    --count(-n): int, # Show no more than specified number of results
    --exact(-e), # Find package using exact match
    --header: string, # Optional Windows-Package-Manager REST source HTTP header
    --accept_source_agreements, # Accept all source agreements during source operations
    --raw, # Output the raw CLI output instead of structured data
    --help(-?) # Display the help for this command
] {
    let flagify = { |name, value| nu-complete winget flagify $name $value }

    let params = (
        [
            "list"
        ]
        | append (
        [
            $"($pos_query)"
            (do $flagify query $query)
            (do $flagify id $id)
            (do $flagify name $name)
            (do $flagify moniker $moniker)
            (do $flagify tag $tag)
            (do $flagify command $command)
            # (do $flagify source $source) # see comment below
            (do $flagify count $count)
            (do $flagify exact $exact)
            (do $flagify header $header)
            (do $flagify accept_source_agreements $accept_source_agreements)
            (do $flagify help $help)
        ] 
        | flatten
        | where { not ($in | is-empty) })
    )

    let output = ^winget ...$params
    | nu-complete winget trimLoadingSymbol
    if $help or $raw {
        $output
    } else {
        let lines = ($output | detect columns --guess) | rename name id version available source
        if ($lines | length) == 1 {
            print -e $"(ansi light_red)($output)(ansi reset)"
            null        
        } else {
            $lines
            # Because of a bug: https://github.com/microsoft/winget-cli/issues/4236
            # we need to filter it with the "where" command
            | if ($source | is-not-empty) { $in | where source == $source } else { $in }
        }
    }
}
export alias "winget ls" = winget list

def "winget upgrades" [] {
    let output = ^winget upgrade | nu-complete winget trimLoadingSymbol
    
    # Do nothing when no upgrades available
    if ( ($output | str starts-with 'No') or ($output | str starts-with '0') ) { return }
    
    let lines = $output | lines
    let head = $lines | first
    let rest = $lines | skip 2
    
    let colnames = [ Name Id Version Available Source ]
    # We must be unicode aware in determining and using index; winget uses `…` elippses to hide overflow
    let cols = $colnames | each {|col| $head | {name: $col i: ($head | str index-of $col --grapheme-clusters) } }
    
    let dirty = $rest | each {|line|
        let chars = $line | split chars
        {
            name:      ( $chars | slice ($cols.0.i)..($cols.1.i - 1) | str join | str trim )
            id:        ( $chars | slice ($cols.1.i)..($cols.2.i - 1) | str join | str trim )
            version:   ( $chars | slice ($cols.2.i)..($cols.3.i - 1) | str join | str trim )
            available: ( $chars | slice ($cols.3.i)..($cols.4.i - 1) | str join | str trim )
            source:    ( $chars | slice ($cols.4.i).. | str join | str trim )
        }
    }
    # Reject footer lines, in a best effort approach, because there is no clear separator or definitely identifiable form change.
    # We expect `x upgrades available.` to follow the table. Then maybe `x package(s) have version numbers that cannot be determined. Use --include-unknown to see all results.`
    return ($dirty | take until {|x| $x.source == '' })
}

# Upgrades the given package
export extern "winget upgrade" [
    query?: string,
    --query(-q): string, # The query used to search for a package
    --manifest(-m): path, # The path to the manifest of the package
    --id: string, # Filter results by id
    --name: string, # Filter results by name
    --moniker: string, # Filter results by moniker
    --version(-v): string, # Use the specified version; default is the latest version
    --source(-s): string@"nu-complete winget install source", # Find package using the specified source
    --exact(-e), # Find package using exact match
    --interactive(-i), # Request interactive installation; user input may be needed
    --silent(-h), # Request silent installation
    --log(-o): path, # Log location (if supported)
    --override: string, # Override arguments to be passed on to the installer
    --location(-l): path, # Location to install to (if supported)
    --force, # Override the installer hash check
    --accept_package_agreements, # Accept all licence agreements for packages
    --header: string, # Optional Windows-Package-Manager REST source HTTP header
    --accept_source_agreements, # Accept all source agreements during source operations
    --all, # Update all installed packages to latest if available
    --help(-?) # Display the help for this command
]
export alias "winget update" = winget upgrade

# Uninstalls the given package
export extern "winget uninstall" [
    query?: string@"nu-complete winget uninstall package name",
    --query(-q): string@"nu-complete winget uninstall package name", # The query used to search for a package
    --manifest(-m): path, # The path to the manifest of the package
    --id: string@"nu-complete winget uninstall package id", # Filter results by id
    --name: string@"nu-complete winget uninstall package name", # Filter results by name
    --moniker: string, # Filter results by moniker
    --version(-v): string, # Use the specified version; default is the latest version
    --source(-s): string@"nu-complete winget install source", # Find package using the specified source
    --exact(-e), # Find package using exact match
    --interactive(-i), # Request interactive installation; user input may be needed
    --silent(-h), # Request silent installation
    --log(-o): path, # Log location (if supported)
    --help(-?) # Display the help for this command
]
export alias "winget remove" = winget uninstall
export alias "winget rm" = winget uninstall

# Helper to hash installer files
export extern "winget hash" [
    file?: path, # File to be hashed
    --file(-f): path, # File to be hashed
    --msix(-m), # Input file will be treated as msix; signature hash will be provided if signed
    --help(-?) # Display the help for this command
]

# Validates a manifest file
export extern "winget validate" [
    manifest?: path, # The path to the manifest to be validated
    --manifest: path,  # The path to the manifest to be validated
    --help(-?) # Display the help for this command
]

# Open settings or set administrator settings
export extern "winget settings" [
    --enable: string, # Enables the specific administrator setting
    --disable: string, # Disables the specific administrator setting
    --help(-?) # Display the help for this command
]

# Shows the status of experimental features
export extern "winget features" [
    --help(-?) # Display the help for this command
]

# Exports a list of the installed packages
export extern "winget export" [
    output?: path, # File where the result is to be written
    --output(-o): path, # File where the result is to be written
    --source(-s): string@"nu-complete winget install source", # Export packages from the specified source
    --include-versions, # Include package versions in produced file
    --accept_source_agreements, # Accept all source agreements during source operations
    --help(-?) # Display the help for this command
]

export extern "winget import" [
    import_file?: path, # File describing the packages to install
    --import-file(-i): path, # File describing the packages to install
    --ignore-unavailable, # Ignore unavailable packages
    --ignore-versions, # Ignore package versions
    --accept_package_agreements, # Accept all licence agreements for packages
    --accept_source_agreements # Accept all source agreements during source operations
]
