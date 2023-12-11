# Nushell themes

Credit to @lemnos and [all contributors](https://github.com/lemnos/theme.sh/blob/master/CREDITS.md).

## Use a colorscheme
### The manual way
Currently, the theme change has to be a bit manual.
To have access to the list of all the themes,
```rust
ls ./themes/nu-themes
```

To use the `dracula` theme for instance, please run
```rust
use ./themes/nu-themes/dracula.nu
$env.config = ($env.config | merge {color_config: (dracula)})
```

The theme should be activated!

### Using Nupm
- install [Nupm] by following the [Nupm instructions]
- download the `nu_scripts` repository
```shell
git clone https://github.com/nushell/nu_scripts
```
- activate the `nupm` module with `use nupm`
- install the `nu-scripts` package
```nushell
nupm install --path --force nu_scripts
```

> **Note**
> installing the `nu-scripts` package will install `nu-themes` and other modules

- now, add the following in your config
```nushell
use nu-themes/nushell-dark.nu
$env.config.color_config = (nushell-dark)
```

## Screenshots

Here are [screenshots](./screenshots/README.md) of our themes.

[Nupm]: https://github.com/nushell/nupm
[Nupm instructions]: https://github.com/nushell/nupm#recycle-installation-toc
