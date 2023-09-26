# this script will print a blue gradient on the screen
# it's intended to simulate nushell v0.44 with autoview

let height = (term size).rows - 3 # calculate height
let width = (term size).columns - 5  # calculate width
let stamp_start = $width * 1.25 # calculate where to start Nu stamp
let stamp_end = $width * 1.3 # calculate where to stop Nu stamp
let stamp = 'Nu'
seq 0 $height | par-each {|| # create these in parallel
    let row_data = (seq 0 $width | each { |col|
        let fgcolor = 2 + 2 * $col
        if $fgcolor > $stamp_start and $fgcolor < $stamp_end {
            $"(ansi -e '48;2;0;0;')($fgcolor)m($stamp)(ansi -e '0m')"
        } else {
            $"(ansi -e '48;2;0;0;')($fgcolor)m (ansi -e '0m')"
        }
    } | str join)
    print -n $"($row_data)" | table
    null
} | compact
