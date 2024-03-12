# Gracefully set an environment variable or merge a nested option.
#
# Examples:
#   Set $env.NUPM_HOME
#   > set-env NUPM_HOME $'($nu.home-path)/.local/share/nupm'
#
#   Add to $env.NU_LIB_DIRS
#   > set-env --append NU_LIB_DIRS $'($env.NUPM_HOME)/modules'
#
#   Set a nested config option
#   > set-env config.filesize.metric true
#
#   Add a config hook
#   > set-env -a config.hooks.pre_prompt 'ellie | print'
export def --env main [
  path: cell-path # The environment variable name or nested option path
  value: any # The value to set or append
  --append (-a) # Append to the previous value or wrap in a new list
]: nothing -> nothing {
  def 'get or' [default path] { get --ignore-errors $path | default $default }
  let value = if $append {
    $env | get or [] $path | append $value
  } else {
    $value
  }
  let path = $path | to text | split row .
  let value = match $path {
    [_] => $value
    [$root, ..$path] => {
      $env | get or {} $root | upsert ($path | into cell-path) $value
    }
  }
  load-env { ($path | first): $value }
}
