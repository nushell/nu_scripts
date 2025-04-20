# Show current time settings
extern "timedatectl status" [
	--help(-h)					# Show this help message
	--version					# Show package version
	--no-pager					# Do not pipe output into a pager
	--no-ask-password					# Do not prompt for password
	--adjust-system-clock					# Adjust system clock when changing local RTC mode
	--monitor					# Monitor status of systemd-timesyncd
	--all(-a)					# Show all properties
	--value					# Only show properties with values
	...args
]

# Show properties of systemd-timedated
extern "timedatectl show" [
	--help(-h)					# Show this help message
	--version					# Show package version
	--no-pager					# Do not pipe output into a pager
	--no-ask-password					# Do not prompt for password
	--adjust-system-clock					# Adjust system clock when changing local RTC mode
	--monitor					# Monitor status of systemd-timesyncd
	--all(-a)					# Show all properties
	--value					# Only show properties with values
	...args
]

# Set system time
extern "timedatectl set-time" [
	--help(-h)					# Show this help message
	--version					# Show package version
	--no-pager					# Do not pipe output into a pager
	--no-ask-password					# Do not prompt for password
	--adjust-system-clock					# Adjust system clock when changing local RTC mode
	--monitor					# Monitor status of systemd-timesyncd
	--all(-a)					# Show all properties
	--value					# Only show properties with values
	...args
]

# Set system time zone
extern "timedatectl set-timezone" [
	--help(-h)					# Show this help message
	--version					# Show package version
	--no-pager					# Do not pipe output into a pager
	--no-ask-password					# Do not prompt for password
	--adjust-system-clock					# Adjust system clock when changing local RTC mode
	--monitor					# Monitor status of systemd-timesyncd
	--all(-a)					# Show all properties
	--value					# Only show properties with values
	...args
]

# Show known time zones
extern "timedatectl list-timezones" [
	--help(-h)					# Show this help message
	--version					# Show package version
	--no-pager					# Do not pipe output into a pager
	--no-ask-password					# Do not prompt for password
	--adjust-system-clock					# Adjust system clock when changing local RTC mode
	--monitor					# Monitor status of systemd-timesyncd
	--all(-a)					# Show all properties
	--value					# Only show properties with values
	...args
]

# Control whether RTC is in local time
extern "timedatectl set-local-rtc" [
	--help(-h)					# Show this help message
	--version					# Show package version
	--no-pager					# Do not pipe output into a pager
	--no-ask-password					# Do not prompt for password
	--adjust-system-clock					# Adjust system clock when changing local RTC mode
	--monitor					# Monitor status of systemd-timesyncd
	--all(-a)					# Show all properties
	--value					# Only show properties with values
	...args
]

# 
extern "timedatectl true false" [
	--help(-h)					# Show this help message
	--version					# Show package version
	--no-pager					# Do not pipe output into a pager
	--no-ask-password					# Do not prompt for password
	--adjust-system-clock					# Adjust system clock when changing local RTC mode
	--monitor					# Monitor status of systemd-timesyncd
	--all(-a)					# Show all properties
	--value					# Only show properties with values
	...args
]

# Control network time sync
extern "timedatectl set-ntp" [
	--help(-h)					# Show this help message
	--version					# Show package version
	--no-pager					# Do not pipe output into a pager
	--no-ask-password					# Do not prompt for password
	--adjust-system-clock					# Adjust system clock when changing local RTC mode
	--monitor					# Monitor status of systemd-timesyncd
	--all(-a)					# Show all properties
	--value					# Only show properties with values
	...args
]

# Show status of systemd-timesyncd
extern "timedatectl timesync-status" [
	--help(-h)					# Show this help message
	--version					# Show package version
	--no-pager					# Do not pipe output into a pager
	--no-ask-password					# Do not prompt for password
	--adjust-system-clock					# Adjust system clock when changing local RTC mode
	--monitor					# Monitor status of systemd-timesyncd
	--all(-a)					# Show all properties
	--value					# Only show properties with values
	...args
]

# Show properties of systemd-timesyncd
extern "timedatectl show-timesync" [
	--help(-h)					# Show this help message
	--version					# Show package version
	--no-pager					# Do not pipe output into a pager
	--no-ask-password					# Do not prompt for password
	--adjust-system-clock					# Adjust system clock when changing local RTC mode
	--monitor					# Monitor status of systemd-timesyncd
	--all(-a)					# Show all properties
	--value					# Only show properties with values
	...args
]

# Show this help message
extern "timedatectl" [
	--help(-h)					# Show this help message
	--version					# Show package version
	--no-pager					# Do not pipe output into a pager
	--no-ask-password					# Do not prompt for password
	--adjust-system-clock					# Adjust system clock when changing local RTC mode
	--monitor					# Monitor status of systemd-timesyncd
	--all(-a)					# Show all properties
	--value					# Only show properties with values
	...args
]