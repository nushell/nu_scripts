# This script is meant to be run from the nu_scripts/themes/screenshots/scripts
# folder inside this repository.
# It and requires MiniCap to be installed in c:\apps\MiniCap\MiniCap.exe
# which is a small windows utility that captures screenshots. This script
# generates another script named preview-screenshot-script.nu which, when
# ran, will generate a screenshot of each theme and put it in the folder
# specified.

def preview_generate_script [theme_count = 10_000] {
  use .../stdlib-candidate/std-rfc/str 

  # Theme commands module
  # use .. *

  if $env.PWD != $env.FILE_PWD {
    "
      Please run this script from the directory where it resides using:

      nu preview-screenshot-script.nu
      "
    | str dedent
    | print -e $in

    return
  }

  # Start fresh
  "
  use .. *

  "
  | str dedent
  | save -f preview-screenshot-script.nu

  let powershell = $"
    Add-Type -AssemblyName System.Windows.Forms
    [Windows.Forms.Sendkeys]::SendWait\('+{Prtsc}')
    [Windows.Forms.Clipboard]::GetImage\().Save\('screenshot.jpg', [Drawing.Imaging.ImageFormat]::Jpeg)
    "

  "../nu-themes/"
  | path expand
  | path join "*.nu"
  | into glob
  | ls $in
  | each {|theme|
    let name = $theme.name
    let basename = ($theme.name | path parse | get stem)

    $"
      clear
      source ($name)
      sleep 100ms
      print `Theme name: (char sq)($basename)(char sq)`
      print \(preview_theme_small | table -e)
      sleep 250ms
      # $'c:\\apps\\MiniCap\\MiniCap.exe -captureactivewin -bordershadow -save c:\\temp\\($name | path parse | get stem)_$dt:%Y%m%d$.png -closeapp -exit'

      "
    | str dedent
    | save -a preview-screenshot-script.nu

  }
}

preview_generate_script