# Function to construct bars based on a given percentage of width
def 'bar' [
    percentage: float
    width: int = 5
    --foreground (-f): string = 'default'
    --background (-b): string = 'default'
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

    $"($whole_part)($fraction)" 
    | fill -c $' ' -w $width 
    | $"(ansi -e {fg: ($foreground), bg: ($background)})($in)(ansi reset)"
}