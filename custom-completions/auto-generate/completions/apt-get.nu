# Display help and exit
extern "apt-get" [
	--help(-h)					# Display help and exit
	--no-install-recommends					# Do not install recommended packages
	--no-install-suggests					# Do not install suggested packages
	--download-only(-d)					# Download Only
	--fix-broken(-f)					# Correct broken dependencies
	--fix-missing(-m)					# Ignore missing packages
	--no-download					# Disable downloading packages
	--quiet(-q)					# Quiet mode
	--no-act(-s)					# Perform a simulation
	--assume-yes(-y)					# Automatic yes to prompts
	--assume-no					# Automatic no to prompts
	--show-upgraded(-u)					# Show upgraded packages
	--verbose-versions(-V)					# Show full versions for packages
	--build(-b)					# Compile source packages
	--install-recommends					# Install recommended packages
	--install-suggests					# Install suggested packages
	--ignore-hold					# Ignore package Holds
	--no-upgrade					# Do not upgrade packages
	--force-yes					# Force yes
	--print-uris					# Print the URIs
	--purge					# Use purge instead of remove
	--reinstall					# Reinstall packages
	--list-cleanup					# Erase obsolete files
	--default-release(-t)					# Control default input to the policy engine
	--trivial-only					# Only perform operations that are trivial
	--no-remove					# Abort if any packages are to be removed
	--only-source					# Only accept source packages
	--diff-only					# Download only diff file
	--tar-only					# Download only tar file
	--arch-only					# Only process arch-dependent build-dependencies
	--allow-unauthenticated					# Ignore non-authenticated packages
	--version(-v)					# Display version and exit
	...args
]

# Update sources
extern "apt-get update" [
	--help(-h)					# Display help and exit
	--no-install-recommends					# Do not install recommended packages
	--no-install-suggests					# Do not install suggested packages
	--download-only(-d)					# Download Only
	--fix-broken(-f)					# Correct broken dependencies
	--fix-missing(-m)					# Ignore missing packages
	--no-download					# Disable downloading packages
	--quiet(-q)					# Quiet mode
	--no-act(-s)					# Perform a simulation
	--assume-yes(-y)					# Automatic yes to prompts
	--assume-no					# Automatic no to prompts
	--show-upgraded(-u)					# Show upgraded packages
	--verbose-versions(-V)					# Show full versions for packages
	--build(-b)					# Compile source packages
	--install-recommends					# Install recommended packages
	--install-suggests					# Install suggested packages
	--ignore-hold					# Ignore package Holds
	--no-upgrade					# Do not upgrade packages
	--force-yes					# Force yes
	--print-uris					# Print the URIs
	--purge					# Use purge instead of remove
	--reinstall					# Reinstall packages
	--list-cleanup					# Erase obsolete files
	--default-release(-t)					# Control default input to the policy engine
	--trivial-only					# Only perform operations that are trivial
	--no-remove					# Abort if any packages are to be removed
	--only-source					# Only accept source packages
	--diff-only					# Download only diff file
	--tar-only					# Download only tar file
	--arch-only					# Only process arch-dependent build-dependencies
	--allow-unauthenticated					# Ignore non-authenticated packages
	--version(-v)					# Display version and exit
	...args
]

# Upgrade or install newest packages
extern "apt-get upgrade" [
	--help(-h)					# Display help and exit
	--no-install-recommends					# Do not install recommended packages
	--no-install-suggests					# Do not install suggested packages
	--download-only(-d)					# Download Only
	--fix-broken(-f)					# Correct broken dependencies
	--fix-missing(-m)					# Ignore missing packages
	--no-download					# Disable downloading packages
	--quiet(-q)					# Quiet mode
	--no-act(-s)					# Perform a simulation
	--assume-yes(-y)					# Automatic yes to prompts
	--assume-no					# Automatic no to prompts
	--show-upgraded(-u)					# Show upgraded packages
	--verbose-versions(-V)					# Show full versions for packages
	--build(-b)					# Compile source packages
	--install-recommends					# Install recommended packages
	--install-suggests					# Install suggested packages
	--ignore-hold					# Ignore package Holds
	--no-upgrade					# Do not upgrade packages
	--force-yes					# Force yes
	--print-uris					# Print the URIs
	--purge					# Use purge instead of remove
	--reinstall					# Reinstall packages
	--list-cleanup					# Erase obsolete files
	--default-release(-t)					# Control default input to the policy engine
	--trivial-only					# Only perform operations that are trivial
	--no-remove					# Abort if any packages are to be removed
	--only-source					# Only accept source packages
	--diff-only					# Download only diff file
	--tar-only					# Download only tar file
	--arch-only					# Only process arch-dependent build-dependencies
	--allow-unauthenticated					# Ignore non-authenticated packages
	--version(-v)					# Display version and exit
	...args
]

# Use with dselect front-end
extern "apt-get dselect-upgrade" [
	--help(-h)					# Display help and exit
	--no-install-recommends					# Do not install recommended packages
	--no-install-suggests					# Do not install suggested packages
	--download-only(-d)					# Download Only
	--fix-broken(-f)					# Correct broken dependencies
	--fix-missing(-m)					# Ignore missing packages
	--no-download					# Disable downloading packages
	--quiet(-q)					# Quiet mode
	--no-act(-s)					# Perform a simulation
	--assume-yes(-y)					# Automatic yes to prompts
	--assume-no					# Automatic no to prompts
	--show-upgraded(-u)					# Show upgraded packages
	--verbose-versions(-V)					# Show full versions for packages
	--build(-b)					# Compile source packages
	--install-recommends					# Install recommended packages
	--install-suggests					# Install suggested packages
	--ignore-hold					# Ignore package Holds
	--no-upgrade					# Do not upgrade packages
	--force-yes					# Force yes
	--print-uris					# Print the URIs
	--purge					# Use purge instead of remove
	--reinstall					# Reinstall packages
	--list-cleanup					# Erase obsolete files
	--default-release(-t)					# Control default input to the policy engine
	--trivial-only					# Only perform operations that are trivial
	--no-remove					# Abort if any packages are to be removed
	--only-source					# Only accept source packages
	--diff-only					# Download only diff file
	--tar-only					# Download only tar file
	--arch-only					# Only process arch-dependent build-dependencies
	--allow-unauthenticated					# Ignore non-authenticated packages
	--version(-v)					# Display version and exit
	...args
]

# Distro upgrade
extern "apt-get dist-upgrade" [
	--help(-h)					# Display help and exit
	--no-install-recommends					# Do not install recommended packages
	--no-install-suggests					# Do not install suggested packages
	--download-only(-d)					# Download Only
	--fix-broken(-f)					# Correct broken dependencies
	--fix-missing(-m)					# Ignore missing packages
	--no-download					# Disable downloading packages
	--quiet(-q)					# Quiet mode
	--no-act(-s)					# Perform a simulation
	--assume-yes(-y)					# Automatic yes to prompts
	--assume-no					# Automatic no to prompts
	--show-upgraded(-u)					# Show upgraded packages
	--verbose-versions(-V)					# Show full versions for packages
	--build(-b)					# Compile source packages
	--install-recommends					# Install recommended packages
	--install-suggests					# Install suggested packages
	--ignore-hold					# Ignore package Holds
	--no-upgrade					# Do not upgrade packages
	--force-yes					# Force yes
	--print-uris					# Print the URIs
	--purge					# Use purge instead of remove
	--reinstall					# Reinstall packages
	--list-cleanup					# Erase obsolete files
	--default-release(-t)					# Control default input to the policy engine
	--trivial-only					# Only perform operations that are trivial
	--no-remove					# Abort if any packages are to be removed
	--only-source					# Only accept source packages
	--diff-only					# Download only diff file
	--tar-only					# Download only tar file
	--arch-only					# Only process arch-dependent build-dependencies
	--allow-unauthenticated					# Ignore non-authenticated packages
	--version(-v)					# Display version and exit
	...args
]

# Install one or more packages
extern "apt-get install" [
	--help(-h)					# Display help and exit
	--no-install-recommends					# Do not install recommended packages
	--no-install-suggests					# Do not install suggested packages
	--download-only(-d)					# Download Only
	--fix-broken(-f)					# Correct broken dependencies
	--fix-missing(-m)					# Ignore missing packages
	--no-download					# Disable downloading packages
	--quiet(-q)					# Quiet mode
	--no-act(-s)					# Perform a simulation
	--assume-yes(-y)					# Automatic yes to prompts
	--assume-no					# Automatic no to prompts
	--show-upgraded(-u)					# Show upgraded packages
	--verbose-versions(-V)					# Show full versions for packages
	--build(-b)					# Compile source packages
	--install-recommends					# Install recommended packages
	--install-suggests					# Install suggested packages
	--ignore-hold					# Ignore package Holds
	--no-upgrade					# Do not upgrade packages
	--force-yes					# Force yes
	--print-uris					# Print the URIs
	--purge					# Use purge instead of remove
	--reinstall					# Reinstall packages
	--list-cleanup					# Erase obsolete files
	--default-release(-t)					# Control default input to the policy engine
	--trivial-only					# Only perform operations that are trivial
	--no-remove					# Abort if any packages are to be removed
	--only-source					# Only accept source packages
	--diff-only					# Download only diff file
	--tar-only					# Download only tar file
	--arch-only					# Only process arch-dependent build-dependencies
	--allow-unauthenticated					# Ignore non-authenticated packages
	--version(-v)					# Display version and exit
	...args
]

# Display changelog of one or more packages
extern "apt-get changelog" [
	--help(-h)					# Display help and exit
	--no-install-recommends					# Do not install recommended packages
	--no-install-suggests					# Do not install suggested packages
	--download-only(-d)					# Download Only
	--fix-broken(-f)					# Correct broken dependencies
	--fix-missing(-m)					# Ignore missing packages
	--no-download					# Disable downloading packages
	--quiet(-q)					# Quiet mode
	--no-act(-s)					# Perform a simulation
	--assume-yes(-y)					# Automatic yes to prompts
	--assume-no					# Automatic no to prompts
	--show-upgraded(-u)					# Show upgraded packages
	--verbose-versions(-V)					# Show full versions for packages
	--build(-b)					# Compile source packages
	--install-recommends					# Install recommended packages
	--install-suggests					# Install suggested packages
	--ignore-hold					# Ignore package Holds
	--no-upgrade					# Do not upgrade packages
	--force-yes					# Force yes
	--print-uris					# Print the URIs
	--purge					# Use purge instead of remove
	--reinstall					# Reinstall packages
	--list-cleanup					# Erase obsolete files
	--default-release(-t)					# Control default input to the policy engine
	--trivial-only					# Only perform operations that are trivial
	--no-remove					# Abort if any packages are to be removed
	--only-source					# Only accept source packages
	--diff-only					# Download only diff file
	--tar-only					# Download only tar file
	--arch-only					# Only process arch-dependent build-dependencies
	--allow-unauthenticated					# Ignore non-authenticated packages
	--version(-v)					# Display version and exit
	...args
]

# Remove and purge one or more packages
extern "apt-get purge" [
	--help(-h)					# Display help and exit
	--no-install-recommends					# Do not install recommended packages
	--no-install-suggests					# Do not install suggested packages
	--download-only(-d)					# Download Only
	--fix-broken(-f)					# Correct broken dependencies
	--fix-missing(-m)					# Ignore missing packages
	--no-download					# Disable downloading packages
	--quiet(-q)					# Quiet mode
	--no-act(-s)					# Perform a simulation
	--assume-yes(-y)					# Automatic yes to prompts
	--assume-no					# Automatic no to prompts
	--show-upgraded(-u)					# Show upgraded packages
	--verbose-versions(-V)					# Show full versions for packages
	--build(-b)					# Compile source packages
	--install-recommends					# Install recommended packages
	--install-suggests					# Install suggested packages
	--ignore-hold					# Ignore package Holds
	--no-upgrade					# Do not upgrade packages
	--force-yes					# Force yes
	--print-uris					# Print the URIs
	--purge					# Use purge instead of remove
	--reinstall					# Reinstall packages
	--list-cleanup					# Erase obsolete files
	--default-release(-t)					# Control default input to the policy engine
	--trivial-only					# Only perform operations that are trivial
	--no-remove					# Abort if any packages are to be removed
	--only-source					# Only accept source packages
	--diff-only					# Download only diff file
	--tar-only					# Download only tar file
	--arch-only					# Only process arch-dependent build-dependencies
	--allow-unauthenticated					# Ignore non-authenticated packages
	--version(-v)					# Display version and exit
	...args
]

# Remove one or more packages
extern "apt-get remove" [
	--help(-h)					# Display help and exit
	--no-install-recommends					# Do not install recommended packages
	--no-install-suggests					# Do not install suggested packages
	--download-only(-d)					# Download Only
	--fix-broken(-f)					# Correct broken dependencies
	--fix-missing(-m)					# Ignore missing packages
	--no-download					# Disable downloading packages
	--quiet(-q)					# Quiet mode
	--no-act(-s)					# Perform a simulation
	--assume-yes(-y)					# Automatic yes to prompts
	--assume-no					# Automatic no to prompts
	--show-upgraded(-u)					# Show upgraded packages
	--verbose-versions(-V)					# Show full versions for packages
	--build(-b)					# Compile source packages
	--install-recommends					# Install recommended packages
	--install-suggests					# Install suggested packages
	--ignore-hold					# Ignore package Holds
	--no-upgrade					# Do not upgrade packages
	--force-yes					# Force yes
	--print-uris					# Print the URIs
	--purge					# Use purge instead of remove
	--reinstall					# Reinstall packages
	--list-cleanup					# Erase obsolete files
	--default-release(-t)					# Control default input to the policy engine
	--trivial-only					# Only perform operations that are trivial
	--no-remove					# Abort if any packages are to be removed
	--only-source					# Only accept source packages
	--diff-only					# Download only diff file
	--tar-only					# Download only tar file
	--arch-only					# Only process arch-dependent build-dependencies
	--allow-unauthenticated					# Ignore non-authenticated packages
	--version(-v)					# Display version and exit
	...args
]

# Fetch source packages
extern "apt-get source" [
	--help(-h)					# Display help and exit
	--no-install-recommends					# Do not install recommended packages
	--no-install-suggests					# Do not install suggested packages
	--download-only(-d)					# Download Only
	--fix-broken(-f)					# Correct broken dependencies
	--fix-missing(-m)					# Ignore missing packages
	--no-download					# Disable downloading packages
	--quiet(-q)					# Quiet mode
	--no-act(-s)					# Perform a simulation
	--assume-yes(-y)					# Automatic yes to prompts
	--assume-no					# Automatic no to prompts
	--show-upgraded(-u)					# Show upgraded packages
	--verbose-versions(-V)					# Show full versions for packages
	--build(-b)					# Compile source packages
	--install-recommends					# Install recommended packages
	--install-suggests					# Install suggested packages
	--ignore-hold					# Ignore package Holds
	--no-upgrade					# Do not upgrade packages
	--force-yes					# Force yes
	--print-uris					# Print the URIs
	--purge					# Use purge instead of remove
	--reinstall					# Reinstall packages
	--list-cleanup					# Erase obsolete files
	--default-release(-t)					# Control default input to the policy engine
	--trivial-only					# Only perform operations that are trivial
	--no-remove					# Abort if any packages are to be removed
	--only-source					# Only accept source packages
	--diff-only					# Download only diff file
	--tar-only					# Download only tar file
	--arch-only					# Only process arch-dependent build-dependencies
	--allow-unauthenticated					# Ignore non-authenticated packages
	--version(-v)					# Display version and exit
	...args
]

# Install/remove packages for dependencies
extern "apt-get build-dep" [
	--help(-h)					# Display help and exit
	--no-install-recommends					# Do not install recommended packages
	--no-install-suggests					# Do not install suggested packages
	--download-only(-d)					# Download Only
	--fix-broken(-f)					# Correct broken dependencies
	--fix-missing(-m)					# Ignore missing packages
	--no-download					# Disable downloading packages
	--quiet(-q)					# Quiet mode
	--no-act(-s)					# Perform a simulation
	--assume-yes(-y)					# Automatic yes to prompts
	--assume-no					# Automatic no to prompts
	--show-upgraded(-u)					# Show upgraded packages
	--verbose-versions(-V)					# Show full versions for packages
	--build(-b)					# Compile source packages
	--install-recommends					# Install recommended packages
	--install-suggests					# Install suggested packages
	--ignore-hold					# Ignore package Holds
	--no-upgrade					# Do not upgrade packages
	--force-yes					# Force yes
	--print-uris					# Print the URIs
	--purge					# Use purge instead of remove
	--reinstall					# Reinstall packages
	--list-cleanup					# Erase obsolete files
	--default-release(-t)					# Control default input to the policy engine
	--trivial-only					# Only perform operations that are trivial
	--no-remove					# Abort if any packages are to be removed
	--only-source					# Only accept source packages
	--diff-only					# Download only diff file
	--tar-only					# Download only tar file
	--arch-only					# Only process arch-dependent build-dependencies
	--allow-unauthenticated					# Ignore non-authenticated packages
	--version(-v)					# Display version and exit
	...args
]

# Update cache and check dependencies
extern "apt-get check" [
	--help(-h)					# Display help and exit
	--no-install-recommends					# Do not install recommended packages
	--no-install-suggests					# Do not install suggested packages
	--download-only(-d)					# Download Only
	--fix-broken(-f)					# Correct broken dependencies
	--fix-missing(-m)					# Ignore missing packages
	--no-download					# Disable downloading packages
	--quiet(-q)					# Quiet mode
	--no-act(-s)					# Perform a simulation
	--assume-yes(-y)					# Automatic yes to prompts
	--assume-no					# Automatic no to prompts
	--show-upgraded(-u)					# Show upgraded packages
	--verbose-versions(-V)					# Show full versions for packages
	--build(-b)					# Compile source packages
	--install-recommends					# Install recommended packages
	--install-suggests					# Install suggested packages
	--ignore-hold					# Ignore package Holds
	--no-upgrade					# Do not upgrade packages
	--force-yes					# Force yes
	--print-uris					# Print the URIs
	--purge					# Use purge instead of remove
	--reinstall					# Reinstall packages
	--list-cleanup					# Erase obsolete files
	--default-release(-t)					# Control default input to the policy engine
	--trivial-only					# Only perform operations that are trivial
	--no-remove					# Abort if any packages are to be removed
	--only-source					# Only accept source packages
	--diff-only					# Download only diff file
	--tar-only					# Download only tar file
	--arch-only					# Only process arch-dependent build-dependencies
	--allow-unauthenticated					# Ignore non-authenticated packages
	--version(-v)					# Display version and exit
	...args
]

# Clean local caches and packages
extern "apt-get clean" [
	--help(-h)					# Display help and exit
	--no-install-recommends					# Do not install recommended packages
	--no-install-suggests					# Do not install suggested packages
	--download-only(-d)					# Download Only
	--fix-broken(-f)					# Correct broken dependencies
	--fix-missing(-m)					# Ignore missing packages
	--no-download					# Disable downloading packages
	--quiet(-q)					# Quiet mode
	--no-act(-s)					# Perform a simulation
	--assume-yes(-y)					# Automatic yes to prompts
	--assume-no					# Automatic no to prompts
	--show-upgraded(-u)					# Show upgraded packages
	--verbose-versions(-V)					# Show full versions for packages
	--build(-b)					# Compile source packages
	--install-recommends					# Install recommended packages
	--install-suggests					# Install suggested packages
	--ignore-hold					# Ignore package Holds
	--no-upgrade					# Do not upgrade packages
	--force-yes					# Force yes
	--print-uris					# Print the URIs
	--purge					# Use purge instead of remove
	--reinstall					# Reinstall packages
	--list-cleanup					# Erase obsolete files
	--default-release(-t)					# Control default input to the policy engine
	--trivial-only					# Only perform operations that are trivial
	--no-remove					# Abort if any packages are to be removed
	--only-source					# Only accept source packages
	--diff-only					# Download only diff file
	--tar-only					# Download only tar file
	--arch-only					# Only process arch-dependent build-dependencies
	--allow-unauthenticated					# Ignore non-authenticated packages
	--version(-v)					# Display version and exit
	...args
]

# Clean packages no longer be downloaded
extern "apt-get autoclean" [
	--help(-h)					# Display help and exit
	--no-install-recommends					# Do not install recommended packages
	--no-install-suggests					# Do not install suggested packages
	--download-only(-d)					# Download Only
	--fix-broken(-f)					# Correct broken dependencies
	--fix-missing(-m)					# Ignore missing packages
	--no-download					# Disable downloading packages
	--quiet(-q)					# Quiet mode
	--no-act(-s)					# Perform a simulation
	--assume-yes(-y)					# Automatic yes to prompts
	--assume-no					# Automatic no to prompts
	--show-upgraded(-u)					# Show upgraded packages
	--verbose-versions(-V)					# Show full versions for packages
	--build(-b)					# Compile source packages
	--install-recommends					# Install recommended packages
	--install-suggests					# Install suggested packages
	--ignore-hold					# Ignore package Holds
	--no-upgrade					# Do not upgrade packages
	--force-yes					# Force yes
	--print-uris					# Print the URIs
	--purge					# Use purge instead of remove
	--reinstall					# Reinstall packages
	--list-cleanup					# Erase obsolete files
	--default-release(-t)					# Control default input to the policy engine
	--trivial-only					# Only perform operations that are trivial
	--no-remove					# Abort if any packages are to be removed
	--only-source					# Only accept source packages
	--diff-only					# Download only diff file
	--tar-only					# Download only tar file
	--arch-only					# Only process arch-dependent build-dependencies
	--allow-unauthenticated					# Ignore non-authenticated packages
	--version(-v)					# Display version and exit
	...args
]

# Remove automatically installed packages
extern "apt-get autoremove" [
	--help(-h)					# Display help and exit
	--no-install-recommends					# Do not install recommended packages
	--no-install-suggests					# Do not install suggested packages
	--download-only(-d)					# Download Only
	--fix-broken(-f)					# Correct broken dependencies
	--fix-missing(-m)					# Ignore missing packages
	--no-download					# Disable downloading packages
	--quiet(-q)					# Quiet mode
	--no-act(-s)					# Perform a simulation
	--assume-yes(-y)					# Automatic yes to prompts
	--assume-no					# Automatic no to prompts
	--show-upgraded(-u)					# Show upgraded packages
	--verbose-versions(-V)					# Show full versions for packages
	--build(-b)					# Compile source packages
	--install-recommends					# Install recommended packages
	--install-suggests					# Install suggested packages
	--ignore-hold					# Ignore package Holds
	--no-upgrade					# Do not upgrade packages
	--force-yes					# Force yes
	--print-uris					# Print the URIs
	--purge					# Use purge instead of remove
	--reinstall					# Reinstall packages
	--list-cleanup					# Erase obsolete files
	--default-release(-t)					# Control default input to the policy engine
	--trivial-only					# Only perform operations that are trivial
	--no-remove					# Abort if any packages are to be removed
	--only-source					# Only accept source packages
	--diff-only					# Download only diff file
	--tar-only					# Download only tar file
	--arch-only					# Only process arch-dependent build-dependencies
	--allow-unauthenticated					# Ignore non-authenticated packages
	--version(-v)					# Display version and exit
	...args
]