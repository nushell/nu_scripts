# example:
# ```nu
# > got
# Error: nu::shell::external_command
#
#   × External command failed
#    ╭─[entry #1:1:1]
#  1 │ got
#    · ─┬─
#    ·  ╰── did you mean 'get'?
#    ╰────
#   help: No such file or directory (os error 2)
#
#         did you mean?
#             dot
#             git
#             go
# ```
{|cmd|
    let commands_in_path = (
        if ($nu.os-info.name == windows) {
            $env.Path | each {|directory|
                if ($directory | path exists) {
                    let cmd_exts = $env.PATHEXT | str downcase | split row ';' | str trim --char .
                    ls $directory | get name | path parse | where {|it| $cmd_exts | any {|ext| $ext == ($it.extension | str downcase)} } | get stem
                }
            }
        } else {
            $env.PATH | each {|directory|
                if ($directory | path exists) {
                    ls $directory | get name | path parse | update parent "" | path join
                }
            }
        }
        | flatten
        | wrap cmd
    )

    let closest_commands = (
        $commands_in_path
        | insert distance {|it|
            $it.cmd | str distance $cmd
        }
        | uniq
        | sort-by distance
        | get cmd
        | first 3
    )

    let pretty_commands = (
        $closest_commands | each {|cmd|
            $"    (ansi {fg: "default" attr: "di"})($cmd)(ansi reset)"
        }
    )

    $"\ndid you mean?\n($pretty_commands | str join "\n")"
}
