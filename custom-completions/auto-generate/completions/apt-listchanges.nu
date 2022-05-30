# Display help and exit
extern "apt-listchanges" [
	--help					# Display help and exit
	--apt					# Read filenames from pipe
	--verbose(-v)					# Verbose mode
	--frontend(-f)					# Select frontend interface
	--confirm(-c)					# Ask confirmation
	--all(-a)					# Display all changelogs
	--headers(-h)					# Insert header
	--debug					# Display debug info
	...args
]

# Select frontend interface
extern "apt-listchanges pager browser xterm-pager xterm-browser text mail none" [
	--help					# Display help and exit
	--apt					# Read filenames from pipe
	--verbose(-v)					# Verbose mode
	--frontend(-f)					# Select frontend interface
	--confirm(-c)					# Ask confirmation
	--all(-a)					# Display all changelogs
	--headers(-h)					# Insert header
	--debug					# Display debug info
	...args
]