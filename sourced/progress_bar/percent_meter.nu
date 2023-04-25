def loading [] {
    print -n $"Loading (char newline)"
    0..100 | each { |tick|
        sleep 50ms
        # I believe '1000D' means move the cursor to the left 1000 columns
        print -n $"(ansi -e '1000D')($tick)%"
    }
    #show_cursor
}

def show_cursor [] {
    print $"(ansi -e '?25h')"
}

def hide_cursor [] {
    print $"(ansi -e '?25l')"
}

def demo_percent_meter [] {
    hide_cursor
    loading
    show_cursor
}