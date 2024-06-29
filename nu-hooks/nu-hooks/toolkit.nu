# setup a hook that will activate `toolkit.nu` when found in a directory
#
# # Example
# ```nushell
# $env.config.hooks.env_change.PWD = (
#     $env.config.hooks.env_change.PWD | append (
#         use nu-hooks/toolkit.nu;
#         toolkit setup --name "tk" --color "yellow_bold"
#     )
# )
# ```
export def setup [
    --name: string = "toolkit", # the name of the overlay, i.e. the command that will be usable
    --color: string = "yellow_bold", # the color of the "hook" indicator
]: [ nothing -> record<condition: closure, code: string> ] {
    {
        condition: {|_, after| $after | path join 'toolkit.nu' | path exists }
        code: $"
            print $'[\(ansi ($color)\)hook\(ansi reset\)] loading toolkit'
            overlay use --prefix toolkit.nu as ($name)
            overlay list
                | str join ', '
                | print $'[\(ansi ($color)\)hook\(ansi reset\)] overlays: \($in\)'
        "
    }
}
