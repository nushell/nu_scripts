# Show or update configuration
extern "mariner config" [
	--show(-s)					# Show the configuration
	...args
]

# Show details about torrent with given ID
extern "mariner details" [

	...args
]

# Download torrent with given ID
extern "mariner download" [

	...args
]

# Print detailed help for another command
extern "mariner help" [

	...args
]

# Copy magnet link with given ID to clipboard
extern "mariner magnet" [

	...args
]

# Open torrent in the default torrent application
extern "mariner open" [

	...args
]

# Search for torrents
extern "mariner search" [
	--all(-a)					# Search all available trackers
	--anime(-A)					# Search trackers with anime content only
	--filter(-f)					# Filter trackers that should be searched
	--legal(-L)					# Search trackers with legal content only
	--newest(-n)					# Sort results by newest
	...args
]

# Show program's version number and exit
extern "mariner" [

	...args
]

# Filter trackers that should be searched
extern "mariner anime legal" [

	...args
]