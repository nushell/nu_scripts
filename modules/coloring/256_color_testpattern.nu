def contrast_colour [ colour:int ] {
    # The first 16 colors
    if $colour < 16 {
        if $colour == 0 {
            15
        } else {
            0
        }
    } else {
      # The gray colors
      if $colour > 231 {
          if $colour < 244 {
              15
          } else {
              0
          }
      } else {
        # The rest
        let r = ($colour - 16) / 36
        let g = (($colour - 16) mod 36) / 6
        let b = ($colour - 16) mod 6

        let luminance = ($r * 299) + ($g * 587) + ($b * 114)
        if $luminance > 2500 {
            0
        } else {
            15
        }
      }
    }
}

def print_colour [ colour:int ] {
    let contrast = (contrast_colour $colour)
    let bg_color = $"(ansi idx_bg)($colour)m" # Start block of colour
    let fg_color = $"(ansi idx_fg)($contrast)m" # In contrast, print number
    let text = $"($colour | into string | fill -c ' ' -w 3 -a r)(ansi reset)"
    $bg_color + $fg_color + $text + " "
}

let printable_colours = 256

def print_run [start:int, amount:int] {
  $start..<($start + $amount) | each { |i|
    if $i < $printable_colours {
      print_colour $i
    } else {
      ""
    }
  } | append "  " | str join
}

def print_blocks [start:int, end:int, block_cols:int, block_rows:int, blocks_per_line:int] {
  let block_length = ($block_cols * $block_rows)
  let end = (($end - $start) / (($blocks_per_line) * $block_length))
    0..<$end | each { |i|
      0..<$block_rows | each { |row|
        0..<$blocks_per_line | each { |block|
        print_run ($start + $block * $block_length + $row * $block_cols + $i * $block_length * $blocks_per_line) $block_cols
      } | append (char nl) | str join
    } | str join
  } | str join
}

print (print_run 0 16) # The first 16 colours are spread over the whole spectrum
print ""             # Single line
print (print_blocks 16 123 6 6 3) # 6x6x6 colour cube between 16 and 123 inclusive
print (print_blocks 124 231 6 6 3) # 6x6x6 colour cube between 124 and 231 inclusive
print (print_blocks 232 255 12 2 1) # Not 50, but 24 Shades of Grey