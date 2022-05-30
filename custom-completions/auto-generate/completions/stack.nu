# Show this help text
extern "stack" [

	...args
]

# Verbosity: silent, error, warn, info, debug
extern "stack silent error warn info debug" [

	...args
]

# Build the package(s) in this directory/configuration
extern "stack build" [

	...args
]

# Shortcut for build --copy-bins
extern "stack install" [

	...args
]

# Shortcut for build --test
extern "stack test" [

	...args
]

# Shortcut for build --bench
extern "stack bench" [

	...args
]

# Shortcut for build --haddock
extern "stack haddock" [

	...args
]

# Create a new project from a template. Run stack templates to see available templates.
extern "stack new" [

	...args
]

# List the templates available for stack new.
extern "stack templates" [

	...args
]

# Initialize a stack project based on one or more cabal packages
extern "stack init" [

	...args
]

# Use a dependency solver to try and determine missing extra-deps
extern "stack solver" [

	...args
]

# Get the appropriate GHC for your project
extern "stack setup" [

	...args
]

# Print out handy path information
extern "stack path" [

	...args
]

# Unpack one or more packages locally
extern "stack unpack" [

	...args
]

# Update the package index
extern "stack update" [

	...args
]

# Upgrade to the latest stack (experimental)
extern "stack upgrade" [

	...args
]

# Upload a package to Hackage
extern "stack upload" [

	...args
]

# Create source distribution tarballs
extern "stack sdist" [

	...args
]

# Visualize your projects dependency graph using Graphviz dot
extern "stack dot" [

	...args
]

# Execute a command
extern "stack exec" [

	...args
]

# Run ghc
extern "stack ghc" [

	...args
]

# Run ghci in the context of package(s) (experimental)
extern "stack ghci" [

	...args
]

# Run ghci in the context of package(s) (experimental) (alias for ghci)
extern "stack repl" [

	...args
]

# Run runghc
extern "stack runghc" [

	...args
]

# Run runghc (alias for runghc)
extern "stack runhaskell" [

	...args
]

# Evaluate some haskell code inline. Shortcut for stack exec ghc -- -e CODE
extern "stack eval" [

	...args
]

# Clean the local packages
extern "stack clean" [

	...args
]

# List the dependencies
extern "stack list-dependencies" [

	...args
]

# Query general build information (experimental)
extern "stack query" [

	...args
]

# IDE-specific commands
extern "stack ide" [

	...args
]

# Subcommands specific to Docker use
extern "stack docker" [

	...args
]

# Subcommands specific to modifying stack.yaml files
extern "stack config" [

	...args
]

# Subcommands specific to imaging (experimental)
extern "stack image" [

	...args
]

# Subcommands specific to Haskell Program Coverage
extern "stack hpc" [

	...args
]

# Subcommands specific to package signatures (experimental)
extern "stack sig" [

	...args
]