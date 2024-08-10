# author: David Telenko

def "nu-complete languages" [] {
  ttyper --list-languages | lines
}

export extern "ttyper" [
     --debug(-d)
     --help(-h)                        # Prints help information
     --list-languages                  # List installed languages
     --no-backtrack                    # Disable backtracking to completed words
     --sudden-death                    # Enable sudden death mode to restart on first error
     --version(-V)                     # Prints version information
     --config(-c): path                # Use config file
     --language(-l): string@"nu-complete languages" # Specify test language
     --language-file                   # Specify test language in file
     --words(-w): int                  # Specify word count [default: 50]
]
