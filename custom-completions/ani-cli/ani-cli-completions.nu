# author: HirschBerge
# inspired by DWTW

def videoQuality [] {
  [ "worst", "360p", "480p", "720p", "1080p", "4K", "best" ]
}
def common_episodes [] {
  [ "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13" ]
}
def common_ranges [] {
  [ "1-5", "5-10", "1-13", "14-26", "1-26" ]
}

# Anime Search and Streaming Tool
export extern "ani-cli" [
  string?
  -q: int@videoQuality              # Specify video quality
  --quality: int@videoQuality       # Specify video quality
  -s                                # Use Syncplay to watch with friends
  --syncplay                        # Use Syncplay to watch with friends
  -f                                # Use FZF for selection
  --fzf                             # Use FZF for selection
  -e: string@common_episodes        # Specify episode number
  --episode: string@common_episodes # Specify episode number
  -d                                # Download the episode instead of playing it
  --download                        # Download the episode instead of playing it
  -p                                # Download episode to a specified directory
  --path: string                    # Download episode to a specified directory
  -c                                # Continue watching from history
  --continue                        # Continue watching from history
  -h                                # Show help text
  --help                            # Show help text
  -D                                # Delete history
  --delete                          # Delete history
  -l                                # Show logs
  --log-view                        # Show logs
  -U                                # Update the script
  --update                          # Update the script
  -V                                # Show the version of the script
  --version                         # Show the version of the script
  -r: string@common_ranges          # Specify range number
  --range: string@common_ranges     # Specify range number
  --skip                            # Use ani-skip to skip intros (mpv only)
  --dub                             # Play dubbed version
  --rofi                            # Use rofi instead of fzf for menu
  --no-detach                       # Don't detach the player (mpv only)
  --exit-after-play                 # Exit after playing (mpv only)
  --skip-title: string              # Use the given title for ani-skip query
  -N                                # Display a countdown to the next episode
  --nextep-countdown                # Display a countdown to the next episode
]
