# Show current time settings
extern "timedatectl status" [

	...args
]

# Show properties of systemd-timedated
extern "timedatectl show" [

	...args
]

# Set system time
extern "timedatectl set-time" [

	...args
]

# Set system time zone
extern "timedatectl set-timezone" [

	...args
]

# Show known time zones
extern "timedatectl list-timezones" [

	...args
]

# Control whether RTC is in local time
extern "timedatectl set-local-rtc" [

	...args
]

# 
extern "timedatectl true false" [

	...args
]

# Control network time sync
extern "timedatectl set-ntp" [

	...args
]

# Show status of systemd-timesyncd
extern "timedatectl timesync-status" [

	...args
]

# Show properties of systemd-timesyncd
extern "timedatectl show-timesync" [

	...args
]

# Show this help message
extern "timedatectl" [

	...args
]