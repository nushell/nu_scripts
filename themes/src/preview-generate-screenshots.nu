# This script is meant to be run from the nu_scripts/themes/src
# folder inside this repository.
#
# Recommended:
# * Close any other Terminal tabs
# * Set your tab title to something like "Theme Preview"
# * Size your terminal so that theme previews just fit without
#   too great a border
# * Place your terminal window against a separate solid
#   background to reduce artifacts

def save_screenshot [ method, theme_name ] {
  use .../stdlib-candidate/std-rfc/str 
  match $method {
    # This method for generating terminal screenshots uses
    # a pure-PowerShell script. The caveat is that Windows
    # Security may interpret this as a threat and refuse to 
    # execute. In that case, temporarily turn off Real-Time
    # Protection, run the script, and then immediately
    # re-enable protection.

    # This method should work from either WSL or Nushell
    # for Windows
    "powershell" => {
      let ps_script = $"
        use .. *
        source ($name)
        clear
        sleep 100ms
        print `Theme name: '($theme_name)'`
        print -n \(preview theme small | table -e)
        sleep 250ms

        $Host.UI.RawUI.WindowTitle = 'Theme Preview'
        Add-Type -AssemblyName System.Windows.Forms
        [Windows.Forms.Sendkeys]::SendWait\('%{Prtsc}')
        [Windows.Forms.Sendkeys]::SendWait\('%{Prtsc}')
        [Windows.Forms.Sendkeys]::SendWait\('%{Prtsc}')
        sleep 1
        [Windows.Forms.Clipboard]::GetImage\().Save\('($theme_name).png', [System.Drawing.Imaging.ImageFormat]::Png)
      "
    | str dedent

      $"powershell.exe -c \"
      ($ps_script)
      \""
    }

    # Requires MiniCap, a utility for capturing screenshots on Windows
    "minicap" => {
      $'
        use .. *
        source ($name)
        clear
        sleep 100ms
        print `Theme name: '($theme_name)'`
        print -n \(preview theme small | table -e)
        sleep 250ms

        c:\\apps\\MiniCap\\MiniCap.exe -captureactivewin -bordershadow -save ($theme_name).png -closeapp -exit
      '
    } 

    # Requires asciinema (Linux/Mac only), agg (asciinema to gif), and ffmpeg
    # Currently uses Caskaydia Cover Nerd Font installed in user's local fonts
    "asciinema" => {
      print $theme_name
      $"
        let asciinema_nu_script = $\"
          use .. *
          sleep 200ms
          source ../nu-themes/($theme_name).nu
          clear
          print 'Theme: ($theme_name)'
          print -n \\\(preview theme small)
          sleep 200ms
          print ""
        \"

        mkdir conversions

        asciinema rec -c $'nu -c "\($asciinema_nu_script)\"' ./conversions/($theme_name).cast

        # Define terminal colors for asciinema-to-gif converter
        let sgr_colors = {
          black: r#'000000'#
          red: r#'800000'#
          green: r#'808000'#
          yellow: r#'008000'#
          blue: r#'000080'#
          magenta: r#'800080'#
          cyan: r#'008080'#
          white: r#'c0c0c0'#
          gray: r#'808080'#
          bright_red: r#'ff0000'#
          bright_green: r#'00ff00'#
          bright_yellow: r#'ffff00'#
          bright_blue: r#'0000ff'#
          bright_magenta: r#'ff00ff'#
          bright_cyan: r#'00ffff'#
          bright_white: r#'ffffff'#
        }

        use ../nu-themes/($theme_name).nu
        let theme_fg_bg = {
          background: \(\(($theme_name)).background | str replace '#' '')
          foreground: \(\(($theme_name)).foreground | str replace '#' '')
        }

        # Combine the theme foreground/background with the SGR colors for an agg theme
        let agg_theme = {
          ...$theme_fg_bg
          ...$sgr_colors
        }
        | transpose key value
        | get value
        | str join ","

        # Convert asciinema recording to gif
        # Line-height of 1.2 to keep table drawing characters together
        agg -v --font-size=24 --renderer=resvg --line-height 1.2 --font-dir ~/.nix-profile/share/fonts/truetype/NerdFonts --font-family \"CaskaydiaCove NFM\" --theme $agg_theme ./conversions/($theme_name).cast ./conversions/($theme_name).gif
        rm ./conversions/($theme_name).cast

        ffmpeg -i ./conversions/($theme_name).gif -vf 'select=eq\\\(n\\,1)' -fps_mode vfr -q:v 2 -frames:v 1 -update 1 ../screenshots/($theme_name).png
        rm ./conversions/($theme_name).gif
      "
    }
  }

}

def "preview generate screenshots" [screenshot_method, theme_count = 10_000] {
  use .../stdlib-candidate/std-rfc str

  let themes = (
    "../nu-themes/"
    | path expand
    | path join "*.nu"
    | into glob
    | ls $in
  )

  for theme in $themes {
      let name = $theme.name
      let basename = ($theme.name | path parse | get stem)

      let filename = (
        "../screenshots"
        | path join $'($name | path parse | get stem).png'
      )

      let script = $"
        #use .. *
        #source ($name)
        #clear
        #sleep 100ms
        #print `Theme name: '($basename)'`
        #print -n \(preview theme small | table -e)
        #sleep 250ms
        (save_screenshot $screenshot_method $basename)
        "

      # Run with default config
      # nu -n -c $script
      nu -n -c $"(save_screenshot $screenshot_method $basename)"
  }

}

def "preview generate readme" [] {
  use .../stdlib-candidate/std-rfc str

  # README Title
  "# Screenshots of Theme Previews\n\n"
  | save -f "../screenshots/README.md"

  # Screenshot for each Theme
  "../screenshots/*.png"
  | into glob
  | ls $in
  | get name
  | sort
  | each {|screenshot|
      let theme_name = (
        $screenshot
        | path parse
        | get stem
      )
      let screenshot_file = (
        $screenshot
        | path parse
        | $"($in.stem).($in.extension)"
      )

      $"
      ### Theme name: '($theme_name)'
      ![($theme_name)]\(($screenshot_file))

      "
      | str dedent
      | save -a "../screenshots/README.md"
    }
    | ignore
}

def main [screenshot_method] {
  use .../stdlib-candidate/std-rfc/str 

  if $env.PWD != $env.FILE_PWD {
    "
      Please run this script from the directory where it resides using:

      nu preview-screenshot-script.nu
      "
    | str dedent
    | print -e $in

    return
  } else {
    mkdir ../screenshots
    preview generate screenshots $screenshot_method
    preview generate readme
  }
}