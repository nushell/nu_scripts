# A cat(1) clone with syntax highlighting and Git integration
export extern "bat" [
    ...file: path  # file to print / concatenate
    --help         # Print help (see a summary with '-h')
    -h             # Print help (see more with '--help')
    --version      # Print version
    --show-all(-A)         # Show non-printable chars like space, tab and \n
    --nonprintable-notation: string@"nu-complete nonprintable-notation" # Set notation for non-printable characters
    --plain(-p)         # Only show plain style, no decorations
    --language(-l): string@"nu-complete languages" # Explicitly set the language for syntax highlighting
    --list-languages(-L) # Display a list of supported languages for syntax highlighting
    --highlight-line: string  # <N:M> Highlight from N to M line range with a different background color
    --file-name: string # Specify the name to display for a file. Useful when piping data to bat from STDIN when bat does not otherwise know the filename
    --diff(-d)       # Only show lines that have been added/removed/modified with respect to the Git index. Checkout --diff-context=N
    --diff-context: number # Include N lines of context around added/removed/modified lines when using '--diff'
    --tabs: number   # Set the tab width to T spaces. Use a width of 0 to pass tabs through directly
    --wraps: string@"nu-complete wrap-modes"  # Specify the text-wrapping mode
    --chop-long-lines(-S) # Truncate all lines longer than screen width. Alias for '--wrap=never'
    --terminal-width: number # Explicitly set the width of the terminal instead of determining it automatically
    --number(-n)     # Only show line numbers, no other decorations
    --color: string@"nu-complete when" # Specify when to use colored output
    --italic-text: string@"nu-complete ansi italics" # Specify when to use ANSI sequences for italic text in the output
    --decorations: string@"nu-complete when" # Specify when to use the decorations that have been specified via '--style'
    --force-colorization(-f) # Alias for '--decorations=always --color=always'
    --paging: string@"nu-complete when" # Specify when to use the pager
    --pager: string  # Determine which pager is used
    --map-syntax(-m): string # <glob:syntax> Map a glob pattern to an existing syntax name
    --ignored-suffix: string # <ignored-suffix> Ignore extension. For example: 'bat --ignored-suffix ".dev" my_file.json.dev' will use JSON syntax, and ignore '.dev'
    --theme: string@"nu-complete themes" # Set the theme for syntax highlighting
    --list-themes    # Display a list of supported themes for syntax highlighting
    --style: string # Configure which elements (line numbers, file headers, grid borders, Git modifications, ..)
    --line-range(-r): string # <N:M> Only print from N to M
    --unbuffered(-u) # This option exists for POSIX-compliance reasons ('u' is for 'unbuffered'). The output is always unbuffered - this option is simply ignored
    --diagnostic     # Show diagnostic information for bug reports
    --acknowledgements  # Show acknowledgements
]

def "nu-complete nonprintable-notation" [] {
    ['unicode', 'caret']
}

def "nu-complete languages" [] {
    ^bat --list-languages 
    | lines 
    | parse "{value}:{description}" 
}

def "nu-complete wrap-modes" [] {
    ['auto', 'never', 'character']
}

def "nu-complete when" [] {
    ['auto', 'never', 'always']
}

def "nu-complete ansi italics" [] {
    ['never', 'always']
}

def "nu-complete themes" [] {
    ^bat --list-themes 
    | lines 
    | parse "{value}" 
}
