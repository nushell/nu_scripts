def loading [] {
    echo Loading $(char newline) | str collect | autoview
    echo 0..100 | each {
        sleep 50ms
        #hide_cursor
        # I believe '1000D' means move the cursor to the left 1000 columns
        echo $(ansi -e '1000D') | autoview
        echo $(build-string $it '%') | autoview
    }
    #show_cursor
}

def show_cursor [] {
    echo $(ansi -e '?25h') | autoview
}

def hide_cursor [] {
    echo $(ansi -e '?25l') | autoview
}

hide_cursor
loading
show_cursor