# A typst custom completion module.

def verbosity [] {
  [
    {value:0, description:"none"}
    {value:1, description:"warning & error"}
    {value:2, description:"info"} 
    {value:3, description:"debug"}
    {value:4, description:"trace"}
  ]
}

def commands [] {
  [
    "compile"
    "watch"
    "fonts"
    "help"
  ]
}

# typst creates PDF files from .typ files
export extern "typst" [
  command?: string@commands
  --font-path: path                   # Add additional directories to search for fonts [env: TYPST_FONT_PATHS=]
  --root: path                        # Configure the root for absolute paths [env: TYPST_ROOT=]
  --verbosity(-v): number@"verbosity" # Sets the level of verbosity: 0 = none, 1 = warning & error, 2 = info, 3 = debug, 4 = trace
  --help(-h)                          # Print help
  --version(-V)                       # Print version
]

# Compiles the input file into a PDF file [aliases: c]
export extern "typst compile" [
  input: path                         # Path to the input file
  output?: path                       # Path to the output file
  --open                              # Opens the output file after compilation using the default PDF viewer
  --flamegraph                        # Produces a flamegraph of the compilation process and saves it to the given file or to `flamegraph.svg` in the current working directory
  --help(-h)                          # Print help
]

# Watches the input file and recompiles on changes [aliases: w]
export extern "typst watch" [
  input: path                         # Path to the input file
  output?: path                       # Path to the output file
  --open                              # Opens the output file after compilation using the default PDF viewer
  --flamegraph                        # Produces a flamegraph of the compilation process and saves it to the given file or to `flamegraph.svg` in the current working directory
  --help(-h)                          # Print help
]

# List all discovered fonts in system and custom font paths
export extern "typst fonts" [
  --variants                          # Also list style variants of each font family
  --help(-h)                          # Print help
]

# Print this message or the help of the given subcommand(s)
export extern "typst help" [
  command?: string@commands           # Command to print help for           
]

# Command completion aliases.
alias "typst c" = typst compile
alias "typst w" = typst watch


