# https://iterm2.com/documentation-images.html
# https://sw.kovidgoyal.net/kitty/graphics-protocol/

def is-screen-term [] {
  $env.TERM =~ ^screen
}

def print_osc [] {
  if (is-screen-term) {
    return "\ePtmux;\e\e]"
  }
  ansi escape_right
}

def print_st [] {
  if (is-screen-term) {
    return "\a\e\\"
  }
  "\a"
}

def b64_encode [fn] {
  open -r $fn | encode base64
}

# Print an image using the iTerm protocol
def print_iterm_image [
  filename: path
  base64contents: string
  --inline
  --print_filename
] {
  let b64_enc_data = (b64_encode $filename)
  let b64_dec_data = ($base64contents | decode base64)
  let query = (
    [(print_osc)]
    | append "1337;File="
    | append (
      if ($filename | str length) > 0 {
        $"name=($b64_enc_data);"
      }
    )
    | append $"size=($b64_dec_data | bytes length)"
    | append (
      if $inline {
        $";inline=1"
      }
    )
    | append ":"
    | append $base64contents
    | append (print_st)
    | append "\n"
  )

  if $print_filename {
    print -n $filename
  }

  $query | str join
}

# Print an image using the Kitty protocol
def print_kitty_image [
  filename: path
  base64contents: string
  --print_filename
] {

  let b64_dec_data = ($base64contents | decode base64)
  let size = ($b64_dec_data | bytes length)

  let result = (
    ["\e"]
    | append "_G"
    | append $"a=T,f=100,t=d,s=($size);"
    | append $base64contents
    | append (ansi st)
  )

  if $print_filename {
    print -n $filename
  }

  $result | str join
}

# Determine the appropriate protocol and print the image
def print_image [
  filename: path
  base64contents: string
  --inline # Only for iTerm; ignored for Kitty
  --print_filename
] {
  if (detect_kitty_support) {
    print_kitty_image $filename $base64contents --print_filename=$print_filename
  } else {
    print_iterm_image $filename $base64contents --inline=$inline --print_filename=$print_filename
  }
}

def error [] {
  print "Error: ($env.LAST_EXIT_CODE)"
}

def show_help [] {
  print "Usage: imgcat [-p] filename ..."
  print "   or: cat filename | imgcat"
}

# Detect Kitty support by querying the terminal
# https://sw.kovidgoyal.net/kitty/graphics-protocol/#querying-support-and-available-transmission-mediums
def detect_kitty_support [] {
  let is_kitty_supported = $"(ansi esc)_Gi=1234,s=1,v=1,a=q,t=d,f=24;AAAA(ansi st)"
  return (term query $is_kitty_supported --terminator (ansi st) | "OK" in ($in | decode))
}

export def detected [] {
  print $"Kitty support: (detect_kitty_support)"
  print $"Is Screen term: (is-screen-term)"
}

# imgcat.nu shows images in your terminal if your terminal supports it
# it uses either the Iterm or the Kitty protocol
export def main [
  --help (-h) # Help/Usage message
  --print (-p) # Print filename
  --url (-u) # Use a URL
  --inline (-i) # Inline image (only for iTerm; ignored for Kitty)
  filename # The filename to show
] {
  if $help {
    show_help
  }

  let url_img = (
    if $url {
      let encoded_image = (b64_encode (http get $url))
      print_image $url $encoded_image --inline=$inline --print_filename=$print
    }
  )

  if ($filename | path exists) {
    let filename = ($filename | path expand)
    print_image $filename (b64_encode $filename) --inline=$inline --print_filename=$print
  } else {
    print $"imgcat: ($filename): No such file or directory"
  }
}
