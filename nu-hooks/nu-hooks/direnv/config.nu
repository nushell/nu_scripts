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
}
