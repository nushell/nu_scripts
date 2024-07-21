# This file configures autojump (https://github.com/wting/autojump) for nushell
#
# Dependencies
#    * autojump
#
# Installation
#    1. store in ~/.config/nushell/autojump.nu
#    2. add to your config.nu: `source .config/nushell/autojump.nu`
#
# Usage
#    Run `j` to jump around

def autojump_add_to_database [dir] {
        $env.AUTOJUMP_SOURCED = 1
        autojump --add $dir
}
def --env j [dir] {
        $env.AUTOJUMP_SOURCED = 1
        cd (autojump $dir)
}
$env.config = ($env.config | upsert hooks.env_change.PWD {|config|
    let val = ($config | get -i hooks.env_change.PWD)

    if $val == null {
        $val | append {|before, after| autojump_add_to_database $after }
    } else {
        [
            {|before, after| autojump_add_to_database $after }
        ]
    }
})
