# progress bar attempt - not 100% yet
# https://askubuntu.com/questions/747143/create-a-progress-bar-in-bash
# https://www.shellscript.sh/tips/progressbar/



let fill = "▒"                    # Fill up to $Len
let arr = [ "▉" "▎" "▌" "▊" ]     # UTF-8 left blocks: 7/8, 1/4, 1/2, 3/4
let pb_len = 10

echo $(ansi cursor_off)

#Move cursor all the way to the left
echo $(ansi -e '1000D') | autoview
echo $fill | str lpad -c $fill -l $pb_len
echo 1..$pb_len | each {
    sleep 50ms
    echo $arr.0 | str lpad -c $arr.0 -l $it | autoview
    echo $(ansi -e '1000D') | autoview
}
echo $(char newline)
echo $(ansi cursor_on)