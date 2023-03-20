# Go up a number of directories
def-env up [
    limit = 1: int # The number of directories to go up (default is 1)
  ] {
    cd ("." * ($limit + 1))
}
