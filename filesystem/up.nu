# needs to be placed in config.nu otherwise it doesn't work?

def up_inner [limit: int] {
  (for $e in 0..$limit { "../" } | str collect | str substring ",-3")
}

# Go up a number of directories
def-env up [
    limit: int # The number of directories to go up
  ] {
    echo $limit  
    cd (up_inner $limit)
}