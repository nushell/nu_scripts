export def main [] {
    let builtin = (scope commands | where type == "built-in" | length)
    let external = (scope commands | where type == "external" | length)
    let custom = (scope commands | where type == "custom" | length)
    let keyword = (scope commands | where type == "keyword" | length)
    let plugin = (scope commands | where type == "plugin" | length)
    let total = (scope commands | length)

    [
        [command_type count];
        [builtin $builtin]
        [external $external]
        [custom $custom]
        [keyword $keyword]
        [plugin $plugin]
        [total_cmds $total]
    ]
}
