
export extern "code" [
    command?: string                # file or string to  to open. Type `code -` to read from stdin
    --diff(-d): string              # <file> <file> Perform a three-way merge by providing paths for two modified versions of a file, the common origin of both modified versions and the output file to save merge results
    --merge(-m)                     # <path1> <path2> <base> <result> Perform a three-way merge by providing paths for two modified versions of a file, the common origin of both modified versions and the output file to save merge results
    --add(-a): string               # Add folder(s) to the last active window
    --goto(-g)                      # <file:line[:character]>          Open a file at the path on the specified line and character position
    --new-window(-n)                # Force to open a new window
    --reuse-window(-r)              # Force to open a file or folder in an already opened window
    --wait(-w)                      # Wait for the files to be closed before returning
    --user-data-dir                 # Specifies the directory that user data is kept in. Can be used to open multiple distinct instances of Code
    --profile                       # <profileName> Opens the provided folder or workspace with the given profile and associates the profile with the workspace. If the profile does not exist, a new empty one is created. A folder or workspace must be provided for the profile to take effect
    --help(-h)                      # Print usage
    --extensions-dir: path          # Set the root path for extensions
    --list-extensions               # List the installed extensions
    --install-extension: string     # <ext-id | path> Installs or updates an extension. The argument is either an extension id or a path to a VSIX. The identifier of an extension is '${publisher}.${name}'
    --uninstall-extension: string   # <ext-id> Uninstalls an extension
    --enable-proposed-api: string   # <ext-id> Enables proposed API features for extensions. Can receive one or more extension IDs to enable individually
    --version(-v)                   # Print version
    --verbose                       # Print verbose output (implies --wait)
    --log: string@"nu-complete log level" # Log level to use. Default is 'info'. You can also configure the log level of an extension by passing extension id and log level. For example: 'vscode.csharp:trace'
    --status(-s)                    # Print process usage and diagnostics information
    --prof-startup                  # Run CPU profiler during startup
    --disable-extensions            # Disable all installed extensions. This option is not persisted and is effective only when the command opens a new window
    --disable-extension: string     # <ext-id> Disable the provided extension. This option is not persisted and is effective only when the command opens a new window
    --sync: string@"nu-complete on-off" # Turn sync on or off
    --inspect-extensions: number    # <port> Allow debugging and profiling of extensions.  Check the developer tools for the connection URI
    --inspect-brk-extensions: number # <port> Allow debugging and profiling of extensions with the extension host being paused after start. Check the developer tools for the connection URI
    --disable-gpu                   # Disable GPU hardware acceleration
    --disable-chromium-sandbox      # Use this option only when there is requirement to launch the application as sudo user on Linux or when running as an elevated user in an applocker environment on Windows
    --telemetry                     # Shows all telemetry events which VS code collects
]

def "nu-complete log level" [] {
    ["critical", "error", "warn", "info", "debug", "trace", "off"]
}


def "nu-complete on-off" [] {
    ["on", "off"]
}

def "nu-complete code extensions" [] {
    ^code --list-extensions | lines
}

export extern "code --list-extensions" [
    --category             # Filters installed extensions by provided category
    --show-versions        # Show versions of installed extensions
]

export extern "code --disable-extension" [
    extension: string@"nu-complete code extensions"
]

export extern "code --uninstall-extension" [
    extension: string@"nu-complete code extensions"
]

export extern "code --install-extension" [
    --pre-release          # Installs the pre-release version of the extension
    --force                # update to latest version
]

export extern "code tunnel" [
    # TODO
]

export extern "code serve-web" [
    # TODO
]
