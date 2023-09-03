# thefuck

Enables Nushell support for [thefuck](https://github.com/nvbn/thefuck), a CLI tool that attempts to correct the synatx of the previously failed command.

Requires `thefuck` to be installed separately.

## Install

Clone this repo or copy the `fuck.nu` file wherever your prefer to keep your Nushell scripts.

Edit your Nushell config file (`$nu.config-path`) and add the line:

```nu
use /path/to/fuck.nu
```

### Add `command_not_found` hook

```nu
$env.config.hooks.command_not_found = {|cmd|fuck}
```
