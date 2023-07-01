# Nushell themes

Credit to @lemnos and [all contributors](https://github.com/lemnos/theme.sh/blob/master/CREDITS.md).

## Use a colorscheme
Currently, the theme change has to be a bit manual.
To have access to the list of all the themes,
```rust
ls ./themes/themes
```

To use the `dracula` theme for instance, please run
```rust
use ./themes/themes/dracula.nu
$env.config = ($env.config | merge {color_config: (dracula)})
```

The theme should be activated!

## Screenshots

Here are [screenshots](./screenshots/README.md) of our themes.
