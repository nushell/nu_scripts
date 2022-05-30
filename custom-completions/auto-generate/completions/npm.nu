# Manipulates package's cache
extern "npm cache" [

	...args
]

# Add the specified package to the local cache
extern "npm add" [

	...args
]

# Delete  data  out of the cache folder
extern "npm clean" [

	...args
]

# Show the data in the cache
extern "npm ls" [

	...args
]

# Echo the config value to stdout
extern "npm get" [

	...args
]

# Sets the config key to the value
extern "npm set" [

	...args
]

# Manage package owners
extern "npm owner" [

	...args
]

# Remove an owner from package
extern "npm rm" [

	...args
]

# Add a registry user account
extern "npm adduser add-user login" [

	...args
]

# Display npm bin folder
extern "npm bin" [

	...args
]

# Bugs for a package in a web browser maybe
extern "npm bugs issues" [

	...args
]

# Reduce duplication
extern "npm ddp dedupe find-dupes" [

	...args
]

# Deprecate a version of a package
extern "npm deprecate" [

	...args
]

# Docs for a package in a web browser maybe
extern "npm docs home" [

	...args
]

# Edit an installed package
extern "npm edit" [

	...args
]

# Browse an installed package
extern "npm explore" [

	...args
]

# Frequently Asked Questions
extern "npm faq" [

	...args
]

# Search npm help documentation
extern "npm help-search" [
	--long					# Display full package descriptions and other long text across multiple lines
	...args
]

# Display full package descriptions and other long text across multiple lines
extern "npm" [

	...args
]

# View registry info
extern "npm info v view" [

	...args
]

# Symlink a package folder
extern "npm link ln" [

	...args
]

# Check for outdated packages
extern "npm outdated" [

	...args
]

# Create a tarball from a package
extern "npm pack" [

	...args
]

# Display NPM prefix
extern "npm prefix" [

	...args
]

# Remove extraneous packages
extern "npm prune" [

	...args
]

# Publish a package
extern "npm publish" [

	...args
]

# Rebuild a package
extern "npm rb rebuild" [

	...args
]

# Display npm root
extern "npm root " [

	...args
]

# Run arbitrary package scripts
extern "npm run-script run" [

	...args
]

# Lock down dependency versions
extern "npm shrinkwrap" [

	...args
]

# Mark your favorite packages
extern "npm star" [

	...args
]

# View packages marked as favorites
extern "npm stars" [

	...args
]

# Start a package
extern "npm start" [

	...args
]

# Stop a package
extern "npm stop" [

	...args
]

# Add a package as a git submodule
extern "npm submodule" [

	...args
]

# Test a package
extern "npm t tst test" [

	...args
]

# Remove a package from the registry
extern "npm unpublish" [

	...args
]

# Remove star from a package
extern "npm unstar" [

	...args
]

# Bump a package version
extern "npm version" [

	...args
]

# Display npm username
extern "npm whoami" [

	...args
]