# ------------------ nu-complete commands ------------------

def "nu-complete github" [] {
    ^gh --help 
    | lines 
    | filter {|line| str starts-with "  " } 
    | skip 1 
    | parse "{value}: {description}" 
    | str trim
}


# ------------------ export extern commands ------------------
export extern "gh" [
    command?: string@"nu-complete github"
    --help          # Show help for command
]