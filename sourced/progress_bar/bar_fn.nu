# Function to construct bars based on a given percentage of width
def 'bar' [
    percentage: float
    --background (-b): string = 'default'
    --foreground (-f): string = 'default'
    --progress  # output the result using 'print -n'
    --width: int = 5
] {
    let blocks = [null "▏" "▎" "▍" "▌" "▋" "▊" "▉" "█"]
    let $whole_part = (($blocks | last) * ($percentage * $width // 1))
    let $fraction = (
        $blocks 
        | get (
            ($percentage * $width) mod 1 
            | $in * ($blocks | length) 
            | math floor
        )
    )

    let result = (
        $"($whole_part)($fraction)" 
        | fill -c $' ' -w $width 
        | $"(ansi -e {fg: ($foreground), bg: ($background)})($in)(ansi reset)"
    )

    if $progress {
        print -n $"($result)\r"
    } else {
        $result
    }
}