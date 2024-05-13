let builtin = (scope commands | where is_builtin == true | length)
let subcmd = (scope commands | where is_sub == true | length)
let plugin = (scope commands | where is_plugin == true | length)
let custom = (scope commands | where is_custom == true | length)
let keyword = (scope commands | where is_keyword == true | length)
let extern = (scope commands | where is_extern == true | length)
let total = (scope commands | length)

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
