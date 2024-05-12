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

