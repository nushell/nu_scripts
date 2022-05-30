# Use only IPv4 address for hostname resolution
extern "chronyc" [

	...args
]

# Show system time info
extern "chronyc tracking" [

	...args
]

# Correct the clock by stepping
extern "chronyc makestep" [

	...args
]

# Modify max valid skew to update frequency
extern "chronyc maxupdateskew" [

	...args
]

# Wait until synced in specified limits
extern "chronyc waitsync" [

	...args
]

# Show info about current sources
extern "chronyc sources" [

	...args
]

# Show statistics about collected measurements
extern "chronyc sourcestats" [

	...args
]

# Force reselecting sync source
extern "chronyc reselect" [

	...args
]

# Modify reselection distance
extern "chronyc reselectdist" [

	...args
]

# Check how many NTP sources are online/offline
extern "chronyc activity" [

	...args
]

# Show info about last valid measurement
extern "chronyc ntpdata" [

	...args
]

# 
extern "chronyc add" [

	...args
]

# Add new NTP peer
extern "chronyc peer" [

	...args
]

# Add new NTP server
extern "chronyc server" [

	...args
]

# Remove server/peer
extern "chronyc delete" [

	...args
]

# Start rapid set of measurements
extern "chronyc burst" [

	...args
]

# Modify max valid sample delay
extern "chronyc maxdelay" [

	...args
]

# Modify max valid delay/deviation ratio
extern "chronyc maxdelaydevratio" [

	...args
]

# Modify max valid delay/min ratio
extern "chronyc maxdelayratio" [

	...args
]

# Modify max polling interval
extern "chronyc maxpoll" [

	...args
]

# Modify min polling interval
extern "chronyc minpoll" [

	...args
]

# Modify min stratum
extern "chronyc minstratum" [

	...args
]

# Set sources in subnet to offline status
extern "chronyc offline" [

	...args
]

# Set sources in subnet to online status
extern "chronyc online" [

	...args
]

# Set all sources to online/offline status according to network config
extern "chronyc onoffline" [

	...args
]

# Modify poll target
extern "chronyc polltarget" [

	...args
]

# Refresh IP address
extern "chronyc refresh" [

	...args
]

# 
extern "chronyc manual" [

	...args
]

# Enable settime command
extern "chronyc on" [

	...args
]

# Disable settime command
extern "chronyc off" [

	...args
]

# Show previous settime entries
extern "chronyc list" [

	...args
]

# Reset settime command
extern "chronyc reset" [

	...args
]

# Set daemon time
extern "chronyc settime" [

	...args
]

# Check whether address is allowed
extern "chronyc accheck" [

	...args
]

# Report on clients that have accessed the server
extern "chronyc clients" [

	...args
]

# Show statistics of the server
extern "chronyc serverstats" [

	...args
]

# Allow access to subnet as a default
extern "chronyc allow" [

	...args
]

# Allow access to subnet and all children
extern "chronyc all" [

	...args
]

# Deny access to subnet as a default
extern "chronyc deny" [

	...args
]

# Serve time even when not synced
extern "chronyc local" [

	...args
]

# Show current time smoothing state
extern "chronyc smoothing" [

	...args
]

# 
extern "chronyc smoothtime" [

	...args
]

# Activate time smoothing
extern "chronyc activate" [

	...args
]

# Check whether address is allowed
extern "chronyc cmdaccheck" [

	...args
]

# Allow access to subnet as a default
extern "chronyc cmdallow" [

	...args
]

# Deny access to subnet as a default
extern "chronyc cmddeny" [

	...args
]

# Print current RTC performance parameters
extern "chronyc rtcdata" [

	...args
]

# Correct RTC relative to system clock
extern "chronyc trimrtc" [

	...args
]

# Save RTC performance parameters to file
extern "chronyc writertc" [

	...args
]

# Close and reopen log files
extern "chronyc cyclelogs" [

	...args
]

# Dump all measurements to save files
extern "chronyc dump" [

	...args
]

# Reread keys from key file
extern "chronyc rekey" [

	...args
]

# Stop daemon
extern "chronyc shutdown" [

	...args
]

# Configure how hostname and IP address are resolved
extern "chronyc dns" [

	...args
]

# Set initial response timeout
extern "chronyc timeout" [

	...args
]

# Set max number of retries
extern "chronyc retries" [

	...args
]

# Generate key for key file
extern "chronyc keygen" [

	...args
]

# Leave the program
extern "chronyc exit quit" [

	...args
]

# Show help message
extern "chronyc help" [

	...args
]