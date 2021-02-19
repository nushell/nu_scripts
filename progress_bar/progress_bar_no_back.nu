let blocks = ["▏" "▎" "▍" "▌" "▋" "▊" "▉" "█"]
let pb_size = 25
echo $(ansi cursor_off)
echo 1..<$pb_size | each {
    let cur_size = $it
    echo 0..7 | each {
        let idx = $(= $it mod 8)
        let cur_block = $(echo $blocks | nth $idx)
        echo $cur_block | str lpad -c $blocks.7 -l $cur_size | autoview
        echo $(ansi -e '1000D') | autoview
        sleep 50ms
    }
}
echo $(char newline)
echo 'Done'
echo $(ansi cursor_on)

