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
    field: cell-path # The environment variable name or nested option cell path
    value: any # The value to set or append
    --append (-a) # Append to the previous value or wrap in a new list
]: nothing -> nothing {
    def 'get or' [default field] {
        get --ignore-errors $field | default $default
    }
    let value = if $append {
        $env | get or [] $field | append $value
    } else {
        $value
    }
    let field = $field | to text | split row .
    let value = match $field {
        [_] => $value
        [$root, ..$field] => {
            let field = $field | into cell-path
            $env | get or {} $root | upsert $field $value
        }
    }
    load-env { ($field | first): $value }
}
