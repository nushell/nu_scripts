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
#    Run `j` to jump arround

def autojump_add_to_database [dir] {
        let-env AUTOJUMP_SOURCED = 1
        autojump --add $dir
}
def-env j [dir] {
        let-env AUTOJUMP_SOURCED = 1
        cd (autojump $dir)
}
let-env config = ($env.config | upsert hooks.env_change.PWD {|config|
    let val = ($config | get -i hooks.env_change.PWD)

    if $val == $nothing {
        $val | append {|before, after| autojump_add_to_database $after }
    } else {
        [
            {|before, after| autojump_add_to_database $after }
        ]
    }
})
