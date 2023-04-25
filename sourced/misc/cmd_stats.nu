let builtin = ($nu.scope.commands | where is_builtin == true | length)
let subcmd = ($nu.scope.commands | where is_sub == true | length)
let plugin = ($nu.scope.commands | where is_plugin == true | length)
let custom = ($nu.scope.commands | where is_custom == true | length)
let keyword = ($nu.scope.commands | where is_keyword == true | length)
let extern = ($nu.scope.commands | where is_extern == true | length)
let total = ($nu.scope.commands | length)

[
    [command_type count];
    [builtin $builtin]
    [sub_command $subcmd]
    [plugin $plugin]
    [custom $custom]
    [keyword $keyword]
    [extern $extern]
    [total_cmds $total]
]