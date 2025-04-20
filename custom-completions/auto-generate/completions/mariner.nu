# Show or update configuration
extern "mariner config" [
	--version					# Show program's version number and exit
	--verbose(-v)					# Increase verbosity of output. Can be repeated
	--quiet(-q)					# Suppress output except warnings and errors
	--help(-h)					# Show help message and exit
	--debug					# Show tracebacks on errors
	--show(-s)					# Show the configuration
	--all(-a)					# Search all available trackers
	--anime(-A)					# Search trackers with anime content only
	--filter(-f)					# Filter trackers that should be searched
	--legal(-L)					# Search trackers with legal content only
	--newest(-n)					# Sort results by newest
	...args
]

# Show details about torrent with given ID
extern "mariner details" [
	--version					# Show program's version number and exit
	--verbose(-v)					# Increase verbosity of output. Can be repeated
	--quiet(-q)					# Suppress output except warnings and errors
	--help(-h)					# Show help message and exit
	--debug					# Show tracebacks on errors
	--show(-s)					# Show the configuration
	--all(-a)					# Search all available trackers
	--anime(-A)					# Search trackers with anime content only
	--filter(-f)					# Filter trackers that should be searched
	--legal(-L)					# Search trackers with legal content only
	--newest(-n)					# Sort results by newest
	...args
]

# Download torrent with given ID
extern "mariner download" [
	--version					# Show program's version number and exit
	--verbose(-v)					# Increase verbosity of output. Can be repeated
	--quiet(-q)					# Suppress output except warnings and errors
	--help(-h)					# Show help message and exit
	--debug					# Show tracebacks on errors
	--show(-s)					# Show the configuration
	--all(-a)					# Search all available trackers
	--anime(-A)					# Search trackers with anime content only
	--filter(-f)					# Filter trackers that should be searched
	--legal(-L)					# Search trackers with legal content only
	--newest(-n)					# Sort results by newest
	...args
]

# Print detailed help for another command
extern "mariner help" [
	--version					# Show program's version number and exit
	--verbose(-v)					# Increase verbosity of output. Can be repeated
	--quiet(-q)					# Suppress output except warnings and errors
	--help(-h)					# Show help message and exit
	--debug					# Show tracebacks on errors
	--show(-s)					# Show the configuration
	--all(-a)					# Search all available trackers
	--anime(-A)					# Search trackers with anime content only
	--filter(-f)					# Filter trackers that should be searched
	--legal(-L)					# Search trackers with legal content only
	--newest(-n)					# Sort results by newest
	...args
]

# Copy magnet link with given ID to clipboard
extern "mariner magnet" [
	--version					# Show program's version number and exit
	--verbose(-v)					# Increase verbosity of output. Can be repeated
	--quiet(-q)					# Suppress output except warnings and errors
	--help(-h)					# Show help message and exit
	--debug					# Show tracebacks on errors
	--show(-s)					# Show the configuration
	--all(-a)					# Search all available trackers
	--anime(-A)					# Search trackers with anime content only
	--filter(-f)					# Filter trackers that should be searched
	--legal(-L)					# Search trackers with legal content only
	--newest(-n)					# Sort results by newest
	...args
]

# Open torrent in the default torrent application
extern "mariner open" [
	--version					# Show program's version number and exit
	--verbose(-v)					# Increase verbosity of output. Can be repeated
	--quiet(-q)					# Suppress output except warnings and errors
	--help(-h)					# Show help message and exit
	--debug					# Show tracebacks on errors
	--show(-s)					# Show the configuration
	--all(-a)					# Search all available trackers
	--anime(-A)					# Search trackers with anime content only
	--filter(-f)					# Filter trackers that should be searched
	--legal(-L)					# Search trackers with legal content only
	--newest(-n)					# Sort results by newest
	...args
]

# Search for torrents
extern "mariner search" [
	--version					# Show program's version number and exit
	--verbose(-v)					# Increase verbosity of output. Can be repeated
	--quiet(-q)					# Suppress output except warnings and errors
	--help(-h)					# Show help message and exit
	--debug					# Show tracebacks on errors
	--show(-s)					# Show the configuration
	--all(-a)					# Search all available trackers
	--anime(-A)					# Search trackers with anime content only
	--filter(-f)					# Filter trackers that should be searched
	--legal(-L)					# Search trackers with legal content only
	--newest(-n)					# Sort results by newest
	...args
]

# Show program's version number and exit
extern "mariner" [
	--version					# Show program's version number and exit
	--verbose(-v)					# Increase verbosity of output. Can be repeated
	--quiet(-q)					# Suppress output except warnings and errors
	--help(-h)					# Show help message and exit
	--debug					# Show tracebacks on errors
	--show(-s)					# Show the configuration
	--all(-a)					# Search all available trackers
	--anime(-A)					# Search trackers with anime content only
	--filter(-f)					# Filter trackers that should be searched
	--legal(-L)					# Search trackers with legal content only
	--newest(-n)					# Sort results by newest
	...args
]

# Filter trackers that should be searched
extern "mariner anime legal" [
	--version					# Show program's version number and exit
	--verbose(-v)					# Increase verbosity of output. Can be repeated
	--quiet(-q)					# Suppress output except warnings and errors
	--help(-h)					# Show help message and exit
	--debug					# Show tracebacks on errors
	--show(-s)					# Show the configuration
	--all(-a)					# Search all available trackers
	--anime(-A)					# Search trackers with anime content only
	--filter(-f)					# Filter trackers that should be searched
	--legal(-L)					# Search trackers with legal content only
	--newest(-n)					# Sort results by newest
	...args
]