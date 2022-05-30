# Show version information
extern "mkvextract" [

	...args
]

# Extract tracks to external files
extern "mkvextract tracks" [
	--cuesheet					# Also try to extract the CUE sheet
	--raw					# Extract the data to a raw file
	--fullraw					# Extract the data to a raw file including the CodecPrivate as header
	...args
]

# Extract tags as XML
extern "mkvextract tags" [

	...args
]

# Extract attachments
extern "mkvextract attachments" [

	...args
]

# Extract chapters as XML
extern "mkvextract chapters" [
	--simple(-s)					# Exports the chapter information in a simple format
	...args
]

# Extract chapters and tags as CUE sheet
extern "mkvextract cuesheet" [

	...args
]

# Extract timecodes of a track as timecode v2 file
extern "mkvextract timecodes_v2" [

	...args
]

# Extract cue information as text file
extern "mkvextract cues" [

	...args
]