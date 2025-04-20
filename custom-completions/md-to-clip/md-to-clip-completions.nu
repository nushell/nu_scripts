# Converter from TlDr format to Command Line Interface Pages format.
# https://github.com/command-line-interface-pages/v2-tooling/tree/main/md-to-clip
export extern "md-to-clip" [
    file: path@"nu-complete md-to-clip mdfiles" # Source tldr page to convert
    --help (-h)     # Display help
    --version (-v)  # Display version
    --author (-a)   # Display author
    --email (-e)    # Display author email
    --no-file-save  # Whether to display conversion result in stdout instead of writing it to a file
    --output-directory : path@"nu-complete md-to-clip dirs"  # Directory where conversion result will be written
    --special-placeholder-config: path  # Config with special placeholders
]
# "old-style long switch" flags are not covered because Nushell does not currently support them https://github.com/nushell/nushell/issues/5959
# `-nfs`, `-od`, `-spc`

def "nu-complete md-to-clip dirs" [] {
  ls | where type == 'dir' | get name
}

def "nu-complete md-to-clip mdfiles" [] {
  ls | where type == 'dir' or name ends-with '.md' | get name
}
