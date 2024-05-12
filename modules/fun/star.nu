# i found this script on a github issue and wanted to see what nushell would do.
# https://github.com/microsoft/terminal/issues/11794

#########################################################
# here's the python version from that issue
#########################################################
# import math
# import os
# import sys

# size = os.popen('stty size', 'r').read().split()
# h,w = tuple(int(n) for n in size)
# mx = w//2
# my = h//2

# def frame(i):
#   s = '\033[H'
#   for y in range(h):
#     for x in range(w):
#       dy,dx = y-my,x-mx
#       a = math.atan2(dy*2,dx) + math.pi
#       c = (int(a/math.pi*127)+i)%256
#       s += '\033[38;2;%d;%d;%dm*' % (c,c,c)
#   return s

# sys.stdout.write('Generating content...\n')
# s = '\033[?25l'
# for i in range(512):
#   s += frame(i)
# s += '\033[?25h\033[m\033[H'

# sys.stdout.write('Starting animation...\n')
# sys.stdout.write(s)

#########################################################
# here's the c version from that issue
#########################################################
# #include <windows.h>
# #include <string>
# #include <cmath>

# void main()
# {
#   HANDLE handle = GetStdHandle(STD_OUTPUT_HANDLE);

#   DWORD mode;
#   GetConsoleMode(handle, &mode);
#   mode |= ENABLE_VIRTUAL_TERMINAL_PROCESSING;
#   SetConsoleMode(handle, mode);

#   CONSOLE_SCREEN_BUFFER_INFOEX csbie;
#   csbie.cbSize = sizeof(csbie);
#   GetConsoleScreenBufferInfoEx(handle, &csbie);

#   const auto w = csbie.dwSize.X;
#   const auto h = csbie.srWindow.Bottom - csbie.srWindow.Top + 1;
#   const auto mx = w/2;
#   const auto my = h/2;
#   const auto pi = 3.14159265358979323846;

#   printf("Generating content...\n");
#   std::string s = "\033[?25l";
#   for (auto i = 0; i < 512; i++) {
#     s += "\033[H";
#     for (auto y = 0; y < h; y++) {
#       for (auto x = 0; x < w; x++) {
#         auto dy = y-my;
#         auto dx = x-mx;
#         auto a = std::atan2(dy*2,dx) + pi;
#         auto c = std::to_string((int(a/pi*127)+i)%256);
#         s += "\033[38;2;"+c+";"+c+";"+c+"m*";
#       }
#     }
#   }
#   s += "\033[?25h\033[m\033[H";

#   printf("Starting animation...\n");
#   DWORD written = 0;
#   WriteConsoleA(handle, s.c_str(), s.length(), &written, NULL);
# }


use std math

def atan2 [y x] {
    if $x > 0 {
        $y / $x | math arctan
    } else if $x < 0 {
        if $y >= 0 {
            $math.PI + ($y / $x | math arctan)
        } else {
            -1 * $math.PI + ($y / $x | math arctan)
        }
    } else {
        if $y >= 0 {
            $math.PI / 2
        } else {
            -1 * $math.PI / 2
        }
    }
}

let w = 50
let h = 20
# if it's fast for your, change w, h to the below lines
# let w = (term size).columns - 2
# let h = (term size).rows - 2
let mx = ($w / 2 | math floor)
let my = ($h / 2 | math floor)

print (ansi -e "?25l")

for i in 0..512 {
    let rows = (0..($h) | each  {|y|
         let cols = (0..($w) | each  {|x|
            let dy = ($y - $my)
            let dx = ($x - $mx)
            let a = (atan2 ($dy * 2) $dx) + $math.PI
            let c = ((($a / ($math.PI) * 127) + ($i)) mod 256 | math round)
            $"(ansi -e '38;2;')($c);($c);($c)m*"
        })
        $cols | str join
    })
   print ((ansi -e 'H') + ($rows | str join (char nl)))
}

print $"(ansi -e '?25h')(ansi -e 'm')(ansi -e 'H')"
