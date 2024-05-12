# this script will print a blue gradient on the screen

# We can get the terminal width and height now with term size
# but we like to use the script as a benchmark, so let's keep
# it a constant size for now
let height = 40 # really need to get the terminal height here
let width = 160  # really need to get the terminal width here
let stamp = 'Nu'

def iter_inc [incr mult iter] {
    $incr + $mult * $iter
}

seq 0 $height | each {
    let row_data = (seq 0 $width | each { |col|
        let fgcolor = (iter_inc 2 2 $col)
        if $fgcolor > 200 and $fgcolor < 210 {
            $"(ansi -e '48;2;0;0;')($fgcolor)m($stamp)(ansi -e '0m')"
        } else {
            $"(ansi -e '48;2;0;0;')($fgcolor)m(char sp)(ansi -e '0m')"
        }
    } | str join)
    $"($row_data)(char newline)"
} | str join


# python:
#
# #!/usr/bin/env python
# from colors import *
#
# def iter_inc(incr, mult, it):
#     return incr + mult * it
#
# height = 40
# width = 160
# stamp = "py"
#
# for line in range(0, height):
#     row_data = ""
#
#     for col in range(0, width):
#         fgcolor = iter_inc(2, 2, col)
#         if fgcolor > 200 and fgcolor < 210:
#             row_data = row_data + color(stamp, bg='rgb(0, 0, %d)' % fgcolor)
#         else:
#             fg = fgcolor % 256
#             row_data = row_data + color(' ', bg='rgb(0, 0, %d)' % fg)
#
#     print(row_data)


# powershell:

# function Set-Cursor {
#     [CmdletBinding()]
#     param ([int] $x, [int] $y)
#     $Host.UI.RawUI.CursorPosition = @{x = $x; y = $y }
# }
#
# function Get-Character {
#     [CmdletBinding()]
#     param ([int]$index)
#     $mystring = '                   Trevor Sullivan'
#     return $index -ge ($mystring.Length) ? ' ' : $mystring[$index]
# }
#
# function main {
#
#     for ($y = 0; $y -le ($host.ui.RawUI.BufferSize.Height - 1); $y++) {
#         $Color = 25
#         Set-Cursor -x $PSItem -y $y
#         0..($Host.UI.RawUI.BufferSize.Width - 1) | ForEach-Object {
#             Write-Host -Object ("`e[48;2;0;0;$Color`m{0}" -f (Get-Character -Index $PSItem)) -NoNewline
#             $Color += 2
#         }
#     }
#     Start-Sleep -Seconds 5
# }
#
# main

