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
  let end = (($end - $start) / (($blocks_per_line) * $block_length)) | math round
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


# bash:

# #!/bin/bash
#
# # Tom Hale, 2016. MIT Licence.
# # Print out 256 colours, with each number printed in its corresponding colour
# # See http://askubuntu.com/questions/821157/print-a-256-color-test-pattern-in-the-terminal/821163#821163
#
# set -eu # Fail on errors or undeclared variables
#
# printable_colours=256
#
# # Return a colour that contrasts with the given colour
# # Bash only does integer division, so keep it integral
# function contrast_colour {
#     local r g b luminance
#     colour="$1"
#
#     if (( colour < 16 )); then # Initial 16 ANSI colours
#         (( colour == 0 )) && printf "15" || printf "0"
#         return
#     fi
#
#     # Greyscale # rgb_R = rgb_G = rgb_B = (number - 232) * 10 + 8
#     if (( colour > 231 )); then # Greyscale ramp
#         (( colour < 244 )) && printf "15" || printf "0"
#         return
#     fi
#
#     # All other colours:
#     # 6x6x6 colour cube = 16 + 36*R + 6*G + B  # Where RGB are [0..5]
#     # See http://stackoverflow.com/a/27165165/5353461
#
#     # r=$(( (colour-16) / 36 ))
#     g=$(( ((colour-16) % 36) / 6 ))
#     # b=$(( (colour-16) % 6 ))
#
#     # If luminance is bright, print number in black, white otherwise.
#     # Green contributes 587/1000 to human perceived luminance - ITU R-REC-BT.601
#     (( g > 2)) && printf "0" || printf "15"
#     return
#
#     # Uncomment the below for more precise luminance calculations
#
#     # # Calculate percieved brightness
#     # # See https://www.w3.org/TR/AERT#color-contrast
#     # # and http://www.itu.int/rec/R-REC-BT.601
#     # # Luminance is in range 0..5000 as each value is 0..5
#     # luminance=$(( (r * 299) + (g * 587) + (b * 114) ))
#     # (( $luminance > 2500 )) && printf "0" || printf "15"
# }
#
# # Print a coloured block with the number of that colour
# function print_colour {
#     local colour="$1" contrast
#     contrast=$(contrast_colour "$1")
#     printf "\e[48;5;%sm" "$colour"                # Start block of colour
#     printf "\e[38;5;%sm%3d" "$contrast" "$colour" # In contrast, print number
#     printf "\e[0m "                               # Reset colour
# }
#
# # Starting at $1, print a run of $2 colours
# function print_run {
#     local i
#     for (( i = "$1"; i < "$1" + "$2" && i < printable_colours; i++ )) do
#         print_colour "$i"
#     done
#     printf "  "
# }
#
# # Print blocks of colours
# function print_blocks {
#     local start="$1" i
#     local end="$2" # inclusive
#     local block_cols="$3"
#     local block_rows="$4"
#     local blocks_per_line="$5"
#     local block_length=$((block_cols * block_rows))
#
#     # Print sets of blocks
#     for (( i = start; i <= end; i += (blocks_per_line-1) * block_length )) do
#         printf "\n" # Space before each set of blocks
#         # For each block row
#         for (( row = 0; row < block_rows; row++ )) do
#             # Print block columns for all blocks on the line
#             for (( block = 0; block < blocks_per_line; block++ )) do
#                 print_run $(( i + (block * block_length) )) "$block_cols"
#             done
#             (( i += block_cols )) # Prepare to print the next row
#             printf "\n"
#         done
#     done
# }
#
# print_run 0 16 # The first 16 colours are spread over the whole spectrum
# printf "\n"
# print_blocks 16 231 6 6 3 # 6x6x6 colour cube between 16 and 231 inclusive
# print_blocks 232 255 12 2 1 # Not 50, but 24 Shades of Grey
