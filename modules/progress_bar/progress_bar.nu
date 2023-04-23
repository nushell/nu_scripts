# progress bar attempt
# https://askubuntu.com/questions/747143/create-a-progress-bar-in-bash
# https://www.shellscript.sh/tips/progressbar/

# There is a strange artifact drawing the first two full blocks
# You can see this artifact better in progress_bar_no_back.nu
# I'm not sure what's going on nor how to fix it.

let pb_len = 25
let bg_fill = "▒"  # Fill up to $pb_len
let blocks = ["▏" "▎" "▍" "▌" "▋" "▊" "▉" "█"]

# "█" #8/8
# "▉" #7/8
# "▊" #3/4
# "▋" #5/8
# "▌" #1/2
# "▍" #3/8
# "▎" #1/4
# "▏" #1/8

# Turn off the cursor
ansi cursor_off
# Move cursor all the way to the left
print -n $"(ansi -e '1000D')"
# Draw the background for the progress bar
print -n ($bg_fill | fill -c $bg_fill -w $pb_len -a r)

1..<$pb_len | each { |cur_progress|
    # This is kind of a hack because it's not incrementally drawing a new box
    # It's drawing the entire row every time with a different padding amount
    # echo $blocks.7 | fill --character $blocks.7 --width $it --align right

    0..7 | each { |tick|
        let cur_idx = ($tick mod 8)
        let cur_block = (echo $blocks | get $cur_idx)
        print -n $"(ansi -e '1000D')($cur_block | fill -c $blocks.7 -w $cur_progress -a r)"
        sleep 20ms
    }
    print -n $"(ansi -e '1000D')"
}
# Fill in the last background block
print $"($blocks.7 | fill -c $blocks.7 -w $pb_len -a r)"
"Done"
ansi cursor_on


# Try to do this in the next version
# Make it a custom command so you can do
# set-progress 33 100
# and the display look like
# 33% (33/100) [███████████                    ]