# The purpose of this module is to automatically update Path variable on Windows since Windows is unable to do it on its own forcing users to restart terminal to pick up updates
# Usage: import this into your config.nu and then add the update-path function to your pre_prompt hook
module update-path {

    def parse-paths [] {
        where name == Path
        | get value.0
        | str trim -c (char double_quote)
        | split row (char esep)
        | par-each {|path|
            let suffix = if $path ends-with (char path_sep) {(char path_sep)} else {''} # necessary because nushell strips trailing path separators which breaks uniq later on

            $path
            | path split
            | each {|elem|
                if $elem starts-with '%' and $elem ends-with '%' {
                    $env
                    | get ($elem|str trim -c '%')
                } else {
                    $elem
                }
            }
            | path join
            | append $suffix
            | str join
        }
    }

    def get-paths-from-registry [] {
        registry query --hkcu environment
        | parse-paths
        | append (registry query --hklm 'SYSTEM\CurrentControlSet\Control\Session Manager\Environment'| parse-paths)
    }
    export def --env update [] {
        $env.Path = ($env.Path|append (get-paths-from-registry)|uniq)
    }
}
