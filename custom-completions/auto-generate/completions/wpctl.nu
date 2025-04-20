# Show help options
extern "wpctl" [
	--help(-h)					# Show help options
	--nick(-k)					# Display device and node nicknames instead of descriptions
	--name(-n)					# Display device and node names instead of descriptions
	--referenced(-r)					# Show objects that are referenced in properties
	--associated(-a)					# Show associated objects
	--pid(-p)					# Selects all nodes associated to the given PID
	--limit(-l)					# Limit volume to below this value
	--pid(-p)					# Selects all nodes associated to the given PID
	...args
]

# Default Microphone
extern "wpctl @DEFAULT_AUDIO_SOURCE@" [
	--help(-h)					# Show help options
	--nick(-k)					# Display device and node nicknames instead of descriptions
	--name(-n)					# Display device and node names instead of descriptions
	--referenced(-r)					# Show objects that are referenced in properties
	--associated(-a)					# Show associated objects
	--pid(-p)					# Selects all nodes associated to the given PID
	--limit(-l)					# Limit volume to below this value
	--pid(-p)					# Selects all nodes associated to the given PID
	...args
]

# Default Speakers
extern "wpctl @DEFAULT_AUDIO_SINK@" [
	--help(-h)					# Show help options
	--nick(-k)					# Display device and node nicknames instead of descriptions
	--name(-n)					# Display device and node names instead of descriptions
	--referenced(-r)					# Show objects that are referenced in properties
	--associated(-a)					# Show associated objects
	--pid(-p)					# Selects all nodes associated to the given PID
	--limit(-l)					# Limit volume to below this value
	--pid(-p)					# Selects all nodes associated to the given PID
	...args
]

# Default Camera
extern "wpctl @DEFAULT_VIDEO_SOURCE@" [
	--help(-h)					# Show help options
	--nick(-k)					# Display device and node nicknames instead of descriptions
	--name(-n)					# Display device and node names instead of descriptions
	--referenced(-r)					# Show objects that are referenced in properties
	--associated(-a)					# Show associated objects
	--pid(-p)					# Selects all nodes associated to the given PID
	--limit(-l)					# Limit volume to below this value
	--pid(-p)					# Selects all nodes associated to the given PID
	...args
]

# 
extern "wpctl 0 1 toggle" [
	--help(-h)					# Show help options
	--nick(-k)					# Display device and node nicknames instead of descriptions
	--name(-n)					# Display device and node names instead of descriptions
	--referenced(-r)					# Show objects that are referenced in properties
	--associated(-a)					# Show associated objects
	--pid(-p)					# Selects all nodes associated to the given PID
	--limit(-l)					# Limit volume to below this value
	--pid(-p)					# Selects all nodes associated to the given PID
	...args
]