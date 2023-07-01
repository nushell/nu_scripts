# Base16 themes integration

This folder contains a couple of files that let you configure Nushell and other terminal tools to use base16 themes.

## Requirements

Assumes a Linux system with an X-based window manager.
Specific packages and environment variable requirements are listed in each file.

## Files explanation
* **base16.nu** - Main module -- see comments inside
* **auto_base16.nu** - Generates a base16 theme from a wallpaper
* **alacritty_colors.template** - Template for Alacritty terminal colors

## Example integration

Fist, set up base16 theme generation from a wallpaper:
```
# ~/.xinitrc

...

[ -f ~/.auto_base16.nu ] && ~/.auto_base16.nu &
```
This will generate a base16 theme to a file from a current wallpaper.
You can combine this with a random wallpaper generation using the fehbg.nu
script for more chaos fun.

Next, set up Nushell config, assuming the base16 colors are generated
```
# config.nu

use ~/.config/nushell/base16.nu

# File containing base16 colors
$env.BASE16_TXT = "/tmp/base16.txt"

let config = {
    color_config: (base16 build-nu-config $env.BASE16_TXT)
}
```

To select a new wallpaper and regenerate the base16 config:
```
> base16 new-wallpaper

> source ~/.config/nushell/config.nu
```
