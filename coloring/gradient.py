# this script will print a blue gradient on the screen
# this is a port of the gradient.nu script used for comparison

from colors import *

def iter_inc(incr, mult, it):
    return incr + mult * it

height = 40
width = 160
stamp = "py"

for line in range(0, height):
    row_data = ""

    for col in range(0, width):
        fgcolor = iter_inc(2, 2, col)
        if fgcolor > 200 and fgcolor < 210:
            row_data = row_data + color(stamp, bg='rgb(0, 0, %d)' % fgcolor)
        else:
            fg = fgcolor % 256
            row_data = row_data + color(' ', bg='rgb(0, 0, %d)' % fg)

    print(row_data)
