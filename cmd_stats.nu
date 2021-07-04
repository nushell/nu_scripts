let filter = ($nu.lang | where is_filter == $true | length)
let builtin = ($nu.lang | where is_builtin == $true | length)
let subcmd = ($nu.lang | where is_sub == $true | length)
let plugin = ($nu.lang | where is_plugin == $true | length)
let custom = ($nu.lang | where is_custom == $true | length)
let private = ($nu.lang | where is_private == $true | length)
let binary = ($nu.lang | where is_binary == $true | length)
let total = ($nu.lang | length)

[
    [command_type count];
    [filter $filter]
    [builtin $builtin]
    [sub_command $subcmd]
    [plugin $plugin]
    [custom $custom]
    [private $private]
    [binary $binary]
    [total_cmds $total]
]