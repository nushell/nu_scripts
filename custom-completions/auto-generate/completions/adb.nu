# Listen on all network interfaces
extern "adb" [
	--algo					# Algorithm name
	--key					# Hex-encoded key
	--iv					# Hex-encoded iv
	--list					# List all forward socket connections
	--no-rebind					# Fails the forward if local is already forwarded
	--remove					# Remove a specific forward socket connection
	--remove-all					# Remove all forward socket connections
	--last(-L)					# Dump logs from prior to last reboot from pstore
	--buffer(-b)					#  Request alternate ring buffer(s)
	--clear(-c)					# Clear (flush) the entire log and exit
	--pid					# Only print the logs for the given PID
	--wrap					# Sleep for 2 hours or when buffer about to wrap whichever comes first
	--format(-v)					# Sets log print format verb and adverbs
	--dividers(-D)					# Print dividers between each log buffer
	--binary(-B)					# Output the log in binary
	--file(-f)					# Log to file instead of stdout
	--rotate-kbytes(-r)					# Rotate log every kbytes, requires -f
	--rotate-count(-n)					# Sets number of rotated logs to keep, default 4
	--id					# If the given signature for logging changes, clear the associated files
	--buffer-size(-g)					# Get the size of the ring buffers within logd
	--buffer-size(-G)					# Set size of a ring buffer in logd
	--statistics(-S)					# Output statistics
	--prune(-p)					# Print prune rules
	--prune(-P)					# Set prune rules
	--regex(-e)					# Only print lines where the log message matches
	--max-count(-m)					# Quit after print <count> lines
	--print					# Print all message even if they do not matches, requires --regex and --max-count
	--uid					# Only display log messages from UIDs present in the comma separate list <uids>
	...args
]

# Connect to device
extern "adb connect" [
	--algo					# Algorithm name
	--key					# Hex-encoded key
	--iv					# Hex-encoded iv
	--list					# List all forward socket connections
	--no-rebind					# Fails the forward if local is already forwarded
	--remove					# Remove a specific forward socket connection
	--remove-all					# Remove all forward socket connections
	--last(-L)					# Dump logs from prior to last reboot from pstore
	--buffer(-b)					#  Request alternate ring buffer(s)
	--clear(-c)					# Clear (flush) the entire log and exit
	--pid					# Only print the logs for the given PID
	--wrap					# Sleep for 2 hours or when buffer about to wrap whichever comes first
	--format(-v)					# Sets log print format verb and adverbs
	--dividers(-D)					# Print dividers between each log buffer
	--binary(-B)					# Output the log in binary
	--file(-f)					# Log to file instead of stdout
	--rotate-kbytes(-r)					# Rotate log every kbytes, requires -f
	--rotate-count(-n)					# Sets number of rotated logs to keep, default 4
	--id					# If the given signature for logging changes, clear the associated files
	--buffer-size(-g)					# Get the size of the ring buffers within logd
	--buffer-size(-G)					# Set size of a ring buffer in logd
	--statistics(-S)					# Output statistics
	--prune(-p)					# Print prune rules
	--prune(-P)					# Set prune rules
	--regex(-e)					# Only print lines where the log message matches
	--max-count(-m)					# Quit after print <count> lines
	--print					# Print all message even if they do not matches, requires --regex and --max-count
	--uid					# Only display log messages from UIDs present in the comma separate list <uids>
	...args
]

# Disconnect from device
extern "adb disconnect" [
	--algo					# Algorithm name
	--key					# Hex-encoded key
	--iv					# Hex-encoded iv
	--list					# List all forward socket connections
	--no-rebind					# Fails the forward if local is already forwarded
	--remove					# Remove a specific forward socket connection
	--remove-all					# Remove all forward socket connections
	--last(-L)					# Dump logs from prior to last reboot from pstore
	--buffer(-b)					#  Request alternate ring buffer(s)
	--clear(-c)					# Clear (flush) the entire log and exit
	--pid					# Only print the logs for the given PID
	--wrap					# Sleep for 2 hours or when buffer about to wrap whichever comes first
	--format(-v)					# Sets log print format verb and adverbs
	--dividers(-D)					# Print dividers between each log buffer
	--binary(-B)					# Output the log in binary
	--file(-f)					# Log to file instead of stdout
	--rotate-kbytes(-r)					# Rotate log every kbytes, requires -f
	--rotate-count(-n)					# Sets number of rotated logs to keep, default 4
	--id					# If the given signature for logging changes, clear the associated files
	--buffer-size(-g)					# Get the size of the ring buffers within logd
	--buffer-size(-G)					# Set size of a ring buffer in logd
	--statistics(-S)					# Output statistics
	--prune(-p)					# Print prune rules
	--prune(-P)					# Set prune rules
	--regex(-e)					# Only print lines where the log message matches
	--max-count(-m)					# Quit after print <count> lines
	--print					# Print all message even if they do not matches, requires --regex and --max-count
	--uid					# Only display log messages from UIDs present in the comma separate list <uids>
	...args
]

# List all connected devices
extern "adb devices" [
	--algo					# Algorithm name
	--key					# Hex-encoded key
	--iv					# Hex-encoded iv
	--list					# List all forward socket connections
	--no-rebind					# Fails the forward if local is already forwarded
	--remove					# Remove a specific forward socket connection
	--remove-all					# Remove all forward socket connections
	--last(-L)					# Dump logs from prior to last reboot from pstore
	--buffer(-b)					#  Request alternate ring buffer(s)
	--clear(-c)					# Clear (flush) the entire log and exit
	--pid					# Only print the logs for the given PID
	--wrap					# Sleep for 2 hours or when buffer about to wrap whichever comes first
	--format(-v)					# Sets log print format verb and adverbs
	--dividers(-D)					# Print dividers between each log buffer
	--binary(-B)					# Output the log in binary
	--file(-f)					# Log to file instead of stdout
	--rotate-kbytes(-r)					# Rotate log every kbytes, requires -f
	--rotate-count(-n)					# Sets number of rotated logs to keep, default 4
	--id					# If the given signature for logging changes, clear the associated files
	--buffer-size(-g)					# Get the size of the ring buffers within logd
	--buffer-size(-G)					# Set size of a ring buffer in logd
	--statistics(-S)					# Output statistics
	--prune(-p)					# Print prune rules
	--prune(-P)					# Set prune rules
	--regex(-e)					# Only print lines where the log message matches
	--max-count(-m)					# Quit after print <count> lines
	--print					# Print all message even if they do not matches, requires --regex and --max-count
	--uid					# Only display log messages from UIDs present in the comma separate list <uids>
	...args
]

# Copy file to device
extern "adb push" [
	--algo					# Algorithm name
	--key					# Hex-encoded key
	--iv					# Hex-encoded iv
	--list					# List all forward socket connections
	--no-rebind					# Fails the forward if local is already forwarded
	--remove					# Remove a specific forward socket connection
	--remove-all					# Remove all forward socket connections
	--last(-L)					# Dump logs from prior to last reboot from pstore
	--buffer(-b)					#  Request alternate ring buffer(s)
	--clear(-c)					# Clear (flush) the entire log and exit
	--pid					# Only print the logs for the given PID
	--wrap					# Sleep for 2 hours or when buffer about to wrap whichever comes first
	--format(-v)					# Sets log print format verb and adverbs
	--dividers(-D)					# Print dividers between each log buffer
	--binary(-B)					# Output the log in binary
	--file(-f)					# Log to file instead of stdout
	--rotate-kbytes(-r)					# Rotate log every kbytes, requires -f
	--rotate-count(-n)					# Sets number of rotated logs to keep, default 4
	--id					# If the given signature for logging changes, clear the associated files
	--buffer-size(-g)					# Get the size of the ring buffers within logd
	--buffer-size(-G)					# Set size of a ring buffer in logd
	--statistics(-S)					# Output statistics
	--prune(-p)					# Print prune rules
	--prune(-P)					# Set prune rules
	--regex(-e)					# Only print lines where the log message matches
	--max-count(-m)					# Quit after print <count> lines
	--print					# Print all message even if they do not matches, requires --regex and --max-count
	--uid					# Only display log messages from UIDs present in the comma separate list <uids>
	...args
]

# Copy file from device
extern "adb pull" [
	--algo					# Algorithm name
	--key					# Hex-encoded key
	--iv					# Hex-encoded iv
	--list					# List all forward socket connections
	--no-rebind					# Fails the forward if local is already forwarded
	--remove					# Remove a specific forward socket connection
	--remove-all					# Remove all forward socket connections
	--last(-L)					# Dump logs from prior to last reboot from pstore
	--buffer(-b)					#  Request alternate ring buffer(s)
	--clear(-c)					# Clear (flush) the entire log and exit
	--pid					# Only print the logs for the given PID
	--wrap					# Sleep for 2 hours or when buffer about to wrap whichever comes first
	--format(-v)					# Sets log print format verb and adverbs
	--dividers(-D)					# Print dividers between each log buffer
	--binary(-B)					# Output the log in binary
	--file(-f)					# Log to file instead of stdout
	--rotate-kbytes(-r)					# Rotate log every kbytes, requires -f
	--rotate-count(-n)					# Sets number of rotated logs to keep, default 4
	--id					# If the given signature for logging changes, clear the associated files
	--buffer-size(-g)					# Get the size of the ring buffers within logd
	--buffer-size(-G)					# Set size of a ring buffer in logd
	--statistics(-S)					# Output statistics
	--prune(-p)					# Print prune rules
	--prune(-P)					# Set prune rules
	--regex(-e)					# Only print lines where the log message matches
	--max-count(-m)					# Quit after print <count> lines
	--print					# Print all message even if they do not matches, requires --regex and --max-count
	--uid					# Only display log messages from UIDs present in the comma separate list <uids>
	...args
]

# Copy host->device only if changed
extern "adb sync" [
	--algo					# Algorithm name
	--key					# Hex-encoded key
	--iv					# Hex-encoded iv
	--list					# List all forward socket connections
	--no-rebind					# Fails the forward if local is already forwarded
	--remove					# Remove a specific forward socket connection
	--remove-all					# Remove all forward socket connections
	--last(-L)					# Dump logs from prior to last reboot from pstore
	--buffer(-b)					#  Request alternate ring buffer(s)
	--clear(-c)					# Clear (flush) the entire log and exit
	--pid					# Only print the logs for the given PID
	--wrap					# Sleep for 2 hours or when buffer about to wrap whichever comes first
	--format(-v)					# Sets log print format verb and adverbs
	--dividers(-D)					# Print dividers between each log buffer
	--binary(-B)					# Output the log in binary
	--file(-f)					# Log to file instead of stdout
	--rotate-kbytes(-r)					# Rotate log every kbytes, requires -f
	--rotate-count(-n)					# Sets number of rotated logs to keep, default 4
	--id					# If the given signature for logging changes, clear the associated files
	--buffer-size(-g)					# Get the size of the ring buffers within logd
	--buffer-size(-G)					# Set size of a ring buffer in logd
	--statistics(-S)					# Output statistics
	--prune(-p)					# Print prune rules
	--prune(-P)					# Set prune rules
	--regex(-e)					# Only print lines where the log message matches
	--max-count(-m)					# Quit after print <count> lines
	--print					# Print all message even if they do not matches, requires --regex and --max-count
	--uid					# Only display log messages from UIDs present in the comma separate list <uids>
	...args
]

# Run remote shell [command]
extern "adb shell" [
	--algo					# Algorithm name
	--key					# Hex-encoded key
	--iv					# Hex-encoded iv
	--list					# List all forward socket connections
	--no-rebind					# Fails the forward if local is already forwarded
	--remove					# Remove a specific forward socket connection
	--remove-all					# Remove all forward socket connections
	--last(-L)					# Dump logs from prior to last reboot from pstore
	--buffer(-b)					#  Request alternate ring buffer(s)
	--clear(-c)					# Clear (flush) the entire log and exit
	--pid					# Only print the logs for the given PID
	--wrap					# Sleep for 2 hours or when buffer about to wrap whichever comes first
	--format(-v)					# Sets log print format verb and adverbs
	--dividers(-D)					# Print dividers between each log buffer
	--binary(-B)					# Output the log in binary
	--file(-f)					# Log to file instead of stdout
	--rotate-kbytes(-r)					# Rotate log every kbytes, requires -f
	--rotate-count(-n)					# Sets number of rotated logs to keep, default 4
	--id					# If the given signature for logging changes, clear the associated files
	--buffer-size(-g)					# Get the size of the ring buffers within logd
	--buffer-size(-G)					# Set size of a ring buffer in logd
	--statistics(-S)					# Output statistics
	--prune(-p)					# Print prune rules
	--prune(-P)					# Set prune rules
	--regex(-e)					# Only print lines where the log message matches
	--max-count(-m)					# Quit after print <count> lines
	--print					# Print all message even if they do not matches, requires --regex and --max-count
	--uid					# Only display log messages from UIDs present in the comma separate list <uids>
	...args
]

# Run emulator console command
extern "adb emu" [
	--algo					# Algorithm name
	--key					# Hex-encoded key
	--iv					# Hex-encoded iv
	--list					# List all forward socket connections
	--no-rebind					# Fails the forward if local is already forwarded
	--remove					# Remove a specific forward socket connection
	--remove-all					# Remove all forward socket connections
	--last(-L)					# Dump logs from prior to last reboot from pstore
	--buffer(-b)					#  Request alternate ring buffer(s)
	--clear(-c)					# Clear (flush) the entire log and exit
	--pid					# Only print the logs for the given PID
	--wrap					# Sleep for 2 hours or when buffer about to wrap whichever comes first
	--format(-v)					# Sets log print format verb and adverbs
	--dividers(-D)					# Print dividers between each log buffer
	--binary(-B)					# Output the log in binary
	--file(-f)					# Log to file instead of stdout
	--rotate-kbytes(-r)					# Rotate log every kbytes, requires -f
	--rotate-count(-n)					# Sets number of rotated logs to keep, default 4
	--id					# If the given signature for logging changes, clear the associated files
	--buffer-size(-g)					# Get the size of the ring buffers within logd
	--buffer-size(-G)					# Set size of a ring buffer in logd
	--statistics(-S)					# Output statistics
	--prune(-p)					# Print prune rules
	--prune(-P)					# Set prune rules
	--regex(-e)					# Only print lines where the log message matches
	--max-count(-m)					# Quit after print <count> lines
	--print					# Print all message even if they do not matches, requires --regex and --max-count
	--uid					# Only display log messages from UIDs present in the comma separate list <uids>
	...args
]

# View device log
extern "adb logcat" [
	--algo					# Algorithm name
	--key					# Hex-encoded key
	--iv					# Hex-encoded iv
	--list					# List all forward socket connections
	--no-rebind					# Fails the forward if local is already forwarded
	--remove					# Remove a specific forward socket connection
	--remove-all					# Remove all forward socket connections
	--last(-L)					# Dump logs from prior to last reboot from pstore
	--buffer(-b)					#  Request alternate ring buffer(s)
	--clear(-c)					# Clear (flush) the entire log and exit
	--pid					# Only print the logs for the given PID
	--wrap					# Sleep for 2 hours or when buffer about to wrap whichever comes first
	--format(-v)					# Sets log print format verb and adverbs
	--dividers(-D)					# Print dividers between each log buffer
	--binary(-B)					# Output the log in binary
	--file(-f)					# Log to file instead of stdout
	--rotate-kbytes(-r)					# Rotate log every kbytes, requires -f
	--rotate-count(-n)					# Sets number of rotated logs to keep, default 4
	--id					# If the given signature for logging changes, clear the associated files
	--buffer-size(-g)					# Get the size of the ring buffers within logd
	--buffer-size(-G)					# Set size of a ring buffer in logd
	--statistics(-S)					# Output statistics
	--prune(-p)					# Print prune rules
	--prune(-P)					# Set prune rules
	--regex(-e)					# Only print lines where the log message matches
	--max-count(-m)					# Quit after print <count> lines
	--print					# Print all message even if they do not matches, requires --regex and --max-count
	--uid					# Only display log messages from UIDs present in the comma separate list <uids>
	...args
]

# Install package
extern "adb install" [
	--algo					# Algorithm name
	--key					# Hex-encoded key
	--iv					# Hex-encoded iv
	--list					# List all forward socket connections
	--no-rebind					# Fails the forward if local is already forwarded
	--remove					# Remove a specific forward socket connection
	--remove-all					# Remove all forward socket connections
	--last(-L)					# Dump logs from prior to last reboot from pstore
	--buffer(-b)					#  Request alternate ring buffer(s)
	--clear(-c)					# Clear (flush) the entire log and exit
	--pid					# Only print the logs for the given PID
	--wrap					# Sleep for 2 hours or when buffer about to wrap whichever comes first
	--format(-v)					# Sets log print format verb and adverbs
	--dividers(-D)					# Print dividers between each log buffer
	--binary(-B)					# Output the log in binary
	--file(-f)					# Log to file instead of stdout
	--rotate-kbytes(-r)					# Rotate log every kbytes, requires -f
	--rotate-count(-n)					# Sets number of rotated logs to keep, default 4
	--id					# If the given signature for logging changes, clear the associated files
	--buffer-size(-g)					# Get the size of the ring buffers within logd
	--buffer-size(-G)					# Set size of a ring buffer in logd
	--statistics(-S)					# Output statistics
	--prune(-p)					# Print prune rules
	--prune(-P)					# Set prune rules
	--regex(-e)					# Only print lines where the log message matches
	--max-count(-m)					# Quit after print <count> lines
	--print					# Print all message even if they do not matches, requires --regex and --max-count
	--uid					# Only display log messages from UIDs present in the comma separate list <uids>
	...args
]

# Uninstall package
extern "adb uninstall" [
	--algo					# Algorithm name
	--key					# Hex-encoded key
	--iv					# Hex-encoded iv
	--list					# List all forward socket connections
	--no-rebind					# Fails the forward if local is already forwarded
	--remove					# Remove a specific forward socket connection
	--remove-all					# Remove all forward socket connections
	--last(-L)					# Dump logs from prior to last reboot from pstore
	--buffer(-b)					#  Request alternate ring buffer(s)
	--clear(-c)					# Clear (flush) the entire log and exit
	--pid					# Only print the logs for the given PID
	--wrap					# Sleep for 2 hours or when buffer about to wrap whichever comes first
	--format(-v)					# Sets log print format verb and adverbs
	--dividers(-D)					# Print dividers between each log buffer
	--binary(-B)					# Output the log in binary
	--file(-f)					# Log to file instead of stdout
	--rotate-kbytes(-r)					# Rotate log every kbytes, requires -f
	--rotate-count(-n)					# Sets number of rotated logs to keep, default 4
	--id					# If the given signature for logging changes, clear the associated files
	--buffer-size(-g)					# Get the size of the ring buffers within logd
	--buffer-size(-G)					# Set size of a ring buffer in logd
	--statistics(-S)					# Output statistics
	--prune(-p)					# Print prune rules
	--prune(-P)					# Set prune rules
	--regex(-e)					# Only print lines where the log message matches
	--max-count(-m)					# Quit after print <count> lines
	--print					# Print all message even if they do not matches, requires --regex and --max-count
	--uid					# Only display log messages from UIDs present in the comma separate list <uids>
	...args
]

# List PIDs of processes hosting a JDWP transport
extern "adb jdwp" [
	--algo					# Algorithm name
	--key					# Hex-encoded key
	--iv					# Hex-encoded iv
	--list					# List all forward socket connections
	--no-rebind					# Fails the forward if local is already forwarded
	--remove					# Remove a specific forward socket connection
	--remove-all					# Remove all forward socket connections
	--last(-L)					# Dump logs from prior to last reboot from pstore
	--buffer(-b)					#  Request alternate ring buffer(s)
	--clear(-c)					# Clear (flush) the entire log and exit
	--pid					# Only print the logs for the given PID
	--wrap					# Sleep for 2 hours or when buffer about to wrap whichever comes first
	--format(-v)					# Sets log print format verb and adverbs
	--dividers(-D)					# Print dividers between each log buffer
	--binary(-B)					# Output the log in binary
	--file(-f)					# Log to file instead of stdout
	--rotate-kbytes(-r)					# Rotate log every kbytes, requires -f
	--rotate-count(-n)					# Sets number of rotated logs to keep, default 4
	--id					# If the given signature for logging changes, clear the associated files
	--buffer-size(-g)					# Get the size of the ring buffers within logd
	--buffer-size(-G)					# Set size of a ring buffer in logd
	--statistics(-S)					# Output statistics
	--prune(-p)					# Print prune rules
	--prune(-P)					# Set prune rules
	--regex(-e)					# Only print lines where the log message matches
	--max-count(-m)					# Quit after print <count> lines
	--print					# Print all message even if they do not matches, requires --regex and --max-count
	--uid					# Only display log messages from UIDs present in the comma separate list <uids>
	...args
]

# Port forwarding
extern "adb forward" [
	--algo					# Algorithm name
	--key					# Hex-encoded key
	--iv					# Hex-encoded iv
	--list					# List all forward socket connections
	--no-rebind					# Fails the forward if local is already forwarded
	--remove					# Remove a specific forward socket connection
	--remove-all					# Remove all forward socket connections
	--last(-L)					# Dump logs from prior to last reboot from pstore
	--buffer(-b)					#  Request alternate ring buffer(s)
	--clear(-c)					# Clear (flush) the entire log and exit
	--pid					# Only print the logs for the given PID
	--wrap					# Sleep for 2 hours or when buffer about to wrap whichever comes first
	--format(-v)					# Sets log print format verb and adverbs
	--dividers(-D)					# Print dividers between each log buffer
	--binary(-B)					# Output the log in binary
	--file(-f)					# Log to file instead of stdout
	--rotate-kbytes(-r)					# Rotate log every kbytes, requires -f
	--rotate-count(-n)					# Sets number of rotated logs to keep, default 4
	--id					# If the given signature for logging changes, clear the associated files
	--buffer-size(-g)					# Get the size of the ring buffers within logd
	--buffer-size(-G)					# Set size of a ring buffer in logd
	--statistics(-S)					# Output statistics
	--prune(-p)					# Print prune rules
	--prune(-P)					# Set prune rules
	--regex(-e)					# Only print lines where the log message matches
	--max-count(-m)					# Quit after print <count> lines
	--print					# Print all message even if they do not matches, requires --regex and --max-count
	--uid					# Only display log messages from UIDs present in the comma separate list <uids>
	...args
]

# Return bugreport information
extern "adb bugreport" [
	--algo					# Algorithm name
	--key					# Hex-encoded key
	--iv					# Hex-encoded iv
	--list					# List all forward socket connections
	--no-rebind					# Fails the forward if local is already forwarded
	--remove					# Remove a specific forward socket connection
	--remove-all					# Remove all forward socket connections
	--last(-L)					# Dump logs from prior to last reboot from pstore
	--buffer(-b)					#  Request alternate ring buffer(s)
	--clear(-c)					# Clear (flush) the entire log and exit
	--pid					# Only print the logs for the given PID
	--wrap					# Sleep for 2 hours or when buffer about to wrap whichever comes first
	--format(-v)					# Sets log print format verb and adverbs
	--dividers(-D)					# Print dividers between each log buffer
	--binary(-B)					# Output the log in binary
	--file(-f)					# Log to file instead of stdout
	--rotate-kbytes(-r)					# Rotate log every kbytes, requires -f
	--rotate-count(-n)					# Sets number of rotated logs to keep, default 4
	--id					# If the given signature for logging changes, clear the associated files
	--buffer-size(-g)					# Get the size of the ring buffers within logd
	--buffer-size(-G)					# Set size of a ring buffer in logd
	--statistics(-S)					# Output statistics
	--prune(-p)					# Print prune rules
	--prune(-P)					# Set prune rules
	--regex(-e)					# Only print lines where the log message matches
	--max-count(-m)					# Quit after print <count> lines
	--print					# Print all message even if they do not matches, requires --regex and --max-count
	--uid					# Only display log messages from UIDs present in the comma separate list <uids>
	...args
]

# Perform device backup
extern "adb backup" [
	--algo					# Algorithm name
	--key					# Hex-encoded key
	--iv					# Hex-encoded iv
	--list					# List all forward socket connections
	--no-rebind					# Fails the forward if local is already forwarded
	--remove					# Remove a specific forward socket connection
	--remove-all					# Remove all forward socket connections
	--last(-L)					# Dump logs from prior to last reboot from pstore
	--buffer(-b)					#  Request alternate ring buffer(s)
	--clear(-c)					# Clear (flush) the entire log and exit
	--pid					# Only print the logs for the given PID
	--wrap					# Sleep for 2 hours or when buffer about to wrap whichever comes first
	--format(-v)					# Sets log print format verb and adverbs
	--dividers(-D)					# Print dividers between each log buffer
	--binary(-B)					# Output the log in binary
	--file(-f)					# Log to file instead of stdout
	--rotate-kbytes(-r)					# Rotate log every kbytes, requires -f
	--rotate-count(-n)					# Sets number of rotated logs to keep, default 4
	--id					# If the given signature for logging changes, clear the associated files
	--buffer-size(-g)					# Get the size of the ring buffers within logd
	--buffer-size(-G)					# Set size of a ring buffer in logd
	--statistics(-S)					# Output statistics
	--prune(-p)					# Print prune rules
	--prune(-P)					# Set prune rules
	--regex(-e)					# Only print lines where the log message matches
	--max-count(-m)					# Quit after print <count> lines
	--print					# Print all message even if they do not matches, requires --regex and --max-count
	--uid					# Only display log messages from UIDs present in the comma separate list <uids>
	...args
]

# Restore device from backup
extern "adb restore" [
	--algo					# Algorithm name
	--key					# Hex-encoded key
	--iv					# Hex-encoded iv
	--list					# List all forward socket connections
	--no-rebind					# Fails the forward if local is already forwarded
	--remove					# Remove a specific forward socket connection
	--remove-all					# Remove all forward socket connections
	--last(-L)					# Dump logs from prior to last reboot from pstore
	--buffer(-b)					#  Request alternate ring buffer(s)
	--clear(-c)					# Clear (flush) the entire log and exit
	--pid					# Only print the logs for the given PID
	--wrap					# Sleep for 2 hours or when buffer about to wrap whichever comes first
	--format(-v)					# Sets log print format verb and adverbs
	--dividers(-D)					# Print dividers between each log buffer
	--binary(-B)					# Output the log in binary
	--file(-f)					# Log to file instead of stdout
	--rotate-kbytes(-r)					# Rotate log every kbytes, requires -f
	--rotate-count(-n)					# Sets number of rotated logs to keep, default 4
	--id					# If the given signature for logging changes, clear the associated files
	--buffer-size(-g)					# Get the size of the ring buffers within logd
	--buffer-size(-G)					# Set size of a ring buffer in logd
	--statistics(-S)					# Output statistics
	--prune(-p)					# Print prune rules
	--prune(-P)					# Set prune rules
	--regex(-e)					# Only print lines where the log message matches
	--max-count(-m)					# Quit after print <count> lines
	--print					# Print all message even if they do not matches, requires --regex and --max-count
	--uid					# Only display log messages from UIDs present in the comma separate list <uids>
	...args
]

# Show adb version
extern "adb version" [
	--algo					# Algorithm name
	--key					# Hex-encoded key
	--iv					# Hex-encoded iv
	--list					# List all forward socket connections
	--no-rebind					# Fails the forward if local is already forwarded
	--remove					# Remove a specific forward socket connection
	--remove-all					# Remove all forward socket connections
	--last(-L)					# Dump logs from prior to last reboot from pstore
	--buffer(-b)					#  Request alternate ring buffer(s)
	--clear(-c)					# Clear (flush) the entire log and exit
	--pid					# Only print the logs for the given PID
	--wrap					# Sleep for 2 hours or when buffer about to wrap whichever comes first
	--format(-v)					# Sets log print format verb and adverbs
	--dividers(-D)					# Print dividers between each log buffer
	--binary(-B)					# Output the log in binary
	--file(-f)					# Log to file instead of stdout
	--rotate-kbytes(-r)					# Rotate log every kbytes, requires -f
	--rotate-count(-n)					# Sets number of rotated logs to keep, default 4
	--id					# If the given signature for logging changes, clear the associated files
	--buffer-size(-g)					# Get the size of the ring buffers within logd
	--buffer-size(-G)					# Set size of a ring buffer in logd
	--statistics(-S)					# Output statistics
	--prune(-p)					# Print prune rules
	--prune(-P)					# Set prune rules
	--regex(-e)					# Only print lines where the log message matches
	--max-count(-m)					# Quit after print <count> lines
	--print					# Print all message even if they do not matches, requires --regex and --max-count
	--uid					# Only display log messages from UIDs present in the comma separate list <uids>
	...args
]

# Show adb help
extern "adb help" [
	--algo					# Algorithm name
	--key					# Hex-encoded key
	--iv					# Hex-encoded iv
	--list					# List all forward socket connections
	--no-rebind					# Fails the forward if local is already forwarded
	--remove					# Remove a specific forward socket connection
	--remove-all					# Remove all forward socket connections
	--last(-L)					# Dump logs from prior to last reboot from pstore
	--buffer(-b)					#  Request alternate ring buffer(s)
	--clear(-c)					# Clear (flush) the entire log and exit
	--pid					# Only print the logs for the given PID
	--wrap					# Sleep for 2 hours or when buffer about to wrap whichever comes first
	--format(-v)					# Sets log print format verb and adverbs
	--dividers(-D)					# Print dividers between each log buffer
	--binary(-B)					# Output the log in binary
	--file(-f)					# Log to file instead of stdout
	--rotate-kbytes(-r)					# Rotate log every kbytes, requires -f
	--rotate-count(-n)					# Sets number of rotated logs to keep, default 4
	--id					# If the given signature for logging changes, clear the associated files
	--buffer-size(-g)					# Get the size of the ring buffers within logd
	--buffer-size(-G)					# Set size of a ring buffer in logd
	--statistics(-S)					# Output statistics
	--prune(-p)					# Print prune rules
	--prune(-P)					# Set prune rules
	--regex(-e)					# Only print lines where the log message matches
	--max-count(-m)					# Quit after print <count> lines
	--print					# Print all message even if they do not matches, requires --regex and --max-count
	--uid					# Only display log messages from UIDs present in the comma separate list <uids>
	...args
]

# Block until device is online
extern "adb wait-for-device" [
	--algo					# Algorithm name
	--key					# Hex-encoded key
	--iv					# Hex-encoded iv
	--list					# List all forward socket connections
	--no-rebind					# Fails the forward if local is already forwarded
	--remove					# Remove a specific forward socket connection
	--remove-all					# Remove all forward socket connections
	--last(-L)					# Dump logs from prior to last reboot from pstore
	--buffer(-b)					#  Request alternate ring buffer(s)
	--clear(-c)					# Clear (flush) the entire log and exit
	--pid					# Only print the logs for the given PID
	--wrap					# Sleep for 2 hours or when buffer about to wrap whichever comes first
	--format(-v)					# Sets log print format verb and adverbs
	--dividers(-D)					# Print dividers between each log buffer
	--binary(-B)					# Output the log in binary
	--file(-f)					# Log to file instead of stdout
	--rotate-kbytes(-r)					# Rotate log every kbytes, requires -f
	--rotate-count(-n)					# Sets number of rotated logs to keep, default 4
	--id					# If the given signature for logging changes, clear the associated files
	--buffer-size(-g)					# Get the size of the ring buffers within logd
	--buffer-size(-G)					# Set size of a ring buffer in logd
	--statistics(-S)					# Output statistics
	--prune(-p)					# Print prune rules
	--prune(-P)					# Set prune rules
	--regex(-e)					# Only print lines where the log message matches
	--max-count(-m)					# Quit after print <count> lines
	--print					# Print all message even if they do not matches, requires --regex and --max-count
	--uid					# Only display log messages from UIDs present in the comma separate list <uids>
	...args
]

# Ensure that there is a server running
extern "adb start-server" [
	--algo					# Algorithm name
	--key					# Hex-encoded key
	--iv					# Hex-encoded iv
	--list					# List all forward socket connections
	--no-rebind					# Fails the forward if local is already forwarded
	--remove					# Remove a specific forward socket connection
	--remove-all					# Remove all forward socket connections
	--last(-L)					# Dump logs from prior to last reboot from pstore
	--buffer(-b)					#  Request alternate ring buffer(s)
	--clear(-c)					# Clear (flush) the entire log and exit
	--pid					# Only print the logs for the given PID
	--wrap					# Sleep for 2 hours or when buffer about to wrap whichever comes first
	--format(-v)					# Sets log print format verb and adverbs
	--dividers(-D)					# Print dividers between each log buffer
	--binary(-B)					# Output the log in binary
	--file(-f)					# Log to file instead of stdout
	--rotate-kbytes(-r)					# Rotate log every kbytes, requires -f
	--rotate-count(-n)					# Sets number of rotated logs to keep, default 4
	--id					# If the given signature for logging changes, clear the associated files
	--buffer-size(-g)					# Get the size of the ring buffers within logd
	--buffer-size(-G)					# Set size of a ring buffer in logd
	--statistics(-S)					# Output statistics
	--prune(-p)					# Print prune rules
	--prune(-P)					# Set prune rules
	--regex(-e)					# Only print lines where the log message matches
	--max-count(-m)					# Quit after print <count> lines
	--print					# Print all message even if they do not matches, requires --regex and --max-count
	--uid					# Only display log messages from UIDs present in the comma separate list <uids>
	...args
]

# Kill the server if it is running
extern "adb kill-server" [
	--algo					# Algorithm name
	--key					# Hex-encoded key
	--iv					# Hex-encoded iv
	--list					# List all forward socket connections
	--no-rebind					# Fails the forward if local is already forwarded
	--remove					# Remove a specific forward socket connection
	--remove-all					# Remove all forward socket connections
	--last(-L)					# Dump logs from prior to last reboot from pstore
	--buffer(-b)					#  Request alternate ring buffer(s)
	--clear(-c)					# Clear (flush) the entire log and exit
	--pid					# Only print the logs for the given PID
	--wrap					# Sleep for 2 hours or when buffer about to wrap whichever comes first
	--format(-v)					# Sets log print format verb and adverbs
	--dividers(-D)					# Print dividers between each log buffer
	--binary(-B)					# Output the log in binary
	--file(-f)					# Log to file instead of stdout
	--rotate-kbytes(-r)					# Rotate log every kbytes, requires -f
	--rotate-count(-n)					# Sets number of rotated logs to keep, default 4
	--id					# If the given signature for logging changes, clear the associated files
	--buffer-size(-g)					# Get the size of the ring buffers within logd
	--buffer-size(-G)					# Set size of a ring buffer in logd
	--statistics(-S)					# Output statistics
	--prune(-p)					# Print prune rules
	--prune(-P)					# Set prune rules
	--regex(-e)					# Only print lines where the log message matches
	--max-count(-m)					# Quit after print <count> lines
	--print					# Print all message even if they do not matches, requires --regex and --max-count
	--uid					# Only display log messages from UIDs present in the comma separate list <uids>
	...args
]

# Remounts the /system partition on the device read-write
extern "adb remount" [
	--algo					# Algorithm name
	--key					# Hex-encoded key
	--iv					# Hex-encoded iv
	--list					# List all forward socket connections
	--no-rebind					# Fails the forward if local is already forwarded
	--remove					# Remove a specific forward socket connection
	--remove-all					# Remove all forward socket connections
	--last(-L)					# Dump logs from prior to last reboot from pstore
	--buffer(-b)					#  Request alternate ring buffer(s)
	--clear(-c)					# Clear (flush) the entire log and exit
	--pid					# Only print the logs for the given PID
	--wrap					# Sleep for 2 hours or when buffer about to wrap whichever comes first
	--format(-v)					# Sets log print format verb and adverbs
	--dividers(-D)					# Print dividers between each log buffer
	--binary(-B)					# Output the log in binary
	--file(-f)					# Log to file instead of stdout
	--rotate-kbytes(-r)					# Rotate log every kbytes, requires -f
	--rotate-count(-n)					# Sets number of rotated logs to keep, default 4
	--id					# If the given signature for logging changes, clear the associated files
	--buffer-size(-g)					# Get the size of the ring buffers within logd
	--buffer-size(-G)					# Set size of a ring buffer in logd
	--statistics(-S)					# Output statistics
	--prune(-p)					# Print prune rules
	--prune(-P)					# Set prune rules
	--regex(-e)					# Only print lines where the log message matches
	--max-count(-m)					# Quit after print <count> lines
	--print					# Print all message even if they do not matches, requires --regex and --max-count
	--uid					# Only display log messages from UIDs present in the comma separate list <uids>
	...args
]

# Reboots the device, optionally into the bootloader or recovery program
extern "adb reboot" [
	--algo					# Algorithm name
	--key					# Hex-encoded key
	--iv					# Hex-encoded iv
	--list					# List all forward socket connections
	--no-rebind					# Fails the forward if local is already forwarded
	--remove					# Remove a specific forward socket connection
	--remove-all					# Remove all forward socket connections
	--last(-L)					# Dump logs from prior to last reboot from pstore
	--buffer(-b)					#  Request alternate ring buffer(s)
	--clear(-c)					# Clear (flush) the entire log and exit
	--pid					# Only print the logs for the given PID
	--wrap					# Sleep for 2 hours or when buffer about to wrap whichever comes first
	--format(-v)					# Sets log print format verb and adverbs
	--dividers(-D)					# Print dividers between each log buffer
	--binary(-B)					# Output the log in binary
	--file(-f)					# Log to file instead of stdout
	--rotate-kbytes(-r)					# Rotate log every kbytes, requires -f
	--rotate-count(-n)					# Sets number of rotated logs to keep, default 4
	--id					# If the given signature for logging changes, clear the associated files
	--buffer-size(-g)					# Get the size of the ring buffers within logd
	--buffer-size(-G)					# Set size of a ring buffer in logd
	--statistics(-S)					# Output statistics
	--prune(-p)					# Print prune rules
	--prune(-P)					# Set prune rules
	--regex(-e)					# Only print lines where the log message matches
	--max-count(-m)					# Quit after print <count> lines
	--print					# Print all message even if they do not matches, requires --regex and --max-count
	--uid					# Only display log messages from UIDs present in the comma separate list <uids>
	...args
]

# Prints state of the device
extern "adb get-state" [
	--algo					# Algorithm name
	--key					# Hex-encoded key
	--iv					# Hex-encoded iv
	--list					# List all forward socket connections
	--no-rebind					# Fails the forward if local is already forwarded
	--remove					# Remove a specific forward socket connection
	--remove-all					# Remove all forward socket connections
	--last(-L)					# Dump logs from prior to last reboot from pstore
	--buffer(-b)					#  Request alternate ring buffer(s)
	--clear(-c)					# Clear (flush) the entire log and exit
	--pid					# Only print the logs for the given PID
	--wrap					# Sleep for 2 hours or when buffer about to wrap whichever comes first
	--format(-v)					# Sets log print format verb and adverbs
	--dividers(-D)					# Print dividers between each log buffer
	--binary(-B)					# Output the log in binary
	--file(-f)					# Log to file instead of stdout
	--rotate-kbytes(-r)					# Rotate log every kbytes, requires -f
	--rotate-count(-n)					# Sets number of rotated logs to keep, default 4
	--id					# If the given signature for logging changes, clear the associated files
	--buffer-size(-g)					# Get the size of the ring buffers within logd
	--buffer-size(-G)					# Set size of a ring buffer in logd
	--statistics(-S)					# Output statistics
	--prune(-p)					# Print prune rules
	--prune(-P)					# Set prune rules
	--regex(-e)					# Only print lines where the log message matches
	--max-count(-m)					# Quit after print <count> lines
	--print					# Print all message even if they do not matches, requires --regex and --max-count
	--uid					# Only display log messages from UIDs present in the comma separate list <uids>
	...args
]

# Prints serial number of the device
extern "adb get-serialno" [
	--algo					# Algorithm name
	--key					# Hex-encoded key
	--iv					# Hex-encoded iv
	--list					# List all forward socket connections
	--no-rebind					# Fails the forward if local is already forwarded
	--remove					# Remove a specific forward socket connection
	--remove-all					# Remove all forward socket connections
	--last(-L)					# Dump logs from prior to last reboot from pstore
	--buffer(-b)					#  Request alternate ring buffer(s)
	--clear(-c)					# Clear (flush) the entire log and exit
	--pid					# Only print the logs for the given PID
	--wrap					# Sleep for 2 hours or when buffer about to wrap whichever comes first
	--format(-v)					# Sets log print format verb and adverbs
	--dividers(-D)					# Print dividers between each log buffer
	--binary(-B)					# Output the log in binary
	--file(-f)					# Log to file instead of stdout
	--rotate-kbytes(-r)					# Rotate log every kbytes, requires -f
	--rotate-count(-n)					# Sets number of rotated logs to keep, default 4
	--id					# If the given signature for logging changes, clear the associated files
	--buffer-size(-g)					# Get the size of the ring buffers within logd
	--buffer-size(-G)					# Set size of a ring buffer in logd
	--statistics(-S)					# Output statistics
	--prune(-p)					# Print prune rules
	--prune(-P)					# Set prune rules
	--regex(-e)					# Only print lines where the log message matches
	--max-count(-m)					# Quit after print <count> lines
	--print					# Print all message even if they do not matches, requires --regex and --max-count
	--uid					# Only display log messages from UIDs present in the comma separate list <uids>
	...args
]

# Prints device path
extern "adb get-devpath" [
	--algo					# Algorithm name
	--key					# Hex-encoded key
	--iv					# Hex-encoded iv
	--list					# List all forward socket connections
	--no-rebind					# Fails the forward if local is already forwarded
	--remove					# Remove a specific forward socket connection
	--remove-all					# Remove all forward socket connections
	--last(-L)					# Dump logs from prior to last reboot from pstore
	--buffer(-b)					#  Request alternate ring buffer(s)
	--clear(-c)					# Clear (flush) the entire log and exit
	--pid					# Only print the logs for the given PID
	--wrap					# Sleep for 2 hours or when buffer about to wrap whichever comes first
	--format(-v)					# Sets log print format verb and adverbs
	--dividers(-D)					# Print dividers between each log buffer
	--binary(-B)					# Output the log in binary
	--file(-f)					# Log to file instead of stdout
	--rotate-kbytes(-r)					# Rotate log every kbytes, requires -f
	--rotate-count(-n)					# Sets number of rotated logs to keep, default 4
	--id					# If the given signature for logging changes, clear the associated files
	--buffer-size(-g)					# Get the size of the ring buffers within logd
	--buffer-size(-G)					# Set size of a ring buffer in logd
	--statistics(-S)					# Output statistics
	--prune(-p)					# Print prune rules
	--prune(-P)					# Set prune rules
	--regex(-e)					# Only print lines where the log message matches
	--max-count(-m)					# Quit after print <count> lines
	--print					# Print all message even if they do not matches, requires --regex and --max-count
	--uid					# Only display log messages from UIDs present in the comma separate list <uids>
	...args
]

# Continuously print the device status
extern "adb status-window" [
	--algo					# Algorithm name
	--key					# Hex-encoded key
	--iv					# Hex-encoded iv
	--list					# List all forward socket connections
	--no-rebind					# Fails the forward if local is already forwarded
	--remove					# Remove a specific forward socket connection
	--remove-all					# Remove all forward socket connections
	--last(-L)					# Dump logs from prior to last reboot from pstore
	--buffer(-b)					#  Request alternate ring buffer(s)
	--clear(-c)					# Clear (flush) the entire log and exit
	--pid					# Only print the logs for the given PID
	--wrap					# Sleep for 2 hours or when buffer about to wrap whichever comes first
	--format(-v)					# Sets log print format verb and adverbs
	--dividers(-D)					# Print dividers between each log buffer
	--binary(-B)					# Output the log in binary
	--file(-f)					# Log to file instead of stdout
	--rotate-kbytes(-r)					# Rotate log every kbytes, requires -f
	--rotate-count(-n)					# Sets number of rotated logs to keep, default 4
	--id					# If the given signature for logging changes, clear the associated files
	--buffer-size(-g)					# Get the size of the ring buffers within logd
	--buffer-size(-G)					# Set size of a ring buffer in logd
	--statistics(-S)					# Output statistics
	--prune(-p)					# Print prune rules
	--prune(-P)					# Set prune rules
	--regex(-e)					# Only print lines where the log message matches
	--max-count(-m)					# Quit after print <count> lines
	--print					# Print all message even if they do not matches, requires --regex and --max-count
	--uid					# Only display log messages from UIDs present in the comma separate list <uids>
	...args
]

# Restart the adbd daemon with root permissions
extern "adb root" [
	--algo					# Algorithm name
	--key					# Hex-encoded key
	--iv					# Hex-encoded iv
	--list					# List all forward socket connections
	--no-rebind					# Fails the forward if local is already forwarded
	--remove					# Remove a specific forward socket connection
	--remove-all					# Remove all forward socket connections
	--last(-L)					# Dump logs from prior to last reboot from pstore
	--buffer(-b)					#  Request alternate ring buffer(s)
	--clear(-c)					# Clear (flush) the entire log and exit
	--pid					# Only print the logs for the given PID
	--wrap					# Sleep for 2 hours or when buffer about to wrap whichever comes first
	--format(-v)					# Sets log print format verb and adverbs
	--dividers(-D)					# Print dividers between each log buffer
	--binary(-B)					# Output the log in binary
	--file(-f)					# Log to file instead of stdout
	--rotate-kbytes(-r)					# Rotate log every kbytes, requires -f
	--rotate-count(-n)					# Sets number of rotated logs to keep, default 4
	--id					# If the given signature for logging changes, clear the associated files
	--buffer-size(-g)					# Get the size of the ring buffers within logd
	--buffer-size(-G)					# Set size of a ring buffer in logd
	--statistics(-S)					# Output statistics
	--prune(-p)					# Print prune rules
	--prune(-P)					# Set prune rules
	--regex(-e)					# Only print lines where the log message matches
	--max-count(-m)					# Quit after print <count> lines
	--print					# Print all message even if they do not matches, requires --regex and --max-count
	--uid					# Only display log messages from UIDs present in the comma separate list <uids>
	...args
]

# Restart the adbd daemon without root permissions
extern "adb unroot" [
	--algo					# Algorithm name
	--key					# Hex-encoded key
	--iv					# Hex-encoded iv
	--list					# List all forward socket connections
	--no-rebind					# Fails the forward if local is already forwarded
	--remove					# Remove a specific forward socket connection
	--remove-all					# Remove all forward socket connections
	--last(-L)					# Dump logs from prior to last reboot from pstore
	--buffer(-b)					#  Request alternate ring buffer(s)
	--clear(-c)					# Clear (flush) the entire log and exit
	--pid					# Only print the logs for the given PID
	--wrap					# Sleep for 2 hours or when buffer about to wrap whichever comes first
	--format(-v)					# Sets log print format verb and adverbs
	--dividers(-D)					# Print dividers between each log buffer
	--binary(-B)					# Output the log in binary
	--file(-f)					# Log to file instead of stdout
	--rotate-kbytes(-r)					# Rotate log every kbytes, requires -f
	--rotate-count(-n)					# Sets number of rotated logs to keep, default 4
	--id					# If the given signature for logging changes, clear the associated files
	--buffer-size(-g)					# Get the size of the ring buffers within logd
	--buffer-size(-G)					# Set size of a ring buffer in logd
	--statistics(-S)					# Output statistics
	--prune(-p)					# Print prune rules
	--prune(-P)					# Set prune rules
	--regex(-e)					# Only print lines where the log message matches
	--max-count(-m)					# Quit after print <count> lines
	--print					# Print all message even if they do not matches, requires --regex and --max-count
	--uid					# Only display log messages from UIDs present in the comma separate list <uids>
	...args
]

# Restart the adbd daemon listening on USB
extern "adb usb" [
	--algo					# Algorithm name
	--key					# Hex-encoded key
	--iv					# Hex-encoded iv
	--list					# List all forward socket connections
	--no-rebind					# Fails the forward if local is already forwarded
	--remove					# Remove a specific forward socket connection
	--remove-all					# Remove all forward socket connections
	--last(-L)					# Dump logs from prior to last reboot from pstore
	--buffer(-b)					#  Request alternate ring buffer(s)
	--clear(-c)					# Clear (flush) the entire log and exit
	--pid					# Only print the logs for the given PID
	--wrap					# Sleep for 2 hours or when buffer about to wrap whichever comes first
	--format(-v)					# Sets log print format verb and adverbs
	--dividers(-D)					# Print dividers between each log buffer
	--binary(-B)					# Output the log in binary
	--file(-f)					# Log to file instead of stdout
	--rotate-kbytes(-r)					# Rotate log every kbytes, requires -f
	--rotate-count(-n)					# Sets number of rotated logs to keep, default 4
	--id					# If the given signature for logging changes, clear the associated files
	--buffer-size(-g)					# Get the size of the ring buffers within logd
	--buffer-size(-G)					# Set size of a ring buffer in logd
	--statistics(-S)					# Output statistics
	--prune(-p)					# Print prune rules
	--prune(-P)					# Set prune rules
	--regex(-e)					# Only print lines where the log message matches
	--max-count(-m)					# Quit after print <count> lines
	--print					# Print all message even if they do not matches, requires --regex and --max-count
	--uid					# Only display log messages from UIDs present in the comma separate list <uids>
	...args
]

# Restart the adbd daemon listening on TCP
extern "adb tcpip" [
	--algo					# Algorithm name
	--key					# Hex-encoded key
	--iv					# Hex-encoded iv
	--list					# List all forward socket connections
	--no-rebind					# Fails the forward if local is already forwarded
	--remove					# Remove a specific forward socket connection
	--remove-all					# Remove all forward socket connections
	--last(-L)					# Dump logs from prior to last reboot from pstore
	--buffer(-b)					#  Request alternate ring buffer(s)
	--clear(-c)					# Clear (flush) the entire log and exit
	--pid					# Only print the logs for the given PID
	--wrap					# Sleep for 2 hours or when buffer about to wrap whichever comes first
	--format(-v)					# Sets log print format verb and adverbs
	--dividers(-D)					# Print dividers between each log buffer
	--binary(-B)					# Output the log in binary
	--file(-f)					# Log to file instead of stdout
	--rotate-kbytes(-r)					# Rotate log every kbytes, requires -f
	--rotate-count(-n)					# Sets number of rotated logs to keep, default 4
	--id					# If the given signature for logging changes, clear the associated files
	--buffer-size(-g)					# Get the size of the ring buffers within logd
	--buffer-size(-G)					# Set size of a ring buffer in logd
	--statistics(-S)					# Output statistics
	--prune(-p)					# Print prune rules
	--prune(-P)					# Set prune rules
	--regex(-e)					# Only print lines where the log message matches
	--max-count(-m)					# Quit after print <count> lines
	--print					# Print all message even if they do not matches, requires --regex and --max-count
	--uid					# Only display log messages from UIDs present in the comma separate list <uids>
	...args
]

# Run PPP over USB
extern "adb ppp" [
	--algo					# Algorithm name
	--key					# Hex-encoded key
	--iv					# Hex-encoded iv
	--list					# List all forward socket connections
	--no-rebind					# Fails the forward if local is already forwarded
	--remove					# Remove a specific forward socket connection
	--remove-all					# Remove all forward socket connections
	--last(-L)					# Dump logs from prior to last reboot from pstore
	--buffer(-b)					#  Request alternate ring buffer(s)
	--clear(-c)					# Clear (flush) the entire log and exit
	--pid					# Only print the logs for the given PID
	--wrap					# Sleep for 2 hours or when buffer about to wrap whichever comes first
	--format(-v)					# Sets log print format verb and adverbs
	--dividers(-D)					# Print dividers between each log buffer
	--binary(-B)					# Output the log in binary
	--file(-f)					# Log to file instead of stdout
	--rotate-kbytes(-r)					# Rotate log every kbytes, requires -f
	--rotate-count(-n)					# Sets number of rotated logs to keep, default 4
	--id					# If the given signature for logging changes, clear the associated files
	--buffer-size(-g)					# Get the size of the ring buffers within logd
	--buffer-size(-G)					# Set size of a ring buffer in logd
	--statistics(-S)					# Output statistics
	--prune(-p)					# Print prune rules
	--prune(-P)					# Set prune rules
	--regex(-e)					# Only print lines where the log message matches
	--max-count(-m)					# Quit after print <count> lines
	--print					# Print all message even if they do not matches, requires --regex and --max-count
	--uid					# Only display log messages from UIDs present in the comma separate list <uids>
	...args
]

# Sideloads the given package
extern "adb sideload" [
	--algo					# Algorithm name
	--key					# Hex-encoded key
	--iv					# Hex-encoded iv
	--list					# List all forward socket connections
	--no-rebind					# Fails the forward if local is already forwarded
	--remove					# Remove a specific forward socket connection
	--remove-all					# Remove all forward socket connections
	--last(-L)					# Dump logs from prior to last reboot from pstore
	--buffer(-b)					#  Request alternate ring buffer(s)
	--clear(-c)					# Clear (flush) the entire log and exit
	--pid					# Only print the logs for the given PID
	--wrap					# Sleep for 2 hours or when buffer about to wrap whichever comes first
	--format(-v)					# Sets log print format verb and adverbs
	--dividers(-D)					# Print dividers between each log buffer
	--binary(-B)					# Output the log in binary
	--file(-f)					# Log to file instead of stdout
	--rotate-kbytes(-r)					# Rotate log every kbytes, requires -f
	--rotate-count(-n)					# Sets number of rotated logs to keep, default 4
	--id					# If the given signature for logging changes, clear the associated files
	--buffer-size(-g)					# Get the size of the ring buffers within logd
	--buffer-size(-G)					# Set size of a ring buffer in logd
	--statistics(-S)					# Output statistics
	--prune(-p)					# Print prune rules
	--prune(-P)					# Set prune rules
	--regex(-e)					# Only print lines where the log message matches
	--max-count(-m)					# Quit after print <count> lines
	--print					# Print all message even if they do not matches, requires --regex and --max-count
	--uid					# Only display log messages from UIDs present in the comma separate list <uids>
	...args
]

# Kick current connection from host side and make it reconnect.
extern "adb reconnect" [
	--algo					# Algorithm name
	--key					# Hex-encoded key
	--iv					# Hex-encoded iv
	--list					# List all forward socket connections
	--no-rebind					# Fails the forward if local is already forwarded
	--remove					# Remove a specific forward socket connection
	--remove-all					# Remove all forward socket connections
	--last(-L)					# Dump logs from prior to last reboot from pstore
	--buffer(-b)					#  Request alternate ring buffer(s)
	--clear(-c)					# Clear (flush) the entire log and exit
	--pid					# Only print the logs for the given PID
	--wrap					# Sleep for 2 hours or when buffer about to wrap whichever comes first
	--format(-v)					# Sets log print format verb and adverbs
	--dividers(-D)					# Print dividers between each log buffer
	--binary(-B)					# Output the log in binary
	--file(-f)					# Log to file instead of stdout
	--rotate-kbytes(-r)					# Rotate log every kbytes, requires -f
	--rotate-count(-n)					# Sets number of rotated logs to keep, default 4
	--id					# If the given signature for logging changes, clear the associated files
	--buffer-size(-g)					# Get the size of the ring buffers within logd
	--buffer-size(-G)					# Set size of a ring buffer in logd
	--statistics(-S)					# Output statistics
	--prune(-p)					# Print prune rules
	--prune(-P)					# Set prune rules
	--regex(-e)					# Only print lines where the log message matches
	--max-count(-m)					# Quit after print <count> lines
	--print					# Print all message even if they do not matches, requires --regex and --max-count
	--uid					# Only display log messages from UIDs present in the comma separate list <uids>
	...args
]

# Execute a command on the device and send its stdout back
extern "adb exec-out" [
	--algo					# Algorithm name
	--key					# Hex-encoded key
	--iv					# Hex-encoded iv
	--list					# List all forward socket connections
	--no-rebind					# Fails the forward if local is already forwarded
	--remove					# Remove a specific forward socket connection
	--remove-all					# Remove all forward socket connections
	--last(-L)					# Dump logs from prior to last reboot from pstore
	--buffer(-b)					#  Request alternate ring buffer(s)
	--clear(-c)					# Clear (flush) the entire log and exit
	--pid					# Only print the logs for the given PID
	--wrap					# Sleep for 2 hours or when buffer about to wrap whichever comes first
	--format(-v)					# Sets log print format verb and adverbs
	--dividers(-D)					# Print dividers between each log buffer
	--binary(-B)					# Output the log in binary
	--file(-f)					# Log to file instead of stdout
	--rotate-kbytes(-r)					# Rotate log every kbytes, requires -f
	--rotate-count(-n)					# Sets number of rotated logs to keep, default 4
	--id					# If the given signature for logging changes, clear the associated files
	--buffer-size(-g)					# Get the size of the ring buffers within logd
	--buffer-size(-G)					# Set size of a ring buffer in logd
	--statistics(-S)					# Output statistics
	--prune(-p)					# Print prune rules
	--prune(-P)					# Set prune rules
	--regex(-e)					# Only print lines where the log message matches
	--max-count(-m)					# Quit after print <count> lines
	--print					# Print all message even if they do not matches, requires --regex and --max-count
	--uid					# Only display log messages from UIDs present in the comma separate list <uids>
	...args
]