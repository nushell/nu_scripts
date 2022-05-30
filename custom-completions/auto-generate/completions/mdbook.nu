# Prints help
extern "mdbook" [

	...args
]

# Build book from markdown files
extern "mdbook build" [

	...args
]

# Prints help
extern "mdbook help" [

	...args
]

# Create boilerplate structure and files in directory
extern "mdbook init" [
	--force					# Skip confirmation prompts
	--theme					# Copy default theme into source folder
	...args
]

# Serve book at http://localhost:3000
extern "mdbook serve" [

	...args
]

# Test that code samples compile
extern "mdbook test" [

	...args
]

# Watch file changes
extern "mdbook watch" [

	...args
]