# Ghostty Completions

Completions for the [Ghostty](https://ghostty.org) terminal emulator CLI.

## Usage

```nu
use ghostty-completions.nu *
```

## Features

- Main `ghostty` command with `-e` flag and config key support
- All `+action` subcommands: `+list-fonts`, `+list-themes`, `+list-keybinds`, `+list-colors`, `+list-actions`, `+show-config`, `+validate-config`, `+edit-config`, `+show-face`, `+ssh-cache`, `+crash-report`, `+version`, `+boo`
- Custom completions for font styles and presentation modes
- Flag descriptions from `ghostty +action --help`

## Tested With

- Ghostty 1.3.x
- Nushell 0.111+
