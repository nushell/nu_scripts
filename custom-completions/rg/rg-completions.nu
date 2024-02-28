# This are completions for most of the flags of `ripgrep`
# There are some missing flags, but I prefer to have less flags in the completion
# given that rg has currently (14.1.0) has 103 flags

# ripgrep (rg) recursively searches the current directory for lines matching a regex pattern
export extern "rg" [
    pattern?: string                # file to print / concatenate. Use `-` to read from stdin
    --help                          # Print help (see a summary with '-h')
    -h                              # Print help (see more with '--help')
    --version                       # Print version
    --regexp(-e): string            # A pattern to search for
    --file(-f): path                # Search for patterns from the given file
    --pre: string                   # For each input PATH, this flag causes ripgrep to search the standard output of COMMAND PATH instead of the contents of PATH
    --pre-glob: string              # Include or exclude files from a preprocessor
    --search-zip(-z)                # Search in compressed files
    --case-sensitive(-s)            # Execute the search case sensitively. This is the default mode
    --crfl                          # Use CRLF line terminators (nice for Windows)
    --dfa-size-limit: number        # The upper size limit of the regex DFA
    --encoding(-E): string          # Specify the text encoding that ripgrep will use on all files searched. The default value is auto
    --engine: string@"nu-complete regex-engine" # Specify which regular expression engine to use
    --fixed-strings(-F)             # Treat all patterns as literals instead of as regular expressions
    --ignore-case(-i)               # Case insensitive match
    --invert-match(-v)              # This flag inverts matching. That is, instead of printing lines that match, ripgrep will print lines that don't match
    --line-regexp(-x)               # This is equivalent to surrounding every pattern with ^ and $
    --max-count(-m): number         # Limit the number of matching lines per file searched to NUM
    --mmap                          # When enabled, ripgrep will search using memory maps when possible. This is enabled by default when ripgrep thinks it will be faster
    --multiline(-U)                 # This flag enable searching across multiple lines
    --multiline-dotall              # This flag enables "dot all" mode in all regex patterns. This causes . to match line terminators when multiline searching is enabledThis flag enable searching across multiple lines
    --no-unicode                    # This flag disables Unicode mode for all patterns given to ripgrep
    --null-data                     #  Enabling this flag causes ripgrep to use NUL as a line terminator instead of the default of \n
    --pcre2(-P)                     # When this flag is present, ripgrep will use the PCRE2 regex engine instead of its default regex engine
    --regex-size-limit: string      # NUM+SUFFIX? The size limit of the compiled regex
    --smart-case(-S)                # This flag instructs ripgrep to searches case insensitively if the pattern is all lowercase
    --stop-on-nonmatch              # Enabling this option will cause ripgrep to stop reading a file once it encounters a non-matching line after it has encountered a matching line
    --text(-a)                      # This flag instructs ripgrep to search binary files as if they were text
    --threads(-j): number           # This flag sets the approximate number of threads to use
    --word-regexp(-w)               # This is equivalent to surrounding every pattern with \b{start-half} and \b{end-half}
    --binary                        # Enabling this flag will cause ripgrep to search binary files
    --follow(-L)                    # This flag instructs ripgrep to follow symbolic links while traversing directories
    --glob(-g): string              # Include or exclude files and directories for searching that match the given glob
    --glob-case-insensitive         # Process all glob patterns case insensitively
    --hidden(-.)                    # Search hidden files and directories. By default, hidden files and directories are skipped
    --iglob: string                 # Include/exclude paths case insensitively
    --ignore-file: path             # Specify additional ignore files
    --ignore-file-case-insensitive  # Process ignore files case insensitively
    --max-depth(-d): number         # Descend at most NUM directories
    --max-filesize: number          # Ignore files larger than NUM in size
    --no-ignore                     # Don't use ignore files
    --type(-t): string              # Only search files matching TYPE
    --type-not(-T): string          # Do not search files matching TYPE
    --after-context(-A): number     # Show NUM lines after each match
    --before-context(-B): number    # Show NUM lines before each match
    --context(-C): number           # Show NUM lines before and after each match
    --no-line-number(-N)            # Suppress line numbers
    --replace(-r): string           # Replace matches with the given text
    --only-matching(-o)             # Print only matched parts of a line
    --sort: string@"nu-complete sort-options" # Sort results in ascending order
    --sortr: string@"nu-complete sort-options" # Sort results in descending order
    --count(-c)                     # Show count of matching lines for each file
    --count-matches                 # Show count of every match for each file
    --files-with-matches(-l)        # Print the paths with at least one match
    --files-without-match           # Print the paths that contain zero matches
    --json                          # Show search results in a JSON Lines format
]

def "nu-complete regex-engine" [] {
    ['default', 'pcre2', 'auto']
}

def "nu-complete sort-options" [] {
    ['none', 'path', 'modified', 'accessed', 'created']
}