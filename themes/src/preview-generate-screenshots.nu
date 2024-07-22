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

def save_screenshot [ method, filename ] {
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
        $Host.UI.RawUI.WindowTitle = 'Theme Preview'
        Add-Type -AssemblyName System.Windows.Forms
        [Windows.Forms.Sendkeys]::SendWait\('%{Prtsc}')
        [Windows.Forms.Sendkeys]::SendWait\('%{Prtsc}')
        [Windows.Forms.Sendkeys]::SendWait\('%{Prtsc}')
        sleep 1
        [Windows.Forms.Clipboard]::GetImage\().Save\('($filename)', [System.Drawing.Imaging.ImageFormat]::Png)
      "
    | str dedent

      $"powershell.exe -c \"
      ($ps_script)
      \""
    }

    # Requires MiniCap, a utility for capturing screenshots on Windows
    "minicap" => {
      $'c:\\apps\\MiniCap\\MiniCap.exe -captureactivewin -bordershadow -save ($filename) -closeapp -exit'
    } 
  }

}

def "preview generate screenshots" [theme_count = 10_000] {
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
        use .. *
        source ($name)
        clear
        sleep 100ms
        print `Theme name: '($basename)'`
        print -n \(preview theme small | table -e)
        sleep 250ms
        (save_screenshot "powershell" $filename)
        "

      # Run with default config
      nu -n -c $script
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

def main [] {
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
    preview generate screenshots
    preview generate readme
  }
}