def alive [x-pos: int, y-pos: int, $grid] {
    let width = ($grid | get width)
    let height = ($grid | get height)
    let data = ($grid | get data)

    let $left-x = (if $x-pos == 0 { $width - 1} { $x-pos - 1})
    let $right-x = (if $x-pos == ($width - 1) { 0 } { $x-pos + 1})
    let $up-y = (if $y-pos == 0 { $height - 1} { $y-pos - 1})
    let $down-y = (if $y-pos == ($height - 1) { 0 } { $y-pos + 1})

    let $n = ($data | nth ($x-pos + $up-y * $width) | into int)
    let $nw = ($data | nth ($left-x + $up-y * $width) | into int)
    let $w = ($data | nth ($left-x + $y-pos * $width) | into int)
    let $sw = ($data | nth ($left-x + $down-y * $width) | into int)
    let $s = ($data | nth ($x-pos + $down-y * $width) | into int)
    let $se = ($data | nth ($right-x + $down-y * $width) | into int)
    let $e = ($data | nth ($right-x + $y-pos * $width) | into int)
    let $ne = ($data | nth ($right-x + $up-y * $width) | into int)

    let total = $n + $nw + $w + $sw + $s + $se + $e + $ne

    let $curr = ($data | nth ($x-pos + $y-pos * $width))

    if ($total == 3) or ($total == 2 and $curr) {
        $true
    } {
        $false
    }
}

def generation [$grid] {
    let width = ($grid | get width)
    let height = ($grid | get height)
    let data = ($grid | get data)

    let next-generation = (
        for y in 0..<$height {
            for x in 0..<$width {
                alive $x $y $grid
            }
        }
    )

    [[width, height, data]; [$width, $height, $next-generation]]
}

def print-grid [$grid] {
    $grid.data | flatten | each group ($grid | get width) { |x|
        for item in $x {
            if $item {
                "*"
            } {
                "."
            }
        } | append (char nl) | str collect
    } | str collect
}

def main [] {
    let width = 15
    let height = 15

    let data = (for x in 0..<($width * $height) {
        random bool
    }) 

    let grid = [[width, height, data]; [$width, $height, $data]]

    echo (print-grid $grid)

    echo (char nl)

    echo 1..100 | reduce -f ($grid) {
        let next-grid = (generation $acc)
        echo $"(char -u '1b')[2J"
        echo (print-grid $next-grid)
        echo (char nl)
        $next-grid
    } | ignore
}

main