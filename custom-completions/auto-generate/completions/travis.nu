# Displays accounts and their subscription status
extern "travis accounts" [
	--help(-h)					# Display help
	--interactive(-i)					# Be interactive and colorful
	--no-interactive					# Don't be interactive and colorful
	--explode(-E)					# Don't rescue exceptions
	--no-explode					# Rescue exceptions
	--skip-version-check					# Don't check if travis client is up to date
	--skip-completion-check					# Don't check if auto-completion is set up
	...args
]

# Displays the most recent build for each branch
extern "travis branches" [
	--help(-h)					# Display help
	--interactive(-i)					# Be interactive and colorful
	--no-interactive					# Don't be interactive and colorful
	--explode(-E)					# Don't rescue exceptions
	--no-explode					# Rescue exceptions
	--skip-version-check					# Don't check if travis client is up to date
	--skip-completion-check					# Don't check if auto-completion is set up
	...args
]

# Lists or deletes repository caches
extern "travis cache" [
	--help(-h)					# Display help
	--interactive(-i)					# Be interactive and colorful
	--no-interactive					# Don't be interactive and colorful
	--explode(-E)					# Don't rescue exceptions
	--no-explode					# Rescue exceptions
	--skip-version-check					# Don't check if travis client is up to date
	--skip-completion-check					# Don't check if auto-completion is set up
	...args
]

# Cancels a job or build
extern "travis cancel" [
	--help(-h)					# Display help
	--interactive(-i)					# Be interactive and colorful
	--no-interactive					# Don't be interactive and colorful
	--explode(-E)					# Don't rescue exceptions
	--no-explode					# Rescue exceptions
	--skip-version-check					# Don't check if travis client is up to date
	--skip-completion-check					# Don't check if auto-completion is set up
	...args
]

# Interactive shell
extern "travis console" [
	--help(-h)					# Display help
	--interactive(-i)					# Be interactive and colorful
	--no-interactive					# Don't be interactive and colorful
	--explode(-E)					# Don't rescue exceptions
	--no-explode					# Rescue exceptions
	--skip-version-check					# Don't check if travis client is up to date
	--skip-completion-check					# Don't check if auto-completion is set up
	...args
]

# Disables a project
extern "travis disable" [
	--help(-h)					# Display help
	--interactive(-i)					# Be interactive and colorful
	--no-interactive					# Don't be interactive and colorful
	--explode(-E)					# Don't rescue exceptions
	--no-explode					# Rescue exceptions
	--skip-version-check					# Don't check if travis client is up to date
	--skip-completion-check					# Don't check if auto-completion is set up
	...args
]

# Enables a project
extern "travis enable" [
	--help(-h)					# Display help
	--interactive(-i)					# Be interactive and colorful
	--no-interactive					# Don't be interactive and colorful
	--explode(-E)					# Don't rescue exceptions
	--no-explode					# Rescue exceptions
	--skip-version-check					# Don't check if travis client is up to date
	--skip-completion-check					# Don't check if auto-completion is set up
	...args
]

# Encrypts values for the .travis.yml
extern "travis encrypt" [
	--help(-h)					# Display help
	--interactive(-i)					# Be interactive and colorful
	--no-interactive					# Don't be interactive and colorful
	--explode(-E)					# Don't rescue exceptions
	--no-explode					# Rescue exceptions
	--skip-version-check					# Don't check if travis client is up to date
	--skip-completion-check					# Don't check if auto-completion is set up
	...args
]

# Encrypts a file and adds decryption steps to .travis.yml
extern "travis encrypt-file" [
	--help(-h)					# Display help
	--interactive(-i)					# Be interactive and colorful
	--no-interactive					# Don't be interactive and colorful
	--explode(-E)					# Don't rescue exceptions
	--no-explode					# Rescue exceptions
	--skip-version-check					# Don't check if travis client is up to date
	--skip-completion-check					# Don't check if auto-completion is set up
	...args
]

# Displays or changes the API endpoint
extern "travis endpoint" [
	--help(-h)					# Display help
	--interactive(-i)					# Be interactive and colorful
	--no-interactive					# Don't be interactive and colorful
	--explode(-E)					# Don't rescue exceptions
	--no-explode					# Rescue exceptions
	--skip-version-check					# Don't check if travis client is up to date
	--skip-completion-check					# Don't check if auto-completion is set up
	...args
]

# Show or modify build environment variables
extern "travis env" [
	--help(-h)					# Display help
	--interactive(-i)					# Be interactive and colorful
	--no-interactive					# Don't be interactive and colorful
	--explode(-E)					# Don't rescue exceptions
	--no-explode					# Rescue exceptions
	--skip-version-check					# Don't check if travis client is up to date
	--skip-completion-check					# Don't check if auto-completion is set up
	...args
]

# Helps you out when in dire need of information
extern "travis help" [
	--help(-h)					# Display help
	--interactive(-i)					# Be interactive and colorful
	--no-interactive					# Don't be interactive and colorful
	--explode(-E)					# Don't rescue exceptions
	--no-explode					# Rescue exceptions
	--skip-version-check					# Don't check if travis client is up to date
	--skip-completion-check					# Don't check if auto-completion is set up
	...args
]

# Displays a projects build history
extern "travis history" [
	--help(-h)					# Display help
	--interactive(-i)					# Be interactive and colorful
	--no-interactive					# Don't be interactive and colorful
	--explode(-E)					# Don't rescue exceptions
	--no-explode					# Rescue exceptions
	--skip-version-check					# Don't check if travis client is up to date
	--skip-completion-check					# Don't check if auto-completion is set up
	...args
]

# Generates a .travis.yml and enables the project
extern "travis init" [
	--help(-h)					# Display help
	--interactive(-i)					# Be interactive and colorful
	--no-interactive					# Don't be interactive and colorful
	--explode(-E)					# Don't rescue exceptions
	--no-explode					# Rescue exceptions
	--skip-version-check					# Don't check if travis client is up to date
	--skip-completion-check					# Don't check if auto-completion is set up
	...args
]

# Display warnings for a .travis.yml
extern "travis lint" [
	--help(-h)					# Display help
	--interactive(-i)					# Be interactive and colorful
	--no-interactive					# Don't be interactive and colorful
	--explode(-E)					# Don't rescue exceptions
	--no-explode					# Rescue exceptions
	--skip-version-check					# Don't check if travis client is up to date
	--skip-completion-check					# Don't check if auto-completion is set up
	...args
]

# Authenticates against the API and stores the token
extern "travis login" [
	--help(-h)					# Display help
	--interactive(-i)					# Be interactive and colorful
	--no-interactive					# Don't be interactive and colorful
	--explode(-E)					# Don't rescue exceptions
	--no-explode					# Rescue exceptions
	--skip-version-check					# Don't check if travis client is up to date
	--skip-completion-check					# Don't check if auto-completion is set up
	...args
]

# Deletes the stored API token
extern "travis logout" [
	--help(-h)					# Display help
	--interactive(-i)					# Be interactive and colorful
	--no-interactive					# Don't be interactive and colorful
	--explode(-E)					# Don't rescue exceptions
	--no-explode					# Rescue exceptions
	--skip-version-check					# Don't check if travis client is up to date
	--skip-completion-check					# Don't check if auto-completion is set up
	...args
]

# Streams test logs
extern "travis logs" [
	--help(-h)					# Display help
	--interactive(-i)					# Be interactive and colorful
	--no-interactive					# Don't be interactive and colorful
	--explode(-E)					# Don't rescue exceptions
	--no-explode					# Rescue exceptions
	--skip-version-check					# Don't check if travis client is up to date
	--skip-completion-check					# Don't check if auto-completion is set up
	...args
]

# Live monitor for what's going on
extern "travis monitor" [
	--help(-h)					# Display help
	--interactive(-i)					# Be interactive and colorful
	--no-interactive					# Don't be interactive and colorful
	--explode(-E)					# Don't rescue exceptions
	--no-explode					# Rescue exceptions
	--skip-version-check					# Don't check if travis client is up to date
	--skip-completion-check					# Don't check if auto-completion is set up
	...args
]

# Opens a build or job in the browser
extern "travis open" [
	--help(-h)					# Display help
	--interactive(-i)					# Be interactive and colorful
	--no-interactive					# Don't be interactive and colorful
	--explode(-E)					# Don't rescue exceptions
	--no-explode					# Rescue exceptions
	--skip-version-check					# Don't check if travis client is up to date
	--skip-completion-check					# Don't check if auto-completion is set up
	...args
]

# Prints out a repository's public key
extern "travis pubkey" [
	--help(-h)					# Display help
	--interactive(-i)					# Be interactive and colorful
	--no-interactive					# Don't be interactive and colorful
	--explode(-E)					# Don't rescue exceptions
	--no-explode					# Rescue exceptions
	--skip-version-check					# Don't check if travis client is up to date
	--skip-completion-check					# Don't check if auto-completion is set up
	...args
]

# Makes an (authenticated) API call and prints out the result
extern "travis raw" [
	--help(-h)					# Display help
	--interactive(-i)					# Be interactive and colorful
	--no-interactive					# Don't be interactive and colorful
	--explode(-E)					# Don't rescue exceptions
	--no-explode					# Rescue exceptions
	--skip-version-check					# Don't check if travis client is up to date
	--skip-completion-check					# Don't check if auto-completion is set up
	...args
]

# Generates a report useful for filing issues
extern "travis report" [
	--help(-h)					# Display help
	--interactive(-i)					# Be interactive and colorful
	--no-interactive					# Don't be interactive and colorful
	--explode(-E)					# Don't rescue exceptions
	--no-explode					# Rescue exceptions
	--skip-version-check					# Don't check if travis client is up to date
	--skip-completion-check					# Don't check if auto-completion is set up
	...args
]

# Lists repositories the user has certain permissions on
extern "travis repos" [
	--help(-h)					# Display help
	--interactive(-i)					# Be interactive and colorful
	--no-interactive					# Don't be interactive and colorful
	--explode(-E)					# Don't rescue exceptions
	--no-explode					# Rescue exceptions
	--skip-version-check					# Don't check if travis client is up to date
	--skip-completion-check					# Don't check if auto-completion is set up
	...args
]

# Lists recent requests
extern "travis requests" [
	--help(-h)					# Display help
	--interactive(-i)					# Be interactive and colorful
	--no-interactive					# Don't be interactive and colorful
	--explode(-E)					# Don't rescue exceptions
	--no-explode					# Rescue exceptions
	--skip-version-check					# Don't check if travis client is up to date
	--skip-completion-check					# Don't check if auto-completion is set up
	...args
]

# Restarts a build or job
extern "travis restart" [
	--help(-h)					# Display help
	--interactive(-i)					# Be interactive and colorful
	--no-interactive					# Don't be interactive and colorful
	--explode(-E)					# Don't rescue exceptions
	--no-explode					# Rescue exceptions
	--skip-version-check					# Don't check if travis client is up to date
	--skip-completion-check					# Don't check if auto-completion is set up
	...args
]

# Access repository settings
extern "travis settings" [
	--help(-h)					# Display help
	--interactive(-i)					# Be interactive and colorful
	--no-interactive					# Don't be interactive and colorful
	--explode(-E)					# Don't rescue exceptions
	--no-explode					# Rescue exceptions
	--skip-version-check					# Don't check if travis client is up to date
	--skip-completion-check					# Don't check if auto-completion is set up
	...args
]

# Sets up an addon or deploy target
extern "travis setup" [
	--help(-h)					# Display help
	--interactive(-i)					# Be interactive and colorful
	--no-interactive					# Don't be interactive and colorful
	--explode(-E)					# Don't rescue exceptions
	--no-explode					# Rescue exceptions
	--skip-version-check					# Don't check if travis client is up to date
	--skip-completion-check					# Don't check if auto-completion is set up
	...args
]

# Displays a build or job
extern "travis show" [
	--help(-h)					# Display help
	--interactive(-i)					# Be interactive and colorful
	--no-interactive					# Don't be interactive and colorful
	--explode(-E)					# Don't rescue exceptions
	--no-explode					# Rescue exceptions
	--skip-version-check					# Don't check if travis client is up to date
	--skip-completion-check					# Don't check if auto-completion is set up
	...args
]

# Checks, updates or deletes an SSH key
extern "travis sshkey" [
	--help(-h)					# Display help
	--interactive(-i)					# Be interactive and colorful
	--no-interactive					# Don't be interactive and colorful
	--explode(-E)					# Don't rescue exceptions
	--no-explode					# Rescue exceptions
	--skip-version-check					# Don't check if travis client is up to date
	--skip-completion-check					# Don't check if auto-completion is set up
	...args
]

# Checks status of the latest build
extern "travis status" [
	--help(-h)					# Display help
	--interactive(-i)					# Be interactive and colorful
	--no-interactive					# Don't be interactive and colorful
	--explode(-E)					# Don't rescue exceptions
	--no-explode					# Rescue exceptions
	--skip-version-check					# Don't check if travis client is up to date
	--skip-completion-check					# Don't check if auto-completion is set up
	...args
]

# Triggers a new sync with GitHub
extern "travis sync" [
	--help(-h)					# Display help
	--interactive(-i)					# Be interactive and colorful
	--no-interactive					# Don't be interactive and colorful
	--explode(-E)					# Don't rescue exceptions
	--no-explode					# Rescue exceptions
	--skip-version-check					# Don't check if travis client is up to date
	--skip-completion-check					# Don't check if auto-completion is set up
	...args
]

# Outputs the secret API token
extern "travis token" [
	--help(-h)					# Display help
	--interactive(-i)					# Be interactive and colorful
	--no-interactive					# Don't be interactive and colorful
	--explode(-E)					# Don't rescue exceptions
	--no-explode					# Rescue exceptions
	--skip-version-check					# Don't check if travis client is up to date
	--skip-completion-check					# Don't check if auto-completion is set up
	...args
]

# Outputs the client version
extern "travis version" [
	--help(-h)					# Display help
	--interactive(-i)					# Be interactive and colorful
	--no-interactive					# Don't be interactive and colorful
	--explode(-E)					# Don't rescue exceptions
	--no-explode					# Rescue exceptions
	--skip-version-check					# Don't check if travis client is up to date
	--skip-completion-check					# Don't check if auto-completion is set up
	...args
]

# Lists most recent builds
extern "travis whatsup" [
	--help(-h)					# Display help
	--interactive(-i)					# Be interactive and colorful
	--no-interactive					# Don't be interactive and colorful
	--explode(-E)					# Don't rescue exceptions
	--no-explode					# Rescue exceptions
	--skip-version-check					# Don't check if travis client is up to date
	--skip-completion-check					# Don't check if auto-completion is set up
	...args
]

# Outputs the current user
extern "travis whoami" [
	--help(-h)					# Display help
	--interactive(-i)					# Be interactive and colorful
	--no-interactive					# Don't be interactive and colorful
	--explode(-E)					# Don't rescue exceptions
	--no-explode					# Rescue exceptions
	--skip-version-check					# Don't check if travis client is up to date
	--skip-completion-check					# Don't check if auto-completion is set up
	...args
]

# Display help
extern "travis" [
	--help(-h)					# Display help
	--interactive(-i)					# Be interactive and colorful
	--no-interactive					# Don't be interactive and colorful
	--explode(-E)					# Don't rescue exceptions
	--no-explode					# Rescue exceptions
	--skip-version-check					# Don't check if travis client is up to date
	--skip-completion-check					# Don't check if auto-completion is set up
	...args
]