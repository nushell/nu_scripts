# Prints help
extern "mdbook" [
	--help(-l)					# Prints help
	--version(-V)					# Prints version
	--force					# Skip confirmation prompts
	--theme					# Copy default theme into source folder
	...args
]

# Build book from markdown files
extern "mdbook build" [
	--help(-l)					# Prints help
	--version(-V)					# Prints version
	--force					# Skip confirmation prompts
	--theme					# Copy default theme into source folder
	...args
]

# Prints help
extern "mdbook help" [
	--help(-l)					# Prints help
	--version(-V)					# Prints version
	--force					# Skip confirmation prompts
	--theme					# Copy default theme into source folder
	...args
]

# Create boilerplate structure and files in directory
extern "mdbook init" [
	--help(-l)					# Prints help
	--version(-V)					# Prints version
	--force					# Skip confirmation prompts
	--theme					# Copy default theme into source folder
	...args
]

# Serve book at http://localhost:3000
extern "mdbook serve" [
	--help(-l)					# Prints help
	--version(-V)					# Prints version
	--force					# Skip confirmation prompts
	--theme					# Copy default theme into source folder
	...args
]

# Test that code samples compile
extern "mdbook test" [
	--help(-l)					# Prints help
	--version(-V)					# Prints version
	--force					# Skip confirmation prompts
	--theme					# Copy default theme into source folder
	...args
]

# Watch file changes
extern "mdbook watch" [
	--help(-l)					# Prints help
	--version(-V)					# Prints version
	--force					# Skip confirmation prompts
	--theme					# Copy default theme into source folder
	...args
]