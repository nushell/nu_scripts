let TICKS = ([(char -u "2581") 
              (char -u "2582") 
              (char -u "2583") 
              (char -u "2584") 
              (char -u "2585") 
              (char -u "2586") 
              (char -u "2587") 
              (char -u "2588")])

# send an array into spark and get a sparkline out
# let v = [2, 250, 670, 890, 2, 430, 11, 908, 123, 57]
# > spark $v
# ▁▂▆▇▁▄▁█▁▁

def spark [v: any] {
    let min = ($v | math min)
    let max = ($v | math max)
    let scale = (($max - $min) / 7.)
    for e in $v {
        let i = (($e - $min) / $scale | into int)
        $"($TICKS | nth $i)"
    } | str collect
}