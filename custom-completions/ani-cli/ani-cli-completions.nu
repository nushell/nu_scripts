# Custom completions for ani-cli 4.10.0

const qualities = [
    best
    worst
    '360'
    '480'
    '720'
    '1080'
]

const limit = 24

def qualities [] { {
    options:     { sort: false }
    completions: $qualities
} }

def episodes [] { {
    options:     { sort: false }
    completions: (1..$limit | into string)
} }

def ranges [] { {
    options: { sort: false }
    completions: (
        1..$limit | each {
            |start| $start..$limit | each {
                |end| if $start != $end {
                    $'($start)-($end)'
                }
            }
        } | flatten
    )
} }

# Watch anime from the commandline.
#
# A shell script to browse and search anime from the command-line.
# This tool scrapes the site allanime.
# ani-cli without options defaults to iina on macOS, flatpak mpv on Steamdeck,
# mpv apk on android, vlc on iOS and mpv media player everywhere else.
@search-terms anime
@category network
@example "Search for 'banana fish' in 720p" {
    ani-cli -q 720 banana fish
}
@example "Search for 'one piece', select 2nd entry and skip the intro" {
    ani-cli --skip --skip-title "one piece" -S 2 one piece
}
@example "Search for 'cyberpunk edgerunners' and download 2nd episode" {
    ani-cli -d -e 2 cyberpunk edgerunners
}
@example "Search for 'cyberpunk edgerunners' 4th episode with VLC in 1080p" {
    ani-cli --vlc cyberpunk edgerunners -q 1080 -e 4
}
@example "Search for 'blue lock' 5th and 6th episodes" {
    ani-cli blue lock -e 5-6
}
@example "Search for 'blue lock' 5th and 6th episodes" {
    ani-cli -e "5 6" blue lock
}
export extern ani-cli [
    ...query: string

    --quality (-q): string@qualities
    # Specify the video quality

    --episode (-e): string@episodes
    # Specify the episode number to watch

    --range (-r): string@ranges
    # Specify the episode numbers to watch

    --select-nth (-S): int
    # Selects nth entry

    --skip-title: string
    # Use given title as ani-skip query

    --syncplay (-s)
    # Use Syncplay to watch with friends (mpv only)

    --download (-d)
    # Download the video instead of playing it

    --continue (-c)
    # Continue watching from history

    --help (-h)
    # Show summary of options

    --delete (-D)
    # Delete history

    --logview (-l)
    # Show logs

    --update (-U)
    # Update the script

    --version (-V)
    # Show the version of the script

    --nextep-countdown (-N)
    # Display a countdown to the next episode

    --vlc (-v)
    # Use VLC as the media player

    --skip
    # Use ani-skip to skip the intro of the episode (mpv only)

    --dub
    # Play the dubbed version

    --rofi
    # Use rofi instead of fzf for the interactive menu

    --no-detach
    # Don't detach the player (mpv only)

    --exit-after-play
    # Exit after playing, and return player exit code (mpv only)
]
