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

def "nu-complete winget parse table" [lines: any] {
    let header = (
        $lines 
        | first
        | parse -r '(?P<name>Name\s+)(?P<id>Id\s+)(?P<version>Version\s+)?(?P<match>Match\s+)?(?P<available>Available\s+)?(?P<source>Source\s*)?'
        | first
    )
    let lengths = {
        name: ($header.name | str length),
        id: ($header.id | str length),
        version: ($header.version | str length),
        match: ($header.match | str length),
        available: ($header.available | str length),
        source: ($header.source | str length)
    }
    $lines | skip 2 | each { |it|
        let it = ($it | split chars)

        let version = if $lengths.version > 0 {
            (
                $it | skip ($lengths.name + $lengths.id)
                | first $lengths.version | str join | str trim
            )
        } else { "" }

        let match = if $lengths.match > 0 {
            (
                $it | skip ($lengths.name + $lengths.id + $lengths.version)
                | first $lengths.match | str join | str trim
            )
        } else { "" }

        let available = if $lengths.available > 0 {
            (
                $it | skip ($lengths.name + $lengths.id + $lengths.version + $lengths.match)
                | first $lengths.available | str join | str trim
            )
        } else { "" }

        let source = if $lengths.source > 0 {
            (
                $it | skip ($lengths.name + $lengths.id + $lengths.version + $lengths.match + $lengths.available)
                | str join | str trim
            )
        } else { "" }

        {
            name: ($it | first $lengths.name | str join | str trim),
            id: ($it | skip $lengths.name | first $lengths.id | str join | str trim),
            version: $version,
            match: $match,
            available: $available,
            source: $source
        }
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

export def "winget show" [
    pos_query?: string,
    --query(-q): string, # The query used to search for a package
    --id: string, # Filter results by id
    --name: string, # Filter results by name
    --moniker: string, # Filter results by moniker
    --version(-v): string, # Use the specified version; default is the latest version
    --source(-s): string@"nu-complete winget install source", # Find package using the specified source
    --scope: string@"nu-complete winget install scope", # Select install scope (user or machine). Doesn't work rn, use ^winget
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
    --raw, # Output the raw CLI output instead of structured data
    --help(-?), # Display the help for this command
] {
    let flagify = { |name, value| nu-complete winget flagify $name $value }

    def sanitize-line []: string -> string {
        let it = $in
        let parsed = ($it | parse '{name}:{value}')
        if ($parsed | is-empty) { return $"($it)" }
        let parsed = ($parsed | first)
        try {
            $"($parsed.name):(if ($parsed.value | str trim | is-empty) { '' } else { $"(char space)(char dq)($parsed.value | str trim)(char dq)" })"
        } catch { 
            $"($it)"
        }
    }

    let params = ([
        "show"
    ] | append ([
        $pos_query
        (do $flagify query $query)
        (do $flagify id $id)
        (do $flagify name $name)
        (do $flagify moniker $moniker)
        (do $flagify version $version)
        (do $flagify source $source)
        #(do $flagify scope $scope)
        (do $flagify exact $exact)
        (do $flagify interactive $interactive)
        (do $flagify silent $silent)
        (do $flagify locale $locale)
        (do $flagify log $log)
        (do $flagify override $override)
        (do $flagify location $location)
        (do $flagify force $force)
        (do $flagify accept_package_agreements $accept_package_agreements)
        (do $flagify header $header)
        (do $flagify accept_source_agreements $accept_source_agreements)
        (do $flagify help $help)
    ] | flatten) | filter { not ($in | is-empty)})

    let output = ^winget ...$params
    if $raw or $help or ($output | str contains "No package selection argument was provided") {
       $output
    } else {
        let lines = ($output | lines)

        if ($lines | first) =~ "Multiple packages found matching input criteria." {
            $"(ansi yellow)($lines | first | str trim)(ansi reset)"
            nu-complete winget parse table ($lines | skip 1) | select name id source
        } else if ($lines | first) =~ "No package found matching input criteria." {
            $"(ansi yellow)($lines | first | str trim)(ansi reset)"
        } else {
            let header = ($lines | first | parse -r 'Found (?P<Name>.+) \[(?P<Id>.+)\]')
            let manifest = ($lines | skip | each { sanitize-line } | str join (char newline) | from yaml)
            $header | first | merge $manifest
        }
    }
}
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
export alias "winget source refresh" = winet source update

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

    let output = (^winget ...$params)
    if $raw or $help {
        $output
    } else {
        let lines = ($output | lines)
        if ($lines | length) == 1 {
            $"(ansi light_red)($lines | first)(ansi reset)"
        } else {
            nu-complete winget parse table $lines | select name id version source
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
        | filter { not ($in | is-empty) })
    )

    let output = ^winget ...$params
    if $help or $raw {
        $output
    } else {
        let lines = ($output | lines)
        if ($lines | length) == 1 {
            $"(ansi light_red)($lines | first)(ansi reset)"
        } else {
            let truncated = $lines | last | $in == "<additional entries truncated due to result limit>"
            nu-complete winget parse table (if $truncated { $lines | drop } else { $lines }) 
                | reject match
                # Because of a bug: https://github.com/microsoft/winget-cli/issues/4236
                # we need to filter it with the "where" command
                | if ($source | is-not-empty) { $in | where source == $source } else { $in }
        }
    }
}
export alias "winget ls" = winget list

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
