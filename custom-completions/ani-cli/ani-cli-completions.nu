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

# Anime Search and Streaming Tool
export extern ani-cli [
  string?
  --quality (-q): int@qualities          # Specify video quality
  --syncplay (-s)                        # Use Syncplay to watch with friends
  --fzf (-f)                             # Use FZF for selection
  --episode (-e): string@episodes        # Specify episode number
  --download (-d)                        # Download the episode instead of playing it
  --path (-p): string                    # Download episode to a specified directory
  --continue (-c)                        # Continue watching from history
  --help (-h)                            # Show help text
  --delete (-D)                          # Delete history
  --log-view (-l)                        # Show logs
  --update (-U)                          # Update the script
  --version (-V)                         # Show the version of the script
  --range (-r): string@ranges            # Specify range number
  --skip                                 # Use ani-skip to skip intros (mpv only)
  --dub                                  # Play dubbed version
  --rofi                                 # Use rofi instead of fzf for menu
  --no-detach                            # Don't detach the player (mpv only)
  --exit-after-play                      # Exit after playing (mpv only)
  --skip-title: string                   # Use the given title for ani-skip query
  --nextep-countdown (-N)                # Display a countdown to the next episode
]
