def up_inner [limit: int] {
  for $e in 0..$limit { "." }
  | str collect
}

# Go up a number of directories
def-env up [
    limit: int # The number of directories to go up
  ] {
    cd (
    (up_inner $limit)
    | into string
    )
}
