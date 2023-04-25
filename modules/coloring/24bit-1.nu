export def draw [] {
    let term_cols = ((term size).columns - 1)

    # let's itertate through each of the columns of our terminal
    0..$term_cols | each { |col|
        let r = (255 - ($col * 255 / $term_cols) | math round)
        let g = ($col * 510 / $term_cols | math round)
        let b = ($col * 255 / $term_cols | math round)
        if $g > 255 {
            let g = (510 - $g)
            build-colorstr $r $g $b $col
        } else {
            build-colorstr $r $g $b $col
        }
    } | str join
}

def build-colorstr [
    r:int # Red
    g:int # Green
    b:int # Blue
    c:int # Column
] {
    # Heavy use of string interpolation below
    let bg = $"(ansi rgb_bg)($r);($g);($b)m"
    let fg = $"(ansi rgb_fg)(255 - $r);(255 - $g);(255 - $b)m"
    let idx = ($c mod 2)
    let slash_str = (if $idx == 0 {
        $'/(ansi reset)'
    } else {
        $'\(ansi reset)'
    })
    $"($bg)($fg)($slash_str)"
    # sleep 10ms | ignore
}

draw