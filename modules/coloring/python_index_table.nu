# This is the python script
# import sys
# for i in range(0, 16):
#     for j in range(0, 16):
#         code = str(i * 16 + j)
#         sys.stdout.write(u"\u001b[38;5;" + code + "m " + code.ljust(4))
#     print u"\u001b[0m"

# Foreground Colors
print (0..16 | each { |col|
    let row = (echo 0..16 | each { |row|
        let code = ($col * 16 + $row)
        if $code < 256 {
            $"(ansi -e '38;5;')($code | into string)m($code | into string | fill -a l -w 4 -c ' ')(ansi reset)"
        }
    } | str join)
    $"($row)(char newline)"
} | str join)

# Background Colors
print (0..16 | each { |col|
    let row = (echo 0..16 | each { |row|
        let code = ($col * 16 + $row)
        if $code < 256 {
            $"(ansi -e '48;5;')($code | into string)m($code | into string | fill -a l -w 4 -c ' ')(ansi reset)"
        }
    } | str join)
    $"($row)(char newline)"
} | str join)
