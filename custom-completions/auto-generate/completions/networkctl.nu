# List links
extern "networkctl list" [

	...args
]

# Show link status
extern "networkctl status" [

	...args
]

# Show LLDP neighbors
extern "networkctl lldp" [

	...args
]

# Show current address label
extern "networkctl label" [

	...args
]

# Delete virtual netdevs
extern "networkctl delete" [

	...args
]

# Bring devices up
extern "networkctl up" [

	...args
]

# Bring devices down
extern "networkctl down" [

	...args
]

# Renew dynamic configurations
extern "networkctl renew" [

	...args
]

# Trigger DHCP reconfiguration of all connected clients
extern "networkctl forcerenew" [

	...args
]

# Reconfigure interfaces
extern "networkctl reconfigure" [

	...args
]

# Reload .network and .netdev files
extern "networkctl reload" [

	...args
]

# Show help
extern "networkctl" [

	...args
]