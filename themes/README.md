# Nushell Themes

Credit to @lemnos and [all contributors](https://github.com/lemnos/theme.sh/blob/master/CREDITS.md).

Note:

* If using Nupm, or the `<package_root>/themes` directory of this package/repository is in your `$env.NU_LIB_DIRS`, then most of the commands below can be run from anywhere on your system.
* Otherwise, all examples assume they are run from the `<package_root>/themes` directory.

## Basic usage
### Activate a colorscheme

```nu
source nu-themes/<theme>.nu
```

For example, to use the `dracula` theme:

```nu
source nu-themes/dracula.nu
```

The theme should be activated!

Note that these settings are for the current shell only.  

### Making changes permanent

Add the command above to your `config.nu` file as shown in [the Configuration chapter of The Book](https://www.nushell.sh/book/configuration.html).

Note that, if not using Nupm or a `NU_LIB_DIR` path, you should use the fully qualified path to the themes directory on your system. For example:

```nu
source ~/nu_scripts/themes/nu-themes/dracula.nu
```

### List all themes

Currently, this is done by simply manually listing the contents of the `nu-themes` directory:

```nu
ls <package_root>/themes/nu-themes
```

## Advanced

Themes are composed of two parts:

* A Nushell `color_config` record which is used to set `$env.config.color_config`
* A command to update your terminal's foreground, background, and cursor colors.  While this assumes that your terminal supports the appropriate OSC codes, the codes need are very basic and should be supported by most any terminal.

You may wish to set the Nushell `color_config` without changing your terminal's colors, or vice-versa. These themes provide additional commands that allow you to accomplish this.

**Important:** Notice that while the "Basic usage" above uses `source` to activate the theme, the following examples *import* the theme module with a `use` statement.

### Load a color_config

For example, to load and use the `tokyo-night` theme's colors without changing the terminal settings:

#### Display a theme's `color_config` settings

```nu
> use nu-themes/tokyo-night.nu
> tokyo-night
```

#### Activate a Nushell `color_config`

```nu
> use nu-themes/tokyo-night.nu
> tokyo-night set color_config
```

or

```nu
> use nu-themes/tokyo-night.nu
> $env.config.color_config = (tokyo-night)
```

### Set terminal colors

Or you can change the terminal settings to use the theme's foreground/background/cursor colors without changing the Nushell `color_config`.

Again, using the `tokyo-night` theme as an example:

```nushell
> use nu-themes/tokyo-night.nu
> tokyo-night update terminal
```

## Using Nupm

The parent `nu_scripts` package can be installed and updated using [Nupm].

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

## Screenshots

Here are [screenshots](./screenshots/README.md) of our themes.

[Nupm]: https://github.com/nushell/nupm
[Nupm instructions]: https://github.com/nushell/nupm#recycle-installation-toc
