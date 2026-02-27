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

def save_screenshot [ method, theme_name, themes ] {
  use ../../stdlib-candidate-archive/stdlib-candidate-older/std-rfc/str/
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
      # in the powershell script template replace "$theme_name" the text holder with $theme_name the actual string passed to this function
      let powershell_nu_script = open powershell-script --raw | str replace -a "$theme_name" $theme_name
    | str dedent

      $"powershell.exe -c \"
      ($powershell_nu_script)
      \""
    }

    # Requires MiniCap, a utility for capturing screenshots on Windows
    "minicap" => {
      # in the script template replace "$theme_name" the text holder with $theme_name the actual string passed to this function
      let minicap_nu_script = open minicap-script --raw | str replace -a "$theme_name" $theme_name


    } 

    # Requires asciinema (Linux/Mac only), agg (asciinema to gif), and ffmpeg
    # Currently uses Caskaydia Cover Nerd Font installed in user's local fonts
    "asciinema" => {
      print $theme_name
      
      # in the asciinema script template replace "$theme_name" the text holder with $theme_name the actual string passed to this function
      let asciinema_nu_script = open asciinema-script --raw | str replace -a "$theme_name" $theme_name

      mkdir conversions
      asciinema rec --overwrite -c $'nu -c "\($asciinema_nu_script)\"' ./conversions/($theme_name).cast

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

      const nu_themes = "../nu-themes"
      let theme = $themes | where $it == $theme_name
      let name_of_theme = $theme | get 0

      # need to import one of the themes at ../nu-themes/(some-theme).nu
      # but compiler will fail because
      # name_of_theme is not a parse time constant
      # is there a workaround?
      use $"../nu-themes/($theme_name).nu"
      use $"($nu_themes)/($name_of_theme).nu"
      use $"($nu_themes)/($theme_name).nu"
      print "using theme:"
      print $theme

      let command = $"($theme_name) | get background | str replace '#' ''"
      print "command to run:"
      print $command
      asciinema rec --overwrite -c $'nu -c "\($"($theme) | get background | str replace '#' ''")\"' ./conversions/($theme_name).cast

      let theme_fg_bg = {
        background: (nu -c $command)
        foreground: (nu -c $command)
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

def "preview generate screenshots" [screenshot_method, themes, theme_count = 10_000] {
  use ../../stdlib-candidate-archive/stdlib-candidate-older/std-rfc/str/

  for $theme in $themes {

    let filename = "../screenshots" | path join $theme ".png"
  
    let script = $"
      #use .. *
      #source ($theme)
      #clear
      #sleep 100ms
      #print `Theme name: '($theme)'`
      #print -n \(preview theme small | table -e)
      #sleep 250ms
      (save_screenshot $screenshot_method $theme $themes)
      "

    # Run with default config
    # nu -n -c $script
    nu -n -c $"(save_screenshot $screenshot_method $theme $themes)"
  }
}

def "preview generate readme" [] {
  use ../../stdlib-candidate-archive/stdlib-candidate-older/std-rfc/str/

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
  use ../../stdlib-candidate-archive/stdlib-candidate-older/std-rfc/str/

  if $env.PWD != $env.FILE_PWD {
    "
      Please run this script from the directory where it resides using:

      nu preview-screenshot-script.nu
      "
    | str dedent
    | print -e $in

    return
  } else {
      let nu_themes = (
        "../nu-themes/"
        | path expand
        | path join "*.nu"
        | into glob
        | ls $in
      )

      # this is the file name of all the files in ../nu-themes
      let themes = $nu_themes | each { $in.name | path parse | get stem }

      mkdir ../screenshots
      preview generate screenshots $screenshot_method $themes
      preview generate readme
  }


  }

