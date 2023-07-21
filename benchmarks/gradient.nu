# height = 40
# width = 160
# stamp = "py"

# for line in range(0, height):
#     row_data = ""

#     for col in range(0, width):
#         fgcolor = 2 + 2 * col
#         if fgcolor > 200 and fgcolor < 210:
#             row_data = row_data + color(stamp, bg='rgb(0, 0, %d)' % fgcolor)
#         else:
#             fg = fgcolor % 256
#             row_data = row_data + color(' ', bg='rgb(0, 0, %d)' % fg)

#     print(row_data)

const height = 40
const width = 160
const stamp = "Nu"

for line in 0..$height {
    mut row_data = ""

    for col in 0..$width {
        let fgcolor = 2 + 2 * $col

        if $fgcolor > 200 and $fgcolor < 210 {
            $row_data += $"(ansi -e '48;2;0;0;')($fgcolor)m($stamp)(ansi -e '0m')"
        } else {
            let fg = $fgcolor mod 256
            $row_data += $"(ansi -e '48;2;0;0;')($fg)m (ansi -e '0m')"
        }
    }

    print $row_data
}