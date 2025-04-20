# Show version information
extern "mkvextract" [
	--version(-V)					# Show version information
	--help(-h)					# Show help
	--check-for-updates					# Check online for updates
	--parse-fully(-f)					# Parse the whole file instead of relying on the index
	--verbose(-v)					# Increase verbosity
	--quiet(-q)					# Suppress status output
	--gui-mode					# Enable GUI mode
	--cuesheet					# Also try to extract the CUE sheet
	--raw					# Extract the data to a raw file
	--fullraw					# Extract the data to a raw file including the CodecPrivate as header
	--simple(-s)					# Exports the chapter information in a simple format
	...args
]

# Extract tracks to external files
extern "mkvextract tracks" [
	--version(-V)					# Show version information
	--help(-h)					# Show help
	--check-for-updates					# Check online for updates
	--parse-fully(-f)					# Parse the whole file instead of relying on the index
	--verbose(-v)					# Increase verbosity
	--quiet(-q)					# Suppress status output
	--gui-mode					# Enable GUI mode
	--cuesheet					# Also try to extract the CUE sheet
	--raw					# Extract the data to a raw file
	--fullraw					# Extract the data to a raw file including the CodecPrivate as header
	--simple(-s)					# Exports the chapter information in a simple format
	...args
]

# Extract tags as XML
extern "mkvextract tags" [
	--version(-V)					# Show version information
	--help(-h)					# Show help
	--check-for-updates					# Check online for updates
	--parse-fully(-f)					# Parse the whole file instead of relying on the index
	--verbose(-v)					# Increase verbosity
	--quiet(-q)					# Suppress status output
	--gui-mode					# Enable GUI mode
	--cuesheet					# Also try to extract the CUE sheet
	--raw					# Extract the data to a raw file
	--fullraw					# Extract the data to a raw file including the CodecPrivate as header
	--simple(-s)					# Exports the chapter information in a simple format
	...args
]

# Extract attachments
extern "mkvextract attachments" [
	--version(-V)					# Show version information
	--help(-h)					# Show help
	--check-for-updates					# Check online for updates
	--parse-fully(-f)					# Parse the whole file instead of relying on the index
	--verbose(-v)					# Increase verbosity
	--quiet(-q)					# Suppress status output
	--gui-mode					# Enable GUI mode
	--cuesheet					# Also try to extract the CUE sheet
	--raw					# Extract the data to a raw file
	--fullraw					# Extract the data to a raw file including the CodecPrivate as header
	--simple(-s)					# Exports the chapter information in a simple format
	...args
]

# Extract chapters as XML
extern "mkvextract chapters" [
	--version(-V)					# Show version information
	--help(-h)					# Show help
	--check-for-updates					# Check online for updates
	--parse-fully(-f)					# Parse the whole file instead of relying on the index
	--verbose(-v)					# Increase verbosity
	--quiet(-q)					# Suppress status output
	--gui-mode					# Enable GUI mode
	--cuesheet					# Also try to extract the CUE sheet
	--raw					# Extract the data to a raw file
	--fullraw					# Extract the data to a raw file including the CodecPrivate as header
	--simple(-s)					# Exports the chapter information in a simple format
	...args
]

# Extract chapters and tags as CUE sheet
extern "mkvextract cuesheet" [
	--version(-V)					# Show version information
	--help(-h)					# Show help
	--check-for-updates					# Check online for updates
	--parse-fully(-f)					# Parse the whole file instead of relying on the index
	--verbose(-v)					# Increase verbosity
	--quiet(-q)					# Suppress status output
	--gui-mode					# Enable GUI mode
	--cuesheet					# Also try to extract the CUE sheet
	--raw					# Extract the data to a raw file
	--fullraw					# Extract the data to a raw file including the CodecPrivate as header
	--simple(-s)					# Exports the chapter information in a simple format
	...args
]

# Extract timecodes of a track as timecode v2 file
extern "mkvextract timecodes_v2" [
	--version(-V)					# Show version information
	--help(-h)					# Show help
	--check-for-updates					# Check online for updates
	--parse-fully(-f)					# Parse the whole file instead of relying on the index
	--verbose(-v)					# Increase verbosity
	--quiet(-q)					# Suppress status output
	--gui-mode					# Enable GUI mode
	--cuesheet					# Also try to extract the CUE sheet
	--raw					# Extract the data to a raw file
	--fullraw					# Extract the data to a raw file including the CodecPrivate as header
	--simple(-s)					# Exports the chapter information in a simple format
	...args
]

# Extract cue information as text file
extern "mkvextract cues" [
	--version(-V)					# Show version information
	--help(-h)					# Show help
	--check-for-updates					# Check online for updates
	--parse-fully(-f)					# Parse the whole file instead of relying on the index
	--verbose(-v)					# Increase verbosity
	--quiet(-q)					# Suppress status output
	--gui-mode					# Enable GUI mode
	--cuesheet					# Also try to extract the CUE sheet
	--raw					# Extract the data to a raw file
	--fullraw					# Extract the data to a raw file including the CodecPrivate as header
	--simple(-s)					# Exports the chapter information in a simple format
	...args
]