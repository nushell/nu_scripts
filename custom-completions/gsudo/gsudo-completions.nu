# authour: DWTW

def gsudoIntegrity [] {
  [ "Untrusted", "Low", "Medium", "MediumPlus", "High", "default", "System" ]
}

def gsudoLoglevel [] {
  [ "All", "Debug", "Info", "Warning", "Error", "None" ]
}


# A sudo for windows
export extern "gsudo" [
  string?
  --new(-n)                                 # Starts command in new console
  --wait(-w)                                # Force wait for command to exit
  --integrity(-i): string@gsudoIntegrity    # Specify integrity level
  --reset-timestamp(-k)                     # Kills all cached credentials
  --system(-s)                              # Run as Local System Account
  --direct(-d)                              # Execute command directly
  --loadProfile                             # Load profile when executing command
  --loglevel: string@gsudoLoglevel          # Specify log level
  --debug                                   # Enable debug mode
  --copyns                                  # Connect network drives
  --copyev                                  # Copy environmnet variables
  --help(-h)                                # Print help information
  --version(-v)                             # Print version information
]

# Starts/Stops an elevated cache session.
export extern "gsudo cache" [
  string?
]

# Show current config settings & values.
export extern "gsudo config" [
  string?
]

# Show status about current user
export extern "gsudo status" [
  string?
]
