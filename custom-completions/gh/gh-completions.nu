# ------------------ nu-complete commands ------------------

def "nu-complete gh" [] {
    ^gh --help 
    | lines 
    | filter {|line| str starts-with "  " } 
    | skip 1 
    | parse "{value}: {description}" 
    | str trim
}


# ------------------ export extern commands ------------------
export extern "gh" [
    command?: string@"nu-complete gh"
    --help          # Show help for command
]