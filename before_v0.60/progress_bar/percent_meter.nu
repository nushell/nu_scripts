def loading [] {
    $"Loading (char newline)" | autoview
    echo 0..100 | each { |tick|
        sleep 50ms
        # I believe '1000D' means move the cursor to the left 1000 columns
        $"(ansi -e '1000D')" | autoview
        $"($tick)%" | autoview
    }
    #show_cursor
}

def show_cursor [] {
    $"(ansi -e '?25h')" | autoview
}

def hide_cursor [] {
    $"(ansi -e '?25l')" | autoview
}

hide_cursor
loading
show_cursor