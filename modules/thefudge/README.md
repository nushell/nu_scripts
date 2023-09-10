# The Fudge

Enables Nushell support for [thef\*ck](https://github.com/nvbn/thefuck), a CLI tool that attempts to correct the syntax of the last failed command, albeit with a more gentle alias.

Requires separate installation of `thef\*ck`.

## Install

Clone this repository or copy the `thefudge.nu` file wherever your prefer to keep your Nushell scripts.

Edit your Nushell config file (`$nu.config-path`) and add the line:

```nu
use /path/to/thefudge.nu
```

### Add `command_not_found` hook

```nu
$env.config.hooks.command_not_found = {|cmd|fudge}
```
