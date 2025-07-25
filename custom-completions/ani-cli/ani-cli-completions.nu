# author: HirschBerge
# inspired by DWTW

def qualities [] {
  [ "worst", "360p", "480p", "720p", "1080p", "4K", "best" ]
}
def episodes [] {
  [ "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13" ]
}
def ranges [] {
  [ "1-5", "5-10", "1-13", "14-26", "1-26" ]
}

# Watch anime from the commandline.
#
# A shell script to browse and search anime from the command-line.
# This tool scrapes the site allanime.
# ani-cli without options defaults to iina on macOS, flatpak mpv on Steamdeck,
# mpv apk on android, vlc on iOS and mpv media player everywhere else.
export extern ani-cli [
  query?: string

  --quality (-q): string@qualities
  # Specify the video quality

  --syncplay (-s)
  # Use Syncplay to watch with friends (mpv only)

  --episode (-e): string@episodes
  # Specify the episode number to watch

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

  --range (-r): string@ranges
  # Specify the episode numbers to watch

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

  --skip-title: string
  # Use given title as ani-skip query

  --nextep-countdown (-N)
  # Display a countdown to the next episode

  --vlc (-v)
  # Use VLC as the media player

  --select-nth (-S): int
  # Selects nth entry
]
