# Nushell Themes

Credit to @lemnos and [all contributors](https://github.com/lemnos/theme.sh/blob/master/CREDITS.md).

## Use a colorscheme
### The manual way

To list all the themes:

```rust
ls ./themes/nu-themes
```

To use the `dracula` theme for instance, please run:

```rust
use ./themes/nu-themes/dracula.nu
```

The theme should be activated!

### Using Nupm

1. Install [Nupm] by following the [Nupm instructions]
2. Download the `nu_scripts` repository

   ```shell
   git clone https://github.com/nushell/nu_scripts
   ```

3. Activate the `nupm` module with `use nupm`
4. Install the `nu-scripts` package

   ```nushell
   nupm install --path --force nu_scripts
   ```

   > **Note**
   > installing the `nu-scripts` package will install `nu-themes` and other modules

5. Add the following in your config:

   ```nushell
   use nu-themes/nushell-dark.nu
   ```

## Screenshots

Here are [screenshots](./screenshots/README.md) of our themes.

[Nupm]: https://github.com/nushell/nupm
[Nupm instructions]: https://github.com/nushell/nupm#recycle-installation-toc
