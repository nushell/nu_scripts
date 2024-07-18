# Nushell Themes

Credit to @lemnos and [all contributors](https://github.com/lemnos/theme.sh/blob/master/CREDITS.md).

## Use a colorscheme
### Without Nupm

To list all the themes, from the root of the repository run:

```rust
ls ./themes/nu-themes
```

To use the `dracula` theme for instance, please run:

```rust
source ./themes/nu-themes/dracula.nu
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

5. Add the following in your config, substituting the `theme_name` as desired:

   ```nushell
   source nu-themes/<theme_name>.nu
   ```

## Loading a theme's color_config

When sourcing the theme, as above, the theme will:

* Set Nushell's `$env.config.color_config` to the appropriate theme colors
* If supported, set your terminal's foreground, background, and cursor colors to match the theme

If you would like to do *just* one or the other, you can load a theme's color definition and terminal settings separately.

### Load a color_config

For example, to load and use the `tokyo-night` theme's colors:

```nushell
> use nu-themes/tokyo-night.nu *
  # Display the values
> tokyo-night-theme get color_config
  # Set the color_config to that scheme
> tokyo-night-theme set color_config
  # Or
> $env.config.color_config = (tokyo-night get color_config)
```

### Set terminal colors

Again, using the `tokyo-night` theme as an example:

```nushell
> use nu-themes/tokyo-night.nu *
> tokyo-night-theme update terminal
```

## Screenshots

Here are [screenshots](./screenshots/README.md) of our themes.

[Nupm]: https://github.com/nushell/nupm
[Nupm instructions]: https://github.com/nushell/nupm#recycle-installation-toc
