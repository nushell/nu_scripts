# you can use the following closure in your config in a few different ways, e.g.
#
# ```nushell
# $env.config.hooks.env_change.PWD = (
#     $env.config.hooks.env_change.PWD | append (source nu-hooks/nu-hooks/direnv/config.nu)
# )
# ```
#
# or
#
# ```nushell
# $env.config.hooks.pre_prompt = (
#     $env.config.hooks.pre_prompt | append (source nu-hooks/nu-hooks/direnv/config.nu)
# )
# ```
#
# > :bulb: **Note**  
# > the former will update direnv when you enter and leave a directory whereas the later will update
# > on every new prompt, i.e. much more often.
{ ||
    if (which direnv | is-empty) {
        return
    }

    direnv export json | from json | default {} | load-env
    # Direnv outputs $PATH as a string, but nushell silently breaks if isn't a list-like table.
    # The following behemoth of Nu code turns this into nu's format while following the standards of how to handle quotes, use it if you need quote handling instead of the line below it:
    # $env.PATH = $env.PATH | parse --regex ('' + `((?:(?:"(?:(?:\\[\\"])|.)*?")|(?:'.*?')|[^` + (char env_sep) + `]*)*)`) | each {|x| $x.capture0 | parse --regex `(?:"((?:(?:\\"|.))*?)")|(?:'(.*?)')|([^'"]*)` | each {|y| if ($y.capture0 != "") { $y.capture0 | str replace -ar `\\([\\"])` `$1` } else if ($y.capture1 != "") { $y.capture1 } else $y.capture2 } | str join }
    $env.PATH = $env.PATH | split row (char env_sep)
}
