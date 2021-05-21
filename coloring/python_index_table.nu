# This is the python script
# import sys
# for i in range(0, 16):
#     for j in range(0, 16):
#         code = str(i * 16 + j)
#         sys.stdout.write(u"\u001b[38;5;" + code + "m " + code.ljust(4))
#     print u"\u001b[0m"

# Foreground Colors
echo 0..16 | each { |col|
    let row = (echo 0..16 | each { |row|
        let code = ($col * 16 + $row)
        if $code < 256 {
            $"(ansi -e '38;5;')($code | into string)m($code | into string | str lpad -l 4 -c ' ')(ansi reset)"
        } {} # Do nothing in the else
    } | str collect)
    $"($row)(char newline)"
} | str collect

# Background Colors
echo 0..16 | each { |col|
    let row = (echo 0..16 | each { |row|
        let code = ($col * 16 + $row)
        if $code < 256 {
            $"(ansi -e '48;5;')($code | into string)m($code | into string | str lpad -l 4 -c ' ')(ansi reset)"
        } {} # do nothing in the else
    } | str collect)
    $"($row)(char newline)"
} | str collect
