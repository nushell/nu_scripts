# ~/.config/nushell/config.nu
#
# Nushell-s config file used in engine-q.
#
# It fetches all definitions and environment variables from the `init` module.

def build-config [] { { footer_mode: "50" } }

let config = build-config

use ~/.config/nushell/init.nu *

alias gd = git diff
