# This script is meant to be run from the nu_scripts/themes/themes folder
# and requires MiniCap to be installed in c:\apps\MiniCap\MiniCap.exe
# which is a small windows utility that captures screenshots. This script
# generates another script named preview-screenshot-script.nu which, when
# ran, will generate a screenshot of each theme and put it in the folder
# specified.

# 
def preview_generate_script [theme_count = 10_000] {
  let themes = (ls *.nu | first $theme_count)
  $themes | each {|theme|
    let name = $theme.name
    if $name in ["preview-terminal.nu", "preview-screenshot-script.nu", "preview-generate-script.nu", "preview-theme.nu"] {
      continue
    }
    let basename = ($theme.name | path parse | get stem)
    [
      "clear"
      $"use ($name)"
      $"$env.config.color_config = (char lp)($basename)(char rp)"
      $'print $"\e]10;(char lp)(char lp)($basename)(char rp).foreground(char rp);(char lp)(char lp)($basename)(char rp).background(char rp);(char lp)(char lp)($basename)(char rp).cursor(char rp)(char lp)char bel(char rp)"'
      "source preview-theme.nu"
      "sleep 100ms"
      $"print `Theme name: (char sq)($basename)(char sq)`"
      "print (preview_theme_small | table -e)"
      "sleep 250ms"
      $'c:\apps\MiniCap\MiniCap.exe -captureactivewin -bordershadow -save c:\temp\($name | path parse | get stem)_$dt:%Y%m%d$.png -closeapp -exit(char nl)'
    ] | str join "\n" | save -f -a preview-screenshot-script.nu
  }
}

preview_generate_script