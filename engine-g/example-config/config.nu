# ~/.config/nushell/config.nu
#
# Nushell-s config file used in engine-q.
#
# It fethes all definitions and environment variables from the `init` module.

use ~/.config/nushell/init.nu *

let config = build-config

alias gd = git diff
