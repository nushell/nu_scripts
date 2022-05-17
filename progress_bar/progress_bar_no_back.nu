let blocks = ["▏" "▎" "▍" "▌" "▋" "▊" "▉" "█"]
let pb_size = 25
ansi cursor_off
1..<$pb_size | each { |cur_size|
    0..7 | each { |tick|
        let idx = ($tick mod 8)
        let cur_block = ($blocks | get $idx)
        print -n $"(ansi -e '1000D')($cur_block | str lpad -c $blocks.7 -l $cur_size)"
        # sleep 1ms
    }
}
char newline
'Done'
ansi cursor_on

