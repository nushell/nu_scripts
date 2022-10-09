# authour: DWTW

def videoQuality [] {
  [ "best", "worst", "360", "480", "720", "1080" ]
}

# Collaborative cheatsheets for console commands
export extern "ani-cli" [
  string?
  -q: string@videoQuality        # Set video quality
  -s                             # Watch using Syncplay
  -f                             # Use FZF for selection
  -a                             # Specify episode
  -d                             # Download episode
  -p                             # Download episode to specified directory
  -c                             # Continue watching anime from history
  -h                             # Show help text
  -D                             # Delete history
  -U                             # Fetch update from github
  -V                             # Print version number
  -r                             # Select provider
  -x                             # Print all video links
]
