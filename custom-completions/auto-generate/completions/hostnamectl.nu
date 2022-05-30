# Show current hostname settings
extern "hostnamectl status" [

	...args
]

# Set system hostname
extern "hostnamectl set-hostname" [

	...args
]

# Set icon name for host
extern "hostnamectl set-icon-name" [

	...args
]

# Set chassis type for host
extern "hostnamectl set-chassis" [

	...args
]

# Set deployment environment for host
extern "hostnamectl set-deployment" [

	...args
]

# Set location for host
extern "hostnamectl set-location" [

	...args
]

# Show this help
extern "hostnamectl" [

	...args
]