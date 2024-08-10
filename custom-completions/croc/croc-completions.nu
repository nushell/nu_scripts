# author: David Telenko

def "nu-complete croc curve" [] {
    [p521, p256, p384, siec]
}

def "nu-complete croc subcommands" [] {
    [send, relay, help]
}

def "nu-complete croc hash" [] {
    [xxhash, imohash, md5]
}

export extern "croc" [
    --internal-dns           # Use a built-in DNS stub resolver rather than the host operating system (default: false)
    --remember               # Save these settings to reuse next time (default: false)
    --debug                  # Toggle debug mode (default: false)
    --yes                    # Automatically agree to all prompts (default: false)
    --stdout                 # Redirect file to stdout (default: false)
    --no-compress            # Disable compression (default: false)
    --ask                    # Make sure sender and recipient are prompted (default: false)
    --local                  # Force to use only local connections (default: false)
    --ignore-stdin           # Ignore piped stdin (default: false)
    --overwrite              # Do not prompt to overwrite (default: false)
    --testing                # Flag for testing purposes (default: false)
    --curve: string@"nu-complete croc curve" # choose an encryption curve (p521, p256, p384, siec) (default: "p256")
    --ip: string             # Set sender ip if known e.g. 10.0.0.1:9009, [::1]:9009
    --relay: string          # Address of the relay (default: "5.78.91.237:9009") [%CROC_RELAY%]
    --relay6: string         # Ipv6 address of the relay [%CROC_RELAY6%]
    --out: path              # Specify an output folder to receive the file (default: ".")
    --pass: string           # Password for the relay (default: "pass123") [%CROC_PASS%]
    --socks5: string         # Add a socks5 proxy [%SOCKS5_PROXY%]
    --connect: string        # Add a http proxy [%HTTP_PROXY%]
    --throttleUpload: string # throttle the upload speed e.g. 500k
    --help(-h)               # Show help (default: false)
    --version(-v)            # Print the version (default: false)
]

# Send file(s), or folder (see options with croc send -h)
export extern "croc send" [
   --zip                   # Zip folder before sending (default: false)
   --code(-c): string      # Codephrase used to connect to relay
   --hash:string@"nu-complete croc hash" # Hash algorithm (xxhash, imohash, md5) (default: "xxhash")
   --text(-t): string      # Send some text
   --no-local              # Disable local relay when sending (default: false)
   --no-multi              # Disable multiplexing (default: false)
   --git                   # Enable .gitignore respect / don't send ignored files (default: false)
   --port: int             # Base port for the relay (default: 9009)
   --transfers: int        # Number of ports to use for transfers (default: 4)
]

# Start your own relay (optional)
export extern "croc relay" [
   --host: string   # host of the relay
   --ports: string  # ports of the relay (default: "9009,9010,9011,9012,9013")
]

# Shows a list of commands or help for one command
export extern "croc help" [
    subcommand?: string@"nu-complete croc subcommands"
]

# Shows a list of commands or help for one command
export extern "croc h" [
    subcommand?: string@"nu-complete croc subcommands"
]
