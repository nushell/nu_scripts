# 
extern "yarn" [
	--dev(-D)
	--peer(-P)
	--O(-O)
	--exact(-E)
	--tilde(-T)
	--yes(-y)
	--depth
	--new-version
	--message
	--no-git-tag-version
	--help(-h)					# output usage information
	--version(-V)					# output the version number
	--verbose					# output verbose messages on internal operations
	--offline					# trigger an error if any required dependencies are not available in local cache
	--prefer-offline					# use network only if dependencies are not available in local cache
	--strict-semver
	--json
	--har					# save HAR output of network traffic
	--ignore-platform					# ignore platform checks
	--ignore-engines					# ignore engines check
	--ignore-optional					# ignore optional dependencies
	--force					# ignore all caches
	--flat					# only allow one version of a package
	--prod production
	--frozen-lockfile					# don\'t
	--global-folder
	--modules-folder					# install modules here instead of node_modules
	--cache-folder					# specify a custom folder to store the yarn cache
	--mutex					# use a mutex to ensure only one yarn instance is executing
	--mutex
	--no-emoji					# disable emoji in output
	--proxy
	--https-proxy
	--no-progress					# disable progress bar
	--network-concurrency					# maximum number of concurrent network requests
	...args
]

# Show available commands and flags
extern "yarn help" [
	--dev(-D)
	--peer(-P)
	--O(-O)
	--exact(-E)
	--tilde(-T)
	--yes(-y)
	--depth
	--new-version
	--message
	--no-git-tag-version
	--help(-h)					# output usage information
	--version(-V)					# output the version number
	--verbose					# output verbose messages on internal operations
	--offline					# trigger an error if any required dependencies are not available in local cache
	--prefer-offline					# use network only if dependencies are not available in local cache
	--strict-semver
	--json
	--har					# save HAR output of network traffic
	--ignore-platform					# ignore platform checks
	--ignore-engines					# ignore engines check
	--ignore-optional					# ignore optional dependencies
	--force					# ignore all caches
	--flat					# only allow one version of a package
	--prod production
	--frozen-lockfile					# don\'t
	--global-folder
	--modules-folder					# install modules here instead of node_modules
	--cache-folder					# specify a custom folder to store the yarn cache
	--mutex					# use a mutex to ensure only one yarn instance is executing
	--mutex
	--no-emoji					# disable emoji in output
	--proxy
	--https-proxy
	--no-progress					# disable progress bar
	--network-concurrency					# maximum number of concurrent network requests
	...args
]

# Add packages
extern "yarn add" [
	--dev(-D)
	--peer(-P)
	--O(-O)
	--exact(-E)
	--tilde(-T)
	--yes(-y)
	--depth
	--new-version
	--message
	--no-git-tag-version
	--help(-h)					# output usage information
	--version(-V)					# output the version number
	--verbose					# output verbose messages on internal operations
	--offline					# trigger an error if any required dependencies are not available in local cache
	--prefer-offline					# use network only if dependencies are not available in local cache
	--strict-semver
	--json
	--har					# save HAR output of network traffic
	--ignore-platform					# ignore platform checks
	--ignore-engines					# ignore engines check
	--ignore-optional					# ignore optional dependencies
	--force					# ignore all caches
	--flat					# only allow one version of a package
	--prod production
	--frozen-lockfile					# don\'t
	--global-folder
	--modules-folder					# install modules here instead of node_modules
	--cache-folder					# specify a custom folder to store the yarn cache
	--mutex					# use a mutex to ensure only one yarn instance is executing
	--mutex
	--no-emoji					# disable emoji in output
	--proxy
	--https-proxy
	--no-progress					# disable progress bar
	--network-concurrency					# maximum number of concurrent network requests
	...args
]

# Show location of Yarn `bin` folder
extern "yarn bin" [
	--dev(-D)
	--peer(-P)
	--O(-O)
	--exact(-E)
	--tilde(-T)
	--yes(-y)
	--depth
	--new-version
	--message
	--no-git-tag-version
	--help(-h)					# output usage information
	--version(-V)					# output the version number
	--verbose					# output verbose messages on internal operations
	--offline					# trigger an error if any required dependencies are not available in local cache
	--prefer-offline					# use network only if dependencies are not available in local cache
	--strict-semver
	--json
	--har					# save HAR output of network traffic
	--ignore-platform					# ignore platform checks
	--ignore-engines					# ignore engines check
	--ignore-optional					# ignore optional dependencies
	--force					# ignore all caches
	--flat					# only allow one version of a package
	--prod production
	--frozen-lockfile					# don\'t
	--global-folder
	--modules-folder					# install modules here instead of node_modules
	--cache-folder					# specify a custom folder to store the yarn cache
	--mutex					# use a mutex to ensure only one yarn instance is executing
	--mutex
	--no-emoji					# disable emoji in output
	--proxy
	--https-proxy
	--no-progress					# disable progress bar
	--network-concurrency					# maximum number of concurrent network requests
	...args
]

# Manage Yarn cache
extern "yarn cache" [
	--dev(-D)
	--peer(-P)
	--O(-O)
	--exact(-E)
	--tilde(-T)
	--yes(-y)
	--depth
	--new-version
	--message
	--no-git-tag-version
	--help(-h)					# output usage information
	--version(-V)					# output the version number
	--verbose					# output verbose messages on internal operations
	--offline					# trigger an error if any required dependencies are not available in local cache
	--prefer-offline					# use network only if dependencies are not available in local cache
	--strict-semver
	--json
	--har					# save HAR output of network traffic
	--ignore-platform					# ignore platform checks
	--ignore-engines					# ignore engines check
	--ignore-optional					# ignore optional dependencies
	--force					# ignore all caches
	--flat					# only allow one version of a package
	--prod production
	--frozen-lockfile					# don\'t
	--global-folder
	--modules-folder					# install modules here instead of node_modules
	--cache-folder					# specify a custom folder to store the yarn cache
	--mutex					# use a mutex to ensure only one yarn instance is executing
	--mutex
	--no-emoji					# disable emoji in output
	--proxy
	--https-proxy
	--no-progress					# disable progress bar
	--network-concurrency					# maximum number of concurrent network requests
	...args
]

# 
extern "yarn clean" [
	--dev(-D)
	--peer(-P)
	--O(-O)
	--exact(-E)
	--tilde(-T)
	--yes(-y)
	--depth
	--new-version
	--message
	--no-git-tag-version
	--help(-h)					# output usage information
	--version(-V)					# output the version number
	--verbose					# output verbose messages on internal operations
	--offline					# trigger an error if any required dependencies are not available in local cache
	--prefer-offline					# use network only if dependencies are not available in local cache
	--strict-semver
	--json
	--har					# save HAR output of network traffic
	--ignore-platform					# ignore platform checks
	--ignore-engines					# ignore engines check
	--ignore-optional					# ignore optional dependencies
	--force					# ignore all caches
	--flat					# only allow one version of a package
	--prod production
	--frozen-lockfile					# don\'t
	--global-folder
	--modules-folder					# install modules here instead of node_modules
	--cache-folder					# specify a custom folder to store the yarn cache
	--mutex					# use a mutex to ensure only one yarn instance is executing
	--mutex
	--no-emoji					# disable emoji in output
	--proxy
	--https-proxy
	--no-progress					# disable progress bar
	--network-concurrency					# maximum number of concurrent network requests
	...args
]

# Manage Yarn configuration
extern "yarn config" [
	--dev(-D)
	--peer(-P)
	--O(-O)
	--exact(-E)
	--tilde(-T)
	--yes(-y)
	--depth
	--new-version
	--message
	--no-git-tag-version
	--help(-h)					# output usage information
	--version(-V)					# output the version number
	--verbose					# output verbose messages on internal operations
	--offline					# trigger an error if any required dependencies are not available in local cache
	--prefer-offline					# use network only if dependencies are not available in local cache
	--strict-semver
	--json
	--har					# save HAR output of network traffic
	--ignore-platform					# ignore platform checks
	--ignore-engines					# ignore engines check
	--ignore-optional					# ignore optional dependencies
	--force					# ignore all caches
	--flat					# only allow one version of a package
	--prod production
	--frozen-lockfile					# don\'t
	--global-folder
	--modules-folder					# install modules here instead of node_modules
	--cache-folder					# specify a custom folder to store the yarn cache
	--mutex					# use a mutex to ensure only one yarn instance is executing
	--mutex
	--no-emoji					# disable emoji in output
	--proxy
	--https-proxy
	--no-progress					# disable progress bar
	--network-concurrency					# maximum number of concurrent network requests
	...args
]

# 
extern "yarn set get delete list" [
	--dev(-D)
	--peer(-P)
	--O(-O)
	--exact(-E)
	--tilde(-T)
	--yes(-y)
	--depth
	--new-version
	--message
	--no-git-tag-version
	--help(-h)					# output usage information
	--version(-V)					# output the version number
	--verbose					# output verbose messages on internal operations
	--offline					# trigger an error if any required dependencies are not available in local cache
	--prefer-offline					# use network only if dependencies are not available in local cache
	--strict-semver
	--json
	--har					# save HAR output of network traffic
	--ignore-platform					# ignore platform checks
	--ignore-engines					# ignore engines check
	--ignore-optional					# ignore optional dependencies
	--force					# ignore all caches
	--flat					# only allow one version of a package
	--prod production
	--frozen-lockfile					# don\'t
	--global-folder
	--modules-folder					# install modules here instead of node_modules
	--cache-folder					# specify a custom folder to store the yarn cache
	--mutex					# use a mutex to ensure only one yarn instance is executing
	--mutex
	--no-emoji					# disable emoji in output
	--proxy
	--https-proxy
	--no-progress					# disable progress bar
	--network-concurrency					# maximum number of concurrent network requests
	...args
]

# Run binaries
extern "yarn exec" [
	--dev(-D)
	--peer(-P)
	--O(-O)
	--exact(-E)
	--tilde(-T)
	--yes(-y)
	--depth
	--new-version
	--message
	--no-git-tag-version
	--help(-h)					# output usage information
	--version(-V)					# output the version number
	--verbose					# output verbose messages on internal operations
	--offline					# trigger an error if any required dependencies are not available in local cache
	--prefer-offline					# use network only if dependencies are not available in local cache
	--strict-semver
	--json
	--har					# save HAR output of network traffic
	--ignore-platform					# ignore platform checks
	--ignore-engines					# ignore engines check
	--ignore-optional					# ignore optional dependencies
	--force					# ignore all caches
	--flat					# only allow one version of a package
	--prod production
	--frozen-lockfile					# don\'t
	--global-folder
	--modules-folder					# install modules here instead of node_modules
	--cache-folder					# specify a custom folder to store the yarn cache
	--mutex					# use a mutex to ensure only one yarn instance is executing
	--mutex
	--no-emoji					# disable emoji in output
	--proxy
	--https-proxy
	--no-progress					# disable progress bar
	--network-concurrency					# maximum number of concurrent network requests
	...args
]

# Show information about a package
extern "yarn info" [
	--dev(-D)
	--peer(-P)
	--O(-O)
	--exact(-E)
	--tilde(-T)
	--yes(-y)
	--depth
	--new-version
	--message
	--no-git-tag-version
	--help(-h)					# output usage information
	--version(-V)					# output the version number
	--verbose					# output verbose messages on internal operations
	--offline					# trigger an error if any required dependencies are not available in local cache
	--prefer-offline					# use network only if dependencies are not available in local cache
	--strict-semver
	--json
	--har					# save HAR output of network traffic
	--ignore-platform					# ignore platform checks
	--ignore-engines					# ignore engines check
	--ignore-optional					# ignore optional dependencies
	--force					# ignore all caches
	--flat					# only allow one version of a package
	--prod production
	--frozen-lockfile					# don\'t
	--global-folder
	--modules-folder					# install modules here instead of node_modules
	--cache-folder					# specify a custom folder to store the yarn cache
	--mutex					# use a mutex to ensure only one yarn instance is executing
	--mutex
	--no-emoji					# disable emoji in output
	--proxy
	--https-proxy
	--no-progress					# disable progress bar
	--network-concurrency					# maximum number of concurrent network requests
	...args
]

# Interactively create or update `package.json`
extern "yarn init" [
	--dev(-D)
	--peer(-P)
	--O(-O)
	--exact(-E)
	--tilde(-T)
	--yes(-y)
	--depth
	--new-version
	--message
	--no-git-tag-version
	--help(-h)					# output usage information
	--version(-V)					# output the version number
	--verbose					# output verbose messages on internal operations
	--offline					# trigger an error if any required dependencies are not available in local cache
	--prefer-offline					# use network only if dependencies are not available in local cache
	--strict-semver
	--json
	--har					# save HAR output of network traffic
	--ignore-platform					# ignore platform checks
	--ignore-engines					# ignore engines check
	--ignore-optional					# ignore optional dependencies
	--force					# ignore all caches
	--flat					# only allow one version of a package
	--prod production
	--frozen-lockfile					# don\'t
	--global-folder
	--modules-folder					# install modules here instead of node_modules
	--cache-folder					# specify a custom folder to store the yarn cache
	--mutex					# use a mutex to ensure only one yarn instance is executing
	--mutex
	--no-emoji					# disable emoji in output
	--proxy
	--https-proxy
	--no-progress					# disable progress bar
	--network-concurrency					# maximum number of concurrent network requests
	...args
]

# Install packages
extern "yarn install" [
	--dev(-D)
	--peer(-P)
	--O(-O)
	--exact(-E)
	--tilde(-T)
	--yes(-y)
	--depth
	--new-version
	--message
	--no-git-tag-version
	--help(-h)					# output usage information
	--version(-V)					# output the version number
	--verbose					# output verbose messages on internal operations
	--offline					# trigger an error if any required dependencies are not available in local cache
	--prefer-offline					# use network only if dependencies are not available in local cache
	--strict-semver
	--json
	--har					# save HAR output of network traffic
	--ignore-platform					# ignore platform checks
	--ignore-engines					# ignore engines check
	--ignore-optional					# ignore optional dependencies
	--force					# ignore all caches
	--flat					# only allow one version of a package
	--prod production
	--frozen-lockfile					# don\'t
	--global-folder
	--modules-folder					# install modules here instead of node_modules
	--cache-folder					# specify a custom folder to store the yarn cache
	--mutex					# use a mutex to ensure only one yarn instance is executing
	--mutex
	--no-emoji					# disable emoji in output
	--proxy
	--https-proxy
	--no-progress					# disable progress bar
	--network-concurrency					# maximum number of concurrent network requests
	...args
]

# Symlink a package
extern "yarn link" [
	--dev(-D)
	--peer(-P)
	--O(-O)
	--exact(-E)
	--tilde(-T)
	--yes(-y)
	--depth
	--new-version
	--message
	--no-git-tag-version
	--help(-h)					# output usage information
	--version(-V)					# output the version number
	--verbose					# output verbose messages on internal operations
	--offline					# trigger an error if any required dependencies are not available in local cache
	--prefer-offline					# use network only if dependencies are not available in local cache
	--strict-semver
	--json
	--har					# save HAR output of network traffic
	--ignore-platform					# ignore platform checks
	--ignore-engines					# ignore engines check
	--ignore-optional					# ignore optional dependencies
	--force					# ignore all caches
	--flat					# only allow one version of a package
	--prod production
	--frozen-lockfile					# don\'t
	--global-folder
	--modules-folder					# install modules here instead of node_modules
	--cache-folder					# specify a custom folder to store the yarn cache
	--mutex					# use a mutex to ensure only one yarn instance is executing
	--mutex
	--no-emoji					# disable emoji in output
	--proxy
	--https-proxy
	--no-progress					# disable progress bar
	--network-concurrency					# maximum number of concurrent network requests
	...args
]

# List installed packages
extern "yarn list" [
	--dev(-D)
	--peer(-P)
	--O(-O)
	--exact(-E)
	--tilde(-T)
	--yes(-y)
	--depth
	--new-version
	--message
	--no-git-tag-version
	--help(-h)					# output usage information
	--version(-V)					# output the version number
	--verbose					# output verbose messages on internal operations
	--offline					# trigger an error if any required dependencies are not available in local cache
	--prefer-offline					# use network only if dependencies are not available in local cache
	--strict-semver
	--json
	--har					# save HAR output of network traffic
	--ignore-platform					# ignore platform checks
	--ignore-engines					# ignore engines check
	--ignore-optional					# ignore optional dependencies
	--force					# ignore all caches
	--flat					# only allow one version of a package
	--prod production
	--frozen-lockfile					# don\'t
	--global-folder
	--modules-folder					# install modules here instead of node_modules
	--cache-folder					# specify a custom folder to store the yarn cache
	--mutex					# use a mutex to ensure only one yarn instance is executing
	--mutex
	--no-emoji					# disable emoji in output
	--proxy
	--https-proxy
	--no-progress					# disable progress bar
	--network-concurrency					# maximum number of concurrent network requests
	...args
]

# Run Node with the hook already setup
extern "yarn node" [
	--dev(-D)
	--peer(-P)
	--O(-O)
	--exact(-E)
	--tilde(-T)
	--yes(-y)
	--depth
	--new-version
	--message
	--no-git-tag-version
	--help(-h)					# output usage information
	--version(-V)					# output the version number
	--verbose					# output verbose messages on internal operations
	--offline					# trigger an error if any required dependencies are not available in local cache
	--prefer-offline					# use network only if dependencies are not available in local cache
	--strict-semver
	--json
	--har					# save HAR output of network traffic
	--ignore-platform					# ignore platform checks
	--ignore-engines					# ignore engines check
	--ignore-optional					# ignore optional dependencies
	--force					# ignore all caches
	--flat					# only allow one version of a package
	--prod production
	--frozen-lockfile					# don\'t
	--global-folder
	--modules-folder					# install modules here instead of node_modules
	--cache-folder					# specify a custom folder to store the yarn cache
	--mutex					# use a mutex to ensure only one yarn instance is executing
	--mutex
	--no-emoji					# disable emoji in output
	--proxy
	--https-proxy
	--no-progress					# disable progress bar
	--network-concurrency					# maximum number of concurrent network requests
	...args
]

# Create compressed archive of packages
extern "yarn pack" [
	--dev(-D)
	--peer(-P)
	--O(-O)
	--exact(-E)
	--tilde(-T)
	--yes(-y)
	--depth
	--new-version
	--message
	--no-git-tag-version
	--help(-h)					# output usage information
	--version(-V)					# output the version number
	--verbose					# output verbose messages on internal operations
	--offline					# trigger an error if any required dependencies are not available in local cache
	--prefer-offline					# use network only if dependencies are not available in local cache
	--strict-semver
	--json
	--har					# save HAR output of network traffic
	--ignore-platform					# ignore platform checks
	--ignore-engines					# ignore engines check
	--ignore-optional					# ignore optional dependencies
	--force					# ignore all caches
	--flat					# only allow one version of a package
	--prod production
	--frozen-lockfile					# don\'t
	--global-folder
	--modules-folder					# install modules here instead of node_modules
	--cache-folder					# specify a custom folder to store the yarn cache
	--mutex					# use a mutex to ensure only one yarn instance is executing
	--mutex
	--no-emoji					# disable emoji in output
	--proxy
	--https-proxy
	--no-progress					# disable progress bar
	--network-concurrency					# maximum number of concurrent network requests
	...args
]

# Remove packages
extern "yarn remove" [
	--dev(-D)
	--peer(-P)
	--O(-O)
	--exact(-E)
	--tilde(-T)
	--yes(-y)
	--depth
	--new-version
	--message
	--no-git-tag-version
	--help(-h)					# output usage information
	--version(-V)					# output the version number
	--verbose					# output verbose messages on internal operations
	--offline					# trigger an error if any required dependencies are not available in local cache
	--prefer-offline					# use network only if dependencies are not available in local cache
	--strict-semver
	--json
	--har					# save HAR output of network traffic
	--ignore-platform					# ignore platform checks
	--ignore-engines					# ignore engines check
	--ignore-optional					# ignore optional dependencies
	--force					# ignore all caches
	--flat					# only allow one version of a package
	--prod production
	--frozen-lockfile					# don\'t
	--global-folder
	--modules-folder					# install modules here instead of node_modules
	--cache-folder					# specify a custom folder to store the yarn cache
	--mutex					# use a mutex to ensure only one yarn instance is executing
	--mutex
	--no-emoji					# disable emoji in output
	--proxy
	--https-proxy
	--no-progress					# disable progress bar
	--network-concurrency					# maximum number of concurrent network requests
	...args
]

# Run a defined package script
extern "yarn run" [
	--dev(-D)
	--peer(-P)
	--O(-O)
	--exact(-E)
	--tilde(-T)
	--yes(-y)
	--depth
	--new-version
	--message
	--no-git-tag-version
	--help(-h)					# output usage information
	--version(-V)					# output the version number
	--verbose					# output verbose messages on internal operations
	--offline					# trigger an error if any required dependencies are not available in local cache
	--prefer-offline					# use network only if dependencies are not available in local cache
	--strict-semver
	--json
	--har					# save HAR output of network traffic
	--ignore-platform					# ignore platform checks
	--ignore-engines					# ignore engines check
	--ignore-optional					# ignore optional dependencies
	--force					# ignore all caches
	--flat					# only allow one version of a package
	--prod production
	--frozen-lockfile					# don\'t
	--global-folder
	--modules-folder					# install modules here instead of node_modules
	--cache-folder					# specify a custom folder to store the yarn cache
	--mutex					# use a mutex to ensure only one yarn instance is executing
	--mutex
	--no-emoji					# disable emoji in output
	--proxy
	--https-proxy
	--no-progress					# disable progress bar
	--network-concurrency					# maximum number of concurrent network requests
	...args
]

# Unlink a previously created symlink
extern "yarn unlink" [
	--dev(-D)
	--peer(-P)
	--O(-O)
	--exact(-E)
	--tilde(-T)
	--yes(-y)
	--depth
	--new-version
	--message
	--no-git-tag-version
	--help(-h)					# output usage information
	--version(-V)					# output the version number
	--verbose					# output verbose messages on internal operations
	--offline					# trigger an error if any required dependencies are not available in local cache
	--prefer-offline					# use network only if dependencies are not available in local cache
	--strict-semver
	--json
	--har					# save HAR output of network traffic
	--ignore-platform					# ignore platform checks
	--ignore-engines					# ignore engines check
	--ignore-optional					# ignore optional dependencies
	--force					# ignore all caches
	--flat					# only allow one version of a package
	--prod production
	--frozen-lockfile					# don\'t
	--global-folder
	--modules-folder					# install modules here instead of node_modules
	--cache-folder					# specify a custom folder to store the yarn cache
	--mutex					# use a mutex to ensure only one yarn instance is executing
	--mutex
	--no-emoji					# disable emoji in output
	--proxy
	--https-proxy
	--no-progress					# disable progress bar
	--network-concurrency					# maximum number of concurrent network requests
	...args
]

# Force unpack packages
extern "yarn unplug" [
	--dev(-D)
	--peer(-P)
	--O(-O)
	--exact(-E)
	--tilde(-T)
	--yes(-y)
	--depth
	--new-version
	--message
	--no-git-tag-version
	--help(-h)					# output usage information
	--version(-V)					# output the version number
	--verbose					# output verbose messages on internal operations
	--offline					# trigger an error if any required dependencies are not available in local cache
	--prefer-offline					# use network only if dependencies are not available in local cache
	--strict-semver
	--json
	--har					# save HAR output of network traffic
	--ignore-platform					# ignore platform checks
	--ignore-engines					# ignore engines check
	--ignore-optional					# ignore optional dependencies
	--force					# ignore all caches
	--flat					# only allow one version of a package
	--prod production
	--frozen-lockfile					# don\'t
	--global-folder
	--modules-folder					# install modules here instead of node_modules
	--cache-folder					# specify a custom folder to store the yarn cache
	--mutex					# use a mutex to ensure only one yarn instance is executing
	--mutex
	--no-emoji					# disable emoji in output
	--proxy
	--https-proxy
	--no-progress					# disable progress bar
	--network-concurrency					# maximum number of concurrent network requests
	...args
]

# Upgrade packages
extern "yarn up" [
	--dev(-D)
	--peer(-P)
	--O(-O)
	--exact(-E)
	--tilde(-T)
	--yes(-y)
	--depth
	--new-version
	--message
	--no-git-tag-version
	--help(-h)					# output usage information
	--version(-V)					# output the version number
	--verbose					# output verbose messages on internal operations
	--offline					# trigger an error if any required dependencies are not available in local cache
	--prefer-offline					# use network only if dependencies are not available in local cache
	--strict-semver
	--json
	--har					# save HAR output of network traffic
	--ignore-platform					# ignore platform checks
	--ignore-engines					# ignore engines check
	--ignore-optional					# ignore optional dependencies
	--force					# ignore all caches
	--flat					# only allow one version of a package
	--prod production
	--frozen-lockfile					# don\'t
	--global-folder
	--modules-folder					# install modules here instead of node_modules
	--cache-folder					# specify a custom folder to store the yarn cache
	--mutex					# use a mutex to ensure only one yarn instance is executing
	--mutex
	--no-emoji					# disable emoji in output
	--proxy
	--https-proxy
	--no-progress					# disable progress bar
	--network-concurrency					# maximum number of concurrent network requests
	...args
]

# Upgrade packages interactively
extern "yarn upgrade-interactive" [
	--dev(-D)
	--peer(-P)
	--O(-O)
	--exact(-E)
	--tilde(-T)
	--yes(-y)
	--depth
	--new-version
	--message
	--no-git-tag-version
	--help(-h)					# output usage information
	--version(-V)					# output the version number
	--verbose					# output verbose messages on internal operations
	--offline					# trigger an error if any required dependencies are not available in local cache
	--prefer-offline					# use network only if dependencies are not available in local cache
	--strict-semver
	--json
	--har					# save HAR output of network traffic
	--ignore-platform					# ignore platform checks
	--ignore-engines					# ignore engines check
	--ignore-optional					# ignore optional dependencies
	--force					# ignore all caches
	--flat					# only allow one version of a package
	--prod production
	--frozen-lockfile					# don\'t
	--global-folder
	--modules-folder					# install modules here instead of node_modules
	--cache-folder					# specify a custom folder to store the yarn cache
	--mutex					# use a mutex to ensure only one yarn instance is executing
	--mutex
	--no-emoji					# disable emoji in output
	--proxy
	--https-proxy
	--no-progress					# disable progress bar
	--network-concurrency					# maximum number of concurrent network requests
	...args
]

# Update the package version
extern "yarn version" [
	--dev(-D)
	--peer(-P)
	--O(-O)
	--exact(-E)
	--tilde(-T)
	--yes(-y)
	--depth
	--new-version
	--message
	--no-git-tag-version
	--help(-h)					# output usage information
	--version(-V)					# output the version number
	--verbose					# output verbose messages on internal operations
	--offline					# trigger an error if any required dependencies are not available in local cache
	--prefer-offline					# use network only if dependencies are not available in local cache
	--strict-semver
	--json
	--har					# save HAR output of network traffic
	--ignore-platform					# ignore platform checks
	--ignore-engines					# ignore engines check
	--ignore-optional					# ignore optional dependencies
	--force					# ignore all caches
	--flat					# only allow one version of a package
	--prod production
	--frozen-lockfile					# don\'t
	--global-folder
	--modules-folder					# install modules here instead of node_modules
	--cache-folder					# specify a custom folder to store the yarn cache
	--mutex					# use a mutex to ensure only one yarn instance is executing
	--mutex
	--no-emoji					# disable emoji in output
	--proxy
	--https-proxy
	--no-progress					# disable progress bar
	--network-concurrency					# maximum number of concurrent network requests
	...args
]

# Show why a package is installed
extern "yarn why" [
	--dev(-D)
	--peer(-P)
	--O(-O)
	--exact(-E)
	--tilde(-T)
	--yes(-y)
	--depth
	--new-version
	--message
	--no-git-tag-version
	--help(-h)					# output usage information
	--version(-V)					# output the version number
	--verbose					# output verbose messages on internal operations
	--offline					# trigger an error if any required dependencies are not available in local cache
	--prefer-offline					# use network only if dependencies are not available in local cache
	--strict-semver
	--json
	--har					# save HAR output of network traffic
	--ignore-platform					# ignore platform checks
	--ignore-engines					# ignore engines check
	--ignore-optional					# ignore optional dependencies
	--force					# ignore all caches
	--flat					# only allow one version of a package
	--prod production
	--frozen-lockfile					# don\'t
	--global-folder
	--modules-folder					# install modules here instead of node_modules
	--cache-folder					# specify a custom folder to store the yarn cache
	--mutex					# use a mutex to ensure only one yarn instance is executing
	--mutex
	--no-emoji					# disable emoji in output
	--proxy
	--https-proxy
	--no-progress					# disable progress bar
	--network-concurrency					# maximum number of concurrent network requests
	...args
]

# Manage workspace packages
extern "yarn workspace" [
	--dev(-D)
	--peer(-P)
	--O(-O)
	--exact(-E)
	--tilde(-T)
	--yes(-y)
	--depth
	--new-version
	--message
	--no-git-tag-version
	--help(-h)					# output usage information
	--version(-V)					# output the version number
	--verbose					# output verbose messages on internal operations
	--offline					# trigger an error if any required dependencies are not available in local cache
	--prefer-offline					# use network only if dependencies are not available in local cache
	--strict-semver
	--json
	--har					# save HAR output of network traffic
	--ignore-platform					# ignore platform checks
	--ignore-engines					# ignore engines check
	--ignore-optional					# ignore optional dependencies
	--force					# ignore all caches
	--flat					# only allow one version of a package
	--prod production
	--frozen-lockfile					# don\'t
	--global-folder
	--modules-folder					# install modules here instead of node_modules
	--cache-folder					# specify a custom folder to store the yarn cache
	--mutex					# use a mutex to ensure only one yarn instance is executing
	--mutex
	--no-emoji					# disable emoji in output
	--proxy
	--https-proxy
	--no-progress					# disable progress bar
	--network-concurrency					# maximum number of concurrent network requests
	...args
]

# Show workspaces information
extern "yarn workspaces" [
	--dev(-D)
	--peer(-P)
	--O(-O)
	--exact(-E)
	--tilde(-T)
	--yes(-y)
	--depth
	--new-version
	--message
	--no-git-tag-version
	--help(-h)					# output usage information
	--version(-V)					# output the version number
	--verbose					# output verbose messages on internal operations
	--offline					# trigger an error if any required dependencies are not available in local cache
	--prefer-offline					# use network only if dependencies are not available in local cache
	--strict-semver
	--json
	--har					# save HAR output of network traffic
	--ignore-platform					# ignore platform checks
	--ignore-engines					# ignore engines check
	--ignore-optional					# ignore optional dependencies
	--force					# ignore all caches
	--flat					# only allow one version of a package
	--prod production
	--frozen-lockfile					# don\'t
	--global-folder
	--modules-folder					# install modules here instead of node_modules
	--cache-folder					# specify a custom folder to store the yarn cache
	--mutex					# use a mutex to ensure only one yarn instance is executing
	--mutex
	--no-emoji					# disable emoji in output
	--proxy
	--https-proxy
	--no-progress					# disable progress bar
	--network-concurrency					# maximum number of concurrent network requests
	...args
]

# 
extern "yarn file network" [
	--dev(-D)
	--peer(-P)
	--O(-O)
	--exact(-E)
	--tilde(-T)
	--yes(-y)
	--depth
	--new-version
	--message
	--no-git-tag-version
	--help(-h)					# output usage information
	--version(-V)					# output the version number
	--verbose					# output verbose messages on internal operations
	--offline					# trigger an error if any required dependencies are not available in local cache
	--prefer-offline					# use network only if dependencies are not available in local cache
	--strict-semver
	--json
	--har					# save HAR output of network traffic
	--ignore-platform					# ignore platform checks
	--ignore-engines					# ignore engines check
	--ignore-optional					# ignore optional dependencies
	--force					# ignore all caches
	--flat					# only allow one version of a package
	--prod production
	--frozen-lockfile					# don\'t
	--global-folder
	--modules-folder					# install modules here instead of node_modules
	--cache-folder					# specify a custom folder to store the yarn cache
	--mutex					# use a mutex to ensure only one yarn instance is executing
	--mutex
	--no-emoji					# disable emoji in output
	--proxy
	--https-proxy
	--no-progress					# disable progress bar
	--network-concurrency					# maximum number of concurrent network requests
	...args
]