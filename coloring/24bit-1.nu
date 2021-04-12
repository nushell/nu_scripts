let term_cols = $(= $(term size -w) - 1)

echo 0..$term_cols |
each {
    let r = $(= 255 - ($it * 255 / $term_cols) | math round)
    let g = $(= $it * 510 / $term_cols | math round)
    let b = $(= $it * 255 / $term_cols | math round)
    if $g > 255 {
        let g = $(= 510 - $g)
        echo $(build-colorstr $r $g $b) | autoview
    } {
        echo $(build-colorstr $r $g $b) | autoview
    }
}

def build-colorstr [
    r:int # Red
    g:int # Green
    b:int # Blue
] {
    # log $(build-string "R=" $r " G=" $g " B=" $b)
    let bg = $(build-string $(ansi rgb_bg) $r ';' $g ';' $b 'm')
    let fg = $(build-string $(ansi rgb_fg) $(= 255 - $r) ';' $(= 255 - $g) ';' $(= 255 - $b) 'm')
    let idx = $(= $it mod 2)
    let slash_str = $(if $idx == 0 {
        build-string "/" $(ansi reset)
    } {
        build-string "\" $(ansi reset)
    })
    build-string $bg $fg $slash_str
    # log $(build-string $bg $fg $slash_str | debug)
}

# This is a first attempt and some type of logging
def log [message:any] {
    let now = $(date now | date format '%Y%m%d_%H%M%S.%f')
    let mess = $(build-string $now '|DBG|' $message $(char newline))
    echo $mess | autoview
}