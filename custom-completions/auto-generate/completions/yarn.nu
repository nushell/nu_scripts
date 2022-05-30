# 
extern "yarn" [

	...args
]

# Show available commands and flags
extern "yarn help" [

	...args
]

# Not implemented
extern "yarn access" [

	...args
]

# 
extern "yarn public restricted grant revoke ls-packages ls-collaborators edit" [

	...args
]

# Add packages
extern "yarn add" [
	--dev(-D)
	--peer(-P)
	--O(-O)
	--exact(-E)
	--tilde(-T)
	...args
]

# Perform vulnerability audit
extern "yarn audit" [

	...args
]

# Clean unnecessary files from dependencies
extern "yarn autoclean" [

	...args
]

# Show location of Yarn `bin` folder
extern "yarn bin" [

	...args
]

# Manage Yarn cache
extern "yarn cache" [

	...args
]

# 
extern "yarn ls dir clean" [

	...args
]

# Check dependencies integrity
extern "yarn check" [

	...args
]

# Manage Yarn configuration
extern "yarn config" [

	...args
]

# 
extern "yarn set get delete list" [

	...args
]

# Create new project
extern "yarn create" [

	...args
]

# Run binaries
extern "yarn exec" [

	...args
]

# Generate lockfile entry
extern "yarn generate-lock-entry" [

	...args
]

# Manage global packages
extern "yarn global" [

	...args
]

# 
extern "yarn add bin dir ls list remove upgrade upgrade-interactive" [

	...args
]

# Generate lockfile from existing installation
extern "yarn import" [

	...args
]

# Show information about a package
extern "yarn info" [

	...args
]

# Interactively create or update `package.json`
extern "yarn init" [
	--yes(-y)
	...args
]

# Install packages
extern "yarn install" [

	...args
]

# List licenses for installed packages
extern "yarn licenses" [

	...args
]

# 
extern "yarn ls generate-disclaimer" [

	...args
]

# Symlink a package
extern "yarn link" [

	...args
]

# List installed packages
extern "yarn list" [
	--depth
	...args
]

# Store registry username and email
extern "yarn login" [

	...args
]

# Clear registry username and email
extern "yarn logout" [

	...args
]

# Run Node with the hook already setup
extern "yarn node" [

	...args
]

# Check for outdated packages
extern "yarn outdated" [

	...args
]

# Manage package owners
extern "yarn owner" [

	...args
]

# 
extern "yarn add rm ls" [

	...args
]

# Create compressed archive of packages
extern "yarn pack" [

	...args
]

# Defines project-wide policies
extern "yarn policies" [

	...args
]

# Publish package to npm registry
extern "yarn publish" [
	--access
	--tag
	--new-version
	--message
	--no-git-tag-version
	--access
	--tag
	...args
]

# 
extern "yarn public restricted" [

	...args
]

# Remove packages
extern "yarn remove" [

	...args
]

# Run a defined package script
extern "yarn run" [

	...args
]

# Manage package tags
extern "yarn tag" [

	...args
]

# Maintain team memberships
extern "yarn team" [

	...args
]

# 
extern "yarn create destroy add rm ls" [

	...args
]

# Unlink a previously created symlink
extern "yarn unlink" [

	...args
]

# Force unpack packages
extern "yarn unplug" [

	...args
]

# Upgrade packages
extern "yarn upgrade" [

	...args
]

# Upgrade packages interactively
extern "yarn upgrade-interactive" [

	...args
]

# Update the package version
extern "yarn version" [
	--new-version
	--message
	--no-git-tag-version
	...args
]

# Show Yarn and Node version
extern "yarn versions" [

	...args
]

# Show why a package is installed
extern "yarn why" [

	...args
]

# Manage workspace packages
extern "yarn workspace" [

	...args
]

# Show workspaces information
extern "yarn workspaces" [

	...args
]

# 
extern "yarn file network" [

	...args
]