# docker wrapper that returns a nushell table
def docker [
  ...args:string # command to be passed to the real docker command
  ] {
  ^docker $args --format={{json .}}|
  lines|
  each {
    $it|
    from json
    }|
  update Labels {
    get Labels|
    split row ','|
    where ($it|str starts-with ' ') == $false|
    split column '=' name value
  }
}
