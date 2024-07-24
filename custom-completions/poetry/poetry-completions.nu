# Python versions
#
# Used by the add command to specify for which Python version the dependency must be installed
def "nu-complete poetry python-versions" [] nothing -> list<string> {
    ["3.8" "3.9" "3.10" "3.11" "3.12" "3.13"]
}

# Default package source names
#
# The default package source names available to install packages from
def "nu-complete poetry default-package-source-names" [] nothing -> list<string> {
    [pypi test test.pypi.org internal-pypi]
}

# Default package source urls
#
# The default package source urls available to install packages from
def "nu-complete poetry default-package-source-urls" [] nothing -> list<string> {
    ["https://" "https://test.pypi.org/legacy/" "https://pypi.org/legacy"]
}

# Default package sources
#
# The default sources to use to install the package, beyond the ones defined within pyproject.toml available for the add command
def "nu-complete poetry default-package-sources" [] nothing -> list<string> {
    (nu-complete poetry default-package-source-names) | append (
        nu-complete poetry default-package-source-urls
    )
}

# Build formats
#
# Used by the build command to limit the built package to either sdist or wheel
def "nu-complete poetry build-formats" [] nothing -> list<string> {
    [sdist wheel]
}

# Default usernames
#
# The current username which is the default suggestion for logging in to services with a username
def "nu-complete poetry default-usernames" [] nothing -> list<string> {
    [(whoami)]
}

# Setting keys
#
# The available setting keys that can be retrieved/changed by the config command
def "nu-complete poetry setting-keys" [] nothing -> list<string> {
    [
        cache-dir
        experimental.system-git-client
        installer.max-workers
        installer.modern-installation
        installer.no-binary
        installer.parallel
        keyring.enabled
        solver.lazy-wheel
        virtualenvs.create
        virtualenvs.in-project
        virtualenvs.options.always-copy
        virtualenvs.optpoeions.no-pip
        virtualenvs.options.no-setuptools
        virtualenvs.options.system-site-packages
        virtualenvs.path
        virtualenvs.prefer-active-python
        virtualenvs.prompt
        repositories.
        repositories.pypi.url
        repositories.testpypi.url
        http-basic.
        http-basic.pypi.username
        http-basic.pypi.password
        http-basic.testpypi.username
        http-basic.testpypi.password
        pypi-token.
        pypi-token.pypi
        pypi-token.testpypi
        certificates.
        certificates.pypi.cert
        certificates.testpypi.cert
        certificates.pypi.client-cert
        certificates.testpypi.client-cert
        warnings.export
    ]
}

# Setting keys
#
# The possible values for the given setting key, that the config command can chenge the respective setting key to
def "nu-complete poetry setting-values" [context: string] nothing -> list<any> {
    let $final_context: string = ($context | str trim | split row " " | last)

    if (
        $final_context in [
            "experimental.system-git-client"
            "installer.modern-installation"
            "installer.parallel"
            "solver.lazy-wheel"
            "virtualenvs.create"
            "virtualenvs.in-project"
            "virtualenvs.options.always-copy"
            "virtualenvs.options.no-pip"
            "virtualenvs.options.no-setuptools"
            "virtualenvs.options.system-site-packages"
            "virtualenvs.prefer-active-python"
            "keyring.enabled"
        ]
    ) {return ["\"true\"", "\"false\""]}

    if ($final_context in ["installer.no-binary", "installer.only-binary"]) {
        return ["\"true\"", "\"false\"", ":all:", ":none:"]
    }

    if ($final_context == "cache-dir") {
        return (
            ls | get name | where (($it | path type) == "dir") | each {|it| $it | path expand}
        ) | append (
            if ($nu.os-info.name == "macos") {
                $env.HOME | path join "Library/Caches/pypoetry"
            } else if ($nu.os-info.name == "windows") {
                $env.HOME | path join "AppData/Local/pypoetry/Cache"
            } else if ("XDG_CACHE_HOME" in $env) {
                $env.XDG_CACHE_HOME | path join "pypoetry"
            } else {
                $env.HOME | path join ".cache/pypoetry"
            }
        )
    }

    if ($final_context == "virtualenvs.path") {
        return (
            ls | get name | where (($it | path type) == "dir") | each {|it| $it | path expand}
        ) | append (
            (^poetry config cache-dir) | into string | str trim | path join "virtualenvs"
        )

    }

    let $split_context: list<string> = ($final_context | split row ".")

    if (
        ($split_context | length) == 3
        and ($split_context | get 0) == "repositories"
        and ($split_context | get 2) == "url"
    ) {return (nu-complete poetry default-package-sources)}

    if (
        ($split_context | length) == 3
        and ($split_context | get 0) == "http-basic"
        and ($split_context | get 2) == "username"
    ) {return (nu-complete poetry default-usernames)}

    if (
        (
            ($split_context | length) == 3
            and ($split_context | get 0) == "http-basic"
            and ($split_context | get 2) == "password"
        ) or (($split_context | length) == 2 and ($split_context | get 0) == "pypi-token")
    ) {return []}

    if (
        ($split_context | length) == 3
        and ($split_context | get 0) == "certificates"
        and ($split_context | get 2) in ["cert" "client-cert"]
    ) {return (ls | get name | | each {|it| $it | path expand} | prepend "\"false\"" )}

    return {
        "installer.max-workers": [5 6 8 10 12 14 16 20 24 32 32 36 52 56 84 100 104]
        "virtualenvs.prompt": ["\"{project_name}-py{python_version}\""]
    } | get -i $final_context
}

# Export formats
#
# The list of possible formats supported by the export command
def "nu-complete poetry export-formats" [] nothing -> list<string> {
    ["requirements.txt" "constraints.txt"]
}

# Default dependency groups
#
# A default selection of dependency groups
def "nu-complete poetry default-dependency-groups" [] nothing -> list<string> {
    [main dev deploy test testing tests development developing deployment deploying]
}

# Commands
#
# The list of command names available to have a help message displayed using the help command
def "nu-complete poetry commands" [] nothing -> list<string> {
    [
        about
        add
        build
        check
        config
        export
        help
        init
        install
        list
        lock
        new
        publish
        remove
        run
        search
        shell
        show
        update
        version
        "cache clear"
        "cache list"
        "debug info"
        "debug resolve"
        "env info"
        "env list"
        "env remove"
        "env use"
        "self add"
        "self install"
        "self lock"
        "self remove"
        "self show"
        "self show plugins"
        "self update"
        "source add"
        "source remove"
        "source show"
    ]
}

# Licenses
#
# The available license IDs for project.toml
def "nu-complete poetry licenses" [] nothing -> list<string> {
    http get https://spdx.org/licenses/licenses.json | get licenses | get licenseId
}

# ReadMe file formats
#
# A default selection of file extensions used for ReadMe files
def "nu-complete poetry readme-file-formats" [] nothing -> list<string> {
    [md txt adoc rst rft pdf html dbk odf tex latex texi asciidoc markdown xhtml xht htm xml]
}

# Namespaces
#
# The list of namespaces available to list poetry commands about
def "nu-complete poetry namespaces" [] nothing -> list<string> {
    [cache debug env self source]
}

# Default repositories
#
# The default set of repositories available to publish this projects package to
def "nu-complete poetry default-repositories" [] nothing -> list<string> {
    nu-complete poetry default-package-sources
}

# Default dist directories
#
# The default set of directories where build artifacts may be stored
def "nu-complete poetry default-dist-directories" [] nothing -> list<string> {
    (
        ls | get name | where (($it | path type) == "dir") | each {|it| $it | path expand}
    ) | prepend ($env.PWD | path join "dist")
}

# Caches
#
# The list of available poetry caches, used to remove one that is listed
def "nu-complete poetry caches" [] nothing -> list<string> {
    poetry cache list | lines
}

# Virtual environments
#
# The list of available virtual environements, used to remove one that is listed
def "nu-complete poetry virtual-environments" [] nothing -> list<string> {
    poetry env list --full-path | lines | each {|| (split row " ").0}
}

# Source priorities
#
# Used by the source commands to set/display the priority of the source
def "nu-complete poetry source-priorities" [] nothing -> list<string> {
    [default primary secondary supplemental explicit]
}

# Python packaging and dependency management made easy.
export extern poetry [
    --help(-h)               # Display help for the given command. When no command is given display help for the list command.
    --quiet(-q)              # Do not output any message.
    --version(-V)            # Display this application version.
    --ansi                   # Force ANSI output.
    --no-ansi                # Disable ANSI output.
    --no-interaction(-n)     # Do not ask any interactive question.
    --no-plugins             # Disables plugins.
    --no-cache               # Disables Poetry source caches.
    --directory(-C): path    # The working directory for the Poetry command (defaults to the current working directory).
    --verbose(-v)            # Increase the verbosity of messages: 1 for normal output, 2 for more verbose output and 3 for debug.
]

# Shows information about Poetry.
export extern "poetry about" [
    --help(-h)               # Display help for the given command. When no command is given display help for the list command.
    --quiet(-q)              # Do not output any message.
    --version(-V)            # Display this application version.
    --ansi                   # Force ANSI output.
    --no-ansi                # Disable ANSI output.
    --no-interaction(-n)     # Do not ask any interactive question.
    --no-plugins             # Disables plugins.
    --no-cache               # Disables Poetry source caches.
    --directory(-C): path    # The working directory for the Poetry command (defaults to the current working directory).
    --verbose(-v)            # Increase the verbosity of messages: 1 for normal output, 2 for more verbose output and 3 for debug.
]

# Adds a new dependency to pyproject.toml.
export extern "poetry add" [
    ...name: string                                                     # The packages to add.
    --group(-G): string@"nu-complete poetry default-dependency-groups"  # The group to add the dependency to. [default: "main"]
    --editable(-e)                                                      # Add vcs/path dependencies as editable.
    --extras(-E): string                                                # Extras to activate for the dependency. (multiple values allowed)
    --optional                                                          # Add as an optional dependency.
    --python: string@"nu-complete poetry python-versions"               # Python version for which the dependency must be installed.
    --platform: string                                                  # Platforms for which the dependency must be installed.
    --source: string@"nu-complete poetry default-package-sources"       # Name of the source to use to install the package.
    --allow-prereleases                                                 # Accept prereleases.
    --dry-run                                                           # Output the operations but do not execute anything (implicitly enables --verbose).
    --lock                                                              # Do not perform operations (only update the lockfile).
    --help(-h)                                                          # Display help for the given command. When no command is given display help for the list command.
    --quiet(-q)                                                         # Do not output any message.
    --version(-V)                                                       # Display this application version.
    --ansi                                                              # Force ANSI output.
    --no-ansi                                                           # Disable ANSI output.
    --no-interaction(-n)                                                # Do not ask any interactive question.
    --no-plugins                                                        # Disables plugins.
    --no-cache                                                          # Disables Poetry source caches.
    --directory(-C): path                                               # The working directory for the Poetry command (defaults to the current working directory).
    --verbose(-v)                                                       # Increase the verbosity of messages: 1 for normal output, 2 for more verbose output and 3 for debug.
]

# Builds a package, as a tarball and a wheel by default.
export extern "poetry build" [
    --format(-f): string@"nu-complete poetry build-formats"  # Limit the format to either sdist or wheel.
    --output(-o): path                                       # Set output directory for build artifacts. Default is `dist`. [default: "dist"]
    --help(-h)                                               # Display help for the given command. When no command is given display help for the list command.
    --quiet(-q)                                              # Do not output any message.
    --version(-V)                                            # Display this application version.
    --ansi                                                   # Force ANSI output.
    --no-ansi                                                # Disable ANSI output.
    --no-interaction(-n)                                     # Do not ask any interactive question.
    --no-plugins                                             # Disables plugins.
    --no-cache                                               # Disables Poetry source caches.
    --directory(-C): path                                    # The working directory for the Poetry command (defaults to the current working directory).
    --verbose(-v)                                            # Increase the verbosity of messages: 1 for normal output, 2 for more verbose output and 3 for debug.
]

# Checks the validity of the pyproject.toml file.
export extern "poetry check" [
    --lock                 # Checks that poetry.lock exists for the current version of pyproject.toml.
    --help(-h)             # Display help for the given command. When no command is given display help for the list command.
    --quiet(-q)            # Do not output any message.
    --version(-V)          # Display this application version.
    --ansi                 # Force ANSI output.
    --no-ansi              # Disable ANSI output.
    --no-interaction(-n)   # Do not ask any interactive question.
    --no-plugins           # Disables plugins.
    --no-cache             # Disables Poetry source caches.
    --directory(-C): path  # The working directory for the Poetry command (defaults to the current working directory).
    --verbose(-v)          # Increase the verbosity of messages: 1 for normal output, 2 for more verbose output and 3 for debug.
]

# Manages configuration settings.
export extern "poetry config" [
    key?: string@"nu-complete poetry setting-keys"     # Setting key.
    ...value: any@"nu-complete poetry setting-values"  # Setting value.
    --list                                             # List configuration settings.
    --unset                                            # Unset configuration setting.
    --local                                            # Set/Get from the project's local configuration.
    --help(-h)                                         # Display help for the given command. When no command is given display help for the list command.
    --quiet(-q)                                        # Do not output any message.
    --version(-V)                                      # Display this application version.
    --ansi                                             # Force ANSI output.
    --no-ansi                                          # Disable ANSI output.
    --no-interaction(-n)                               # Do not ask any interactive question.
    --no-plugins                                       # Disables plugins.
    --no-cache                                         # Disables Poetry source caches.
    --directory(-C): path                              # The working directory for the Poetry command (defaults to the current working directory).
    --verbose(-v)                                      # Increase the verbosity of messages: 1 for normal output, 2 for more verbose output and 3 for debug.
]

# Exports the lock file to alternative formats.
export extern "poetry export" [
    --format(-f): string@"nu-complete poetry export-formats"          # Format to export to. Currently, only constraints.txt and requirements.txt are supported. [default: "requirements.txt"]
    --output(-o): path                                                # The name of the output file.
    --without-hashes                                                  # Exclude hashes from the exported file.
    --without-urls                                                    # Exclude source repository urls from the exported file.
    --without: string@"nu-complete poetry default-dependency-groups"  # The dependency groups to ignore. (multiple values allowed)
    --with: string@"nu-complete poetry default-dependency-groups"     # The optional dependency groups to include. (multiple values allowed)
    --only: string@"nu-complete poetry default-dependency-groups"     # The only dependency groups to include. (multiple values allowed)
    --extras(-E): string                                              # Extra sets of dependencies to include. (multiple values allowed)
    --all-extras                                                      # Include all sets of extra dependencies.
    --with-credentials                                                # Include credentials for extra indices.
    --help(-h)                                                        # Display help for the given command. When no command is given display help for the list command.
    --quiet(-q)                                                       # Do not output any message.
    --version(-V)                                                     # Display this application version.
    --ansi                                                            # Force ANSI output.
    --no-ansi                                                         # Disable ANSI output.
    --no-interaction(-n)                                              # Do not ask any interactive question.
    --no-plugins                                                      # Disables plugins.
    --no-cache                                                        # Disables Poetry source caches.
    --directory(-C): path                                             # The working directory for the Poetry command (defaults to the current working directory).
    --verbose(-v)                                                     # Increase the verbosity of messages: 1 for normal output, 2 for more verbose output and 3 for debug.
]

# Displays help for a command.
export extern "poetry help" [
    command_name?: string@"nu-complete poetry commands"  # The command name. [default: "help"]
    --help(-h)                                           # Display help for the given command. When no command is given display help for the list command.
    --quiet(-q)                                          # Do not output any message.
    --version(-V)                                        # Display this application version.
    --ansi                                               # Force ANSI output.
    --no-ansi                                            # Disable ANSI output.
    --no-interaction(-n)                                 # Do not ask any interactive question.
    --no-plugins                                         # Disables plugins.
    --no-cache                                           # Disables Poetry source caches.
    --directory(-C): path                                # The working directory for the Poetry command (defaults to the current working directory).
    --verbose(-v)                                        # Increase the verbosity of messages: 1 for normal output, 2 for more verbose output and 3 for debug.
]

# Creates a basic pyproject.toml file in the current directory.
export extern "poetry init" [
    --name: string                                         # Name of the package.
    --description: string                                  # Description of the package.
    --author: string                                       # Author name of the package.
    --python: string@"nu-complete poetry python-versions"  # Compatible Python versions.
    --dependency: string                                   # Package to require, with an optional version constraint, e.g. requests:^2.10.0 or requests=2.11.1. (multiple values allowed)
    --license(-s): string@"nu-complete poetry licenses"    # License of the package.
    --help(-h)                                             # Display help for the given command. When no command is given display help for the list command.
    --quiet(-q)                                            # Do not output any message.
    --version(-V)                                          # Display this application version.
    --ansi                                                 # Force ANSI output.
    --no-ansi                                              # Disable ANSI output.
    --no-interaction(-n)                                   # Do not ask any interactive question.
    --no-plugins                                           # Disables plugins.
    --no-cache                                             # Disables Poetry source caches.
    --directory(-C): path                                  # The working directory for the Poetry command (defaults to the current working directory).
    --verbose(-v)                                          # Increase the verbosity of messages: 1 for normal output, 2 for more verbose output and 3 for debug.
]

# Installs the project dependencies.
export extern "poetry install" [
    --without: string@"nu-complete poetry default-dependency-groups"  # The dependency groups to ignore. (multiple values allowed)
    --with: string@"nu-complete poetry default-dependency-groups"     # The optional dependency groups to include. (multiple values allowed)
    --only: string@"nu-complete poetry default-dependency-groups"     # The only dependency groups to include. (multiple values allowed)
    --sync                                                            # Synchronize the environment with the locked packages and the specified groups.
    --no-root                                                         # Do not install the root package (the current project).
    --no-directory                                                    # Do not install any directory path dependencies; useful to install dependencies without source code, e.g. for caching of Docker layers).
    --dry-run                                                         # Output the operations but do not execute anything (implicitly enables --verbose).
    --extras(-E): string                                              # Extra sets of dependencies to include. (multiple values allowed)
    --all-extras                                                      # Install all extra dependencies.
    --only-root                                                       # Exclude all dependencies.
    --compile                                                         # Compile Python source files to bytecode. (This option has no effect if modern-installation is disabled because the old installer always compiles.)
    --help(-h)                                                        # Display help for the given command. When no command is given display help for the list command.
    --quiet(-q)                                                       # Do not output any message.
    --version(-V)                                                     # Display this application version.
    --ansi                                                            # Force ANSI output.
    --no-ansi                                                         # Disable ANSI output.
    --no-interaction(-n)                                              # Do not ask any interactive question.
    --no-plugins                                                      # Disables plugins.
    --no-cache                                                        # Disables Poetry source caches.
    --directory(-C): path                                             # The working directory for the Poetry command (defaults to the current working directory).
    --verbose(-v)                                                     # Increase the verbosity of messages: 1 for normal output, 2 for more verbose output and 3 for debug.
]

# Lists commands.
export extern "poetry list" [
    namespace?: string@"nu-complete poetry namespaces"  # The namespace name.
    --help(-h)                                          # Display help for the given command. When no command is given display help for the list command.
    --quiet(-q)                                         # Do not output any message.
    --version(-V)                                       # Display this application version.
    --ansi                                              # Force ANSI output.
    --no-ansi                                           # Disable ANSI output.
    --no-interaction(-n)                                # Do not ask any interactive question.
    --no-plugins                                        # Disables plugins.
    --no-cache                                          # Disables Poetry source caches.
    --directory(-C): path                               # The working directory for the Poetry command (defaults to the current working directory).
    --verbose(-v)                                       # Increase the verbosity of messages: 1 for normal output, 2 for more verbose output and 3 for debug.
]

# Locks the project dependencies.
export extern "poetry lock" [
    --no-update            # Do not update locked versions, only refresh lock file.
    --help(-h)             # Display help for the given command. When no command is given display help for the list command.
    --quiet(-q)            # Do not output any message.
    --version(-V)          # Display this application version.
    --ansi                 # Force ANSI output.
    --no-ansi              # Disable ANSI output.
    --no-interaction(-n)   # Do not ask any interactive question.
    --no-plugins           # Disables plugins.
    --no-cache             # Disables Poetry source caches.
    --directory(-C): path  # The working directory for the Poetry command (defaults to the current working directory).
    --verbose(-v)          # Increase the verbosity of messages: 1 for normal output, 2 for more verbose output and 3 for debug.
]

# Creates a new Python project at <path>.
export extern "poetry new" [
    path: path                                                 # The path to create the project at.
    --name: string                                             # Set the resulting package name.
    --src                                                      # Use the src layout for the project.
    --readme: string@"nu-complete poetry readme-file-formats"  # Specify the readme file format. Default is md.
    --help(-h)                                                 # Display help for the given command. When no command is given display help for the list command.
    --quiet(-q)                                                # Do not output any message.
    --version(-V)                                              # Display this application version.
    --ansi                                                     # Force ANSI output.
    --no-ansi                                                  # Disable ANSI output.
    --no-interaction(-n)                                       # Do not ask any interactive question.
    --no-plugins                                               # Disables plugins.
    --no-cache                                                 # Disables Poetry source caches.
    --directory(-C): path                                      # The working directory for the Poetry command (defaults to the current working directory).
    --verbose(-v)                                              # Increase the verbosity of messages: 1 for normal output, 2 for more verbose output and 3 for debug.
]

# Publishes a package to a remote repository.
export extern "poetry publish" [
    --repository(-r): string@"nu-complete poetry default-repositories"  # The repository to publish the package to.
    --username(-u): string@"nu-complete poetry default-usernames"       # The username to access the repository.
    --password(-p): string                                              # The password to access the repository.
    --cert: string                                                      # Certificate authority to access the repository.
    --client-cert: string                                               # Client certificate to access the repository.
    --dist-dir: path@"nu-complete poetry default-dist-directories"      # Dist directory where built artifact are stored. Default is `dist`. [default: "dist"]
    --build                                                             # Build the package before publishing.
    --dry-run                                                           # Perform all actions except upload the package.
    --skip-existing                                                     # Ignore errors from files already existing in the repository.
    --help(-h)                                                          # Display help for the given command. When no command is given display help for the list command.
    --quiet(-q)                                                         # Do not output any message.
    --version(-V)                                                       # Display this application version.
    --ansi                                                              # Force ANSI output.
    --no-ansi                                                           # Disable ANSI output.
    --no-interaction(-n)                                                # Do not ask any interactive question.
    --no-plugins                                                        # Disables plugins.
    --no-cache                                                          # Disables Poetry source caches.
    --directory(-C): path                                               # The working directory for the Poetry command (defaults to the current working directory).
    --verbose(-v)                                                       # Increase the verbosity of messages: 1 for normal output, 2 for more verbose output and 3 for debug.
]

# Removes a package from the project dependencies.
export extern "poetry remove" [
    ...packages: string    # The packages to remove.
    --group(-G): string    # The group to add the dependency to. [default: "main"]
    --dry-run              # Output the operations but do not execute anything (implicitly enables --verbose).
    --lock                 # Do not perform operations (only update the lockfile).
    --help(-h)             # Display help for the given command. When no command is given display help for the list command.
    --quiet(-q)            # Do not output any message.
    --version(-V)          # Display this application version.
    --ansi                 # Force ANSI output.
    --no-ansi              # Disable ANSI output.
    --no-interaction(-n)   # Do not ask any interactive question.
    --no-plugins           # Disables plugins.
    --no-cache             # Disables Poetry source caches.
    --directory(-C): path  # The working directory for the Poetry command (defaults to the current working directory).
    --verbose(-v)          # Increase the verbosity of messages: 1 for normal output, 2 for more verbose output and 3 for debug.
]

# Runs a command in the appropriate environment.
export extern "poetry run" [
    ...args: string        # The command and arguments/options to run.
    --help(-h)             # Display help for the given command. When no command is given display help for the list command.
    --quiet(-q)            # Do not output any message.
    --version(-V)          # Display this application version.
    --ansi                 # Force ANSI output.
    --no-ansi              # Disable ANSI output.
    --no-interaction(-n)   # Do not ask any interactive question.
    --no-plugins           # Disables plugins.
    --no-cache             # Disables Poetry source caches.
    --directory(-C): path  # The working directory for the Poetry command (defaults to the current working directory).
    --verbose(-v)          # Increase the verbosity of messages: 1 for normal output, 2 for more verbose output and 3 for debug.
]

# Searches for packages on remote repositories.
export extern "poetry search" [
    ...tokens: string      # The tokens to search for.
    --help(-h)             # Display help for the given command. When no command is given display help for the list command.
    --quiet(-q)            # Do not output any message.
    --version(-V)          # Display this application version.
    --ansi                 # Force ANSI output.
    --no-ansi              # Disable ANSI output.
    --no-interaction(-n)   # Do not ask any interactive question.
    --no-plugins           # Disables plugins.
    --no-cache             # Disables Poetry source caches.
    --directory(-C): path  # The working directory for the Poetry command (defaults to the current working directory).
    --verbose(-v)          # Increase the verbosity of messages: 1 for normal output, 2 for more verbose output and 3 for debug.
]

# Spawns a shell within the virtual environment.
export extern "poetry shell" [
    --help(-h)             # Display help for the given command. When no command is given display help for the list command.
    --quiet(-q)            # Do not output any message.
    --version(-V)          # Display this application version.
    --ansi                 # Force ANSI output.
    --no-ansi              # Disable ANSI output.
    --no-interaction(-n)   # Do not ask any interactive question.
    --no-plugins           # Disables plugins.
    --no-cache             # Disables Poetry source caches.
    --directory(-C): path  # The working directory for the Poetry command (defaults to the current working directory).
    --verbose(-v)          # Increase the verbosity of messages: 1 for normal output, 2 for more verbose output and 3 for debug.
]

# Shows information about packages.
export extern "poetry show" [
    package?: string                                                  # The package to inspect.
    --without: string@"nu-complete poetry default-dependency-groups"  # The dependency groups to ignore. (multiple values allowed)
    --with: string@"nu-complete poetry default-dependency-groups"     # The optional dependency groups to include. (multiple values allowed)
    --only: string@"nu-complete poetry default-dependency-groups"     # The only dependency groups to include. (multiple values allowed)
    --tree(-t)                                                        # List the dependencies as a tree.
    --why                                                             # When showing the full list, or a --tree for a single package, display whether they are a direct dependency or required by other packages.
    --latest(-l)                                                      # Show the latest version.
    --outdated(-o)                                                    # Show the latest version but only for packages that are outdated.
    --all(-a)                                                         # Show all packages (even those not compatible with current system).
    --top-level(-T)                                                   # Show only top-level dependencies.
    --help(-h)                                                        # Display help for the given command. When no command is given display help for the list command.
    --quiet(-q)                                                       # Do not output any message.
    --version(-V)                                                     # Display this application version.
    --ansi                                                            # Force ANSI output.
    --no-ansi                                                         # Disable ANSI output.
    --no-interaction(-n)                                              # Do not ask any interactive question.
    --no-plugins                                                      # Disables plugins.
    --no-cache                                                        # Disables Poetry source caches.
    --directory(-C): path                                             # The working directory for the Poetry command (defaults to the current working directory).
    --verbose(-v)                                                     # Increase the verbosity of messages: 1 for normal output, 2 for more verbose output and 3 for debug.
]

# Update the dependencies as according to the pyproject.toml file.
export extern "poetry update" [
    ...packages: string                                               # The packages to update.
    --without: string@"nu-complete poetry default-dependency-groups"  # The dependency groups to ignore. (multiple values allowed)
    --with: string@"nu-complete poetry default-dependency-groups"     # The optional dependency groups to include. (multiple values allowed)
    --only: string@"nu-complete poetry default-dependency-groups"     # The only dependency groups to include. (multiple values allowed)
    --sync                                                            # Synchronize the environment with the locked packages and the specified groups.
    --dry-run                                                         # Output the operations but do not execute anything (implicitly enables --verbose).
    --lock                                                            # Do not perform operations (only update the lockfile).
    --help(-h)                                                        # Display help for the given command. When no command is given display help for the list command.
    --quiet(-q)                                                       # Do not output any message.
    --version(-V)                                                     # Display this application version.
    --ansi                                                            # Force ANSI output.
    --no-ansi                                                         # Disable ANSI output.
    --no-interaction(-n)                                              # Do not ask any interactive question.
    --no-plugins                                                      # Disables plugins.
    --no-cache                                                        # Disables Poetry source caches.
    --directory(-C): path                                             # The working directory for the Poetry command (defaults to the current working directory).
    --verbose(-v)                                                     # Increase the verbosity of messages: 1 for normal output, 2 for more verbose output and 3 for debug.
]

# Shows the version of the project or bumps it when a valid bump rule is provided.
export extern "poetry version" [
    version?: string        # The version number or the rule to update the version.
    --short(-s)            # Output the version number only.
    --dry-run              # Do not update pyproject.toml file.
    --next-phase           # Increment the phase of the current version
    --help(-h)             # Display help for the given command. When no command is given display help for the list command.
    --quiet(-q)            # Do not output any message.
    --version(-V)          # Display this application version.
    --ansi                 # Force ANSI output.
    --no-ansi              # Disable ANSI output.
    --no-interaction(-n)   # Do not ask any interactive question.
    --no-plugins           # Disables plugins.
    --no-cache             # Disables Poetry source caches.
    --directory(-C): path  # The working directory for the Poetry command (defaults to the current working directory).
    --verbose(-v)          # Increase the verbosity of messages: 1 for normal output, 2 for more verbose output and 3 for debug.
]

# Clears Poetry's cache.
export extern "poetry cache clear" [
    cache: string@"nu-complete poetry caches"  # The name of the cache to clear.
    --all                                      # Clear all entries in the cache.
    --help(-h)                                 # Display help for the given command. When no command is given display help for the list command.
    --quiet(-q)                                # Do not output any message.
    --version(-V)                              # Display this application version.
    --ansi                                     # Force ANSI output.
    --no-ansi                                  # Disable ANSI output.
    --no-interaction(-n)                       # Do not ask any interactive question.
    --no-plugins                               # Disables plugins.
    --no-cache                                 # Disables Poetry source caches.
    --directory(-C): path                      # The working directory for the Poetry command (defaults to the current working directory).
    --verbose(-v)                              # Increase the verbosity of messages: 1 for normal output, 2 for more verbose output and 3 for debug.
]

# List Poetry's caches.
export extern "poetry cache list" [
    --help(-h)             # Display help for the given command. When no command is given display help for the list command.
    --quiet(-q)            # Do not output any message.
    --version(-V)          # Display this application version.
    --ansi                 # Force ANSI output.
    --no-ansi              # Disable ANSI output.
    --no-interaction(-n)   # Do not ask any interactive question.
    --no-plugins           # Disables plugins.
    --no-cache             # Disables Poetry source caches.
    --directory(-C): path  # The working directory for the Poetry command (defaults to the current working directory).
    --verbose(-v)          # Increase the verbosity of messages: 1 for normal output, 2 for more verbose output and 3 for debug.
]

# Shows debug information.
export extern "poetry debug info" [
    --help(-h)             # Display help for the given command. When no command is given display help for the list command.
    --quiet(-q)            # Do not output any message.
    --version(-V)          # Display this application version.
    --ansi                 # Force ANSI output.
    --no-ansi              # Disable ANSI output.
    --no-interaction(-n)   # Do not ask any interactive question.
    --no-plugins           # Disables plugins.
    --no-cache             # Disables Poetry source caches.
    --directory(-C): path  # The working directory for the Poetry command (defaults to the current working directory).
    --verbose(-v)          # Increase the verbosity of messages: 1 for normal output, 2 for more verbose output and 3 for debug.
]

# Debugs dependency resolution.
export extern "poetry debug resolve" [
    ...package: string                                     # The packages to resolve.
    --extras(-E): string                                   # Extras to activate for the dependency. (multiple values allowed)
    --python: string@"nu-complete poetry python-versions"  # Python version(s) to use for resolution.
    --tree                                                 # Display the dependency tree.
    --install                                              # Show what would be installed for the current system.
    --help(-h)                                             # Display help for the given command. When no command is given display help for the list command.
    --quiet(-q)                                            # Do not output any message.
    --version(-V)                                          # Display this application version.
    --ansi                                                 # Force ANSI output.
    --no-ansi                                              # Disable ANSI output.
    --no-interaction(-n)                                   # Do not ask any interactive question.
    --no-plugins                                           # Disables plugins.
    --no-cache                                             # Disables Poetry source caches.
    --directory(-C): path                                  # The working directory for the Poetry command (defaults to the current working directory).
    --verbose(-v)                                          # Increase the verbosity of messages: 1 for normal output, 2 for more verbose output and 3 for debug.
]

# Displays information about the current environment.
export extern "poetry env info" [
    --path(-p)             # Only display the environment's path.
    --executable(-e)       # Only display the environment's python executable path.
    --help(-h)             # Display help for the given command. When no command is given display help for the list command.
    --quiet(-q)            # Do not output any message.
    --version(-V)          # Display this application version.
    --ansi                 # Force ANSI output.
    --no-ansi              # Disable ANSI output.
    --no-interaction(-n)   # Do not ask any interactive question.
    --no-plugins           # Disables plugins.
    --no-cache             # Disables Poetry source caches.
    --directory(-C): path  # The working directory for the Poetry command (defaults to the current working directory).
    --verbose(-v)          # Increase the verbosity of messages: 1 for normal output, 2 for more verbose output and 3 for debug.
]

# Lists all virtualenvs associated with the current project.
export extern "poetry env list" [
    --full-path            # Output the full paths of the virtualenvs.
    --help(-h)             # Display help for the given command. When no command is given display help for the list command.
    --quiet(-q)            # Do not output any message.
    --version(-V)          # Display this application version.
    --ansi                 # Force ANSI output.
    --no-ansi              # Disable ANSI output.
    --no-interaction(-n)   # Do not ask any interactive question.
    --no-plugins           # Disables plugins.
    --no-cache             # Disables Poetry source caches.
    --directory(-C): path  # The working directory for the Poetry command (defaults to the current working directory).
    --verbose(-v)          # Increase the verbosity of messages: 1 for normal output, 2 for more verbose output and 3 for debug.
]

# Remove virtual environments associated with the project.
export extern "poetry env remove" [
    ...python: string@"nu-complete poetry virtual-environments"  # The python executables associated with, or names of the virtual environments which are to be removed.
    --all                                                        # Remove all managed virtual environments associated with the project.
    --help(-h)                                                   # Display help for the given command. When no command is given display help for the list command.
    --quiet(-q)                                                  # Do not output any message.
    --version(-V)                                                # Display this application version.
    --ansi                                                       # Force ANSI output.
    --no-ansi                                                    # Disable ANSI output.
    --no-interaction(-n)                                         # Do not ask any interactive question.
    --no-plugins                                                 # Disables plugins.
    --no-cache                                                   # Disables Poetry source caches.
    --directory(-C): path                                        # The working directory for the Poetry command (defaults to the current working directory).
    --verbose(-v)                                                # Increase the verbosity of messages: 1 for normal output, 2 for more verbose output and 3 for debug.
]

# Activates or creates a new virtualenv for the current project.
export extern "poetry env use" [
    python: string@"nu-complete poetry virtual-environments"  # The python executable to use.
    --help(-h)                                                # Display help for the given command. When no command is given display help for the list command.
    --quiet(-q)                                               # Do not output any message.
    --version(-V)                                             # Display this application version.
    --ansi                                                    # Force ANSI output.
    --no-ansi                                                 # Disable ANSI output.
    --no-interaction(-n)                                      # Do not ask any interactive question.
    --no-plugins                                              # Disables plugins.
    --no-cache                                                # Disables Poetry source caches.
    --directory(-C): path                                     # The working directory for the Poetry command (defaults to the current working directory).
    --verbose(-v)                                             # Increase the verbosity of messages: 1 for normal output, 2 for more verbose output and 3 for debug.
]

# Add additional packages to Poetry's runtime environment.
export extern "poetry self add" [
    ...name: string                                                # The packages to add.
    --editable(-e)                                                 # Add vcs/path dependencies as editable.
    --extras(-E): string                                           # Extras to activate for the dependency. (multiple values allowed)
    --source: string@"nu-complete poetry default-package-sources"  # Name of the source to use to install the package.
    --allow-prereleases                                            # Accept prereleases.
    --dry-run                                                      # Output the operations but do not execute anything (implicitly enables --verbose).
    --help(-h)                                                     # Display help for the given command. When no command is given display help for the list command.
    --quiet(-q)                                                    # Do not output any message.
    --version(-V)                                                  # Display this application version.
    --ansi                                                         # Force ANSI output.
    --no-ansi                                                      # Disable ANSI output.
    --no-interaction(-n)                                           # Do not ask any interactive question.
    --no-plugins                                                   # Disables plugins.
    --no-cache                                                     # Disables Poetry source caches.
    --directory(-C): path                                          # The working directory for the Poetry command (defaults to the current working directory).
    --verbose(-v)                                                  # Increase the verbosity of messages: 1 for normal output, 2 for more verbose output and 3 for debug.
]

# Install locked packages (incl. addons) required by this Poetry installation.
export extern "poetry self install" [
    --sync                 # Synchronize the environment with the locked packages and the specified groups.
    --dry-run              # Output the operations but do not execute anything (implicitly enables --verbose).
    --help(-h)             # Display help for the given command. When no command is given display help for the list command.
    --quiet(-q)            # Do not output any message.
    --version(-V)          # Display this application version.
    --ansi                 # Force ANSI output.
    --no-ansi              # Disable ANSI output.
    --no-interaction(-n)   # Do not ask any interactive question.
    --no-plugins           # Disables plugins.
    --no-cache             # Disables Poetry source caches.
    --directory(-C): path  # The working directory for the Poetry command (defaults to the current working directory).
    --verbose(-v)          # Increase the verbosity of messages: 1 for normal output, 2 for more verbose output and 3 for debug.
]

# Lock the Poetry installation's system requirements.
export extern "poetry self lock" [
    --no-update            # Do not update locked versions, only refresh lock file.
    --help(-h)             # Display help for the given command. When no command is given display help for the list command.
    --quiet(-q)            # Do not output any message.
    --version(-V)          # Display this application version.
    --ansi                 # Force ANSI output.
    --no-ansi              # Disable ANSI output.
    --no-interaction(-n)   # Do not ask any interactive question.
    --no-plugins           # Disables plugins.
    --no-cache             # Disables Poetry source caches.
    --directory(-C): path  # The working directory for the Poetry command (defaults to the current working directory).
    --verbose(-v)          # Increase the verbosity of messages: 1 for normal output, 2 for more verbose output and 3 for debug.
]

# Remove additional packages from Poetry's runtime environment.
export extern "poetry self remove" [
    ...packages: string    # The packages to remove.
    --dry-run              # Output the operations but do not execute anything (implicitly enables --verbose).
    --help(-h)             # Display help for the given command. When no command is given display help for the list command.
    --quiet(-q)            # Do not output any message.
    --version(-V)          # Display this application version.
    --ansi                 # Force ANSI output.
    --no-ansi              # Disable ANSI output.
    --no-interaction(-n)   # Do not ask any interactive question.
    --no-plugins           # Disables plugins.
    --no-cache             # Disables Poetry source caches.
    --directory(-C): path  # The working directory for the Poetry command (defaults to the current working directory).
    --verbose(-v)          # Increase the verbosity of messages: 1 for normal output, 2 for more verbose output and 3 for debug.
]

# Show packages from Poetry's runtime environment.
export extern "poetry self show" [
    package?: string       # The package to inspect.
    --addons               # List only add-on packages installed.
    --tree(-t)             # List the dependencies as a tree.
    --latest(-l)           # Show the latest version.
    --outdated(-o)         # Show the latest version but only for packages that are outdated.
    --help(-h)             # Display help for the given command. When no command is given display help for the list command.
    --quiet(-q)            # Do not output any message.
    --version(-V)          # Display this application version.
    --ansi                 # Force ANSI output.
    --no-ansi              # Disable ANSI output.
    --no-interaction(-n)   # Do not ask any interactive question.
    --no-plugins           # Disables plugins.
    --no-cache             # Disables Poetry source caches.
    --directory(-C): path  # The working directory for the Poetry command (defaults to the current working directory).
    --verbose(-v)          # Increase the verbosity of messages: 1 for normal output, 2 for more verbose output and 3 for debug.
]

# Shows information about the currently installed plugins.
export extern "poetry self show plugins" [
    --help(-h)             # Display help for the given command. When no command is given display help for the list command.
    --quiet(-q)            # Do not output any message.
    --version(-V)          # Display this application version.
    --ansi                 # Force ANSI output.
    --no-ansi              # Disable ANSI output.
    --no-interaction(-n)   # Do not ask any interactive question.
    --no-plugins           # Disables plugins.
    --no-cache             # Disables Poetry source caches.
    --directory(-C): path  # The working directory for the Poetry command (defaults to the current working directory).
    --verbose(-v)          # Increase the verbosity of messages: 1 for normal output, 2 for more verbose output and 3 for debug.
]

# Updates Poetry to the latest version.
export extern "poetry self update" [
    version?: string       # The version to update to. [default: "latest"]
    --preview              # Allow the installation of pre-release versions.
    --dry-run              # Output the operations but do not execute anything (implicitly enables --verbose).
    --help(-h)             # Display help for the given command. When no command is given display help for the list command.
    --quiet(-q)            # Do not output any message.
    --version(-V)          # Display this application version.
    --ansi                 # Force ANSI output.
    --no-ansi              # Disable ANSI output.
    --no-interaction(-n)   # Do not ask any interactive question.
    --no-plugins           # Disables plugins.
    --no-cache             # Disables Poetry source caches.
    --directory(-C): path  # The working directory for the Poetry command (defaults to the current working directory).
    --verbose(-v)          # Increase the verbosity of messages: 1 for normal output, 2 for more verbose output and 3 for debug.
]

# Add source configuration for project.
export extern "poetry source add" [
    name: string@"nu-complete poetry default-package-source-names"  # Source repository name.
    url?: string@"nu-complete poetry default-package-source-urls"   # Source repository URL. Required, except for PyPI, for which it is not allowed.
    --priority(-p): string@"nu-complete poetry source-priorities"   # Set the priority of this source. One of: default, primary, secondary, supplemental, explicit. Defaults to primary.
    --help(-h)                                                      # Display help for the given command. When no command is given display help for the list command.
    --quiet(-q)                                                     # Do not output any message.
    --version(-V)                                                   # Display this application version.
    --ansi                                                          # Force ANSI output.
    --no-ansi                                                       # Disable ANSI output.
    --no-interaction(-n)                                            # Do not ask any interactive question.
    --no-plugins                                                    # Disables plugins.
    --no-cache                                                      # Disables Poetry source caches.
    --directory(-C): path                                           # The working directory for the Poetry command (defaults to the current working directory).
    --verbose(-v)                                                   # Increase the verbosity of messages: 1 for normal output, 2 for more verbose output and 3 for debug.
]

# Remove source configured for the project.
export extern "poetry source remove" [
    name: string@"nu-complete poetry default-package-source-names"  # Source repository name.
    --help(-h)                                                      # Display help for the given command. When no command is given display help for the list command.
    --quiet(-q)                                                     # Do not output any message.
    --version(-V)                                                   # Display this application version.
    --ansi                                                          # Force ANSI output.
    --no-ansi                                                       # Disable ANSI output.
    --no-interaction(-n)                                            # Do not ask any interactive question.
    --no-plugins                                                    # Disables plugins.
    --no-cache                                                      # Disables Poetry source caches.
    --directory(-C): path                                           # The working directory for the Poetry command (defaults to the current working directory).
    --verbose(-v)                                                   # Increase the verbosity of messages: 1 for normal output, 2 for more verbose output and 3 for debug.
]

# Show information about sources configured for the project.
export extern "poetry source show" [
    ...source: string@"nu-complete poetry default-package-source-names"  # Source(s) to show information for. Defaults to showing all sources.
    --help(-h)                                                           # Display help for the given command. When no command is given display help for the list command.
    --quiet(-q)                                                          # Do not output any message.
    --version(-V)                                                        # Display this application version.
    --ansi                                                               # Force ANSI output.
    --no-ansi                                                            # Disable ANSI output.
    --no-interaction(-n)                                                 # Do not ask any interactive question.
    --no-plugins                                                         # Disables plugins.
    --no-cache                                                           # Disables Poetry source caches.
    --directory(-C): path                                                # The working directory for the Poetry command (defaults to the current working directory).
    --verbose(-v)                                                        # Increase the verbosity of messages: 1 for normal output, 2 for more verbose output and 3 for debug.
]
