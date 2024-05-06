def alive [x_pos: int, y_pos: int, $grid] {
    let width = ($grid | get width)
    let height = ($grid | get height)
    let data = ($grid | get data)

    let $left_x = (if $x_pos == 0 { $width - 1} else { $x_pos - 1})
    let $right_x = (if $x_pos == ($width - 1) { 0 } else { $x_pos + 1})
    let $up_y = (if $y_pos == 0 { $height - 1} else { $y_pos - 1})
    let $down_y = (if $y_pos == ($height - 1) { 0 } else { $y_pos + 1})
    let $n = ($data | get ($x_pos + $up_y * $width) | into int)
    let $nw = ($data | get ($left_x + $up_y * $width) | into int)
    let $w = ($data | get ($left_x + $y_pos * $width) | into int)
    let $sw = ($data | get ($left_x + $down_y * $width) | into int)
    let $s = ($data | get ($x_pos + $down_y * $width) | into int)
    let $se = ($data | get ($right_x + $down_y * $width) | into int)
    let $e = ($data | get ($right_x + $y_pos * $width) | into int)
    let $ne = ($data | get ($right_x + $up_y * $width) | into int)

    let total = $n + $nw + $w + $sw + $s + $se + $e + $ne

    let $curr = ($data | get ($x_pos + $y_pos * $width))

    if ($total == 3) or ($total == 2 and $curr) {
        true
    } else {
        false
    }
}

def generation [$grid] {
    let width = ($grid | get width)
    let height = ($grid | get height)
    let data = ($grid | get data)

    let next_generation = (
         0..<$height | each {|y|
             0..<$width | each {|x|
                alive $x $y $grid
            }
        }
    ) | flatten
    { width: $width, height : $height, data: $next_generation }
}

def print-grid [$grid] {
    $grid.data | flatten | group ($grid | get width) | each {|x|
        $x | each {|item|
            if $item {
                "*"
            } else {
                "."
            }
        } | append (char nl) | str join
    } | str join ""
}

def main [] {
    let width = 15
    let height = 15

    let data = (0..<($width * $height) | each {
        random bool
    }) 

    let grid = { width: $width, height : $height, data: $data }

    print (print-grid $grid)

    1..100 | reduce --fold ($grid) {|it acc|
        let next_grid = (generation $acc)
        print $"(char -u '1b')[2J" (print-grid $next_grid)
        $next_grid
    } | ignore
}

