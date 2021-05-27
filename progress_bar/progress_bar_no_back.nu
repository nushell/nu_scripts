let blocks = ["▏" "▎" "▍" "▌" "▋" "▊" "▉" "█"]
let pb_size = 25
ansi cursor_off
echo 1..<$pb_size | each { |cur_size|
    echo 0..7 | each { |tick|
        let idx = ($tick mod 8)
        let cur_block = (echo $blocks | nth $idx)
        $"($cur_block | str lpad -c $blocks.7 -l $cur_size)" | autoview
        $"(ansi -e '1000D')" | autoview
        sleep 5ms
    }
}
char newline
'Done'
ansi cursor_on

