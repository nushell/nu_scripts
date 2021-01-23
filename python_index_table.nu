# This is the python script
# import sys
# for i in range(0, 16):
#     for j in range(0, 16):
#         code = str(i * 16 + j)
#         sys.stdout.write(u"\u001b[38;5;" + code + "m " + code.ljust(4))
#     print u"\u001b[0m"


# Convert anything that's piped into it a string
def 'to str' [] {
    each { build-string $it } | str collect
}

# Foreground Colors
echo 0..16 | each {
    let i = $it
    let row = $(echo 0..16 | each {
        let j = $it
        let code = $(= $i * 16 + $j)
        if $code < 256 {
            echo [$(ansi -e '38;5;') $(echo $code | to str) 'm' $(echo $code | to str | str lpad -l 4 -c ' ')] | str collect
        } {} # Do nothing in the else
    } | str collect)
    echo [$row $(char newline)] | str collect
} | str collect

# Background Colors
echo 0..16 | each {
    let i = $it
    let row = $(echo 0..16 | each {
        let j = $it
        let code = $(= $i * 16 + $j)
        if $code < 256 {
            echo [$(ansi -e '48;5;') $(echo $code | to str) 'm' $(echo $code | to str | str lpad -l 4 -c ' ') $(ansi reset)] | str collect
        } {} # do nothing in the else
    } | str collect)
    echo [$row $(char newline)] | str collect
} | str collect
