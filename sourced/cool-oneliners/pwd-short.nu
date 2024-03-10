# Print working directory but abbreviates the home dir as ~
def pwd-short [] {
  $env.PWD | str replace $nu.home-path '~'
}
